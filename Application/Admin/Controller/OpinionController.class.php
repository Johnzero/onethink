<?php

namespace Admin\Controller;
use Admin\Model\AuthGroupModel;
use Think\Page;

class OpinionController extends AdminController {

    /* 保存允许访问的公共方法 */
    static protected $allow = array( 'draftbox','mydocument');

    private $cate_id        =   null; //文档分类id


    protected function checkDynamic(){
        $cates = AuthGroupModel::getAuthCategories(UID);
        switch(strtolower(ACTION_NAME)){
            case 'index':   //文档列表
            case 'add':   // 新增
                $cate_id =  I('cate_id');
                break;
            case 'edit':    //编辑
            case 'update':  //更新
                $doc_id  =  I('id');
                $cate_id =  M('Document')->where(array('id'=>$doc_id))->getField('category_id');
                break;
            case 'setstatus': //更改状态
            case 'permit':    //回收站
                $doc_id  =  (array)I('ids');
                $cate_id =  M('Document')->where(array('id'=>array('in',$doc_id)))->getField('category_id',true);
                $cate_id =  array_unique($cate_id);
                break;
        }
        if(!$cate_id){
            return null;//不明
        }elseif( !is_array($cate_id) && in_array($cate_id,$cates) ) {
            return true;//有权限
        }elseif( is_array($cate_id) && $cate_id==array_intersect($cate_id,$cates) ){
            return true;//有权限
        }else{
            return false;//无权限
        }
    }

    /**
     * 显示左边菜单，进行权限控制
     * @author huajie <banhuajie@163.com>
     */
    protected function getMenu(){
        //获取动态分类
        $cate_auth  =   AuthGroupModel::getAuthCategories(UID); //获取当前用户所有的内容权限节点
        $cate_auth  =   $cate_auth == null ? array() : $cate_auth;
        $cate       =   M('Category')->where(array('status'=>1))->field('id,title,pid,allow_publish')->order('pid,sort')->select();

        //没有权限的分类则不显示
        if(!IS_ROOT){
            foreach ($cate as $key=>$value){
                if(!in_array($value['id'], $cate_auth)){
                    unset($cate[$key]);
                }
            }
        }

        $cate           =   list_to_tree($cate);    //生成分类树

        //获取分类id
        $cate_id        =   I('param.cate_id');
        $this->cate_id  =   $cate_id;

        //是否展开分类
        $hide_cate = false;
        if(ACTION_NAME != 'recycle' && ACTION_NAME != 'draftbox' && ACTION_NAME != 'mydocument'){
            $hide_cate  =   true;
        }

        //生成每个分类的url
        foreach ($cate as $key=>&$value){
            $value['url']   =   'Article/index?cate_id='.$value['id'];
            if($cate_id == $value['id'] && $hide_cate){
                $value['current'] = true;
            }else{
                $value['current'] = false;
            }
            if(!empty($value['_child'])){
                $is_child = false;
                foreach ($value['_child'] as $ka=>&$va){
                    $va['url']      =   'Article/index?cate_id='.$va['id'];
                    if(!empty($va['_child'])){
                        foreach ($va['_child'] as $k=>&$v){
                            $v['url']   =   'Article/index?cate_id='.$v['id'];
                            $v['pid']   =   $va['id'];
                            $is_child = $v['id'] == $cate_id ? true : false;
                        }
                    }
                    //展开子分类的父分类
                    if($va['id'] == $cate_id || $is_child){
                        $is_child = false;
                        if($hide_cate){
                            $value['current']   =   true;
                            $va['current']      =   true;
                        }else{
                            $value['current']   =   false;
                            $va['current']      =   false;
                        }
                    }else{
                        $va['current']      =   false;
                    }
                }
            }
        }
        $this->assign('nodes',      $cate);
        $this->assign('cate_id',    $this->cate_id);

        //获取面包屑信息
        $nav = get_parent_category($cate_id);
        $this->assign('rightNav',   $nav);

        //获取回收站权限
        $this->assign('show_recycle', IS_ROOT || $this->checkRule('Admin/article/recycle'));
        //获取草稿箱权限
        $this->assign('show_draftbox', C('OPEN_DRAFTBOX'));
        //获取审核列表权限
        $this->assign('show_examine', IS_ROOT || $this->checkRule('Admin/article/examine'));
    }

    /**
     * 分类文档列表页
     * @param integer $cate_id 分类id
     * @param integer $model_id 模型id
     * @param integer $position 推荐标志
     * @param integer $group_id 分组id
     */
	 
	public function index()
	{
		//获取左边菜单
        $this->getMenu();
		
		$list_grids = array('标题','时间');
		$model_list = $list = M('opinion')->order('id DESC')->select();
		$this->assign('model_list', $model_list);
		$this->assign('list_grids', $list_grids);
		
        // 记录当前列表页的cookie
        Cookie('__forward__',$_SERVER['REQUEST_URI']);
        $this->display();
	}

    /**
     * 文档新增页面初始化
     * @author huajie <banhuajie@163.com>
     */
    public function add(){
		
		if(IS_POST)
		{
			$data = array('content'=>htmlspecialchars($_POST['content']),'title'=>htmlspecialchars($_POST['title']),'lastupdate'=>date('Y-m-d H:i:s'));
			$opinion_info = $list = M('opinion')->add($data);
			
			$this->success("新增成功！",U('Opinion/index'));
		}
		else
		{ 
			//获取左边菜单
			$this->getMenu();
			
			$this->meta_title   =   '新增';
			$this->display();
		}
    }

    /**
     * 文档编辑页面初始化
     * @author huajie <banhuajie@163.com>
     */
    public function edit(){
		
		if(IS_POST)
		{
			$data = array('content'=>htmlspecialchars($_POST['content']),'title'=>htmlspecialchars($_POST['title']),'lastupdate'=>date('Y-m-d H:i:s'));
			$opinion_info = $list = M('opinion')->where(array('id'=>(int)$_POST['id']))->save($data);
			
			$this->success("修改成功！",U('Opinion/index'));
		}
		else
		{ 
			//获取左边菜单
			$this->getMenu();

			$id     =   I('get.id','');
			if(empty($id)){
				$this->error('参数不能为空！');
			}
			
			$opinion_info = $list = M('opinion')->where(array('id'=>$id))->find();
			$this->assign('opinion_info',$opinion_info);
			
			$this->meta_title   =   '编辑文档';
			$this->display();
		}
    }

    /**
     * 更新一条数据
     * @author huajie <banhuajie@163.com>
     */
    public function del(){
       $id     =   I('get.id','');
	   if(empty($id)){
			$this->error('参数不能为空！');
		}
	    M('opinion')->where(array('id'=>$id))->delete();
		
		$this->success("删除成功！",U('Opinion/index'));
    }
}
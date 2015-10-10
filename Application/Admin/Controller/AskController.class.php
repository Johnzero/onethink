<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: huajie <banhuajie@163.com>
// +----------------------------------------------------------------------
namespace Admin\Controller;
use Admin\Model\AuthGroupModel;
use Think\Page;

/**
 * 后台内容控制器
 * @author huajie <banhuajie@163.com>
 */
class AskController extends AdminController {
    
    public function _initialize(){
        
        parent:: _initialize();

        $this->getMenu();
        $group_id = $_SESSION["onethink_admin"]["user_auth"]["group_id"];
        if ( is_administrator($uid) ) {
            $group_id = 1;
        }
        $this->assign('group_id', $group_id);

        // if (in_array(ACTION_NAME,array("index","my","all","processing"))) {
        //     layout('Ask/base');
        // }

        //菜单后数量
        $maps  =  array();
        $maps['uid'] = array('EXP','IS NULL');
        $wrl_count = M('Ask')->where($maps)->count();
        $_SESSION["menu_nums"]["未认领"] = $wrl_count;

        $maps  =  array();
        $maps['uid'] = array("eq",$_SESSION["onethink_admin"]["user_auth"]["uid"]);
        $maps['status'] = array("eq",0);
        $dsh_count = M('Ask')->where($maps)->count();
        $_SESSION["menu_nums"]["待审核"] = $dsh_count;

        $maps['status']    =   array("eq",1);
        $blz_count = M('Ask')->where($maps)->count();
        $_SESSION["menu_nums"]["办理中"] = $blz_count;

        $maps['status'] = array('in','4,5');
        $ydf_count = M('Ask')->where($maps)->count();
        $_SESSION["menu_nums"]["已回复"] = $ydf_count;

        $maps['status'] = array("eq",60);
        $thcb_count = M('Ask')->where($maps)->count();
        $_SESSION["menu_nums"]["退回重办"] = $thcb_count;

    }
	
    /* 全部问题 */
    public function index(){
        
        $title       =   trim(I('title'));
        $status = I('status');
        $maps  =  array();
        if ( $title ) {
            if(is_numeric($title)){
                $maps['id|title']=   array(intval($title),array('like','%'.$title.'%'),'_multi'=>true);
            }else{
                $maps['title']    =   array('like', '%'.(string)$title.'%');
            }
        }

        if ( isset($_GET['time-start']) ) {
            $maps['create_time'][] = array('egt',strtotime(I('time-start')));
        }
        if ( isset($_GET['time-end']) ) {
            $maps['create_time'][] = array('elt',24*60*60 + strtotime(I('time-end')));
        }

        if ( is_numeric($status) ) {
            $maps['status']    =   array("eq",$status);
        }

        $total = M('Ask')->where($maps)->count();

        $request    =   (array)I('request.');
        $total      =   $total? $total : 1 ;
        $listRows   =   C('LIST_ROWS') > 0 ? C('LIST_ROWS') : 10;
        $page       =   new \Think\Page($total, $listRows, $request);
        $p          =   $page->show();
        $this->assign('_page', $p? $p: '');
        // 记录当前列表页的cookie
        Cookie('__forward__',$_SERVER['REQUEST_URI']);

        $lists = M('Ask')->where($maps)->limit($page->firstRow . ',' . $page->listRows)->order("id DESC")->select();

        foreach ($lists as $key => $value) {
            if ($value["uid"]) {
                $member = M("Member")->where(array("uid"=>$value["uid"]))->find();
                if (!empty($member)) {
                    $lists[$key]["member"] = $member;
                }
            }
        }
        $this->assign('lists', $lists);

        $this->meta_title = '全部问题';
        $this->display();
    }

    /* 全部待认领问题 */
    public function all(){

        $title  =   trim(I('title'));
        $status = I('status');
        $maps  =  array();
        $maps['uid'] = array('EXP','IS NULL');

        if ( $title ) {
            if(is_numeric($title)){
                $maps['id|title']=   array(intval($title),array('like','%'.$title.'%'),'_multi'=>true);
            }else{
                $maps['title']    =   array('like', '%'.(string)$title.'%');
            }
        }

        if ( isset($_GET['time-start']) ) {
            $maps['create_time'][] = array('egt',strtotime(I('time-start')));
        }
        if ( isset($_GET['time-end']) ) {
            $maps['create_time'][] = array('elt',24*60*60 + strtotime(I('time-end')));
        }

        $total = M('Ask')->where($maps)->count();

        $request    =   (array)I('request.');
        $total      =   $total? $total : 1 ;
        $listRows   =   C('LIST_ROWS') > 0 ? C('LIST_ROWS') : 10;
        $page       =   new \Think\Page($total, $listRows, $request);
        $p          =   $page->show();
        $this->assign('_page', $p? $p: '');
        // 记录当前列表页的cookie
        Cookie('__forward__',$_SERVER['REQUEST_URI']);

        $lists = M('Ask')->where($maps)->limit($page->firstRow . ',' . $page->listRows)->order("id DESC")->select();

        foreach ($lists as $key => $value) {
            if ($value["uid"]) {
                $member = M("Member")->where(array("uid"=>$value["uid"]))->find();
                if (!empty($member)) {
                    $lists[$key]["member"] = $member;
                }
            }
        }
        $this->assign('lists', $lists);

        $this->meta_title = '全部问题';
        $this->display("index");
    }

    /* 我的待审核 */
    public function my(){
        
        $title       =   trim(I('title'));
        $maps  =  array();
        $maps['status']    =   array("eq",0);
        $maps['uid']    =   array("eq",$_SESSION["onethink_admin"]["user_auth"]["uid"]);

        if ( $title ) {
            if(is_numeric($title)){
                $maps['id|title']=   array(intval($title),array('like','%'.$title.'%'),'_multi'=>true);
            }else{
                $maps['title']    =   array('like', '%'.(string)$title.'%');
            }
        }

        if ( isset($_GET['time-start']) ) {
            $maps['create_time'][] = array('egt',strtotime(I('time-start')));
        }
        if ( isset($_GET['time-end']) ) {
            $maps['create_time'][] = array('elt',24*60*60 + strtotime(I('time-end')));
        }

        $total = M('Ask')->where($maps)->count();

        $request    =   (array)I('request.');
        $total      =   $total? $total : 1 ;
        $listRows   =   C('LIST_ROWS') > 0 ? C('LIST_ROWS') : 10;
        $page       =   new \Think\Page($total, $listRows, $request);
        $p          =   $page->show();
        $this->assign('_page', $p? $p: '');

        Cookie('__forward__',$_SERVER['REQUEST_URI']);

        $lists = M('Ask')->where($maps)->limit($page->firstRow . ',' . $page->listRows)->order("id DESC")->select();

        foreach ($lists as $key => $value) {
            if ($value["uid"]) {
                $member = M("Member")->where(array("uid"=>$value["uid"]))->find();
                if (!empty($member)) {
                    $lists[$key]["member"] = $member;
                }
            }
        }
        $this->assign('lists', $lists);

        $this->meta_title = '我的问题';
        $this->display("index");
    }

    /* 办理中 */
    public function processing(){
        
        $title       =   trim(I('title'));
        $maps  =  array();
        $maps['status']    =   array("eq",1);
        $maps['uid']    =   array("eq",$_SESSION["onethink_admin"]["user_auth"]["uid"]);

        if ( $title ) {
            if(is_numeric($title)){
                $maps['id|title']=   array(intval($title),array('like','%'.$title.'%'),'_multi'=>true);
            }else{
                $maps['title']    =   array('like', '%'.(string)$title.'%');
            }
        }

        if ( isset($_GET['time-start']) ) {
            $maps['create_time'][] = array('egt',strtotime(I('time-start')));
        }
        if ( isset($_GET['time-end']) ) {
            $maps['create_time'][] = array('elt',24*60*60 + strtotime(I('time-end')));
        }

        $total = M('Ask')->where($maps)->count();

        $request    =   (array)I('request.');
        $total      =   $total? $total : 1 ;
        $listRows   =   C('LIST_ROWS') > 0 ? C('LIST_ROWS') : 10;
        $page       =   new \Think\Page($total, $listRows, $request);
        $p          =   $page->show();
        $this->assign('_page', $p? $p: '');

        Cookie('__forward__',$_SERVER['REQUEST_URI']);

        $lists = M('Ask')->where($maps)->limit($page->firstRow . ',' . $page->listRows)->order("id DESC")->select();

        foreach ($lists as $key => $value) {
            if ($value["uid"]) {
                $member = M("Member")->where(array("uid"=>$value["uid"]))->find();
                if (!empty($member)) {
                    $lists[$key]["member"] = $member;
                }
            }
        }
        $this->assign('lists', $lists);

        $this->meta_title = '待办理问题';
        $this->display("index");
    }

    /* 已答复 */
    public function done(){
        
        $title       =   trim(I('title'));
        $maps  =  array();
        $maps['status'] = array('in','4,5');
        $maps['uid']    =   array("eq",$_SESSION["onethink_admin"]["user_auth"]["uid"]);

        if ( $title ) {
            if(is_numeric($title)){
                $maps['id|title']=   array(intval($title),array('like','%'.$title.'%'),'_multi'=>true);
            }else{
                $maps['title']    =   array('like', '%'.(string)$title.'%');
            }
        }

        if ( isset($_GET['time-start']) ) {
            $maps['create_time'][] = array('egt',strtotime(I('time-start')));
        }
        if ( isset($_GET['time-end']) ) {
            $maps['create_time'][] = array('elt',24*60*60 + strtotime(I('time-end')));
        }

        $total = M('Ask')->where($maps)->count();

        $request    =   (array)I('request.');
        $total      =   $total? $total : 1 ;
        $listRows   =   C('LIST_ROWS') > 0 ? C('LIST_ROWS') : 10;
        $page       =   new \Think\Page($total, $listRows, $request);
        $p          =   $page->show();
        $this->assign('_page', $p? $p: '');

        Cookie('__forward__',$_SERVER['REQUEST_URI']);

        $lists = M('Ask')->where($maps)->limit($page->firstRow . ',' . $page->listRows)->order("id DESC")->select();

        foreach ($lists as $key => $value) {
            if ($value["uid"]) {
                $member = M("Member")->where(array("uid"=>$value["uid"]))->find();
                if (!empty($member)) {
                    $lists[$key]["member"] = $member;
                }
            }
        }
        $this->assign('lists', $lists);

        $this->meta_title = '待办理问题';
        $this->display("index");
    }

    /* 退回 */
    public function unsatisfied(){
        
        $title       =   trim(I('title'));
        $maps  =  array();
        $maps['status'] = array('eq', 60);
        $maps['uid']    =   array("eq",$_SESSION["onethink_admin"]["user_auth"]["uid"]);

        if ( $title ) {
            if(is_numeric($title)){
                $maps['id|title']=   array(intval($title),array('like','%'.$title.'%'),'_multi'=>true);
            }else{
                $maps['title']    =   array('like', '%'.(string)$title.'%');
            }
        }

        if ( isset($_GET['time-start']) ) {
            $maps['create_time'][] = array('egt',strtotime(I('time-start')));
        }
        if ( isset($_GET['time-end']) ) {
            $maps['create_time'][] = array('elt',24*60*60 + strtotime(I('time-end')));
        }

        $total = M('Ask')->where($maps)->count();

        $request    =   (array)I('request.');
        $total      =   $total? $total : 1 ;
        $listRows   =   C('LIST_ROWS') > 0 ? C('LIST_ROWS') : 10;
        $page       =   new \Think\Page($total, $listRows, $request);
        $p          =   $page->show();
        $this->assign('_page', $p? $p: '');

        Cookie('__forward__',$_SERVER['REQUEST_URI']);

        $lists = M('Ask')->where($maps)->limit($page->firstRow . ',' . $page->listRows)->order("id DESC")->select();

        foreach ($lists as $key => $value) {
            if ($value["uid"]) {
                $member = M("Member")->where(array("uid"=>$value["uid"]))->find();
                if (!empty($member)) {
                    $lists[$key]["member"] = $member;
                }
            }
        }
        $this->assign('lists', $lists);

        $this->meta_title = '待办理问题';
        $this->display("index");
    }


    /* 审批 */
    public function sp() {
        $id = I('get.id');

        if ( !$id ) {
            $this->error("出现错误！");
        }
        if (IS_POST) {
            $status = I('post.status');
            $info = I('post.info');
            if (!$status) {
                $this->error("请选择审批意见！");
            }else {
                
                $ask = M("Ask")->where(array("id"=>$id))->find();

                if ( $status == 1 ) {
                    if ( !empty($ask) ) {

                        M("Ask")->where(array("id"=>$id))->save(array("status"=>1,"update_time"=>time()));
                        $process = array();
                        $process["uid"] = $ask["uid"];
                        $process["aid"] = $id;
                        $process["status"] = 1;
                        $process["create_time"] = time();
                        $process["create_uid"] = UID;
                        M("Process")->add($process);
                        $this->success("审批成功！",U('Ask/index'));

                    }else {
                        $this->error("出现错误！");
                    }
                }else {
                    if( !$info ) {
                        $this->error("请填写未通过原因！");
                    }else{

                        M("Ask")->where(array("id"=>$id))->save(array("status"=>10,"update_time"=>time()));
                        $process = array();
                        $process["uid"] = $ask["uid"];
                        $process["aid"] = $id;
                        $process["status"] = 10;
                        $process["create_time"] = time();
                        $process["create_uid"] = UID;
                        $process["info"] = $info;

                        M("Process")->add($process);
                        $this->success("处理完成！",U('Ask/index'));

                    }
                } 

            }

            exit;
        }

        $ask = M("Ask")->where(array("id"=>$id))->find();

        if ($ask['status'] != 0) {
            $this->error("该问题已经审批过！");
        }

        $this->assign($ask);

        $yjdw = M("Auth_group_access")->alias('A')->join(C('DB_PREFIX').'member B ON A.uid = B.uid')->where(array("A.group_id"=>3))->select();
        $this->assign('yjdw', $yjdw);

        $this->display();
    }

    /* 流程明细 */
    public function detail() {
        $id = I('get.id');
        if ( !$id ) {
            $this->error("出现错误！");
        }
        
        $ask = M("Ask")->where(array("id"=>$id))->find();
        $this->assign($ask);

        $yjdw = M("Auth_group_access")->alias('A')->join(C('DB_PREFIX').'member B ON A.uid = B.uid')->where(array("A.group_id"=>3))->select();
        $this->assign('yjdw', $yjdw);
        $process = M("Process")->where(array("aid"=>$id))->order('create_time ASC')->select();
        foreach ($process as $key => $value) {
            $member = M("Member")->where(array("uid"=>$value["create_uid"]))->find();
            if (!empty($member)) {
                $process[$key]["member"] = $member;
            }
        }
        $this->assign('process', $process);

        $this->display();
    }

    /* 问题答复 */
    public function reply(){

        $id = I('get.id');
        empty($id) && $this->error('参数不能为空！');
        
        $this->meta_title = '问题答复';

        if(IS_POST){


            $Reply = D('Reply');
            
            $check_ask = $Reply->check_reply($_POST);
            
            if($check_ask['error'])
            {
                $this->error($check_ask['error']);
            }
            else
            {
                $save_ask = $check_ask['data'];
            }
            
            $save_ask['aid'] = $id;
            $return = $Reply->save_ask($save_ask);

            if($return)
            {
                $this->success("保存成功！");
            }
            else
            {
                $this->error("保存失败，请重新提交！");
            }
            exit;

        } else {
            $parents = M("Reply")->where(array("aid"=>$id))->find();
            $this->assign('parents', $parents);
            $this->display("reply");
        }
    }

    /* 更改受理单位 */
    public function change() {
        $id = I('get.id');
        if ( !$id ) {
            $this->error("出现错误！");
        }
        $ask = M("Ask")->where(array("id"=>$id))->find();
        $this->assign($ask);
        if (IS_POST) {
            $pid = I('post.pid');
            if ( !$pid ) {
                $this->error("请选择受理单位");
            }else {
                M("Ask")->where(array("id"=>$id))->save(array("uid"=>$pid));

                $pmember = M("Member")->where(array("uid"=>$pid))->find();
                $process = array();
                $process["uid"] = $pid;
                $process["aid"] = $id;
                $process["status"] = 0;
                $process["create_time"] = time();
                $process["create_uid"] = UID;
                $process["info"] = "将问题指派到".$pmember['nickname'];

                M("Process")->add($process);
                $this->success("处理成功！",U('Ask/index'));

                $this->success("处理成功！");
            }

        }
        $yjdw = M("Auth_group_access")->alias('A')->join(C('DB_PREFIX').'member B ON A.uid = B.uid')->where(array("A.group_id"=>3))->select();
        $this->assign('yjdw', $yjdw);
        $this->display();
    }



    public function add(){
        //获取左边菜单
        $this->getMenu();

        $cate_id    =   I('get.cate_id',0);
        $model_id   =   I('get.model_id',0);
		$group_id	=	I('get.group_id','');

        empty($cate_id) && $this->error('参数不能为空！');
        empty($model_id) && $this->error('该分类未绑定模型！');

        //检查该分类是否允许发布
        $allow_publish = check_category($cate_id);
        !$allow_publish && $this->error('该分类不允许发布内容！');

        // 获取当前的模型信息
        $model    =   get_document_model($model_id);

        //处理结果
        $info['pid']            =   $_GET['pid']?$_GET['pid']:0;
        $info['model_id']       =   $model_id;
        $info['category_id']    =   $cate_id;
		$info['group_id']		=	$group_id;

        if($info['pid']){
            // 获取上级文档
            $article            =   M('Document')->field('id,title,type')->find($info['pid']);
            $this->assign('article',$article);
        }

        //获取表单字段排序
        $fields = get_model_attribute($model['id']);
        $this->assign('info',       $info);
        $this->assign('fields',     $fields);
        $this->assign('type_list',  get_type_bycate($cate_id));
        $this->assign('model',      $model);
        $this->meta_title = '新增'.$model['title'];
        $this->display();
    }

    /**
     * 文档编辑页面初始化
     * @author huajie <banhuajie@163.com>
     */
    public function edit(){
        //获取左边菜单
        $this->getMenu();

        $id     =   I('get.id','');
        if(empty($id)){
            $this->error('参数不能为空！');
        }

        // 获取详细数据 
        $Document = D('Document');
        $data = $Document->detail($id);
        if(!$data){
            $this->error($Document->getError());
        }

        if($data['pid']){
            // 获取上级文档
            $article        =   $Document->field('id,title,type')->find($data['pid']);
            $this->assign('article',$article);
        }
        // 获取当前的模型信息
        $model    =   get_document_model($data['model_id']);

        $this->assign('data', $data);
        $this->assign('model_id', $data['model_id']);
        $this->assign('model',      $model);

        //获取表单字段排序
        $fields = get_model_attribute($model['id']);
        $this->assign('fields',     $fields);


        //获取当前分类的文档类型
        $this->assign('type_list', get_type_bycate($data['category_id']));

        $this->meta_title   =   '编辑文档';
        $this->display();
    }

    /**
     * 更新一条数据
     * @author huajie <banhuajie@163.com>
     */
    public function update(){
        $document   =   D('Document');
        $res = $document->update();
        if(!$res){
            $this->error($document->getError());
        }else{
            $this->success($res['id']?'更新成功':'新增成功', Cookie('__forward__'));
        }
    }

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

}
<?php
namespace Home\Controller;

class ArticleController extends HomeController {

	public function index(){

		$category = $this->category();
		$this->assign('category', $category);
		$this->display($category['template_index']);

	}

	
	public function lists($p = 1){
		$category = $this->category();
		$Document = D('Document');
        
		$list = $Document->page($p, $category['list_row'])->lists($category['id']);
		if(false === $list){
			$this->error('获取列表数据失败！');
		}

		$this->assign('category', $category);
		$this->assign('list', $list);
		$this->display($category['template_lists']);
	}

	public function search(){
			
		$host = I("get.host");
		$keyword = I("get.keyword");

		if ( $host != $_SERVER['HTTP_HOST'] ) {
			$this->error('请求域名错误！');
		}
		
		$Document = D('Document');
		$map = array();
		
		if ($keyword) {
			$map['title']  = array('like', '%'.(string)$keyword.'%');
		}
		$map['status'] = 1;

		$count      = $Document->where($map)->count();
		$Page       = new \Think\Page($count,10);
		$list = $Document->where($map)->order($order)->limit($Page->firstRow.','.$Page->listRows)->select();

		$this->assign('list', $list);
		$this->assign('keyword', $keyword);
		$this->assign('count', $count);
		$this->assign('page', $Page->show());
		$this->display();
	}

	public function detail($id = 0, $p = 1){
		if(!($id && is_numeric($id))){
			$this->error('文档ID错误！');
		}

		$Document = D('Document');

		$p = intval($p);
		$p = empty($p) ? 1 : $p;

		$Document = D('Document');
		$info = $Document->detail($id);
		if(!$info){
			$this->error($Document->getError());
		}
		
		if (!trim($info['content'])) {
			header("Location:".U("Index/index"));
		}

		$category = $this->category($info['category_id']);

		/* 获取模板 */
		if(!empty($info['template'])){//已定制模板
			$tmpl = $info['template'];
		} elseif (!empty($category['template_detail'])){ //分类已定制模板
			$tmpl = $category['template_detail'];
		} else { //使用默认模板
			$tmpl = 'Article/'. get_document_model($info['model_id'],'name') .'/detail';
		}

		/* 更新浏览数 */
		$map = array('id' => $id);
		$Document->where($map)->setInc('view');

		/* 模板赋值并渲染模板 */
		$this->assign('category', $category);
		$this->assign('info', $info);
		$this->assign('page', $p); //页码
		$this->display($tmpl);
	}

	/* 文档分类检测 */
	private function category($id = 0){
		/* 标识正确性检测 */
		$id = $id ? $id : I('get.category', 0);
		if(empty($id)){
			$this->error('没有指定文档分类！');
		}

		/* 获取分类信息 */
		$category = D('Category')->info($id);
		if($category && 1 == $category['status']){
			switch ($category['display']) {
				case 0:
					$this->error('该分类禁止显示！');
					break;
				//TODO: 更多分类显示状态判断
				default:
					return $category;
			}
		} else {
			$this->error('分类不存在或被禁用！');
		}
	}
	
	
	/* 提交留言页面 guth 20150922 */
	public function ask(){
		/* 分类信息 */
		//$category = $this->category();guth 分类判断，不清楚干嘛的

		//频道页只显示模板，默认不读取任何内容
		//内容可以通过模板标签自行定制
		
		if ( IS_POST ) {
			$ask = D('Ask');
			$_POST['create_time'] = time();
			
			$check_ask = $ask->check_ask($_POST);
			if($check_ask['error'])
			{
				$this->error($check_ask['error']);
			}
			else
			{
				$save_ask = $check_ask['data'];
			}
			if ( !I("post.uid") ) {
				unset($_POST['uid']);
			}
			$return = $ask->add($_POST);

			if($return)
			{
				$this->success("保存成功！");
			}
			else
			{
				$this->error("保存失败，请重新提交！");
			}
			exit;
		}
		
		$yjdw = M("Auth_group_access")->alias('A')->join(C('DB_PREFIX').'member B ON A.uid = B.uid')->where(array("A.group_id"=>3))->select();
		$this->assign('yjdw', $yjdw);
		
		$tmpl = 'article/Ask/detail';
		$this->display($tmpl);
	}
	
	//2015-10-10 留言列表
	public function ask_list()
	{
		$maps  =  array();

        $total = M('Ask')->where($maps)->count();

        $request    =   (array)I('request.');
        $total      =   $total? $total : 1 ;
        $listRows   =   C('LIST_ROWS') > 0 ? C('LIST_ROWS') : 10;
        $page       =   new \Think\Page($total, $listRows, $request);
        $p          =   $page->show();
        $this->assign('_page', $p? $p: '');

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

        $tmpl = 'article/Ask/list';
		$this->display($tmpl);
	}
	
	//2015-10-10 留言详情
	public function ask_detail()
	{
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

        $tmpl = 'article/Ask/ask_detail';
		$this->display($tmpl);
	}
	
	public function get_message()
	{
		$tel = I('post.tel');
		$ask_id = I('post.ask_id');
		
		$ask = M("Ask")->where(array("id"=>$ask_id,"tel"=>$tel,"status"=>5))->find();//校验信息和状态进行打分

		if(empty($ask))
		{
			$result = array();
			$result['error'] = true;
			$result['msg'] = '只有结束的留言才允许打分';
			$this->ajaxReturn ( $result );
		}
		
		
		$num = rand(1111,9999);
		$re = message($tel,$num);
		
		if($re['res_code']==1)
		{
			$result = array();
			$result['error'] = true;
			$result['msg'] = $re['res_message'];
			$this->ajaxReturn ( $result );
		}
		else
		{
			M("Message_num")->execute("INSERT INTO `ot_message_num` (`tel`,`num`,`lastupdate`) VALUES ('".$tel."','".$num."','".time()."')");
			
			$result = array();
			$result['error'] = false;
			$result['msg'] = '短信已发送，请注意查收！';
			$this->ajaxReturn ( $result );
		}
	}
	
	//2015-10-10 打分
	public function ask_detail_score()
	{
		$tel = I('post.tel');
		$ticket = I('post.ticket');
		$scores = I('post.score');
		$ask_id = I('post.ask_id');
		$uinfo = I('post.uinfo');

		$result = array();

		if ( $scores != 100 ) {
			if ( !$uinfo ) {
				$result['error'] = true;
				$result['msg'] = '请填写原因！';
				$this->ajaxReturn ( $result );
			}
		}
		if(empty($tel) || empty($ticket) || empty($ask_id))
		{
			$result['error'] = true;
			$result['msg'] = '信息不完善！';
			$this->ajaxReturn ( $result );
		}
		
		//校验验证码 ticket
		$Message_num_info = M("Message_num")->where(array("num"=>$ticket,"tel"=>$tel,'status'=>0))->order('id desc')->find();
		if(empty($Message_num_info) || (time()-150)>$Message_num_info['lastupdate'])
		{
			$result = array();
		 	$result['error'] = true;
		 	$result['msg'] = '验证码无效';
		 	$this->ajaxReturn ( $result );
		}
		
		$Message_num_info = M("Message_num")->where(array("num"=>$ticket,"tel"=>$tel,'status'=>0))->save(array('status'=>1));
		
		$ask = M("Ask")->where(array("id"=>$ask_id,"tel"=>$tel,"status"=>5))->find();

		if(empty($ask))
		{
			$result['error'] = true;
			$result['msg'] = '只有结束的留言才允许打分';
			$this->ajaxReturn ( $result );
		}
		
		$ask_score = M("Score")->where(array("ask_id"=>$ask_id))->find();
		if ( empty($ask_score) ) {

			M("Score")->execute("INSERT INTO `ot_score` (`ask_id`,`scores`,`lastupdate`) VALUES ('".$ask_id."','".$scores."','".time()."')");

		}else {

			M("Score")->execute("UPDATE `ot_score` SET `scores`='".$scores."',`lastupdate`='".time()."' WHERE `ask_id` = '".$ask_id."'");

		}

		$process = array();
        $process["uid"] = $ask["uid"];
        $process["aid"] = $ask_id;
        $process["create_time"] = time();

		if ( $scores == 100 ) {
			
        	$process["status"] = 5;
            $process["info"] = "网友打分：满意";
            M("Process")->add($process);

		}else {

			$process["status"] = 60;
            $process["info"] = "网友打分：不满意，原因：".$uinfo;
            M("Process")->add($process);

            M("Ask")->where(array("id"=>$ask_id))->save(array("status"=>60,"update_time"=>time(),"finish_time"=>''));

		}

		$result['error'] = false;
		$result['msg'] = '打分成功';
		$this->ajaxReturn( $result );
	}
}

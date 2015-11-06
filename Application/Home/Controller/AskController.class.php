<?php

namespace Home\Controller;
use OT\DataDictionary;

class AskController extends HomeController {

    public function index(){
        $this->display();
    }

    public function question() {
    	$yjdw = M("Auth_group_access")->alias('A')->join(C('DB_PREFIX').'member B ON A.uid = B.uid')->where(array("A.group_id"=>3))->select();
        $this->assign('yjdw', $yjdw);
    	$this->display();
    }

    public function submit() {
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
    }

    public function getSubclass() {
    	if ( IS_POST ) {
    		$id = I("post.id");
    		if ($id) {
    			$sub = M("member")->where(array("type"=>intval($id)))->select();
    		}
    		$str = "";
    		if(!empty($sub)) {
    			foreach ($sub as $key => $value) {
    				$str .= '<option value="' . $value['uid'] . '" >' . $value['nickname'] . '</option>';
    			}
    		}
    		echo $str;
    	}
    }

}
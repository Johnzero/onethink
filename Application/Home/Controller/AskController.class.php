<?php

namespace Home\Controller;
use OT\DataDictionary;
use Think\Page;

class AskController extends HomeController {

    public function question() {
    	$yjdw = M("Auth_group_access")->alias('A')->join(C('DB_PREFIX').'member B ON A.uid = B.uid')->where(array("A.group_id"=>3))->select();
        $this->assign('yjdw', $yjdw);
    	$this->display();
    }

    public function submit() {
    	if ( IS_POST ) {

			$ask = D('Ask');

			$_POST['create_time'] = time();
			
			if ( !I("post.uid") ) {
				unset($_POST['uid']);
			}

            if (!$_SESSION['code']) {
                $this->error("请获取您的验证码！");
            }

            $_SESSION['code'] = $_POST["yzm"];
            if ( $_SESSION['code'] != $_POST["yzm"] ) {
                $this->error("您的验证码错误！");
            }else {
                unset($_POST["yzm"]);
                $_SESSION['code'] = "";
            }

			$return = $ask->add($_POST);

			if($return)
			{
				$this->success("感谢您的留言！");
			}
			else
			{
				$this->error("提交失败，请稍后再试！");
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

    public function search() {
        
        $keyword = I("post.keyword");
        if ($keyword) {
            $_SESSION['keyword'] = $keyword;
        }else {
            if($_SESSION['keyword']) {
                $keyword = $_SESSION['keyword'];
            }
        }

        if( $keyword ) {
            $total = M('Ask')->where(array("sfz"=>$keyword))->count();
            $Page       = new \Think\Page($total,10);
            $this->assign('page', $Page->show());

            $result = M("Ask")->where(array("sfz"=>$keyword))->limit($Page->firstRow.','.$Page->listRows)->order("id DESC")->select();
            foreach ($result as $key => $value) {
                $member = M("Member")->where(array("uid"=>$value["uid"]))->find();
                $result[$key]["nickname"] = $member["nickname"];
            }

            if (!empty($result)) {
                $this->assign("ask",$result);
                $this->display("my");
            }else {
                $this->error("无查询结果！",U('Index/respond_to_society'));
            }
        }else {
            $this->error("请输入您的证件号码！",U('Index/respond_to_society'));
        }
    }

    public function detail() {

        $id = I('get.id');
        if ( !$id ) {
            $this->error("出现错误！");
        }
        
        $ask = M("Ask")->where(array("id"=>$id))->find();
        if ($ask["sfz"] == $_SESSION["keyword"]) {
            $this->assign('show',1);
        }

        $member = M("Member")->where(array("uid"=>$ask['uid']))->find();
        $this->assign("member",$member);
        $this->assign($ask);

        $yjdw = M("Auth_group_access")->alias('A')->join(C('DB_PREFIX').'member B ON A.uid = B.uid')->where(array("A.group_id"=>3))->select();
        $this->assign('yjdw', $yjdw);


        $reply = M("Reply")->alias('A')->order("A.id DESC")->join(C('DB_PREFIX').'member B ON A.uid = B.uid')->where(array("A.aid"=>$id))->select();
        $this->assign("reply",$reply);

        $this->display();
    }


    public function get_message()
    {
        $tel = I('post.tel');
        if ($tel) {
            if ( S('code') ) {
                $result = array();
                $result['error'] = true;
                $result['msg'] = "请勿重复发送验证码！";
                $this->ajaxReturn ( $result );
            }else {
                $num = rand(1111,9999);
                $_SESSION['code'] = $num;
                S('code',$num,60);
                $content = "您好，您当前的验证码为".$num;
                $re = message($tel,$content);
                if ( $re['res_code'] != 1 ) {
                    $result = array();
                    $result['error'] = false;
                    $result['msg'] = '短信已发送，请注意查收！';
                    $this->ajaxReturn ( $result );
                }
            }
        }else {
            $result = array();
            $result['error'] = true;
            $result['msg'] = '请输入您的手机号！';
            $this->ajaxReturn ( $result );
        }
    }


    public function score() {

        $id = I("get.id");
        $score = (int) I("post.score");

        $result = array();

        if (!id) {
            $result['error'] = true;
            $result['msg'] = '出现错误！请稍后重试！';
            $this->ajaxReturn ( $result );
        }

        $ask_score = M("Score")->where(array("ask_id"=>$ask_id))->find();
        M("Score")->add(array("aid"=>$id,"score"=>$score,"update_time"=>time()));
        
        $result['error'] = false;
        $result['msg'] = '打分成功！';
        $this->ajaxReturn ( $result );

    }

}

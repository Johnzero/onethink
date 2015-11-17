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

}

<?php

namespace Home\Controller;
use OT\DataDictionary;

class IndexController extends HomeController {

	//系统首页
    public function index(){

        $category = D('Category')->getTree();
        $this->assign('category',$category);

        $lists = D('Document')->order("create_time DESC")->limit(5)->where(array("hot"=>1,'status' => 1))->select();
        $this->assign('lists',$lists);

        $zf = M("Auth_group_access")->order("B.reg_time ASC")->alias('A')->join(C('DB_PREFIX').'member B ON A.uid = B.uid')->where(array("A.group_id"=>3,"B.type"=>2))->select();
        $this->assign('zf',$zf);

        $sz = M("Auth_group_access")->alias('A')->join(C('DB_PREFIX').'member B ON A.uid = B.uid')->where(array("A.group_id"=>3,"B.type"=>1))->select();
        $this->assign('sz',$sz);

        $all = M("Auth_group_access")->alias('A')->join(C('DB_PREFIX').'member B ON A.uid = B.uid')->field("B.uid,B.name,B.home_link,B.weibo,B.weibo_link,B.weixin")->where(array("A.group_id"=>3,"B.type"=>array('in','1,2')))->select();
        $this->assign('data_ewm',json_encode($all));

        $wjd = D('Document')->limit(5)->lists(48,$order='level DESC');
        $wft = D('Document')->limit(5)->lists(49,$order='level DESC');
        $whd = D('Document')->limit(5)->lists(50,$order='level DESC');

        $this->assign('wjd', $wjd);
        $this->assign('wft', $wft);
        $this->assign('whd', $whd);

        $this->assign('category', $category);
        $this->assign('list', $list);


        $ly_count = M("Ask")->count();
        $this->assign('ly_count', $ly_count + 1055);

        $sl_count = M("Ask")->where('status <> 10')->count();
        $this->assign('sl_count', $sl_count + 1055);

        $today = strtotime(date("Y-m-d 00:00:00"));
        $td_count = M("Ask")->where('create_time > '.$today)->count();
        $this->assign('td_count', $td_count);

        $ask = M("Ask")->limit(5)->order("finish_time DESC,create_time DESC")->where('status <> 0 AND status IS NOT NULL AND public = 1 ')->select();
        foreach ($ask as $key => $value) {
            $thisM = M("Member")->where(array("uid"=>$value['uid']))->find();
            $ask[$key]['nickname'] = $thisM['nickname'];
        }
        $this->assign('ask', $ask);

        $slider = D("Document")->where("slider LIKE '%1%' AND status = 1")->order("create_time DESC")->limit(5)->select();
        $this->assign('slider', $slider);

        $question = file_get_contents("http://www.ah.gov.cn/tmp/jsonp/ajax.shtml?action=getszxx&nums=6");
        $question = json_decode($question,true);
        $ask = $question['data'];
        $this->assign('ask', $ask);

        $this->display();
    }

    public function respond_to_society() {

        $keyword = I("get.keyword");
        $where = 'status <> 0 AND status IS NOT NULL AND public = 1 ';

        if ($keyword) {
            $where = $where."AND title LIKE '%{$keyword}%' ";
        }
    	$ask = M("Ask")->limit(20)->order("finish_time DESC,create_time DESC")->where($where)->select();
        foreach ($ask as $key => $value) {
            $thisM = M("Member")->where(array("uid"=>$value['uid']))->find();
            $ask[$key]['nickname'] = $thisM['nickname'];
        }
        $this->assign('ask', $ask);

        // $question = file_get_contents("http://www.ah.gov.cn/tmp/jsonp/ajax.shtml?action=getszxx&nums=20");
        // $question = json_decode($question,true);
        // $ask = $question['data'];
        // $this->assign('ask', $ask);

        $this->assign('keyword', $keyword);

        $lyxd = M("Ask")->limit(10)->order("finish_time DESC,create_time DESC")->where("public = 1")->select();
        $this->assign('lyxd', $lyxd);

        $this->display();
    }

    public function supervision_and_evaluation() {
    	$lists = M("ask")->order("create_time DESC")->limit(20)->select();
        $this->assign('lists',$lists);

        $Document = D('Document');
		$news = $Document->lists(null);
        $this->assign('news',$news);

        $this->display();
    }

    public function weixin_weibo() {
    	
        $zf = M("Auth_group_access")->alias('A')->join(C('DB_PREFIX').'member B ON A.uid = B.uid')->where(array("A.group_id"=>3,"B.type"=>2))->select();
        $this->assign('zf',$zf);

        $sz = M("Auth_group_access")->alias('A')->join(C('DB_PREFIX').'member B ON A.uid = B.uid')->where(array("A.group_id"=>3,"B.type"=>1))->select();
        $this->assign('sz',$sz);

        $all = M("Auth_group_access")->alias('A')->join(C('DB_PREFIX').'member B ON A.uid = B.uid')->field("B.uid,B.name,B.home_link,B.weibo,B.weibo_link,B.weixin")->where(array("A.group_id"=>3,"B.type"=>array('in','1,2')))->select();
        $this->assign('data_ewm',json_encode($all));

        $slider = D("Document")->where("slider LIKE '%4%' AND status = 1")->order("create_time DESC")->limit(5)->select();
        $this->assign('slider', $slider);

        $this->display();
    }

    public function government_information() {

        $Document = D('Document');

        $list1 = $Document->position(1,$category = null, $limit=10);
        $this->assign('list1',$list1);

        $list2 = $Document->position(2,$category = null, $limit=10);
        $this->assign('list2',$list2);

        $list3 = $Document->position(4,$category = null, $limit=10);
        $this->assign('list3',$list3);

        $slider = D("Document")->where("slider LIKE '%2%' AND status = 1")->order("create_time DESC")->limit(5)->select();
        $this->assign('slider', $slider);

        $this->display();
    }

}
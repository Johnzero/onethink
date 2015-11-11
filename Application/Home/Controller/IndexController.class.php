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

        $this->display();
    }

    public function respond_to_society() {
    	$lists = M("ask")->order("create_time DESC")->limit(20)->select();
        $this->assign('lists',$lists);
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
    	
    	$Document = D('Document');
		$news = $Document->lists(null);
        $this->assign('news',$news);

        $this->display();
    }

    public function government_information() {

        $Document = D('Document');
        $news = $Document->lists(null);
        $this->assign('news',$news);

        $ahyw = $Document->order("create_time DESC")->limit(10)->lists(40);
        $this->assign('ahyw',$ahyw);

        $zcdt = $Document->order("create_time DESC")->limit(10)->lists(41);
        $this->assign('zcdt',$zcdt);

        $jhzx = $Document->order("create_time DESC")->limit(10)->lists(42);
        $this->assign('jhzx',$jhzx);

        $this->display();
    }
}
<?php

namespace Home\Controller;
use OT\DataDictionary;

class WeixinController extends HomeController {
//要闻
    public function yaowen(){
        $this->display();
    }
//便民
	public function bianmin(){
        $this->display();
    }
//监督	
	public function jiandu(){
        $this->display();
    }
//留言
	public function liuyan(){
        $this->display();
    }
//信息
	public function xinxi(){
        $this->display();
    }
//微发布
	public function fabu(){
        $this->display();
    }
//发布停
	public function fabuting(){
        $this->display();
    }
}
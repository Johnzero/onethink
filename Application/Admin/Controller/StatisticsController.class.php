<?php

namespace Admin\Controller;
use Admin\Model\AuthGroupModel;
use Think\Page;

class StatisticsController extends AdminController {
    
    public function _initialize(){
        
        parent:: _initialize();

    }
	
    /* 全部留言 */
    public function index(){
		
		
		
		

        $this->meta_title = '办事效率';
        $this->display();
    }

}
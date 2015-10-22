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
		
		//group ask表 合并数据
		//SELECT COUNT(*) as `total`,`uid` FROM `ot_ask` GROUP BY  `uid`;
		
		$maps  =  array();
        $maps['uid'] = array('EXP','IS NULL');
        $wrl_count = M('Ask')->where($maps)->count();
        $_SESSION["menu_nums"]["未认领"] = $wrl_count;

        $maps  =  array();

        $children = M("Member")->where(array("pid"=>UID))->select();
        $uid_array = array();
        $uid_array[] = UID;

        if (!empty($children)) {
            foreach ($children as $key => $value) {
                $uid_array[] = $value["uid"];
            }
        }
        $maps['uid']    =   array("in",implode(",",$uid_array));
        $this->uid_array = $uid_array;

        $maps['status'] = array("eq",0);
        $dsh_count = M('Ask')->where($maps)->count();
        $_SESSION["menu_nums"]["待审核"] = $dsh_count;

        $maps['status']    =   array("eq",1);
        $blz_count = M('Ask')->where($maps)->count();
        $_SESSION["menu_nums"]["办理中"] = $blz_count;

        $maps['status'] = array('in','4');
        $ydf_count = M('Ask')->where($maps)->count();
        $_SESSION["menu_nums"]["已回复"] = $ydf_count;

        $maps['status'] = array("eq",60);
        $thcb_count = M('Ask')->where($maps)->count();
        $_SESSION["menu_nums"]["退回重办"] = $thcb_count;

        $xbwt_count = M("Assist")->where(array("pid"=>UID,"reply"=>array('EXP','IS NULL')))->count();
        $_SESSION["menu_nums"]["协办问题"] = $xbwt_count;
		
		
		
		
		
		
		
		
		
		
		

        $this->meta_title = '办事效率';
        $this->display();
    }

}
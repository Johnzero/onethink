<?php

namespace Admin\Controller;
use Admin\Model\AuthGroupModel;
use Think\Page;

class StatisticsController extends AdminController {
    
    public function _initialize(){
        
        parent:: _initialize();

        $this->group_id = $_SESSION["onethink_admin"]["user_auth"]["group_id"];
        if ( is_administrator($uid) ) {
            $this->group_id = 1;
        }
        $this->assign('group_id', $this->group_id);

        // if (in_array(ACTION_NAME,array("index","my","all","processing"))) {
        //     layout('Ask/base');
        // }

        //菜单后数量
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

    }
	
    /* 全部留言 */
    public function index(){
        
        $title  = I('title');
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

        $this->meta_title = '全部留言';
        $this->display();
    }

}
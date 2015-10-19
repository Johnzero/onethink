<?php

namespace Admin\Controller;
use Admin\Model\AuthGroupModel;
use Think\Page;

class AskController extends AdminController {
    
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

    /* 全部待认领留言 */
    public function all(){

        $title  =   I('title');
        $status = I('status');
        $maps  =  array();
        $maps['uid'] = array('EXP','IS NULL');

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
        $this->display("index");
    }

    /* 我的待审核 */
    public function my(){
        
        $title       =   I('title');
        $maps  =  array();
        $maps['status']    =   array("eq",0);
        $maps['uid']    =   array("eq",UID);

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

        $total = M('Ask')->where($maps)->count();

        $request    =   (array)I('request.');
        $total      =   $total? $total : 1 ;
        $listRows   =   C('LIST_ROWS') > 0 ? C('LIST_ROWS') : 10;
        $page       =   new \Think\Page($total, $listRows, $request);
        $p          =   $page->show();
        $this->assign('_page', $p? $p: '');

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

        $this->meta_title = '待审核的留言';
        $this->display("index");
    }

    /* 办理中 */
    public function processing(){
        
        $title =   I('title');
        $maps  =  array();
        $maps['status']    =   array("eq",1);
        $maps['uid']    =   array("in",implode(",",$this->uid_array));
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

        $total = M('Ask')->where($maps)->count();

        $request    =   (array)I('request.');
        $total      =   $total? $total : 1 ;
        $listRows   =   C('LIST_ROWS') > 0 ? C('LIST_ROWS') : 10;
        $page       =   new \Think\Page($total, $listRows, $request);
        $p          =   $page->show();
        $this->assign('_page', $p? $p: '');

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

        $this->meta_title = '办理中的留言';
        $this->display("index");
    }

    /* 已答复 */
    public function done(){
        
        $title =   I('title');
        $maps  =  array();
        $maps['status'] = array('in','4,5');
        $maps['uid']    =   array("in",implode(",",$this->uid_array));

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

        $total = M('Ask')->where($maps)->count();

        $request    =   (array)I('request.');
        $total      =   $total? $total : 1 ;
        $listRows   =   C('LIST_ROWS') > 0 ? C('LIST_ROWS') : 10;
        $page       =   new \Think\Page($total, $listRows, $request);
        $p          =   $page->show();
        $this->assign('_page', $p? $p: '');

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

        $this->meta_title = '待办理留言';
        $this->display("index");
    }

    // 回复网友
    public function answer() {

        $id = I('get.id');
        if ( !$id ) {
            $this->error("出现错误！");
        }

        $ask = M("Ask")->where(array("id"=>$id))->find();
        $this->assign($ask);
        if ( !in_array($ask["uid"],$this->uid_array) ) {
            $this->error("出现错误！");
        }

        $reply = M("Reply")->order("id desc")->where(array("aid"=>$id))->find();

        $this->assign("reply",$reply);
        if (empty($reply)) {
            $this->error("请先回复留言，再进行审核！");
        }
        if (IS_POST) {

            $_POST['explain'] = html_entity_decode($_POST['explain']);
            $_POST['reply_content'] = html_entity_decode($_POST['reply_content']);
            $_POST['aid'] = $id;
            $_POST['create_time'] = time();
            $_POST['uid'] = UID;

            M("Ask")->where(array("id"=>$id))->save(array("status"=>5,"finish_time"=>time(),"update_time"=>time()));
            M("Reply")->where(array("id"=>$reply["id"]))->save($_POST);
            
            $member = M("Member")->where(array("uid"=>UID))->find();

            $process = array();
            $process["uid"] = $ask["uid"];
            $process["aid"] = $id;
            $process["status"] = 5;
            $process["create_time"] = time();
            $process["create_uid"] = UID;
            $process["info"] = $member["nickname"]." 发布留言到网站";
            M("Process")->add($process);

            $this->success("回复网友成功！",U('Ask/done'));

        }

        $this->meta_title = '留言：'.$ask['name'];
        $this->display("reply");

    }

    // 退回
    public function call_back() {

        $id = I('post.aid');
        if ( !$id ) {
            $this->error("出现错误！");
        }
        $info = I('post.call_back_info');
        if ( !$info ) {
            $this->error("退回重办原因不能为空！");
        }

        $ask = M("Ask")->where(array("id"=>$id))->find();
        if ( !in_array($ask["uid"],$this->uid_array) ) {
            $this->error("出现错误！");
        }

        M("Ask")->where(array("id"=>$id))->save(array("status"=>60,"finish_time"=>'',"update_time"=>time() ));
        
        $member = M("Member")->where(array("uid"=>UID))->find();

        $process = array();
        $process["uid"] = $ask["uid"];
        $process["aid"] = $id;
        $process["status"] = 60;
        $process["create_time"] = time();
        $process["create_uid"] = UID;
        $process["info"] = $member["nickname"].": ".$info;
        M("Process")->add($process);

        $this->success('已退回！');

    }

    /* 退回 */
    public function unsatisfied(){
        
        $title       =   I('title');
        $maps  =  array();
        $maps['status'] = array('eq', 60);
        $maps['uid']    =   array("eq",UID);

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

        $total = M('Ask')->where($maps)->count();

        $request    =   (array)I('request.');
        $total      =   $total? $total : 1 ;
        $listRows   =   C('LIST_ROWS') > 0 ? C('LIST_ROWS') : 10;
        $page       =   new \Think\Page($total, $listRows, $request);
        $p          =   $page->show();
        $this->assign('_page', $p? $p: '');

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

        $this->meta_title = '退回重办的留言';
        $this->display("index");
    }


    /* 审批 */
    public function sp() {
        $id = I('get.id');

        if ( !$id ) {
            $this->error("出现错误！");
        }
        if (IS_POST) {
            $status = I('post.status');
            $info = I('post.info');
            if (!$status) {
                $this->error("请选择审批意见！");
            }else {
                
                $ask = M("Ask")->where(array("id"=>$id))->find();

                if ( $status == 1 ) {
                    if ( !empty($ask) ) {

                        M("Ask")->where(array("id"=>$id))->save(array("status"=>1,"update_time"=>time()));
                        $process = array();
                        $process["uid"] = $ask["uid"];
                        $process["aid"] = $id;
                        $process["status"] = 1;
                        $process["create_time"] = time();
                        $process["create_uid"] = UID;
                        $process["info"] = "审核通过";

                        M("Process")->add($process);
                        $this->success("审批成功！",U('Ask/my'));

                    }else {
                        $this->error("出现错误！");
                    }
                }else {
                    if( !$info ) {
                        $this->error("请填写未通过原因！");
                    }else{

                        M("Ask")->where(array("id"=>$id))->save(array("status"=>10,"update_time"=>time()));
                        $process = array();
                        $process["uid"] = $ask["uid"];
                        $process["aid"] = $id;
                        $process["status"] = 10;
                        $process["create_time"] = time();
                        $process["create_uid"] = UID;
                        $process["info"] = "审核未通过 ".$info;

                        M("Process")->add($process);
                        $this->success("处理完成！",U('Ask/my'));

                    }
                } 

            }

            exit;
        }

        $ask = M("Ask")->where(array("id"=>$id))->find();

        if ($ask['status'] != 0) {
            $this->error("该留言已经审批过！");
        }

        $this->assign($ask);

        $yjdw = M("Auth_group_access")->alias('A')->join(C('DB_PREFIX').'member B ON A.uid = B.uid')->where(array("A.group_id"=>3))->select();
        $this->assign('yjdw', $yjdw);

        $this->display();
    }

    /* 流程明细 */
    public function detail() {
        $id = I('get.id');
        if ( !$id ) {
            $this->error("出现错误！");
        }
        
        $ask = M("Ask")->where(array("id"=>$id))->find();
        if ( !in_array($ask["uid"],$this->uid_array) ) {
            $this->error("出现错误！");
        }

        $this->assign($ask);

        $reply = M("Reply")->order("id DESC")->where(array("aid"=>$id))->select();
        $this->assign("reply",$reply);

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

        $this->display();
    }

    /* 留言答复 */
    public function reply(){

        $id = I('get.id');
        if ( !$id ) {
            $this->error("出现错误！");
        }
        
        $ask = M("Ask")->where(array("id"=>$id))->find();
        if ( !in_array($ask["uid"],$this->uid_array) ) {
            $this->error("出现错误！");
        }
        $this->assign($ask);
        
        if(IS_POST){

            $_POST['explain'] = $_POST['explain'];
            $_POST['reply_content'] = $_POST['reply_content'];
            $_POST['aid'] = $id;
            $_POST['create_time'] = time();
            $_POST['uid'] = UID;

            if(empty($_POST['explain']))
            {
                $this->error("办理情况不能为空");
            }

            if(empty($_POST['reply_content']))
            {
                $this->error("答复口径不能为空");
            }

            if(empty($_POST['transactor']))
            {
                $this->error("经办人不能为空");
            }

            if(empty($_POST['transactor_tel']))
            {
                $this->error("联系电话不能为空");
            }
            
            
            M("Reply")->add($_POST);
            M("Ask")->where(array("id"=>$_POST['aid']))->save(array("status"=>4,"update_time"=>time()));
            $process = array();
            $process["uid"] = $ask["uid"];
            $process["aid"] = $_POST['aid'];
            $process["status"] = 4;
            $process["create_time"] = time();
            $process["create_uid"] = UID;
            $process["info"] = "回复成功";
            M("Process")->add($process);
            $this->success("答复成功！",U('Ask/processing'));
            
        } else {
            $this->meta_title = '回复：'.$ask['name'];
            $this->display();
        }
    }

    /* 更改受理单位 */
    public function change() {
        $id = I('get.id');
        if ( !$id ) {
            $this->error("出现错误！");
        }
        $ask = M("Ask")->where(array("id"=>$id))->find();
        $this->assign($ask);
        if (IS_POST) {
            $pid = I('post.pid');
            if ( !$pid ) {
                $this->error("请选择受理单位");
            }else {
                M("Ask")->where(array("id"=>$id))->save(array("uid"=>$pid));

                $pmember = M("Member")->where(array("uid"=>$pid))->find();
                $process = array();
                $process["uid"] = $pid;
                $process["aid"] = $id;
                $process["status"] = 0;
                $process["create_time"] = time();
                $process["create_uid"] = UID;
                $process["info"] = "将留言指派到 ".$pmember['nickname'];

                M("Process")->add($process);

                $this->success("处理成功！",U('Ask/index'));

            }

        }
        $yjdw = M("Auth_group_access")->alias('A')->join(C('DB_PREFIX').'member B ON A.uid = B.uid')->where(array("A.group_id"=>3))->select();
        $this->assign('yjdw', $yjdw);
        $this->display();
    }

    // 指派
    public function assign_to() {
        $id = I('get.id');
        if ( !$id ) {
            $this->error("出现错误！");
        }
        $ask = M("Ask")->where(array("id"=>$id))->find();
        $this->assign($ask);
        if (IS_POST) {
            $pid = I('post.pid');
            if ( !$pid ) {
                $this->error("请选择指派单位");
            }else {
                M("Ask")->where(array("id"=>$id))->save(array("uid"=>$pid,"update_time"=>time()));

                $member = M("Member")->where(array("uid"=>$pid))->find();
                $old_member = M("Member")->where(array("uid"=>$ask["uid"]))->find();

                $process = array();
                $process["uid"] = $pid;
                $process["aid"] = $id;
                $process["status"] = 1;
                $process["create_time"] = time();
                $process["create_uid"] = UID;
                $process["info"] = $old_member['nickname']." 将留言指派到 ".$member['nickname'];

                M("Process")->add($process);

                $this->success("指派留言成功！",U('Ask/processing'));

            }

        }
        $yjdw = M("Auth_group_access")->alias('A')->join(C('DB_PREFIX').'member B ON A.uid = B.uid')->where(array("B.pid"=>UID))->select();
        $this->assign('yjdw', $yjdw);
        $this->display();
    }

    // 认领
    public function adopt() {

        $id = I('get.id');

        if ( !$id ) {
            $this->error("出现错误！");
        }

        $ask = M("Ask")->where(array("id"=>$id))->find();

        if ($ask['uid']) {
            $this->error("该留言已指派受理单位！");
        }else {

            M("Ask")->where(array("id"=>$id))->save(array("uid"=>UID,"update_time"=>time(),"status"=>1));
            $member = M("Member")->where(array("uid"=>UID))->find();

            $process = array();
            $process["uid"] = UID;
            $process["aid"] = $id;
            $process["status"] = 1;
            $process["create_time"] = time();
            $process["create_uid"] = UID;
            $process["info"] = $member['nickname']." 认领了该留言";

            M("Process")->add($process);
            
            $this->success("认领成功！");
        }

    }

    //重办
    public function re_do(){

        $id = I('get.id');
        if ( !$id ) {
            $this->error("出现错误！");
        }
        
        $ask = M("Ask")->where(array("id"=>$id))->find();
        $reply = M("Reply")->order("id desc")->where(array("aid"=>$id))->find();

        $this->assign("reply",$reply);

        if ( !in_array($ask["uid"],$this->uid_array) ) {
            $this->error("出现错误！");
        }
        $this->assign($ask);
        
        if(IS_POST){

            $_POST['explain'] = $_POST['explain'];
            $_POST['reply_content'] = $_POST['reply_content'];
            $_POST['aid'] = $id;
            $_POST['create_time'] = time();
            $_POST['uid'] = UID;

            if(empty($_POST['explain']))
            {
                $this->error("办理情况不能为空");
            }

            if(empty($_POST['reply_content']))
            {
                $this->error("答复口径不能为空");
            }

            if(empty($_POST['transactor']))
            {
                $this->error("经办人不能为空");
            }

            if(empty($_POST['transactor_tel']))
            {
                $this->error("联系电话不能为空");
            }
            
            M("Reply")->add($_POST);
            M("Ask")->where(array("id"=>$_POST['aid']))->save(array("status"=>4,"update_time"=>time()));
            $process = array();
            $process["uid"] = $ask["uid"];
            $process["aid"] = $_POST['aid'];
            $process["status"] = 4;
            $process["create_time"] = time();
            $process["create_uid"] = UID;
            $process["info"] = "重新办理成功";
            M("Process")->add($process);
            $this->success("重新办理成功！",U('Ask/unsatisfied'));
        } else {
            $this->meta_title = '重新办理：'.$ask['name'];
            $this->display("reply");
        }
    }

    public function add(){
        //获取左边菜单
        $this->getMenu();

        $cate_id    =   I('get.cate_id',0);
        $model_id   =   I('get.model_id',0);
		$group_id	=	I('get.group_id','');

        empty($cate_id) && $this->error('参数不能为空！');
        empty($model_id) && $this->error('该分类未绑定模型！');

        //检查该分类是否允许发布
        $allow_publish = check_category($cate_id);
        !$allow_publish && $this->error('该分类不允许发布内容！');

        // 获取当前的模型信息
        $model    =   get_document_model($model_id);

        //处理结果
        $info['pid']            =   $_GET['pid']?$_GET['pid']:0;
        $info['model_id']       =   $model_id;
        $info['category_id']    =   $cate_id;
		$info['group_id']		=	$group_id;

        if($info['pid']){
            // 获取上级文档
            $article            =   M('Document')->field('id,title,type')->find($info['pid']);
            $this->assign('article',$article);
        }

        //获取表单字段排序
        $fields = get_model_attribute($model['id']);
        $this->assign('info',       $info);
        $this->assign('fields',     $fields);
        $this->assign('type_list',  get_type_bycate($cate_id));
        $this->assign('model',      $model);
        $this->meta_title = '新增'.$model['title'];
        $this->display();
    }

    public function edit(){
        //获取左边菜单
        $this->getMenu();

        $id     =   I('get.id','');
        if(empty($id)){
            $this->error('参数不能为空！');
        }

        // 获取详细数据 
        $Document = D('Document');
        $data = $Document->detail($id);
        if(!$data){
            $this->error($Document->getError());
        }

        if($data['pid']){
            // 获取上级文档
            $article        =   $Document->field('id,title,type')->find($data['pid']);
            $this->assign('article',$article);
        }
        // 获取当前的模型信息
        $model    =   get_document_model($data['model_id']);

        $this->assign('data', $data);
        $this->assign('model_id', $data['model_id']);
        $this->assign('model',      $model);

        //获取表单字段排序
        $fields = get_model_attribute($model['id']);
        $this->assign('fields',     $fields);


        //获取当前分类的文档类型
        $this->assign('type_list', get_type_bycate($data['category_id']));

        $this->meta_title   =   '编辑文档';
        $this->display();
    }

    /**
     * 更新一条数据
     * @author huajie <banhuajie@163.com>
     */
    public function update(){
        $document   =   D('Document');
        $res = $document->update();
        if(!$res){
            $this->error($document->getError());
        }else{
            $this->success($res['id']?'更新成功':'新增成功', Cookie('__forward__'));
        }
    }

    protected function checkDynamic(){
        $cates = AuthGroupModel::getAuthCategories(UID);
        switch(strtolower(ACTION_NAME)){
            case 'index':   //文档列表
            case 'add':   // 新增
                $cate_id =  I('cate_id');
                break;
            case 'edit':    //编辑
            case 'update':  //更新
                $doc_id  =  I('id');
                $cate_id =  M('Document')->where(array('id'=>$doc_id))->getField('category_id');
                break;
            case 'setstatus': //更改状态
            case 'permit':    //回收站
                $doc_id  =  (array)I('ids');
                $cate_id =  M('Document')->where(array('id'=>array('in',$doc_id)))->getField('category_id',true);
                $cate_id =  array_unique($cate_id);
                break;
        }
        if(!$cate_id){
            return null;//不明
        }elseif( !is_array($cate_id) && in_array($cate_id,$cates) ) {
            return true;//有权限
        }elseif( is_array($cate_id) && $cate_id==array_intersect($cate_id,$cates) ){
            return true;//有权限
        }else{
            return false;//无权限
        }
    }

}
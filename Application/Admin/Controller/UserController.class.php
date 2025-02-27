<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Admin\Controller;
use User\Api\UserApi;

/**
 * 后台用户控制器
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
class UserController extends AdminController {

    public function index(){
        $nickname       =   trim(I('nickname'));
        $maps  =  array();
        if ( $nickname ) {
            if(is_numeric($nickname)){
                $maps['uid|nickname']=   array(intval($nickname),array('like','%'.$nickname.'%'),'_multi'=>true);
            }else{
                $maps['nickname']    =   array('like', '%'.(string)$nickname.'%');
            }
        }
        // $list   = $this->lists('Member', $map);
        // int_to_string($list);

        $tree = D('Member')->getTree(0,true,$maps);
        $this->assign('tree', $tree);
        C('_SYS_GET_CATEGORY_TREE_', true); //标记系统获取分类树模板

        $this->meta_title = '用户信息';
        $this->display();
    }

    /**
     * 显示分类树，仅支持内部调
     * @param  array $tree 分类树
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function tree($tree = null){
        C('_SYS_GET_CATEGORY_TREE_') || $this->_empty();
        $this->assign('tree', $tree);
        $this->display('tree');
    }

    /**
     * 修改昵称初始化
     * @author huajie <banhuajie@163.com>
     */
    public function updateNickname(){
        $nickname = M('Member')->getFieldByUid(UID, 'nickname');
        $this->assign('nickname', $nickname);
        $this->meta_title = '修改昵称';
        $this->display('updatenickname');
    }

    /**
     * 修改昵称提交
     * @author huajie <banhuajie@163.com>
     */
    public function submitNickname(){
        //获取参数
        $nickname = I('post.nickname');
        $password = I('post.password');
        empty($nickname) && $this->error('请输入昵称');
        empty($password) && $this->error('请输入密码');

        //密码验证
        $User   =   new UserApi();
        $uid    =   $User->login(UID, $password, 4);
        ($uid == -2) && $this->error('密码不正确');

        $Member =   D('Member');
        $data   =   $Member->create(array('nickname'=>$nickname));
        if(!$data){
            $this->error($Member->getError());
        }

        $res = $Member->where(array('uid'=>$uid))->save($data);

        if($res){
            $user               =   session('user_auth');
            $user['username']   =   $data['nickname'];
            session('user_auth', $user);
            session('user_auth_sign', data_auth_sign($user));
            $this->success('修改昵称成功！');
        }else{
            $this->error('修改昵称失败！');
        }
    }

    /**
     * 修改密码初始化
     * @author huajie <banhuajie@163.com>
     */
    public function updatePassword(){
        $this->meta_title = '修改密码';
        $this->display('updatepassword');
    }

    /**
     * 修改密码提交
     * @author huajie <banhuajie@163.com>
     */
    public function submitPassword(){
        //获取参数
        $password   =   I('post.old');
        empty($password) && $this->error('请输入原密码');
        $data['password'] = I('post.password');
        empty($data['password']) && $this->error('请输入新密码');
        $repassword = I('post.repassword');
        empty($repassword) && $this->error('请输入确认密码');

        if($data['password'] !== $repassword){
            $this->error('您输入的新密码与确认密码不一致');
        }

        $Api    =   new UserApi();
        $res    =   $Api->updateInfo(UID, $password, $data);
        if($res['status']){
            $this->success('修改密码成功！');
        }else{
            $this->error($res['info']);
        }
    }

    /**
     * 用户行为列表
     * @author huajie <banhuajie@163.com>
     */
    public function action(){
        //获取列表数据
        $Action =   M('Action')->where(array('status'=>array('gt',-1)));
        $list   =   $this->lists($Action);
        int_to_string($list);
        // 记录当前列表页的cookie
        Cookie('__forward__',$_SERVER['REQUEST_URI']);

        $this->assign('_list', $list);
        $this->meta_title = '用户行为';
        $this->display();
    }

    /**
     * 新增行为
     * @author huajie <banhuajie@163.com>
     */
    public function addAction(){
        $this->meta_title = '新增行为';
        $this->assign('data',null);
        $this->display('editaction');
    }

    /**
     * 编辑行为
     * @author huajie <banhuajie@163.com>
     */
    public function editAction(){
        $id = I('get.id');
        empty($id) && $this->error('参数不能为空！');
        $data = M('Action')->field(true)->find($id);

        $this->assign('data',$data);
        $this->meta_title = '编辑行为';
        $this->display('editaction');
    }

    /**
     * 更新行为
     * @author huajie <banhuajie@163.com>
     */
    public function saveAction(){
        $res = D('Action')->update();
        if(!$res){
            $this->error(D('Action')->getError());
        }else{
            $this->success($res['id']?'更新成功！':'新增成功！', Cookie('__forward__'));
        }
    }

    /**
     * 会员状态修改
     * @author 朱亚杰 <zhuyajie@topthink.net>
     */
    public function changeStatus($method=null){
        $id = array_unique((array)I('id',0));
        if( in_array(C('USER_ADMINISTRATOR'), $id)){
            $this->error("不允许对超级管理员执行该操作!");
        }
        $id = is_array($id) ? implode(',',$id) : $id;
        if ( empty($id) ) {
            $this->error('请选择要操作的数据!');
        }
        $map['uid'] =   array('in',$id);
        switch ( strtolower($method) ){
            case 'forbiduser':
                $this->forbid('Member', $map );
                break;
            case 'resumeuser':
                $this->resume('Member', $map );
                break;
            case 'deleteuser':
                $this->delete('Member', $map );
                break;
            default:
                $this->error('参数非法');
        }
    }

    public function add($username = '', $password = '', $repassword = '', $email = '',$contact='', $tel=''){
        if(IS_POST){
            /* 检测密码 */
            if($password != $repassword){
                $this->error('密码和重复密码不一致！');
            }

            /* 调用注册接口注册用户 */
            $User   =   new UserApi;
            $uid    =   $User->register($username, $password, $email);

            if(0 < $uid){

                $user = array('uid' => $uid, 'nickname' => $username, 'status' => 1, 'contact'=>$contact, 'tel'=>$tel,'type'=>$_POST['type'],'name'=>$_POST['name'],'home_link'=>$_POST['home_link'],'weibo_link'=>$_POST['weibo_link'],'weibo'=>$_POST['weibo'],'weixin'=>$_POST['weixin']);
                if ($_POST['pid']) {
                    $user['pid'] = $_POST["pid"];
                }

                if(!M('Member')->add($user)){
                    $this->error('用户添加失败！');
                } else {
                    $this->success('用户添加成功！',U('index'));
                }
            } else { 
                $this->error($this->showRegError($uid));
            }
        } else {

            $parents = M("Member")->where(array("uid"=>array("neq","1"),"pid"=>array("EXP","IS NULL")))->select();
            $this->assign('parents', $parents);
            $this->meta_title = '新增用户';
            $this->display();

        }
    }

    public function edit(){

        $id = I('get.id');
        empty($id) && $this->error('参数不能为空！');
        $data = M('Member')->alias('A')->join('ot_ucenter_member B ON A.uid = B.id')->find($id);
        $this->assign('data',$data);

        $parents = M("Member")->where(array("uid"=>array("neq","1"),"pid"=>array("eq",0)))->select();
        $this->assign('parents', $parents);
        $this->meta_title = '编辑用户';

        if(IS_POST){

            extract($_POST);

            $old_email = $data["email"];

            $data = array();
            if ($old_email != $email) {
                $data["email"] = $email;
            }

            if (trim(I('post.password'))) {
                if($password != $repassword){
                    $this->error('密码和重复密码不一致！');
                }else {
                    if (strlen($password)<6) {
                        $this->error('密码长度必须在6-30个字符之间！');
                    }else {
                        $data["password"] = $password;
                    }
                }
            }
            if (!empty($data)) {
                $User   =   new UserApi;
                $rt = $User->updateInfoNp($id, $data);
            }else {
                $rt = 1;
            }

            if($rt){ 

                $user_array = array('pid'=>$pid, 'nickname' => $username, 'status' => 1, 'contact'=>$contact, 'tel'=>$tel,'type'=>$_POST['type'],'name'=>$_POST['name'],'home_link'=>$_POST['home_link'],'weibo_link'=>$_POST['weibo_link'],'weibo'=>$_POST['weibo'],'weixin'=>$_POST['weixin']);
                if ($_POST['pid']) {
                    $user['pid'] = $_POST["pid"];
                }

                D('Member')->where(array('uid'=>$id))->save($user_array);
                $this->success('用户编辑成功！',U('index'));
                
            } else { 
                $this->error($this->showRegError($uid));
            }

        } else {
            $parents = M("Member")->where(array("uid"=>array("neq","1"),"pid"=>array("EXP","IS NULL")))->select();
            $this->assign('parents', $parents);
            $this->display("add");
        }
    }


    /**
     * 获取用户注册错误信息
     * @param  integer $code 错误编码
     * @return string        错误信息
     */
    private function showRegError($code = 0){
        switch ($code) {
            case -1:  $error = '用户名长度必须在16个字符以内！'; break;
            case -2:  $error = '用户名被禁止注册！'; break;
            case -3:  $error = '用户名被占用！'; break;
            case -4:  $error = '密码长度必须在6-30个字符之间！'; break;
            case -5:  $error = '邮箱格式不正确！'; break;
            case -6:  $error = '邮箱长度必须在1-32个字符之间！'; break;
            case -7:  $error = '邮箱被禁止注册！'; break;
            case -8:  $error = '邮箱被占用！'; break;
            case -9:  $error = '手机格式不正确！'; break;
            case -10: $error = '手机被禁止注册！'; break;
            case -11: $error = '手机号被占用！'; break;
            default:  $error = '未知错误';
        }
        return $error;
    }

}
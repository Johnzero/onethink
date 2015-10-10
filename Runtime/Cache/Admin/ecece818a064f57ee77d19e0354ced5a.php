<?php if (!defined('THINK_PATH')) exit(); if(is_array($tree)): $i = 0; $__LIST__ = $tree;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$list): $mod = ($i % 2 );++$i;?><dl class="cate-item">
        <dt class="cf ">
            <form action="<?php echo U('edit');?>" method="post">
                <table border="0" width="100%">
                    <tr>
                        <td width="5%">
                            <div class="fold">
                                <i>
                                </i>
                            </div>
                        </td> 
                        <td width="5%"><?php echo ($list["uid"]); ?> </td>
                        <td width="15%" class="text-left">
                            <?php if($list["pid"] != 0): ?><span class="tab-sign"></span><?php endif; ?>
                            &nbsp;<?php echo ($list["nickname"]); ?>
                        </td>
                        <td width="5%"><?php echo ($list["score"]); ?></td>
                        <td width="10%"><?php echo ($list["login"]); ?></td>
                        <td width="15%">
                            <span>
                                <?php if($list["last_login_time"] == 0): ?>暂未登陆
                                <?php else: ?>
                                    <?php echo (time_format($list["last_login_time"])); endif; ?>
                            </span>
                        </td>
                        <td width="15%">
                        <span>
                            <?php if($list["last_login_ip"] == 0): ?>暂未登陆
                            <?php else: ?>
                                <?php echo long2ip($list['last_login_ip']); endif; ?>
                        </span>
                        </td>
                        <td width="10%">
                            <?php $st = array(1=>'正常',-1=>'删除',0=>'禁用',2=>'未审核',3=>'草稿'); echo $st[$list['status']]; ?>
                        </td>
                        <td width="25%">
                            
                            <a href="<?php echo U('User/edit?id='.$list['uid']);?>" target="_blank">编辑</a>&nbsp;|

                            <?php if(($list["status"]) == "1"): ?><a href="<?php echo U('User/changeStatus?method=forbidUser&id='.$list['uid']);?>" class="ajax-get">禁用</a>&nbsp;|
                                <?php else: ?>
                                <a href="<?php echo U('User/changeStatus?method=resumeUser&id='.$list['uid']);?>" class="ajax-get">启用</a>&nbsp;|<?php endif; ?>
                            <a href="<?php echo U('AuthManager/group?uid='.$list['uid']);?>" class="authorize">授权</a>&nbsp;|
                            <a href="<?php echo U('User/changeStatus?method=deleteUser&id='.$list['uid']);?>" class="confirm ajax-get">删除</a>
                        </td>
                    </tr>
                </table>
                <span class="help-inline msg">
                </span>

            </form>
        </dt>
        <?php if(!empty($list['_'])): ?><dd style="display:none;">
                <?php echo R('user/tree', array($list['_']));?>
            </dd><?php endif; ?>
    </dl><?php endforeach; endif; else: echo "" ;endif; ?>
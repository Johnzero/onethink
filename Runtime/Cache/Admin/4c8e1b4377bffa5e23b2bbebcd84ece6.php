<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title><?php echo ($meta_title); ?></title>
<<<<<<< HEAD
    <!-- <script>document.write('<script src="http://192.168.6.80:8080/livereload.js?snipver=1"></' + 'script>')</script> -->
=======
    <script>document.write('<script src="http://192.168.6.80:8080/livereload.js?snipver=1"></' + 'script>')</script>
>>>>>>> c5aa0e95e0b7d49fc0922542f984bcc79da0b41c
    <link href="/Public/favicon.ico" type="image/x-icon" rel="shortcut icon">
    <link rel="stylesheet" type="text/css" href="/Public/Admin/css/base.css" media="all">
    <link rel="stylesheet" type="text/css" href="/Public/Admin/css/common.css" media="all">
    <link rel="stylesheet" type="text/css" href="/Public/Admin/css/module.css">
    <link rel="stylesheet" type="text/css" href="/Public/Admin/css/style.css" media="all">
	<link rel="stylesheet" type="text/css" href="/Public/Admin/css/<?php echo (C("COLOR_STYLE")); ?>.css" media="all">
    <link rel="stylesheet" href="/Public/static/font-awesome/css/font-awesome.min.css">
     <!--[if lt IE 9]>
    <script type="text/javascript" src="/Public/static/jquery-1.10.2.min.js"></script>
    <link rel="stylesheet" href="/Public/static/font-awesome/css/font-awesome-ie7.min.css">
    <![endif]-->
    <!--[if gte IE 9]><!-->
    <script type="text/javascript" src="/Public/static/jquery-2.0.3.min.js"></script>
    <script type="text/javascript" src="/Public/Admin/js/jquery.mousewheel.js"></script>
    <!--<![endif]-->
    
<link rel="stylesheet" type="text/css" href="/Public/Admin/css/table.css" media="all">

</head>
<body>
    <!-- 头部 -->
    <div class="header">
        <!-- Logo -->
<<<<<<< HEAD
        <span class="logo" style="background:none;color:white;font-size:22px;">办事平台</span>
=======
        <span class="logo"></span>
>>>>>>> c5aa0e95e0b7d49fc0922542f984bcc79da0b41c
        <!-- /Logo -->

        <!-- 主导航 -->
        <ul class="main-nav">
            <?php if(is_array($__MENU__["main"])): $i = 0; $__LIST__ = $__MENU__["main"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$menu): $mod = ($i % 2 );++$i;?><li class="<?php echo ((isset($menu["class"]) && ($menu["class"] !== ""))?($menu["class"]):''); ?>"><a href="<?php echo (U($menu["url"])); ?>"><?php echo ($menu["title"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
        </ul>
        <!-- /主导航 -->

        <!-- 用户栏 -->
        <div class="user-bar">
            <a href="javascript:;" class="user-entrance"><i class="icon-user"></i></a>
            <ul class="nav-list user-menu hidden">
                <li class="manager">你好，<em title="<?php echo session('user_auth.username');?>"><?php echo session('user_auth.username');?></em></li>
                <li><a href="<?php echo U('User/updatePassword');?>">修改密码</a></li>
                <li><a href="<?php echo U('Public/logout');?>">退出</a></li>
            </ul>
        </div>
    </div>
    <!-- /头部 -->

    <!-- 边栏 -->
    <div class="sidebar">
        <!-- 子导航 -->
        
    <div id="subnav" class="subnav">
    <?php if(!empty($_extra_menu)): echo extra_menu($_extra_menu,$__MENU__); endif; ?>
    <?php if(is_array($__MENU__["child"])): $i = 0; $__LIST__ = $__MENU__["child"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$sub_menu): $mod = ($i % 2 );++$i;?><!-- 子导航 -->
        <?php if(!empty($sub_menu)): if(!empty($key)): ?><h3><i class="icon icon-unfold"></i><?php echo ($key); ?></h3><?php endif; ?>
            <ul class="side-sub-menu">
                <?php if(is_array($sub_menu)): $i = 0; $__LIST__ = $sub_menu;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$menu): $mod = ($i % 2 );++$i;?><li>
                        <a class="item" href="<?php echo (U($menu["url"])); ?>"><?php echo ($menu["title"]); ?>
                            <?php if ($_SESSION["menu_nums"][$menu['title']]) { ?>
                            <div class="circle">
                                <p id="messages"><?php echo ($_SESSION["menu_nums"][$menu['title']]); ?></p>
                            </div>
                            <?php } ?>
                        </a>
                    </li><?php endforeach; endif; else: echo "" ;endif; ?>
            </ul><?php endif; ?>
        <!-- /子导航 --><?php endforeach; endif; else: echo "" ;endif; ?>
    
</div>
<script>
    $(function(){
        $(".side-sub-menu li").hover(function(){
            $(this).addClass("hover");
        },function(){
            $(this).removeClass("hover");
        });
    })
</script>


        <!-- /子导航 -->
    </div>
    <!-- /边栏 -->

    <!-- 内容区 -->
    <div id="main-content">
        <div id="top-alert" class="fixed alert alert-error" style="display: none;">
            <button class="close fixed" style="margin-top: 4px;">&times;</button>
            <div class="alert-content">这是内容</div>
        </div>
        <div id="main" class="main">
            
            <!-- nav -->
            <?php if(!empty($_show_nav)): ?><div class="breadcrumb">
                <span>您的位置:</span>
                <?php $i = '1'; ?>
                <?php if(is_array($_nav)): foreach($_nav as $k=>$v): if($i == count($_nav)): ?><span><?php echo ($v); ?></span>
                    <?php else: ?>
                    <span><a href="<?php echo ($k); ?>"><?php echo ($v); ?></a>&gt;</span><?php endif; ?>
                    <?php $i = $i+1; endforeach; endif; ?>
            </div><?php endif; ?>
            <!-- nav -->
            

            
    <div class="main-title">
<<<<<<< HEAD
        <h2>留言留言：<?php echo ($title); ?></h2>
=======
        <h2>留言问题：<?php echo ($title); ?></h2>
>>>>>>> c5aa0e95e0b7d49fc0922542f984bcc79da0b41c
    </div>
    <form method="post" class="form-horizontal">
        <div class="form-left">
            <div class="form-item">
                <label class="item-label">留言用户</label>
                <div class="controls">
                    <input type="text" class="text input-large" value="<?php echo ($name); ?>" readonly="readonly">
                </div>
            </div>

            <div class="form-item">
                <label class="item-label">联系方式</label>
                <div class="controls">
                    <input type="text" class="text input-large" value="<?php echo ($tel); ?>" readonly="readonly">
                </div>
            </div>

            <div class="form-item">
                <label class="item-label">留言内容</label>
                <div class="controls">
                    <label class="textarea input-large">
                        <textarea readonly="readonly"><?php echo ($content); ?></textarea>
                    </label>
                </div>
            </div>

            <div class="form-item">
                <label class="item-label">附件</label>
                <div class="controls">
                    
                </div>
            </div>

            <div class="form-item">
                <label class="item-label">受理单位</label>
                <div class="controls">
                    <select name="pid" disabled="disabled">
                        <?php if(is_array($yjdw)): $i = 0; $__LIST__ = $yjdw;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option value="<?php echo ($vo["uid"]); ?>" <?php if(($$vo["uid"]) == $uid): ?>selected<?php endif; ?> ><?php echo ($vo["nickname"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
                    </select>
                </div>
            </div>
        </div>
        <?php if(!empty($reply)) { ?>
        <div class="form-right">
            <div class="form-item">
                <label class="item-label">办理情况</label>
                <div class="controls">
<<<<<<< HEAD
                    <ul class="tab-nav nav">
                        <?php foreach ($reply as $key => $value): ?>
                        <li class="nav-<?php echo ($value["id"]); ?> <?php if(($key) == "0"): ?>current<?php endif; ?> "><a href="javascript:void(0);" data-reply="<?php echo ($value["id"]); ?>"><?php echo (time_format($value["create_time"])); ?></a></li>
                        <?php endforeach ?>
                    </ul>
                    <label class="textarea input-large">
                        <?php foreach ($reply as $key => $value): ?>
                        <section class="contents-reply reply-<?php echo ($value["id"]); ?>" <?php if(($key) == "0"): ?>style="display:block;"<?php endif; ?>><?php echo ($value["explain"]); ?></section>
                        <?php endforeach ?>
=======
                    <label class="textarea input-large">
                        <section id="contents"><?php echo ($reply["explain"]); ?></section>
>>>>>>> c5aa0e95e0b7d49fc0922542f984bcc79da0b41c
                    </label>
                </div>
            </div>

            <div class="form-item">
                <label class="item-label">网上答复口径</label>
                <div class="controls">
<<<<<<< HEAD
                    <ul class="tab-nav nav">
                        <?php foreach ($reply as $key => $value): ?>
                        <li class="nav-<?php echo ($value["id"]); ?> <?php if(($key) == "0"): ?>current<?php endif; ?> "><a href="javascript:void(0);" data-reply="<?php echo ($value["id"]); ?>"><?php echo (time_format($value["create_time"])); ?></a></li>
                        <?php endforeach ?>
                    </ul>
                    <label class="textarea input-large">
                        <?php foreach ($reply as $key => $value): ?>
                        <section class="contents-reply reply-<?php echo ($value["id"]); ?>" <?php if(($key) == "0"): ?>style="display:block;"<?php endif; ?>><?php echo ($value["reply_content"]); ?></section>
                        <?php endforeach ?>
=======
                    <label class="textarea input-large">
                        <section id="contents"><?php echo ($reply["reply_content"]); ?></section>
>>>>>>> c5aa0e95e0b7d49fc0922542f984bcc79da0b41c
                    </label>
                </div>
            </div>

            <div class="form-item">
                <label class="item-label">经办人</label>
                <div class="controls">
<<<<<<< HEAD
                    <ul class="tab-nav nav">
                        <?php foreach ($reply as $key => $value): ?>
                        <li class="nav-<?php echo ($value["id"]); ?> <?php if(($key) == "0"): ?>current<?php endif; ?> "><a href="javascript:void(0);" data-reply="<?php echo ($value["id"]); ?>"><?php echo (time_format($value["create_time"])); ?></a></li>
                        <?php endforeach ?>
                    </ul>
                    <?php foreach ($reply as $key => $value): ?>
                    <input type="text" class="text input-large contents-reply reply-<?php echo ($value["id"]); ?>" name="transactor" value="<?php echo ($value["transactor"]); ?>" readonly="readonly" <?php if(($key) == "0"): ?>style="display:block;"<?php endif; ?>>
                    <?php endforeach ?>
=======
                    <input type="text" class="text input-large" name="transactor" value="<?php echo ($reply["transactor"]); ?>" readonly="readonly">
>>>>>>> c5aa0e95e0b7d49fc0922542f984bcc79da0b41c
                </div>
            </div>

            <div class="form-item">
                <label class="item-label">联系方式</label>
                <div class="controls">
<<<<<<< HEAD
                    <ul class="tab-nav nav">
                        <?php foreach ($reply as $key => $value): ?>
                        <li class="nav-<?php echo ($value["id"]); ?> <?php if(($key) == "0"): ?>current<?php endif; ?> "><a href="javascript:void(0);" data-reply="<?php echo ($value["id"]); ?>"><?php echo (time_format($value["create_time"])); ?></a></li>
                        <?php endforeach ?>
                    </ul>
                    <?php foreach ($reply as $key => $value): ?>
                    <input type="text" class="text input-large contents-reply reply-<?php echo ($value["id"]); ?>" name="transactor_tel" value="<?php echo ($value["transactor_tel"]); ?>" readonly="readonly" <?php if(($key) == "0"): ?>style="display:block;"<?php endif; ?>>
                    <?php endforeach ?>
                </div>
            </div>
            <div class="form-item">
                <label class="item-label">备注</label>
                <div class="controls">
                    <ul class="tab-nav nav">
                        <?php foreach ($reply as $key => $value): ?>
                        <li class="nav-<?php echo ($value["id"]); ?> <?php if(($key) == "0"): ?>current<?php endif; ?> "><a href="javascript:void(0);" data-reply="<?php echo ($value["id"]); ?>"><?php echo (time_format($value["create_time"])); ?></a></li>
                        <?php endforeach ?>
                    </ul>
                    <label class="textarea input-large">
                        <?php foreach ($reply as $key => $value): ?>
                        <section class="contents-reply reply-<?php echo ($value["id"]); ?>" <?php if(($key) == "0"): ?>style="display:block;"<?php endif; ?>><?php echo ($value["remarks"]); ?></section>
                        <?php endforeach ?>
=======
                    <input type="text" class="text input-large" name="transactor_tel" value="<?php echo ($reply["transactor_tel"]); ?>" readonly="readonly">
                </div>
            </div>

            <div class="form-item">
                <label class="item-label">备注</label>
                <div class="controls">
                    <label class="textarea input-large">
                        <textarea name="remarks" readonly="readonly"><?php echo ($reply["remarks"]); ?></textarea>
>>>>>>> c5aa0e95e0b7d49fc0922542f984bcc79da0b41c
                    </label>
                </div>
            </div>
        </div>
        <?php } ?>
    </form>
    <div class="clearfix">
    <div class="form-item">
        <label class="item-label">办理流程</label>
        <div class="controls">
            <table class="table-fill">
                <thead>
                    <tr>
                        <th class="text-left">
                            状态
                        </th>
                        <th class="text-left">
                            处理人
                        </th>
                        <th class="text-left">
                            意见
                        </th>
                        <th class="text-left">
                            处理时间
                        </th>
                    </tr>
                </thead>
                <tbody class="table-hover">
                    <?php if(is_array($process)): foreach($process as $key=>$vo): ?><tr>
                            <td class="text-left">
                                <?php $types = C('STATUS'); ?>
                                <?php echo ($types[$vo['status']]); ?>
                            </td>
                            <td class="text-left">
                                <?php echo ($vo['member']['nickname']); ?>
                            </td>
                            <td class="text-left">
                                <?php if (!$vo["info"]) { ?>
                                    更改状态
                                <?php }else { ?>
                                    <?php echo ($vo["info"]); ?>
                                <?php } ?>
                                
                            </td>
                            <td class="text-left">
                                <?php echo (time_format($vo["create_time"])); ?>
                            </td>
                        </tr><?php endforeach; endif; ?>
                </tbody>
            </table>
        </div>
    </div>
       
    <div class="form-item">
        <button class="btn btn-return" onclick="javascript:history.back(-1);return false;">返 回</button>
    </div>

        </div>
        <div class="cont-ft">
            <div class="copyright">
                <div class="fl">感谢使用<a href="/" target="_blank"> 安徽省人民政府办事系统 </a>管理平台</div>
            </div>
        </div>
    </div>
    <!-- /内容区 -->
    <script type="text/javascript">
    (function(){
        var ThinkPHP = window.Think = {
            "ROOT"   : "", //当前网站地址
            "APP"    : "/admin.php?s=", //当前项目地址
            "PUBLIC" : "/Public", //项目公共目录地址
            "DEEP"   : "<?php echo C('URL_PATHINFO_DEPR');?>", //PATHINFO分割符
            "MODEL"  : ["<?php echo C('URL_MODEL');?>", "<?php echo C('URL_CASE_INSENSITIVE');?>", "<?php echo C('URL_HTML_SUFFIX');?>"],
            "VAR"    : ["<?php echo C('VAR_MODULE');?>", "<?php echo C('VAR_CONTROLLER');?>", "<?php echo C('VAR_ACTION');?>"]
        }
    })();
    </script>
    <script type="text/javascript" src="/Public/static/think.js"></script>
    <script type="text/javascript" src="/Public/Admin/js/common.js"></script>
    <script type="text/javascript">
        +function(){
            var $window = $(window), $subnav = $("#subnav"), url;
            $window.resize(function(){
                $("#main").css("min-height", $window.height() - 130);
            }).resize();

            /* 左边菜单高亮 */
            url = window.location.pathname + window.location.search;
            url = url.replace(/(\/(p)\/\d+)|(&p=\d+)|(\/(id)\/\d+)|(&id=\d+)|(\/(group)\/\d+)|(&group=\d+)/, "");
            $subnav.find("a[href='" + url + "']").parent().addClass("current");

            /* 左边菜单显示收起 */
            $("#subnav").on("click", "h3", function(){
                var $this = $(this);
                $this.find(".icon").toggleClass("icon-fold");
                $this.next().slideToggle("fast").siblings(".side-sub-menu:visible").
                      prev("h3").find("i").addClass("icon-fold").end().end().hide();
            });

            $("#subnav h3 a").click(function(e){e.stopPropagation()});

            /* 头部管理员菜单 */
            $(".user-bar").mouseenter(function(){
                var userMenu = $(this).children(".user-menu ");
                userMenu.removeClass("hidden");
                clearTimeout(userMenu.data("timeout"));
            }).mouseleave(function(){
                var userMenu = $(this).children(".user-menu");
                userMenu.data("timeout") && clearTimeout(userMenu.data("timeout"));
                userMenu.data("timeout", setTimeout(function(){userMenu.addClass("hidden")}, 100));
            });

	        /* 表单获取焦点变色 */
	        $("form").on("focus", "input", function(){
		        $(this).addClass('focus');
	        }).on("blur","input",function(){
				        $(this).removeClass('focus');
			        });
		    $("form").on("focus", "textarea", function(){
			    $(this).closest('label').addClass('focus');
		    }).on("blur","textarea",function(){
			    $(this).closest('label').removeClass('focus');
		    });

            // 导航栏超出窗口高度后的模拟滚动条
            var sHeight = $(".sidebar").height();
            var subHeight  = $(".subnav").height();
            var diff = subHeight - sHeight; //250
            var sub = $(".subnav");
            if(diff > 0){
                $(window).mousewheel(function(event, delta){
                    if(delta>0){
                        if(parseInt(sub.css('marginTop'))>-10){
                            sub.css('marginTop','0px');
                        }else{
                            sub.css('marginTop','+='+10);
                        }
                    }else{
                        if(parseInt(sub.css('marginTop'))<'-'+(diff-10)){
                            sub.css('marginTop','-'+(diff-10));
                        }else{
                            sub.css('marginTop','-='+10);
                        }
                    }
                });
            }
        }();
    </script>
    
    <script type="text/javascript">
        highlight_subnav('<?php echo U('User/index');?>');
<<<<<<< HEAD
        $(".tab-nav li a").click(function () {
            var id = $(this).data("reply");

            $(".tab-nav li").removeClass("current");
            $(".nav-"+id).addClass("current");

            $(".contents-reply").hide();
            $(".reply-"+id).show();
        })
=======
>>>>>>> c5aa0e95e0b7d49fc0922542f984bcc79da0b41c
    </script>

</body>
</html>
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
            

            
	<!-- 标题 -->
	<div class="main-title">
		<h2>
		<?php echo ($meta_title); ?>
		</h2>
	</div>

	<!-- 按钮工具栏 -->
	<div class="cf">
		<div class="fl">

		 	<button class="btn ajax-post" target-form="ids" url="<?php echo U("Ask/setStatus",array("status"=>1));?>">审核通过</button>

			<!-- <button class="btn ajax-post" target-form="ids" url="<?php echo U("Ask/setStatus",array("status"=>1));?>">启 用</button>
			<button class="btn ajax-post" target-form="ids" url="<?php echo U("Ask/setStatus",array("status"=>0));?>">禁 用</button>
			<button class="btn ajax-post confirm" target-form="ids" url="<?php echo U("Ask/setStatus",array("status"=>-1));?>">删 除</button> -->
			
		</div>

		<!-- 高级搜索 -->
		<div class="search-form fr cf">
			<div class="sleft">
				<div class="drop-down">
					<span id="sch-sort-txt" class="sort-txt" data="<?php echo ($status); ?>"><?php if(get_status_title($status) == ''): ?>所有<?php else: echo get_status_title($status); endif; ?></span>
					<i class="arrow arrow-down"></i>
					<ul id="sub-sch-menu" class="nav-list hidden">
						<li><a href="javascript:;" value="">所有</a></li>
						<?php if((ACTION_NAME) == "index"): $_result=C('STATUS');if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$type): $mod = ($i % 2 );++$i;?><li><a href="javascript:;" value="<?php echo ($key); ?>"><?php echo ($type); ?></a></li><?php endforeach; endif; else: echo "" ;endif; endif; ?>
					</ul>
				</div>
				<input type="text" name="title" class="search-input" value="<?php echo I('title');?>" placeholder="请输入标题文档">
				<a class="sch-btn" href="javascript:;" id="search" url="<?php echo U('Ask/index',false);?>"><i class="btn-search"></i></a>
			</div>
            <div class="btn-group-click adv-sch-pannel fl">
                <button class="btn">高 级<i class="btn-arrowdown"></i></button>
                <div class="dropdown cf">
                	<div class="row">
                		<label>留言时间：</label>
                		<input type="text" id="time-start" name="time-start" class="text input-2x" value="<?php echo I('time-start');?>" placeholder="起始时间" /> -                		
                        <div class="input-append date" id="datetimepicker"  style="display:inline-block">
                            <input type="text" id="time-end" name="time-end" class="text input-2x" value="<?php echo I('time-end');?>" placeholder="结束时间" />
                            <span class="add-on"><i class="icon-th"></i></span>
                        </div>
                	</div>
                </div>
            </div>
		</div>
	</div>


	<!-- 数据表格 -->
    <div class="data-table">
		<table>
    <thead>
        <tr>
			<th class="row-selected row-selected"><input class="check-all" type="checkbox"/></th>
			<th>编号</th>
			<th class="text-left">标题</th>
			<th>受理单位</th>
			<th>留言日期</th>
			<th>办理情况</th>	
			<?php if (ACTION_NAME == "done") {?>
			<th>办理完成</th>
			<?php } ?>
			<th>办理天数</th>
			<?php if (ACTION_NAME != "all" && ACTION_NAME != "index") {?>
			<th>操作</th>
			<?php } ?>
		</tr>
    </thead>
   	<tbody>
   		<?php if (!empty($lists)) { ?>
		<?php if(is_array($lists)): $i = 0; $__LIST__ = $lists;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
	        <td><input class="ids" type="checkbox" name="ids[]" value="<?php echo ($vo["id"]); ?>" /></td>
			<td><?php echo ($vo["id"]); ?></td>
			<td style="text-align: left;"><i class="fa fa-question-circle"></i>&nbsp;&nbsp;<a href="<?php echo U('Ask/detail?id='.$vo['id']);?>" title="查看"><?php echo ($vo["title"]); ?></a></td>
			<td>
				<span>
				<?php echo ($vo['member']['nickname']?$vo['member']['nickname']:'未知'); ?>&nbsp;&nbsp;
				
				<?php if ( $group_id == 1 && $vo['status'] == 0 && empty($vo['member']) ) { ?>
					<a href="<?php echo U('Ask/change?id='.$vo['id']);?>" title="更改"><i class="fa fa-reply-all"></i></a>
				<?php }else if ( $group_id == 3 && $vo['status'] == 0 && empty($vo['member']) ) { ?>
					<a href="<?php echo U('Ask/adopt?id='.$vo['id']);?>" class="ajax-get confirm" title="认领" target-form="form-horizontal"><i class="fa fa-reply-all"></i></a>
				<?php } ?>
				
				<?php if ( $group_id == 3 && $vo['status'] == 1 && $vo['uid'] == UID) { ?>
					<a href="<?php echo U('Ask/assign_to?id='.$vo['id']);?>" title="指派" target-form="form-horizontal"><i class="fa fa-reply-all"></i></a>
				<?php } ?>

				<?php if ( ($group_id == 3 || $group_id == 1) && $vo['status'] == 1 && $vo['uid'] != UID) { ?>
					<a href="" title="督办" target-form="form-horizontal"><i class="fa fa-bell-o"></i></a>
				<?php } ?>

				</span>
			</td>
			<td><span><?php echo (time_format($vo["create_time"])); ?></span></td>
			<td>
				<?php $types = C('STATUS'); ?>
				<?php echo ($types[$vo['status']]); ?>
			</td>
			
	        <?php if (ACTION_NAME == "done") { ?>
	        <td>
				<?php if ($vo['finish_time']) { ?>
				<span><?php echo (time_format($vo["finish_time"])); ?></span>
				<?php } ?>
			</td>
			<?php } ?>
	        <td>
				<?php if ($vo['finish_time']) { $diff_day = round(abs($vo['finish_time']-$vo['create_time'])/86400); }else { $diff_day = round(abs(time()-$vo['create_time'])/86400); } if ( $diff_day < 1 ) { $diff_day = 1; } ?>
				<span <?php if(($diff_day) > "5"): ?>class="red"<?php endif; ?>><?php echo ($diff_day); ?> 天</span>
	        </td>
	        <?php if (ACTION_NAME != "all" && ACTION_NAME != "index") { ?>
	        <td>
				<?php if ( $vo['status'] != 10 ) { ?>
				
					<?php if ( $vo['status'] == 0 ) { ?>
						<a href="<?php echo U('Ask/sp',array('id'=>$vo['id']));?>">审核</a>
					<?php } ?>

					<!-- <a href="<?php echo U('Ask/edit?cate_id='.$vo['category_id'].'&id='.$vo['id']);?>">编辑</a>
					
					<a href="<?php echo U('Ask/setStatus?ids='.$vo['id'].'&status='.abs(1-$vo['status']));?>" class="ajax-get"><?php echo (show_status_op($vo["status"])); ?></a> -->

					<?php if ( $vo['status'] == 1 && $vo['uid'] == UID ) { ?>
						<a href="<?php echo U('Ask/reply?&id='.$vo['id']);?>">办理</a>
					<?php } ?>

					<?php if ( ($group_id == 3 || $group_id == 1) && $vo['status'] == 1 && $vo['uid'] != UID) { ?>
						<a href="" title="督办" target-form="form-horizontal">督办</a>
					<?php } ?>

					<?php if ( $group_id == 3 && $vo['status'] == 4 ) { ?>
						<a href="<?php echo U('Ask/answer?&id='.$vo['id']);?>" title="回复网友">回复网友</a>
						|
						<a href="javascript:void(0);" data-aid="<?php echo ($vo['id']); ?>" title="退回重办" class="call_back_btn">退回重办</a>
					<?php } ?>

					<?php if ( $vo['status'] == 60 && $vo['uid'] == UID ) { ?>
<<<<<<< HEAD
						<a href="<?php echo U('Ask/re_do?&id='.$vo['id']);?>">重办</a>
=======
						<a href="<?php echo U('Ask/reply?&id='.$vo['id']);?>">重办</a>
>>>>>>> c5aa0e95e0b7d49fc0922542f984bcc79da0b41c
					<?php } ?>

					<!-- <a href="<?php echo U('Ask/setStatus?status=-1&ids='.$vo['id']);?>" class="confirm ajax-get">删除</a> -->

				<?php } else { ?>
					<a href="<?php echo U('Ask/detail?id='.$vo['id']);?>">查看</a>
				<?php } ?>
	        </td>
	        <?php } ?>
		</tr><?php endforeach; endif; else: echo "" ;endif; ?>
		<?php } else { ?>
			<tr>
				<td colspan="10" class="text-center"> 暂时还没有内容! </td>
			</tr>
		<?php } ?>
	</tbody>

    </table> 

	</div>

	<!-- 分页 -->
    <div class="page">
        <?php echo ($_page); ?>
    </div>

    <div class="modal call_back">
	    <form method="post" class="call_back_form" action="<?php echo U('Ask/call_back');?>">
	        <div style="width: auto; padding: 0;" class="modal-dialog">
	            <input name="aid" value="" type="hidden" />
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button aria-hidden="true" data-dismiss="modal" class="close close-dialog" type="button">
	                        x
	                    </button>
	                    <h4 class="modal-title">
	                        退回重办原因
	                    </h4>
	                </div>
	                <div class="modal-body">
	                    <textarea name="call_back_info">请输入内容！</textarea>
	                </div>
	                <div class="modal-footer">
	                    <button href="<?php echo U('Ask/call_back?&id='.$vo['id']);?>" class="btn btn-primary ajax-post confirm"
	                    target-form="call_back_form" type="button">
	                        退回
	                    </button>
	                    <button class="btn btn-default close-dialog" type="button">
	                        取消
	                    </button>
	                </div>
	            </div>
	        </div>
	    </form>
	</div>
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
    
<link href="/Public/static/datetimepicker/css/datetimepicker.css" rel="stylesheet" type="text/css">
<?php if(C('COLOR_STYLE')=='blue_color') echo '<link href="/Public/static/datetimepicker/css/datetimepicker_blue.css" rel="stylesheet" type="text/css">'; ?>
<link href="/Public/static/datetimepicker/css/dropdown.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/Public/static/datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="/Public/static/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script type="text/javascript">
$(function(){
	//搜索功能
	$("#search").click(function(){
		var url = $(this).attr('url');
		var status = $("#sch-sort-txt").attr("data");
        var query  = $('.search-form').find('input').serialize();
        query = query.replace(/(&|^)(\w*?\d*?\-*?_*?)*?=?((?=&)|(?=$))/g,'');
        query = query.replace(/^&/g,'');
		if(status != ''){
			query = 'status=' + status + "&" + query;
        }
        if( url.indexOf('?')>0 ){
            url += '&' + query;
        }else{
            url += '?' + query;
        }
		window.location.href = url;
	});

	$(".call_back_btn").click(function () {
		var aid = $(this).data("aid");
		$("input[name='aid']").val(aid);
		$(".call_back").show();
	})
	$("textarea[name='call_back_info']").click(function () {
		if ($(this).val() == "请输入内容！") {
			$(this).val('');
		}
	});

	$(".close-dialog").click(function () {
		$(".call_back").hide();
	})

	/* 状态搜索子菜单 */
	$(".search-form").find(".drop-down").hover(function(){
		$("#sub-sch-menu").removeClass("hidden");
	},function(){
		$("#sub-sch-menu").addClass("hidden");
	});
	$("#sub-sch-menu li").find("a").each(function(){
		$(this).click(function(){
			var text = $(this).text();
			$("#sch-sort-txt").text(text).attr("data",$(this).attr("value"));
			$("#sub-sch-menu").addClass("hidden");
		})
	});

    //回车自动提交
    $('.search-form').find('input').keyup(function(event){
        if(event.keyCode===13){
            $("#search").click();
        }
    });

    $('#time-start').datetimepicker({
        format: 'yyyy-mm-dd',
        language:"zh-CN",
	    minView:2,
	    autoclose:true
    });

    $('#datetimepicker').datetimepicker({
       format: 'yyyy-mm-dd',
        language:"zh-CN",
        minView:2,
        autoclose:true,
        pickerPosition:'bottom-left'
    });
    var getstatus = '';
    <?php if ( $_GET['status'] ) { ?>
	var getstatus = <?php echo ($_GET['status']); ?>;
	<?php } ?>
	if (getstatus) {
		$("#sub-sch-menu li").find("a").each(function(){
			var valuestatus = $(this).attr("value");
			if ( getstatus == valuestatus ) {
				$(this).click();
			}
		})
	}
})
</script>

</body>
</html>
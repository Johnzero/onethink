<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
<title><?php echo C('WEB_SITE_TITLE');?></title>

<script>document.write('<script src="http://192.168.6.80:8080/livereload.js?snipver=1"></' + 'script>')</script>

<link href="/Public/static/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="/Public/static/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<link href="/Public/static/bootstrap/css/docs.css" rel="stylesheet">
<link href="/Public/static/bootstrap/css/onethink.css" rel="stylesheet">

<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
<script src="/Public/static/bootstrap/js/html5shiv.js"></script>
<![endif]-->

<link rel="stylesheet" type="text/css" href="/Public/Admin/css/table.css" media="all">

<!--[if lt IE 9]>
<script type="text/javascript" src="/Public/static/jquery-1.10.2.min.js"></script>
<![endif]-->
<!--[if gte IE 9]><!-->
<script type="text/javascript" src="/Public/static/jquery-2.0.3.min.js"></script>
<script type="text/javascript" src="/Public/static/bootstrap/js/bootstrap.min.js"></script>
<!--<![endif]-->
<!-- 页面header钩子，一般用于加载插件CSS文件和代码 -->
<?php echo hook('pageHeader');?>

</head>
<body>
	<!-- 头部 -->
	<!-- 导航条
================================================== -->
<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <a class="brand" href="<?php echo U('index/index');?>">OneThink</a>
            <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <div class="nav-collapse collapse">
                <ul class="nav">
                    <?php $__NAV__ = M('Channel')->field(true)->where("status=1")->order("sort")->select(); if(is_array($__NAV__)): $i = 0; $__LIST__ = $__NAV__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$nav): $mod = ($i % 2 );++$i; if(($nav["pid"]) == "0"): ?><li>
                            <a href="<?php echo (get_nav_url($nav["url"])); ?>" target="<?php if(($nav["target"]) == "1"): ?>_blank<?php else: ?>_self<?php endif; ?>"><?php echo ($nav["title"]); ?></a>
                        </li><?php endif; endforeach; endif; else: echo "" ;endif; ?>
                </ul>
            </div>
            <div class="nav-collapse collapse pull-right">
                <?php if(is_login()): ?><ul class="nav" style="margin-right:0">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="padding-left:0;padding-right:0"><?php echo get_username();?> <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="<?php echo U('User/profile');?>">修改密码</a></li>
                                <li><a href="<?php echo U('User/logout');?>">退出</a></li>
                            </ul>
                        </li>
                    </ul>
                <?php else: ?>
                    <ul class="nav" style="margin-right:0">
                        <li>
                            <a href="<?php echo U('User/login');?>">登录</a>
                        </li>
                        <li>
                            <a href="<?php echo U('User/register');?>" style="padding-left:0;padding-right:0">注册</a>
                        </li>
                    </ul><?php endif; ?>
            </div>
        </div>
    </div>
</div>

	<!-- /头部 -->
	
	<!-- 主体 -->
	
<div id="main-container" class="container">
    <div class="row">
        
        <!-- 左侧 nav
        ================================================== -->
            <div class="span3 bs-docs-sidebar">
                
                <ul class="nav nav-list bs-docs-sidenav">
                    <?php echo W('Category/lists', array($category['id'], ACTION_NAME == 'index'));?>
                </ul>
            </div>
        
        
	<div class="main-title">
        <h2>留言问题：<?php echo ($title); ?></h2>
    </div>

        <div class="form-item">
            <label class="item-label">留言用户</label>
            <div class="controls">
                <input type="text" class="text input-large" value="<?php echo ($name); ?>" readonly="readonly">
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
            <label class="item-label">受理单位</label>
            <div class="controls">
                <select name="pid" disabled="disabled">
                    <?php if(is_array($yjdw)): $i = 0; $__LIST__ = $yjdw;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option value="<?php echo ($vo["uid"]); ?>" <?php if(($$vo["uid"]) == $uid): ?>selected<?php endif; ?> ><?php echo ($vo["nickname"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
                </select>
            </div>
        </div>

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
			<input type="button" id="message_button" value="免费获取验证码"/>
		</div>
		
		<div class="form-item">
            <label class="item-label">打分</label>
                
			电话号码：
			<input type="text" id="tel" class="text input-large" value="">
			验证码：
			<input type="text" id="ticket" class="text input-large" value="">
			
			<select name="pid" id="score">
				<option value="100" selected>满意</option>
				<option value="0">不满意</option>
			</select>
			
			<button id='type_button' class="btn btn-return" onclick="set_score();return false;">打分</button>
        </div>
       
        <div class="form-item">
            <button class="btn btn-return" onclick="javascript:history.back(-1);return false;">返 回</button>
        </div>
		<script type="text/javascript">
		
		
		var wait=60;
		function time(o) {
			if (wait == 0) {
				o.removeAttribute("disabled");           
				o.value="免费获取验证码";
				wait = 60;
			} else {
				if(wait==60)
				{
					var tel = $('#tel').val();
					if(tel=="")
					{
						alert("请输入电话号码!");return false;
					}
				
					get_message();
				}
				
				o.setAttribute("disabled", true);
				o.value="重新发送(" + wait + ")";
				
				wait--;
				setTimeout(function() {
					time(o)
				},
				1000)
			}
		}
		document.getElementById("message_button").onclick=function(){time(this);}
				
				
				
				
			function get_message(){
				var tel = $('#tel').val();
				if(tel=="")
				{
					alert("请输入电话号码!");return false;
				}
				
				$.ajax({
					type : 'POST',
					url : '/Article/get_message',
					data : {
						tel : tel
					},
					success : function (response , status , xhr) {
						if(response.error==true || response.error==false)
						{
							alert(response.msg);
							if(response.error==false){
								//window.location.reload();
							}
							return false;
						}
						else
						{
							alert("系统繁忙，请稍候再试");
							return false;
						}
					},
					beforeSend : function(){
						$('#message_button').hide();
					},
					complete : function(){
						$('#message_button').show();
					}
				});
				
			}
		
			//get_message
			function set_score(){
				var tel = $('#tel').val();
				var ticket = $('#ticket').val();
				var score = $('#score').val();
				
				if(tel=="")
				{
					alert("请输入电话号码!");return false;
				}
				
				if(ticket=="")
				{
					alert("请输入验证码!");return false;
				}
				
				if(score=="")
				{
					alert("请选择分数!");return false;
				}
				
				$.ajax({
					type : 'POST',
					url : '/Article/ask_detail_score',
					data : {
						tel : tel,
						ticket : ticket,
						score : score,
						ask_id : <?php echo ($id); ?>
					},
					success : function (response , status , xhr) {
						if(response.error==true || response.error==false)
						{
							alert(response.msg);
							if(response.error==false){
								//window.location.reload();
							}
							return false;
						}
						else
						{
							alert("系统繁忙，请稍候再试");
							return false;
						}
					},
					beforeSend : function(){
						$('#type_button').hide();
					},
					complete : function(){
						$('#type_button').show();
					}
				});
			}
			
			
			
			$(function () { 
				$('#btn').click(function () {
				
				})
			});
		</script>

    </div>
</div>

<script type="text/javascript">
    $(function(){
        $(window).resize(function(){
            $("#main-container").css("min-height", $(window).height() - 343);
        }).resize();
    })
</script>
	<!-- /主体 -->

	<!-- 底部 -->
	
    <!-- 底部
    ================================================== -->
    <footer class="footer">
      <div class="container">
          <p> 本站由 <strong><a href="http://www.onethink.cn" target="_blank">OneThink</a></strong> 强力驱动</p>
      </div>
    </footer>

<script type="text/javascript">
(function(){
	var ThinkPHP = window.Think = {
		"ROOT"   : "", //当前网站地址
		"APP"    : "", //当前项目地址
		"PUBLIC" : "/Public", //项目公共目录地址
		"DEEP"   : "<?php echo C('URL_PATHINFO_DEPR');?>", //PATHINFO分割符
		"MODEL"  : ["<?php echo C('URL_MODEL');?>", "<?php echo C('URL_CASE_INSENSITIVE');?>", "<?php echo C('URL_HTML_SUFFIX');?>"],
		"VAR"    : ["<?php echo C('VAR_MODULE');?>", "<?php echo C('VAR_CONTROLLER');?>", "<?php echo C('VAR_ACTION');?>"]
	}
})();
</script>
 <!-- 用于加载js代码 -->
<!-- 页面footer钩子，一般用于加载插件JS文件和JS代码 -->
<?php echo hook('pageFooter', 'widget');?>
<div class="hidden"><!-- 用于加载统计代码等隐藏元素 -->
	
</div>

	<!-- /底部 -->
</body>
</html>
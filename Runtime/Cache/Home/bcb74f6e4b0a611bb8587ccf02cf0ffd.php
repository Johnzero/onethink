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
        
        
	
	<div>
		<form onSubmit="javascript:return check(formUser);" action="" method="post" name="formUser">
        <table width="100%">
            <tbody><tr>
                <td align="right" width="20%">姓名：&nbsp;</td>
                <td><input name="name" type="text" id="name" class="common-input" placeholder="请填写姓名" style="width:90%;">
                <span id="username_notice" style="color:#FF0000"> *</span></td>
            </tr>
            <tr>
                <td align="right">标题：&nbsp;</td>
                <td><input placeholder="请填写标题！" name="title" type="text" id="title" class="common-input" style="width:90%;">
                <span style="color:#FF0000" id="password_notice"> *</span></td>
            </tr>
            <tr>
                <td align="right">手机：&nbsp;</td>
                <td><input placeholder="请填写手机！" name="tel" type="text" id="tel" class="common-input" style="width:90%;">
                <span style="color:#FF0000" id="password_notice"> *</span></td>
            </tr>
			<tr>
                <td align="right">身份证：&nbsp;</td>
                <td><input placeholder="请填写身份证！" name="sfz" type="text" id="sfz" class="common-input" style="width:90%;">
                <span style="color:#FF0000" id="password_notice"> *</span></td>
            </tr>
			<tr>
                <td align="right">邮箱：&nbsp;</td>
                <td><input placeholder="请填写邮箱！" name="email" type="text" id="email" class="common-input" style="width:90%;">
                <span style="color:#FF0000" id="password_notice"> *</span></td>
            </tr>
			<tr>
                <td align="right">详情：&nbsp;</td>
                <td><textarea placeholder="请填写详情！" rows="3" style="width:90%;" name='content'></textarea>
                <span style="color:#FF0000" id="password_notice"> *</span></td>
            </tr>
			
			<tr>	
				<div class="form-item">
					<td align="right">受理单位：&nbsp;</td>
					<td><select name="uid" >
							<?php if(is_array($yjdw)): $i = 0; $__LIST__ = $yjdw;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option value="<?php echo ($vo["uid"]); ?>"><?php echo ($vo["nickname"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
							<option value="0">未知</option>
						</select>
					<span style="color:#FF0000" id="password_notice"> *</span></td>
				</div>
			</tr>
			
			<tr>
				<td></td>
				<td><input name="act" type="hidden" value="act_register">
				<input type="hidden" name="back_act" value="">
				<input name="Submit" type="submit" class="sub_btn fl" style="width:90%" value="提交"></td>
			</tr>
            </tbody></table>
      </form>
	
	</div>
	
	<script type="text/javascript">
		function check(theForm){
			if(theForm.name.value == ""){
				alert("请输入用户名!");theForm.name.focus();return false;
			}
			if(theForm.title.value == ""){
				alert("请输入标题!");theForm.title.focus();return false;
			}
			if(theForm.tel.value == ""){
				alert("请输入电话!");theForm.tel.focus();return false;
			}
			if(theForm.sfz.value == ""){
				alert("请输入身份证!");theForm.sfz.focus();return false;
			}
			if(theForm.content.value == ""){
				alert("请输入详情!");theForm.content.focus();return false;
			}
			return true;
		}
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
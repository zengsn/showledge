<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="common/tag.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<%@include file="common/head.jsp"%>
<title>简随记</title>
<link href="css/emailAutoComplete.css" rel="stylesheet" media="all">
</head>

<body class="output no-fluid zh cn win ie ie11 reader-day-mode reader-font2" data-locale="zh-CN">
	<div class="navbar navbar-jianshu expanded">
		<div class="dropdown">
			<a class="active logo" role="button" href="<%=path%>" data-original-title="个人主页"
				data-container="div.expanded">
				<b>简</b>
				<I class="fa fa-home"></I>
				<span class="title">首页</span>
			</a>
			<a href="" data-original-title="专题" data-toggle="tooltip" data-container="div.expanded"
				data-placement="right">
				<I class="fa fa-th"></I>
				<span class="title">专题</span>
			</a>
			<a class="ad-selector" href="">
				<i class="fa fa-mobile"></i>
				<span class="title">下载手机应用</span>
			</a>
		</div>
		<div class="nav-user">
			<a href="" data-toggle="modal">
				<i class="fa fa-font"></i>
				<span class="title">显示模式</span>
			</a>
		</div>
	</div>

	<div class="navbar-user">
		<a class="login" href="register" data-toggle="modal" data-signup-link="true">
			<i class="fa fa-user"></i>
			注册
		</a>
		<a class="login" href="login" data-toggle="modal" data-signin-link="true">
			<i class="fa fa-sign-in"></i>
			登录
		</a>
	</div>

	<div class="container">
		<div class="login-page">
			<div class="logo">
				<img alt="images logo" src="<%=path%>/images/login/logo.png">
			</div>
			<h4 class="title">
				<span>
					<a class="active" href="login" data-pjax="true">登录</a>
					<b>·</b>
					<a href="register" data-pjax="true">注册</a>
				</span>
			</h4>
			<div id="pjax-container">
				<div class="sign-in">
					<form id="login-form" class="form-horizontal" action="" method="post" accept-charset="UTF-8"
						data-js-module="sign-in">
						<div class="input-prepend domestic parentCls">
							<span class="add-on">
								<i class="fa fa-user"></i>
							</span>
							<input id="userEmail" name="userEmail" class="span2 inputElem" type="text"
								placeholder="手机号码/电子邮件" value="">
						</div>
						<div class="input-prepend password ">
							<span class="add-on">
								<i class="fa fa-unlock-alt"></i>
							</span>
							<input id="userPassword" name="userPassword" class="span2" type="password" placeholder="密码"
								value="" onfocus="loginJS.hidePasswordCss()">
							<span id="errorPasswordMessage"
								style="color:red;display:none;font-size:16px;padding-left:18px;vertical-align:middle;">用户名或密码不正确</span>
						</div>
						<div class="input-prepend">
							<span class="add-on">
								<i class="fa fa-unlock-alt"></i>
							</span>
							<input class="span2" type="text" placeholder="验证码" id="kaptcha" name="kaptcha" maxlength="4"
								class="chknumber_input" value="" style="width: 136px;" onfocus="loginJS.hideVerifyCodeCss()">
							<img id="kaptchaImage" src="<%=path%>/login/getKaptchaImage"
								style="margin-bottom: -3px;padding-left:14px;width: 100px;height: 40px"
								onclick="loginJS.changeCode();" />
							<span id="errorVerifyCodeMessage"
								style="color:red;display:none;font-size:16px;padding-left:18px;vertical-align:middle;">验证码错误</span>
						</div>
						<button id="login-button" type="button" class="ladda-button submit-button" data-color="blue"
							onclick="loginJS.checkLogin();">
							<span class="ladda-label">登 录</span>
						</button>
						<div class="control-group text-left">
							<input id="isRememberLogin" type="checkbox" value="true">
							记住我
							<a href="">忘记密码</a>
						</div>
					</form>
				</div>
			</div>

			<div class="login-sns">
				<p>您还可以通过以下方式直接登录</p>
				<ul class="login-sns">
					<li class="weibo">
						<a href="javascript:void(0)">
							<i class="fa fa-weibo"></i>
						</a>
					</li>
					<li class="qq">
						<a href="javascript:void(0)">
							<i class="fa fa-qq"></i>
						</a>
					</li>
					<li class="google">
						<a href="javascript:void(0)">
							<i class="fa fa-google-plus"></i>
						</a>
					</li>
					<li class="wechat">
						<a href="javascript:void(0)">
							<i class="fa fa-wechat"></i>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>

	<%@include file="common/common-js.jsp"%>
	<script src="js/login.js" type="text/javascript"></script>
	<script src="js/emailAutoComplete.js" type="text/javascript"></script>
</body>
</html>
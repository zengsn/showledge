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
				<img alt="img logo" src="<%=path%>/images/register/logo.png">
			</div>
			<h4 class="title">
				<span>
					<a href="login" data-pjax="true">登录</a>
					<b>·</b>
					<a class="active" href="register" data-pjax="true">注册</a>
				</span>
			</h4>
			<div id="pjax-container">
				<div class="sign-up" data-js-module="sign-up-form">
					<form id="register_form" class="form-horizontal" action="" method="post" accept-charset="UTF-8">
						<div class="input-prepend parentCls">
							<span class="add-on">
								<i class="fa fa-envelope-o"></i>
							</span>
							<input id="userEmail" name="userEmail" class="span2 inputElem" type="text"
								placeholder="你的邮件地址" value="" onblur="registerJS.checkEmailIsValid()"
								onfocus="registerJS.hideEmailCss()" />
							<span id="noEmailMessage"
								style="color:red;display:none;font-size:16px;padding-left:14px;vertical-align:middle;"></span>
							<span id="yesEmailMessage"
								style="color:green;display:none;font-size:16px;padding-left:14px;vertical-align:middle;"></span>
						</div>
						<div class="input-prepend">
							<span class="add-on">
								<i class="fa fa-user"></i>
							</span>
							<input id="userName" name="userName" class="span2" type="text" placeholder="选一个昵称" value=""
								onblur="registerJS.checkNameIsValid()" onfocus="registerJS.hideNameCss()" />
							<span id="noNameMessage"
								style="color:red;display:none;font-size:16px;padding-left:14px;vertical-align:middle;"></span>
							<span id="yesNameMessage"
								style="color:green;display:none;font-size:16px;padding-left:14px;vertical-align:middle;"></span>
						</div>
						<div class="input-prepend">
							<span class="add-on">
								<i class="fa fa-unlock-alt"></i>
							</span>
							<input id="userPassword" name="userPassword" class="span2" type="password" placeholder="输入密码"
								value="" onblur="registerJS.checkPasswordIsValid()" onfocus="registerJS.hidePasswordCss()" />
							<span id="noPasswordMessage"
								style="color:red;display:none;font-size:16px;padding-left:14px;vertical-align:middle;"></span>
							<span id="yesPasswordMessage"
								style="color:green;display:none;font-size:16px;padding-left:14px;vertical-align:middle;"></span>
						</div>
						<button class="ladda-button submit-button" type="button" data-color="green"
							data-disable-with="<span class='ladda-label'>loading</span>"
							onclick="registerJS.checkRegister()">
							<span class="ladda-label">注册</span>
						</button>
						<P class="sign_up_msg">
							点击 “注册” 或下方社交登录按钮，即表示您同意并愿意遵守简笔记
							<A href="">用户协议</A>
							和
							<A href="">隐私政策</A>
						</P>
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
	<script src="js/register.js" type="text/javascript"></script>
	<script src="js/emailAutoComplete.js" type="text/javascript"></script>
</body>
</html>
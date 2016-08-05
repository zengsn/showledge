<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta content="IE=11.0000" http-equiv="X-Ua-Compatible">
<meta charset="utf-8">
<meta http-equiv="X-Ua-Compatible" content="iE=Edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,user-scalable=no">

<title>简笔记</title>

<link href="css/css_1.css" rel="stylesheet" media="all">
<link href="css/css_2.css" rel="stylesheet" media="all">
<link href="css/css_3.css" rel="stylesheet" media="all">
<link href="css/emailAutoComplete.css" rel="stylesheet" media="all">

<link href="images/favicon.ico" rel="icon">

<script src="js/jquery.min.js"></script>
<script src="js/vue.js"></script>
<script src="js/my-vue.js"></script>
<script src="js/register.js"></script>
<script src="js/emailAutoComplete.js"></script>

</head>

<body
	class="output no-fluid zh cn win ie ie11 reader-day-mode reader-font2"
	data-locale="zh-CN" data-js-module="" id="my-vueJS" v-cloak>
	<my-min-sidebar></my-min-sidebar>
	<my-switch-bar></my-switch-bar>
	<div class="container">
		<div class="login-page">
			<div class="logo">
				<img alt="img logo" src="images/register/logo.png">
			</div>
			<h4 class="title">
				<span><a href="login.html" data-pjax="true">登录</a> <b>·</b> <a
					class="active" href="register.html" data-pjax="true">注册</a> </span>
			</h4>
			<div id="pjax-container">
				<div class="sign-up" data-js-module="sign-up-form">
					<form class="form-horizontal" id="sign_up" action="register.do"
						method="post" accept-charset="UTF-8">
						<div class="input-prepend parentCls">
							<span class="add-on"><i class="fa fa-envelope-o"></i></span> <input
								id="userEmail" name="userEmail" class="span2 inputElem"
								type="text" placeholder="你的邮件地址" value=""
								onblur="checkEmailIsValid()" onfocus="clearEmailCss()"/>
							<span id="noEmailMessage"
								style="color:red;display:none;font-size:16px;padding-left:14px;vertical-align:middle;"></span>
							<span id="yesEmailMessage"
								style="color:green;display:none;font-size:16px;padding-left:14px;vertical-align:middle;"></span>
						</div>
						<div class="input-prepend">
							<span class="add-on"><i class="fa fa-user"></i></span> <input
								id="userName" name="userName" class="span2" type="text"
								placeholder="选一个昵称" value="" onblur="checkNameIsValid()"
								onfocus="clearNameCss()" /> 
							<span id="noNameMessage"
								style="color:red;display:none;font-size:16px;padding-left:14px;vertical-align:middle;"></span>
							<span id="yesNameMessage"
								style="color:green;display:none;font-size:16px;padding-left:14px;vertical-align:middle;"></span>
						</div>
						<div class="input-prepend">
							<span class="add-on"><i class="fa fa-unlock-alt"></i></span> <input
								id="userPassword" name="userPassword" class="span2" type="password"
								placeholder="输入密码" value=""
								onblur="checkPasswordIsValid()" onfocus="clearPasswordCss()" />
							<span id="noPasswordMessage"
								style="color:red;display:none;font-size:16px;padding-left:14px;vertical-align:middle;"></span>
							<span id="yesPasswordMessage"
								style="color:green;display:none;font-size:16px;padding-left:14px;vertical-align:middle;"></span>
						</div>
						<button id="register-btn" name="button"
							class="ladda-button submit-button" type="submit"
							data-color="green"
							data-disable-with="<span class='ladda-label'>loading</span>">
							<span class="ladda-label">注册</span>
						</button>
						<P class="sign_up_msg">
							点击 “注册” 或下方社交登录按钮，即表示您同意并愿意遵守简笔记 <A
								href="http://www.jianshu.com/p/c44d171298ce">用户协议</A> 和 <A
								href="http://www.jianshu.com/p/2ov8x3">隐私政策</A> 。
						</P>
					</form>
				</div>
			</div>
			<my-switch-login-bar></my-switch-login-bar>
		</div>
	</div>
</body>
</html>
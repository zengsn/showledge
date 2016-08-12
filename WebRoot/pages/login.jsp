<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script src="js/login.js"></script>
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
				<img alt="images logo" src="images/register/logo.png">
			</div>
			<h4 class="title">
				<span><a class="active" href="login.html" data-pjax="true">登录</a>
					<b>·</b> <a href="register.html" data-pjax="true">注册</a> </span>
			</h4>
			<div id="pjax-container">
				<div class="sign-in">
					<form id="login-form" class="form-horizontal" action=""
						method="post" accept-charset="UTF-8" data-js-module="sign-in">
						<div class="input-prepend domestic parentCls">
							<span class="add-on"><i class="fa fa-user"></i></span> <input
								id="userEmail" name="userEmail" class="span2 inputElem"
								type="text" placeholder="手机号码/电子邮件" value="">
						</div>
						<div class="input-prepend password ">
							<span class="add-on"><i class="fa fa-unlock-alt"></i></span> <input
								id="userPassword" name="userPassword" class="span2"
								type="password" placeholder="密码" value=""
								onfocus="clearPasswordCss()"> <span
								id="noPasswordMessage"
								style="color:red;display:none;font-size:16px;padding-left:18px;vertical-align:middle;">登录失败,用户名或密码不正确</span>
						</div>
						<div class="input-prepend">
							<span class="add-on"><i class="fa fa-unlock-alt"></i></span> <input
								class="span2" type="text" placeholder="验证码" id="kaptcha"
								name="kaptcha" maxlength="4" class="chknumber_input" value=""
								style="width: 136px;" onfocus="clearVerifyCodeCss()"> <img
								src="getKaptchaImage.do" id="kaptchaImage"
								style="margin-bottom: -3px;padding-left:14px;width: 100px;height: 40px"
								onclick="changeCode()" /> <span id="noVerifyCodeMessage"
								style="color:red;display:none;font-size:16px;padding-left:18px;vertical-align:middle;">验证码错误</span>
						</div>
						<button id="login-button" type="button"
							class="ladda-button submit-button" data-color="blue">
							<span class="ladda-label">登 录</span>
						</button>
						<div class="control-group text-left">
							<input name="" type="checkbox" value="true"> 记住我 <a
								href="http://www.jianshu.com/users/password/new">忘记密码</a>
						</div>
					</form>
				</div>
			</div>
			<my-switch-login-bar></my-switch-login-bar>
		</div>
	</div>
</body>
</html>
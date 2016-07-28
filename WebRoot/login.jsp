<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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

<link href="img/favicon.ico" rel="icon">
<link href="img/img_1.png" rel="apple-touch-icon-precomposed"
	sizes="57x57">
<link href="img/img_2.png" rel="apple-touch-icon-precomposed"
	sizes="72x72">
<link href="img/img_3.png" rel="apple-touch-icon-precomposed"
	sizes="76x76">
<link href="img/img_4.png" rel="apple-touch-icon-precomposed"
	sizes="114x114">
<link href="img/img_5.png" rel="apple-touch-icon-precomposed"
	sizes="120x120">
<link href="img/img_6.png" rel="apple-touch-icon-precomposed"
	sizes="152x152">

<script src="js/vue.js"></script>
<script src="js/my-vue.js"></script>
</head>

<body
	class="output no-fluid zh cn win ie ie11 reader-day-mode reader-font2"
	data-locale="zh-CN" data-js-module="" id="my-vueJS" v-cloak>
	<my-min-sidebar></my-min-sidebar>
	<my-switch-bar></my-switch-bar>
	<div class="container">
		<div class="login-page">
			<div class="logo">
				<img alt="img logo" src="img/register/logo.png">
			</div>
			<h4 class="title">
				<span><a class="active" href="login.jsp" data-pjax="true">登录</a>
					<b>·</b> <a href="register.jsp" data-pjax="true">注册</a> </span>
			</h4>
			<div id="pjax-container">
				<div class="sign-in">
					<s:form class="form-horizontal" action="login" method="post"
						accept-charset="UTF-8" data-js-module="sign-in">
						<div class="input-prepend domestic ">
							<span class="add-on"><i class="fa fa-user"></i></span> <input
								name="user.name" class="span2" type="text"
								placeholder="手机号码/电子邮件" value="">
						</div>
						<div class="input-prepend password ">
							<span class="add-on"><i class="fa fa-unlock-alt"></i></span> <input
								name="user.password" class="span2" type="password"
								placeholder="密码" value="">
						</div>
						<button class="ladda-button submit-button" data-color="blue">
							<span class="ladda-label">登 录</span>
						</button>
						<div class="control-group text-left">
							<input name="" type="checkbox" value="true"> 记住我 <a
								href="http://www.jianshu.com/users/password/new">忘记密码</a>
						</div>
					</s:form>
				</div>
			</div>
			<my-switch-login-bar></my-switch-login-bar>
		</div>
	</div>
	<my-min-sidebar-switch></my-min-sidebar-switch>
</body>
</html>
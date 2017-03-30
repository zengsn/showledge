<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common/tag.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="common/head.jsp"%>
<title>登录/注册 - 秀知识</title>

<link href="<%=path%>/css/register.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
	<div class="container">
		<h1>秀知识</h1>
		<h4>Show your knowledge</h4>
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<!-- 警告框 -->
				<div class="alert alert-success" role="alert">注册成功</div>
				<!-- 警告框 end -->
				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation">
						<a href="login" role="tab">登录</a>
					</li>
					<li role="presentation" class="active">
						<a href="register" role="tab">注册</a>
					</li>
				</ul>

				<!-- Tab panes -->
				<div class="tab-content">
					<!--注册-->
					<div role="tabpanel" class="tab-pane active" id="register">
						<div class="col-md-12">
							<form class="form-horizontal" role="form">
								<div class="form-group">
									<div class="col-sm-12">
										<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
										<input id="userEmail" name="userEmail" type="email" class="form-control"
											placeholder="你的邮件地址">
										<label for="inputEmail3" class="col-sm-2 control-label"></label>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-12">
										<span class="glyphicon glyphicon-user form-control-feedback"></span>
										<input id="userName" name="userName" type="text" class="form-control" placeholder="选一个昵称">
										<label for="inputEmail3" class="col-sm-2 control-label"></label>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-12">
										<span class="glyphicon glyphicon-lock form-control-feedback"></span>
										<input id="userPassword" name="userPassword" type="password" class="form-control"
											placeholder="输入密码">
										<label for="inputEmail3" class="col-sm-2 control-label"></label>
									</div>
								</div>
								<%-- <div class="form-group">
									<div class="col-sm-6">
										<input type="password" class="form-control" id="inputPassword3" placeholder="验证码">
									</div>
									<div class="col-sm-3">
										<img id="kaptchaImage" src="<%=path%>/login/getKaptchaImage"
											style="margin-bottom: -3px;padding-left:14px;width: 100px;height: 34px"
											onclick="loginJS.changeCode();" />
									</div>
								</div> --%>
								<div class="form-group">
									<div class="col-sm-12">
										<label>
											点击「注册」按钮，即代表你同意
											<a href="#">《秀知识协议》</a>
										</label>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-12">
										<button type="button" class="btn btn-success btn-block" onclick="registerJS.checkRegister()">注册</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4"></div>
		</div>
	</div>

	<%@ include file="common/common-js.jsp"%>
	<script src="<%=path%>/js/register.js" type="text/javascript"></script>
</body>
</html>
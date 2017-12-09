<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common/tag.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="common/head.jsp"%>
<title>登录/注册 - 简随记</title>

<link href="<%=path%>/css/login.css" rel="stylesheet">

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
				<div class="alert alert-success" role="alert">登录成功</div>
				<!-- 警告框 end -->
				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active">
						<a href="login" role="tab">登录</a>
					</li>
					<li role="presentation">
						<a href="register" role="tab">注册</a>
					</li>
				</ul>

				<!-- Tab panes -->
				<div class="tab-content">
					<!--登录-->
					<div role="tabpanel" class="tab-pane active">
						<div class="col-md-12">
							<form class="form-horizontal" role="form">
								<div class="form-group">
									<div class="col-sm-12">
										<span class="glyphicon glyphicon-user form-control-feedback"></span>
										<input id="userEmail" name="userEmail" type="email" class="form-control" placeholder="邮箱"
											value="${userEmail}">
										<label for="userEmail" class="col-sm-2 control-label"></label>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-12">
										<span class="glyphicon glyphicon-lock form-control-feedback"></span>
										<input id="userPassword" name="userPassword" type="password" class="form-control"
											placeholder="密码" value="${userPassword}">
										<label for="userPassword" class="col-sm-2 control-label"></label>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-6">
										<input id="kaptcha" name="kaptcha" type="text" class="form-control" placeholder="验证码">
									</div>
									<div class="col-sm-3">
										<img id="kaptchaImage" src="<%=path%>/login/getKaptchaImage"
											style="margin-bottom: -3px;padding-left:14px;width: 100px;height: 34px"
											onclick="loginJS.changeCode();" />
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-0 col-sm-6">
										<div class="checkbox">
											<label>
												<input id="rememberFlag" type="checkbox">
												记住帐号
											</label>
											<a href="#">忘记密码</a>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-12">
										<button id="login-btn" type="button" class="btn btn-success btn-block"
											onclick="loginJS.checkLogin();">登录</button>
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
	<script src="<%=path%>/js/login.js" type="text/javascript"></script>
</body>
</html>
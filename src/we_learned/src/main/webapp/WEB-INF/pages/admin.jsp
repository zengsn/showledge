<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common/tag.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="common/head.jsp"%>
<title>简随记 | 控制台</title>

<!-- HTML5 shim an
d Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
	<!--头部菜单栏-->
	<div class="container-fluid">
		<nav class="navbar navbar-inverse" role="navigation">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="admin">简随记</a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li>
							<a href="#">Home</a>
						</li>
						<li>
							<a href="#">Setting</a>
						</li>
						<li>
							<a href="#">Help</a>
						</li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								管理员
								<span class="caret"></span>
							</a>
							<ul class="dropdown-menu" role="menu">
								<li class="divider"></li>
								<li>
									<a href="#">登出</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
	</div>

	<!--网页主要内容-->
	<div class="container-fluid">
		<div class="row">
			<!--左侧导航栏-->
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-pills nav-stacked">
					<li>
						<a href="#" class="" id="all-user">用户管理</a>
					</li>
					<li>
						<a href="#" class="" id="all-passage">文章管理</a>
					</li>
					<li>
						<a href="#" class="" id="all-topic">文集管理</a>
					</li>
					<li>
						<a href="#" class="" id="good-passage">精选文章</a>
					</li>
				</ul>
			</div>
			<!--dashboard内容-->
			<div class="col-sm-9 col-md-10">
				<!-- 4:3 aspect ratio -->
				<div class="embed-responsive embed-responsive-4by3">
					<iframe class="embed-responsive-item" src="admin-welcome"></iframe>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="common/common-js.jsp"%>
	<script>
		window.onload = function() {
			$("#all-user").click(function() {
				$("iframe").attr("src", "admin-user")
			});
			$("#all-passage").click(function() {
				$("iframe").attr("src", "admin-passage")
			});
			$("#all-topic").click(function() {
				$("iframe").attr("src", "admin-topic")
			});
			$("#good-passage").click(function() {
				$("iframe").attr("src", "admin-good-passage")
			});
			$("#good-topic").click(function() {
				$("iframe").attr("src", "admin-good-topic")
			});
		}
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<title>您要找的页面不存在</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="404 Error Widget Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="<%=path%>/css/404.css" rel="stylesheet" type="text/css" media="all" />
<link href='//fonts.googleapis.com/css?family=Raleway:400,100,100italic,200,200italic,300,400italic,500,500italic,600,600italic,700,700italic,800,800italic,900italic,900' rel='stylesheet' type='text/css'>
</head>
<body>
	<div class="main">
		<div class="agileits_main_grid">
			<div class="agileits_main_grid_left">
				<h1>网页好像走丢了~ T T</h1>
			</div>
			<div class="agileits_main_grid_right">
				<a href="<%=path%>/index">返回「简随记」首页</a>
			</div>
			<div class="clear"> </div>
		</div>
		<div class="w3l_main_grid">
			<img src="<%=path%>/images/404.png" alt=" " class="img-responsive" />
		</div>
		<div class="w3ls_main_grid_bottom">
			<div class="w3ls_main_grid_bottom_left">
				<div class="wthree_social_buttons">
					<a href="#" class="wthree_social_button facebook"><i class="fa fa-facebook"></i></a>
					<a href="#" class="wthree_social_button twitter"><i class="fa fa-twitter"></i></a>
					<a href="#" class="wthree_social_button google"><i class="fa fa-google"></i></a>
					<a href="#" class="wthree_social_button pinterest"><i class="fa fa-pinterest"></i></a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
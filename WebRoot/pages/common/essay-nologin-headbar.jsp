<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="wrap-btn">
	<div class="article-related pull-left">
		<a class="collection-menu-btn" data-toggle="modal" data-target="#collection-menu" hidefocus="true"
			onFocus="this.blur()" href="javascript:void(null);">
			<i class="fa fa-th"></i>
		</a>
		<a class="notebooks-menu-btn" data-toggle="modal" data-target="#notebooks-menu" hidefocus="true"
			onFocus="this.blur()" href="javascript:void(null);">
			<i class="fa fa-list-ul"></i>
		</a>
		<div class="related-avatar-group activities"></div>
	</div>
	<a class="login" data-signup-link="true" data-toggle="modal" hidefocus="true" onFocus="this.blur()"
		href="<%=path%>/register">
		<i class="fa fa-user"></i>
		注册
	</a>
	<a class="login" data-signin-link="true" data-toggle="modal" hidefocus="true" onFocus="this.blur()"
		href="<%=path%>/login">
		<i class="fa fa-sign-in"></i>
		登录
	</a>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<a href="#view-mode-modal" data-toggle="modal">
			<i class="fa fa-font"></i>
			<span class="title">显示模式</span>
		</a>
		<a class="signin" href="<%=path%>/login" data-original-title="登录" data-toggle="modal"
			data-signin-link="true" data-container="div.expanded" data-placement="right">
			<i class="fa fa-sign-in"></i>
			<span class="title">登录</span>
		</a>
	</div>
</div>
<div class="navbar-user">
	<a class="login" data-signup-link="true" data-toggle="modal" href="<%=path%>/register">
		<i class="fa fa-user"></i>
		注册
	</a>
	<a class="login" data-signin-link="true" data-toggle="modal" href="<%=path%>/login">
		<i class="fa fa-sign-in"></i>
		登录
	</a>
	<a class="daytime set-view-mode pull-right" href="javascript:void(0)">
		<i class="fa fa-moon-o"></i>
	</a>
</div>
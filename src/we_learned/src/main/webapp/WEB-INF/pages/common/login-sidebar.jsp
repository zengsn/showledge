<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="navbar navbar-jianshu expanded">
	<div class="dropdown">
		<a class="active logo" role="button" data-original-title="个人主页" data-container="div.expanded"
			href="<%=path%>">
			<b>简</b>
			<i class="fa fa-home"></i>
			<span class="title">首页</span>
		</a>
		<a data-toggle="tooltip" data-placement="right" data-original-title="专题"
			data-container="div.expanded" href="">
			<i class="fa fa-th"></i>
			<span class="title">专题</span>
		</a>
		<a data-toggle="tooltip" data-placement="right" data-original-title="简友圈"
			data-container="div.expanded" href="">
			<i class="fa fa-users"></i>
			<span class="title">简友圈</span>
		</a>
		<a data-toggle="tooltip" data-placement="right" data-original-title="写文章"
			data-container="div.expanded" href="<%=path%>/writer">
			<i class="fa fa-pencil"></i>
			<span class="title">写文章</span>
		</a>
	</div>
	<div class="nav-user">
		<a data-toggle="tooltip" data-placement="right" data-original-title="我的主页"
			data-container="div.expanded" href="<%=path%>/user">
			<i class="fa fa-user"></i>
			<span class="title">我的主页</span>
		</a>
		<a data-toggle="tooltip" data-placement="right" data-original-title="我的收藏"
			data-container="div.expanded" href="<%=path%>/bookmarks">
			<i class="fa fa-bookmark"></i>
			<span class="title">我的收藏</span>
		</a>
		<a data-toggle="tooltip" data-placement="right" data-original-title="提醒"
			data-container="div.expanded" href="">
			<i id="notify-icon" class="fa fa-bell"></i>
			<span class="title">提醒</span>
		</a>
		<a data-toggle="tooltip" data-placement="right" data-original-title="简信"
			data-container="div.expanded" href="">
			<i id="chat-message-icon" class="fa fa-envelope"></i>
			<span class="title">简信</span>
		</a>
		<a href="" data-toggle="modal">
			<i class="fa fa-font"></i>
			<span class="title">显示模式</span>
		</a>
		<a data-toggle="tooltip" data-placement="right" data-original-title="设置"
			data-container="div.expanded" href="<%=path%>/settings">
			<i class="fa fa-cogs"></i>
			<span class="title">设置</span>
		</a>
		<a data-toggle="tooltip" data-placement="right" data-original-title="登 出"
			data-container="div.expanded" rel="nofollow" data-method="delete" href="<%=path%>/logout">
			<i class="fa fa-sign-out"></i>
			<span class="title">登 出</span>
		</a>
	</div>
</div>
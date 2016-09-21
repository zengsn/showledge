<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="navbar navbar-jianshu expanded">
	<div class="dropdown">
		<a class="active logo" role="button" data-original-title="个人主页" data-container="div.expanded"
			href="<%=path%>/index">
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

<div class="navbar-user">
	<a class="user avatar" data-toggle="dropdown" hidefocus="true" onFocus="this.blur();"
		href="javascript:void(0)">
		<img src="<%=path%>/${userImagePathInSession}" alt="11"><b class="caret"></b>
	</a>
	<ul class="dropdown-menu arrow-top" role="menu" aria-labelledby="dLabel">
		<li>
			<a href="<%=path%>/writer">
				<i class="fa fa-pencil"></i>
				写文章
			</a>
		</li>
		<li>
			<a target="_blank" href="<%=path%>/user">
				<i class="fa fa-user"></i>
				我的主页
			</a>
		</li>
		<li>
			<a href="<%=path%>/favourites">
				<i class="fa fa-heart"></i>
				我喜欢的
			</a>
		</li>
		<li>
			<a href="<%=path%>/bookmarks">
				<i class="fa fa-bookmark"></i>
				我的收藏
			</a>
		</li>
		<li>
			<a href="">
				<i class="fa fa-bell"></i>
				提醒
			</a>
		</li>
		<li>
			<a href="">
				<i class="fa fa-envelope"></i>
				简信
			</a>
		</li>
		<li>
			<a href="<%=path%>/settings">
				<i class="fa fa-cogs"></i>
				设置
			</a>
		</li>
		<li>
			<a href="">
				<i class="fa fa-credit-card"></i>
				钱包
			</a>
		</li>
		<li class="dropdown-submenu">
			<a tabindex="-1" href="">
				<i class="fa fa-question-circle"></i>
				帮助
			</a>
			<ul class="dropdown-menu">
				<li>
					<a href="" target="_blank">帮助中心</a>
				</li>
				<li>
					<a target="_blank" href="">联系我们</a>
				</li>
			</ul>
		</li>
		<li>
			<a rel="nofollow" data-method="DELETE" href="<%=path%>/logout">
				<i class="fa fa-sign-out"></i>
				登 出
			</a>
		</li>
	</ul>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="wrap-btn" style="top: -1px;">
	<div class="article-related pull-left">
		<a data-toggle="tooltip" data-placement="bottom" data-original-title="未加入专题" hidefocus="true"
			onFocus="this.blur()" href="javascript:void(null);">
			<i class="fa fa-th"></i>
		</a>
		<a class="notebooks-menu-btn" data-toggle="modal" data-target="#notebooks-menu" hidefocus="true"
			onFocus="this.blur()" href="javascript:void(null);">
			<i class="fa fa-list-ul"></i>
		</a>
		<div class="related-avatar-group activities"></div>
	</div>
	<a class="user avatar" data-toggle="dropdown" hidefocus="true" onFocus="this.blur()"
		href="javascript:void(0)">
		<img src="<%=path%>/${userImagePathInSession}" alt="11"> <b class="caret"></b>
	</a>
	<ul class="dropdown-menu arrow-top" role="menu" aria-labelledby="dLabel">
		<li>
			<a hidefocus="true" onFocus="this.blur()" href="<%=path%>/writer">
				<i class="fa fa-pencil"></i>
				写文章
			</a>
		</li>
		<li>
			<a target="_blank" hidefocus="true" onFocus="this.blur()" href="<%=path%>/user">
				<i class="fa fa-user"></i>
				我的主页
			</a>
		</li>
		<li>
			<a hidefocus="true" onFocus="this.blur()" href="<%=path%>/favourites">
				<i class="fa fa-heart"></i>
				我喜欢的
			</a>
		</li>
		<li>
			<a hidefocus="true" onFocus="this.blur()" href="<%=path%>/bookmarks">
				<i class="fa fa-bookmark"></i>
				我的收藏
			</a>
		</li>
		<li>
			<a hidefocus="true" onFocus="this.blur()" href="javascript:void(null)">
				<i class="fa fa-bell"></i>
				提醒
			</a>
		</li>
		<li>
			<a hidefocus="true" onFocus="this.blur()" href="javascript:void(null)">
				<i class="fa fa-envelope"></i>
				简信
			</a>
		</li>
		<li>
			<a hidefocus="true" onFocus="this.blur()" href="<%=path%>/settings">
				<i class="fa fa-cogs"></i>
				设置
			</a>
		</li>
		<li>
			<a hidefocus="true" onFocus="this.blur()" href="javascript:void(null)">
				<i class="fa fa-credit-card"></i>
				钱包
			</a>
		</li>
		<li class="dropdown-submenu">
			<a tabindex="-1" hidefocus="true" onFocus="this.blur()" href="javascript:void(null)">
				<i class="fa fa-question-circle"></i>
				帮助
			</a>
			<ul class="dropdown-menu">
				<li>
					<a hidefocus="true" onFocus="this.blur()" href="javascript:void(null)" target="_blank">帮助中心</a>
				</li>
				<li>
					<a target="_blank" hidefocus="true" onFocus="this.blur()" href="javascript:void(null)">联系我们</a>
				</li>
			</ul>
		</li>
		<li>
			<a rel="nofollow" data-method="DELETE" hidefocus="true" onFocus="this.blur()"
				href="<%=path%>/logout">
				<i class="fa fa-sign-out"></i>
				登 出
			</a>
		</li>
	</ul>
	<div class="btn-group editor-article">
		<a class="daytime set-view-mode" hidefocus="true" onFocus="this.blur()" href="javascript:void(0)">
			<i class="fa fa-moon-o"></i>
		</a>
		<span> <c:if test="${userIdInSession == essay.userId}">
				<a class="btn" hidefocus="true" onFocus="this.blur()" href="<%=path%>/writer"
					data-toggle="tooltip" data-placement="bottom" title="写文章">
					<i class="fa fa-pencil-square-o"></i>
				</a>
			</c:if> <c:if test="${!essay.isCollected}">
				<a id="top-collect-button" class="bookmark" hidefocus="true" onFocus="this.blur()"
					hidefocus="true" onFocus="this.blur()" href="javascript:void(null)" data-toggle="tooltip"
					data-placement="bottom" title="收藏文章" onclick="essayJS.addCollect(${essay.id});">
					<i id="top-collect-button-i" class="fa fa-bookmark-o"></i>
					<span>收藏文章</span>
				</a>
			</c:if> <c:if test="${essay.isCollected}">
				<a id="top-collect-button" class="bookmarked" hidefocus="true" onFocus="this.blur()"
					hidefocus="true" onFocus="this.blur()" href="javascript:void(null)" data-toggle="tooltip"
					data-placement="bottom" title="收藏文章" onclick="essayJS.removeCollect(${essay.id});">
					<i id="top-collect-button-i" class="fa fa-bookmark"></i>
					<span>收藏文章</span>
				</a>
			</c:if> <a id="top-share-button" hidefocus="true" onFocus="this.blur()" href="javascript:void(null)"
				hidefocus="true" onFocus="this.blur()" data-toggle="tooltip" data-placement="right" title="分享文章">
				<i class="fa fa-share-square-o"></i>
			</a>
		</span>
	</div>
</div>
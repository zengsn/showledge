<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta content="IE=11.0000" http-equiv="X-Ua-Compatible">
<meta charset="utf-8">
<meta http-equiv="X-Ua-Compatible" content="iE=Edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,user-scalable=no">

<title>首页-简笔记</title>

<link href="css/css_1.css" rel="stylesheet" media="all">
<link href="css/css_2.css" rel="stylesheet" media="all">
<link href="css/css_3.css" rel="stylesheet" media="all">

<link href="images/favicon.ico" rel="icon">

<script src="js/js_1.js"></script>
<script src="js/vue.js"></script>
<script src="js/my-vue.js"></script>
<script src="js/index.js"></script>
</head>

<body class="output fluid zh cn win reader-day-mode reader-font2"
	data-locale="zh-CN" data-js-module="recommendation" id="my-vueJS"
	v-cloak>
	<c:if test="${userNameInSession == null}">
		<my-nologin-top-sidebar></my-nologin-top-sidebar>
		<my-nologin-sidebar></my-nologin-sidebar>
	</c:if>
	<c:if test="${userNameInSession != null}">
		<div class="navbar-user">
			<a class="user avatar" data-toggle="dropdown"
				href="javascript:void(0)"> <img src="${user.userImagePath}"
				alt="11"> <b class="caret"></b>
			</a>
			<ul class="dropdown-menu arrow-top" role="menu"
				aria-labelledby="dLabel">
				<li><a href="writer.html"><i class="fa fa-pencil"></i> 写文章</a></li>
				<li><a target="_blank" href=""><i class="fa fa-user"></i>
						我的主页</a></li>
				<li><a href=""> <i class="fa fa-heart"></i> 我喜欢的
				</a></li>
				<li><a href=""> <i class="fa fa-bookmark"></i> 我的收藏
				</a></li>
				<li><a href=""> <i class="fa fa-bell"></i> 提醒
				</a></li>
				<li><a href=""> <i class="fa fa-envelope"></i> 简信
				</a></li>
				<li><a href="setting.html"><i class="fa fa-cogs"></i> 设置</a></li>
				<li><a href=""> <i class="fa fa-credit-card"></i> 钱包
				</a></li>
				<li class="dropdown-submenu"><a tabindex="-1" href=""><i
						class="fa fa-question-circle"></i> 帮助</a>
					<ul class="dropdown-menu">
						<li><a href="" target="_blank">帮助中心</a></li>
						<li><a target="_blank" href="">联系我们</a></li>
					</ul></li>
				<li><a rel="nofollow" data-method="DELETE" href="logout.do">
						<i class="fa fa-sign-out"></i> 登 出
				</a></li>
			</ul>
		</div>
		<div class="navbar navbar-jianshu expanded">
			<div class="dropdown">
				<a class="active logo" role="button" data-original-title="个人主页"
					data-container="div.expanded" href="index.html"> <b>简</b><i
					class="fa fa-home"></i><span class="title">首页</span>
				</a> <a data-toggle="tooltip" data-placement="right"
					data-original-title="专题" data-container="div.expanded" href="">
					<i class="fa fa-th"></i><span class="title">专题</span>
				</a> <a data-toggle="tooltip" data-placement="right"
					data-original-title="简友圈" data-container="div.expanded" href="">
					<i class="fa fa-users"></i><span class="title">简友圈</span>
				</a> <a data-toggle="tooltip" data-placement="right"
					data-original-title="写文章" data-container="div.expanded"
					href="writer.html"> <i class="fa fa-pencil"></i><span
					class="title">写文章</span>
			</div>
			<div class="nav-user">
				<a data-toggle="tooltip" data-placement="right"
					data-original-title="我的主页" data-container="div.expanded" href="">
					<i class="fa fa-user"></i><span class="title">我的主页</span>
				</a> <a data-toggle="tooltip" data-placement="right"
					data-original-title="我的收藏" data-container="div.expanded" href="">
					<i class="fa fa-bookmark"></i><span class="title">我的收藏</span>
				</a> <a data-toggle="tooltip" data-placement="right"
					data-original-title="提醒" data-container="div.expanded" href="">
					<i id="notify-icon" class="fa fa-bell"></i><span class="title">提醒</span>
				</a> <a data-toggle="tooltip" data-placement="right"
					data-original-title="简信" data-container="div.expanded" href="">
					<i id="chat-message-icon" class="fa fa-envelope"></i><span
					class="title">简信</span>
				</a> <a href="" data-toggle="modal"><i class="fa fa-font"></i><span
					class="title">显示模式</span></a> <a data-toggle="tooltip"
					data-placement="right" data-original-title="设置"
					data-container="div.expanded" href="setting.html"> <i
					class="fa fa-cogs"></i><span class="title">设置</span>
				</a> <a data-toggle="tooltip" data-placement="right"
					data-original-title="登 出" data-container="div.expanded"
					rel="nofollow" data-method="delete" href="logout.do"> <i
					class="fa fa-sign-out"></i><span class="title">登 出</span>
				</a>
			</div>
		</div>
	</c:if>
	<div class="row-fluid">
		<div class="recommended">
			<my-min-pic-bar></my-min-pic-bar>
			<div class="span7 offset3">
				<div class="page-title" style="width: 705px;">
					<ul class="recommened-nav navigation clearfix"
						data-container="#list-container" data-loader=".loader-tiny">
						<li class="active"><A
							href="http://www.jianshu.com/trending/now" data-pjax="true">发现</A>
						</li>
						<c:if test="${userNameInSession != null}">
							<li data-name="subscription_notes" class=""><a
								data-pjax="true" href="/subscription_notes"><i
									class="fa fa-bars"></i> 关注</a></li>
						</c:if>
						<li class="bonus"><A
							href="http://www.jianshu.com/zodiac/2015"><I
								class="fa fa-bars"></I> 2015精选</A></li>
						<c:if test="${userNameInSession != null}">
							<li class="switch-default-tab disabled"><a
								href="javascript:void(null)" data-toggle="tooltip"
								data-placement="right" data-original-title='更改标签页顺序'><i
									class="fa fa-cog"></i></a></li>
						</c:if>
						<li class="search">
							<form class="search-form" action="searchInIndex.do" method="post"
								target="_blank" accept-charset="UTF-8">
								<input id="searchKeyword" name="searchKeyword"
									class="input-medium search-query" type="search"
									placeholder="搜索" value=""> <span class="search_trigger"
									onclick="searchEssay()"><I class="fa fa-search"></I></span>
							</form>
						</li>
					</ul>
				</div>
				<div id="list-container">
					<my-navigation-bar></my-navigation-bar>
					<input id="hideLimitNumber" type="hidden" value="${limitNumber}">
					<ul id="essay_list" class="article-list thumbnails">
						<c:forEach items="${essayList}" var="essay">
							<li class="have-img"><A class="wrap-img"
								href="http://www.jianshu.com/p/cb254b7647d7"><img alt="300"
									src="images/index/1480410-dc9d2be35d880969.png"></A>
								<div>
									<P class="list-top">
										<A class="author-name blue-link" href="" target="_blank">${essay.userName}</A>
										<EM>·</EM> <span class="time"
											data-shared-at="2016-07-10T14:43:28+08:00"></span>
									</P>
									<H4 class="title">
										<A href="essay.html?id=${essay.id}" target="_blank">${essay.essayTitle}</A>
									</H4>
									<div class="list-footer">
										<span> 阅读 ${essay.essayReadingNumber}</span> <span> ·
											评论 ${essay.essayReadingNumber}</span> <span> · 喜欢
											${essay.essayGoodNumber}</span>
									</div>
								</div></li>
						</c:forEach>
					</ul>
					<div class="load-more">
						<button class="ladda-button " data-style="slide-left"
							type="button" data-size="medium" data-color="maleskine"
							data-type="script" onclick="lookMoreEssay();">
							<span class="ladda-label">点击查看更多</span>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
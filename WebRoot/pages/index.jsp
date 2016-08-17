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

<title>首页 - 简随记</title>

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
		<my-login-top-sidebar img-src="${userImagePathInSession}"></my-login-top-sidebar>
		<my-login-sidebar></my-login-sidebar>
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
							<li class="have-img"><A class="wrap-img" href=""><img
									alt="300" src="images/index/1480410-dc9d2be35d880969.png"></A>
								<div>
									<P class="list-top">
										<A class="author-name blue-link"
											href="users.html?userName=${essay.userName}" target="_blank">${essay.userName}</A>
										<EM>·</EM> <span class="time">${essay.subEssayTime}</span>
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
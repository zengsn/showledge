<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="common/tag.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<%@include file="common/head.jsp"%>
<title>首页   - 简随记</title>
</head>

<body class="output fluid zh cn win reader-day-mode reader-font2" data-locale="zh-CN"
	data-js-module="recommendation">
	<%@include file="common/login.jsp"%>
	<div class="row-fluid">
		<div class="timeline">
			<div class="span3 left-aside">
				<div class="cover-img"
					style="background-image: url(http://upload.jianshu.io/daily_images/images/KE3AwKqJ1oeCdxSW5SNT.jpg)"></div>
				<div class="bottom-block">
					<h1>简友圈</h1>
					<h3>以文会友</h3>
					<a class="btn btn-large btn-success" href="writer" hidefocus="true" onFocus="this.blur()">提笔写篇文章</a>
				</div>
				<div class="img-info">
					<i class="fa fa-info"></i>
					<div class="info">
						Photo by
						<a target="_blank" href="javascript:void(0)" hidefocus="true" onFocus="this.blur()">linlis</a>
					</div>
				</div>
			</div>
			<div class="offset3 span7 timeline-list">
				<div class="page-title">
					<ul class="timeline-nav navigation clearfix" data-js-module="timeline-navbar">
						<li class="">
							<a data-pjax="timeline-container" href="javascript:void(0)" hidefocus="true"
								onFocus="this.blur()">简友圈</a>
						</li>
						<li class="active">
							<a data-pjax="timeline-container" href="bookmarks" hidefocus="true" onFocus="this.blur()">我的收藏</a>
						</li>
						<li class="search">
							<input id="searchKeyword" name="searchKeyword" class="input-medium search-query"
								type="search" placeholder="搜索" onkeypress="if (event.keyCode == 13) indexJS.search();">
							<span class="search_trigger" onclick="indexJS.search();"> <I class="fa fa-search"></I>
							</span>
						</li>
					</ul>
				</div>
				<div id="timeline-container">
					<ul id="bookmarks" class="article-list" data-js-module="timeline-bookmarks">
						<c:forEach items="${essayList}" var="essay">
							<li class="have-img">
								<a class="wrap-img" href="essay/${essay.id}" hidefocus="true" onFocus="this.blur()">
									<img src="images/index/1480410-dc9d2be35d880969.png" alt="300">
								</a>
								<div>
									<p class="list-top">
										<a class="author-name blue-link" target="_blank" href="users/${essay.userName}"
											hidefocus="true" onFocus="this.blur()">${essay.userName}</a>
										<em>·</em>
									</p>
									<h4 class="title">
										<a target="_blank" href="essay/${essay.id}" hidefocus="true" onFocus="this.blur()">${essay.essayTitle}</a>
									</h4>
									<div class="list-footer">
										<span>阅读 ${essay.essayReadingNumber}</span> <span>· 评论 ${essay.essayReadingNumber}</span>
										<span>· 喜欢 ${essay.essayGoodNumber}</span>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<%@include file="common/common-js.jsp"%>
	<script src="js/index.js" type="text/javascript"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="common/tag.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<%@include file="common/head.jsp"%>
<title>${user.userName} - 简随记</title>
</head>

<body class="user output zh cn win reader-day-mode reader-font2 " data-js-module="user-show"
	data-locale="zh-CN">
	<%@include file="common/login.jsp"%>
	<div class="row-fluid">
		<%@include file="common/user-tag.jsp"%>
		<!-- content -->
		<div class="span9 offset3 recent-post">
			<!-- navigation -->
			<ul class="nav nav-tabs nav-articles">
				<li class="active">
					<a data-pjax="list-container" href="<%=path%>/users/${user.id}/latest_articles">
						<i class="fa fa-file-text-o"></i>
						最新文章
					</a>
				</li>
				<li class="">
					<a data-pjax="list-container" href="<%=path%>/users/${user.id}/timeline">
						<i class="fa fa-users"></i>
						最新动态
					</a>
				</li>
				<li class="">
					<a data-pjax="list-container" href="">
						<i class="fa fa-signal"></i>
						热门文章
					</a>
				</li>
			</ul>
			<div class="tab-content">
				<div id="list-container" class="tab-pane active">
					<ul class="article-list latest-notes">
						<c:forEach items="${essayList}" var="essay">
							<li>
								<div>
									<p class="list-top">
										<a class="author-name blue-link" target="_blank"
											href="<%=path%>/users/${essay.userId}/latest_articles" hidefocus="true"
											onFocus="this.blur()">${essay.userName}</a>
										<em>·</em> <span class="time">${essay.subEssayTime}</span>
									</p>
									<h4 class="title">
										<a target="_blank" href="essay/${essay.id}" hidefocus="true" onFocus="this.blur()">${essay.essayTitle}</a>
									</h4>
									<div class="list-footer">
										<span>阅读 ${essay.essayReadingNumber}</span> <span>· 评论 ${essay.essayCommentNumber}</span>
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
	<script src="js/subscribe.js" type="text/javascript"></script>
	<script src="js/user.js" type="text/javascript"></script>
</body>
</html>
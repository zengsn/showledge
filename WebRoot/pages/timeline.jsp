<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="common/tag.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<%@include file="common/head.jsp"%>
<title>lovely菜头 - 简书</title>
</head>

<body class="user output zh cn win reader-day-mode reader-font2 " data-js-module="user-show"
	data-locale="zh-CN">
	<c:if test="${userIdInSession == null}">
		<%@include file="common/no-login.jsp"%>
	</c:if>
	<c:if test="${userIdInSession != null}">
		<%@include file="common/login.jsp"%>
	</c:if>

	<div class="row-fluid">
		<%@include file="common/user-tag.jsp"%>
		<!-- content -->
		<div class="span9 offset3 recent-post">
			<!-- navigation -->
			<ul class="nav nav-tabs nav-articles">
				<li class="">
					<a data-pjax="list-container" href="<%=path%>/users/${user.id}/latest_articles">
						<i class="fa fa-file-text-o"></i>
						最新文章
					</a>
				</li>
				<li class="active">
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
					<div class="tab-pane timeline">
						<div class="timeline-list">
							<ul class="timeline-content">
								<c:forEach items="${timelineList}" var="timeline" varStatus="status">
									<c:if test="${status.index < timelineList.size() - 1}">
										<li class="user-update article">
											<div class="avatar-container">
												<div class="avatar">
													<a target="_blank" href="<%=path%>/users/${user.id}/latest_articles">
														<img src="<%=path%>/${user.userImagePath}" alt="100">
													</a>
												</div>
											</div>
											<div class="article-content">
												<a class="title" target="_blank" href="<%=path%>/essay/${timeline.essay.id}">${timeline.essay.essayTitle}</a>
												<p>${timeline.essay.essayContent}</p>
											</div>
											<div class="meta">
												<a class="reply toggle-comments-display" href="<%=path%>/essay/${timeline.essay.id}">评论(${timeline.essay.essayCommentNumber})</a>
												<a target="_blank" href="<%=path%>/notebooks/${timeline.essay.corpusId}/latest">
													<i class="fa fa-book"></i>
													${timeline.essay.corpusName}
												</a>
												<time>${timeline.formatCreateTime}</time>
											</div>
										</li>
									</c:if>

									<c:if test="${status.index == timelineList.size() - 1}">
										<li class="user-update">
											<div class="avatar-container">
												<div class="avatar">
													<a target="_blank" href="<%=path%>/users/${user.id}/latest_articles">
														<img src="<%=path%>/${user.userImagePath}" alt="100">
													</a>
												</div>
											</div>
											<span>
												<a target="_blank" href="<%=path%>/users/${user.id}/latest_articles">${user.userName}</a>
												加入简随记<b></b>
											</span>
											<div class="meta">
												<time>${timeline.formatCreateTime}</time>
											</div>
										</li>
									</c:if>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="common/common-js.jsp"%>
	<script src="<%=path%>/js/subscribe.js"></script>
</body>
</html>
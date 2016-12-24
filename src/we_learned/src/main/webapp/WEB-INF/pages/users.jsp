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
							<li class="have-img">
								<%-- <a class="wrap-img" href="users.html?userName=${essay.userName}">
                          <img src="${user.userImagePath}" alt="300"></a>--%>
								<div>
									<p class="list-top">
										<a class="author-name blue-link" target="_blank" href="<%=path%>/users/${essay.userName}">${essay.userName}</a>
										<em>·</em> <span class="time">${essay.subEssayTime}</span>
									</p>
									<h4 class="title">
										<a target="_blank" href="<%=path%>/essay/${essay.id}">${essay.essayTitle}</a>
									</h4>
									<div class="list-footer">
										<span>阅读 ${essay.essayReadingNumber}</span> <span>· 评论 ${essay.essayCommentNumber}</span>
										<span>· 喜欢 ${essay.essayGoodNumber}</span>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
					<div class="hidden">
						<div class="pagination">
							<ul class="pagination">
								<li class=" active">
									<a data-remote="true" href="javascript:null;">1</a>
								</li>
								<li class="">
									<a rel="next" data-remote="true" href="">2</a>
								</li>
								<li class="">
									<a data-remote="true" href="">3</a>
								</li>
								<li class="">
									<a data-remote="true" href="">4</a>
								</li>
								<li class="">
									<a data-remote="true" href="">5</a>
								</li>
								<li class="next">
									<a rel="next" data-remote="true" href="">下一页</a>
								</li>
								<li class="last">
									<a data-remote="true" href="">终页</a>
								</li>
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
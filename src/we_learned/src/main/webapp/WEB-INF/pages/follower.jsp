<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="common/tag.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<%@include file="common/head.jsp"%>
<title>${user.userName}  - 简随记</title>
</head>

<body class="user output zh cn win reader-day-mode reader-font2 " data-js-module="user-show"
	data-locale="zh-CN" id="my-vueJS">
	<c:if test="${userIdInSession == null}">
		<%@include file="common/no-login.jsp"%>
	</c:if>
	<c:if test="${userIdInSession != null}">
		<%@include file="common/login.jsp"%>
	</c:if>
	<div class="row-fluid">
		<%@include file="common/user-tag.jsp"%>
		<!-- content -->
		<div class="span9 offset3 recent-post relationships">
			<!-- navigation -->
			<ul class="nav nav-tabs nav-relationships">
				<li class="">
					<a data-pjax="list-container" href="<%=path%>/users/${user.id}/subscriptions">关注专题/文集(${user.userFocusCorpusNumber})</a>
				</li>
				<li class="">
					<a data-pjax="list-container" href="<%=path%>/users/${user.id}/following" hidefocus="true"
						onFocus="this.blur()">关注用户(${user.userFocusUserNumber})</a>
				</li>
				<li class="active">
					<a data-pjax="list-container" href="<%=path%>/users/${user.id}/followers" hidefocus="true"
						onFocus="this.blur()">粉丝(${user.userFansNumber})</a>
				</li>
			</ul>
			<div class="tab-content">
				<div id="list-container" class="tab-pane active">
					<ul class="users">
						<c:forEach items="${userList}" var="user" varStatus="status">
							<li>
								<a class="avatar" target="_blank" href="<%=path%>/users/${user.userName}">
									<img src="<%=path%>/${user.userImagePath}" alt="4">
								</a>
								<c:if test="${user.userName != userNameInSession}">
									<c:if test="${!user.isFocused}">
										<div id="focus_at_users_${status.index}" class="btn btn-small btn-success follow">
											<a id="focus_at_users_a_${status.index}" hidefocus="true" onFocus="this.blur()"
												onclick="addFocusAtUsersLi(${status.index}, ${user.id}, '<%=path%>');">
												<i id="focus_at_users_i_${status.index}" class="fa fa-plus"></i>
												<span> 添加关注</span>
											</a>
										</div>
									</c:if>
									<c:if test="${user.isFocused}">
										<div id="focus_at_users_${status.index}" class="btn btn-small follow following">
											<a id="focus_at_users_a_${status.index}" hidefocus="true" onFocus="this.blur()"
												onclick="removeFocusAtUsersLi(${status.index}, ${user.id}, '<%=path%>');">
												<i id="focus_at_users_i_${status.index}" class="fa fa-check"></i>
												<span> 正在关注</span>
											</a>
										</div>
									</c:if>
								</c:if>
								<h4>
									<a target="_blank" href="<%=path%>/users/${user.id}" hidefocus="true"
										onFocus="this.blur()">${user.userName}</a>
								</h4>
								<p>
									<a href="<%=path%>/users/${user.id}/followers">粉丝 ${user.userFansNumber}</a>
									｜
									<a href="<%=path%>/users/${user.id}/latest_articles">文章 ${user.userEssayNumber}</a>
								</p>
								<p class="article-info author-info">写了 ${user.userWordsNumber} 字, 获得了
									${user.userLikesNumber} 个喜欢</p>
							</li>
						</c:forEach>
				</div>
			</div>
		</div>

		<%@include file="common/common-js.jsp"%>
		<script src="<%=path%>/js/subscribe.js" type="text/javascript"></script>
		<script src="<%=path%>/js/user.js" type="text/javascript"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="common/tag.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<%@include file="common/head.jsp"%>
<title>首页 - 简随记</title>
</head>

<body class="output fluid zh cn win reader-day-mode reader-font2" data-locale="zh-CN"
	data-js-module="recommendation">
	<c:if test="${userIdInSession == null}">
		<%@include file="common/no-login.jsp"%>
	</c:if>
	<c:if test="${userIdInSession != null}">
		<%@include file="common/login.jsp"%>
	</c:if>
	<div class="row-fluid">
		<div class="recommended">
			<%@include file="common/mid-img.jsp"%>
			<div class="span7 offset3">
				<div class="page-title" style="width: 705px;">
					<ul class="recommened-nav navigation clearfix" data-container="#list-container"
						data-loader=".loader-tiny">
						<li class="active">
							<A href="" data-pjax="true">发现</A>
						</li>
						<c:if test="${userIdInSession != null}">
							<li data-name="subscription_notes" class="">
								<a data-pjax="true" href="javascript:void(null)">
									<i class="fa fa-bars"></i>
									关注
								</a>
							</li>
						</c:if>
						<li class="bonus">
							<A href="javascript:void(null)">
								<I class="fa fa-bars"></I>
								精选
							</A>
						</li>
						<c:if test="${userIdInSession != null}">
							<li class="switch-default-tab disabled">
								<a href="javascript:void(null)" data-toggle="tooltip" data-placement="right"
									data-original-title='更改标签页顺序'>
									<i class="fa fa-cog"></i>
								</a>
							</li>
						</c:if>
						<li class="search">
							<input id="searchKeyword" name="searchKeyword" class="input-medium search-query"
								type="search" placeholder="搜索" onkeypress="if (event.keyCode == 13) indexJS.search();">
							<span class="search_trigger" onclick="indexJS.search();">
								<I class="fa fa-search"></I>
							</span>
						</li>
					</ul>
				</div>
				<div id="list-container">
					<input id="hideCurrentPage" type="hidden" value="${pageParam.currentPage}">
					<%@include file="common/mid-navigation.jsp"%>
					<ul id="essay_list" class="article-list thumbnails">
						<c:forEach items="${pageParam.data}" var="essay" varStatus="status">
							<c:if test="${status.index == pageParam.data.size() - 1}">
								<input id="hideCurrentNumber" type="hidden" value="${status.index}">
							</c:if>
							<li id="essay_${status.index}" class="have-img">
								<c:if test="${essay.essayImagePath != null}">
									<a class="wrap-img" href="essay/${essay.id}" hidefocus="true" onFocus="this.blur()">
										<img alt="300" src="${essay.essayImagePath}">
									</a>
								</c:if>
								<div>
									<P class="list-top">
										<A class="author-name blue-link" href="users/${essay.userId}/latest_articles"
											target="_blank" hidefocus="true" onFocus="this.blur()">${essay.userName}</A>
										<EM>·</EM>
										<span class="time">${essay.subEssayTime}</span>
									</P>
									<H4 class="title">
										<A href="essay/${essay.id}" target="_blank" hidefocus="true" onFocus="this.blur()">${essay.essayTitle}</A>
									</H4>
									<div class="list-footer">
										<span>阅读 ${essay.essayReadingNumber}</span>
										<span>· 评论 ${essay.essayCommentNumber}</span>
										<span>· 喜欢 ${essay.essayGoodNumber}</span>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
					<c:if test="${pageParam.currentPage < (pageParam.totalPage - 1)}">
						<div id="lookmore-btn" class="load-more">
							<button class="ladda-button " data-style="slide-left" type="button" data-size="medium"
								data-color="maleskine" data-type="script" onclick="indexJS.lookMoreEssay();"
								hidefocus="true" onFocus="this.blur()">
								<span class="ladda-label">点击查看更多</span>
							</button>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>

	<%@include file="common/common-js.jsp"%>
	<script src="js/index.js" type="text/javascript"></script>
</body>
</html>
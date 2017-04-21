<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="common/tag.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="common/head.jsp"%>
<title>搜索 - 秀知识</title>

<link href="<%=path%>/css/nav.css" rel="stylesheet">
<link href="<%=path%>/css/search.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<%@ include file="common/nav.jsp"%>

	<!--主要内容部分-->
	<div class="container-fluid">
		<input id="path" type="hidden" value="search">
		<input id="hideSearchKeyword" type="hidden" value="${searchKeyword}">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<p id="searh-title">
					<img src="<%=path%>/icon/search.png" alt="搜索">
					<span>搜索结果</span>
				</p>
				<hr>
				<div>
					<!-- Nav tabs -->
					<ul class="nav nav-pills" role="tablist">
						<li role="presentation" class="active">
							<a href="#search-article" aria-controls="search-article" role="tab" data-toggle="tab">文章</a>
						</li>
						<li role="presentation">
							<a href="#search-user" aria-controls="search-user" role="tab" data-toggle="tab">用户</a>
						</li>
						<li role="presentation">
							<a href="#search-album" aria-controls="search-album" role="tab" data-toggle="tab">专题</a>
						</li>
					</ul>

					<!-- Tab panes -->
					<div class="tab-content">
						<!-- 搜索文章  -->
						<div role="tabpanel" class="tab-pane active" id="search-article">
							<ul class="note-list list-unstyled" id="article-list">
								<c:if test="${essayPageParam.data == null || fn:length(essayPageParam.data) == 0}">
									<!-- 搜索失败提示 -->
									<p class="searchFail">你要找的文章不存在 : )</p>
								</c:if>
								<c:if test="${essayPageParam.data != null && fn:length(essayPageParam.data) > 0}">
									<c:forEach items="${essayPageParam.data}" var="essay" varStatus="status">
										<li class="have-img">
											<c:if test="${essay.essayImagePath != null}">
												<a href="<%=path%>/essay/${essay.id}" target="_blank">
													<img class="wrap-img" src="${essay.essayImagePath}" alt="缩略图">
												</a>
											</c:if>
											<div class="content">
												<div class="author">
													<a href="users/${essay.userId}/latest_articles" target="_blank">
														<img class="avatar" src="<%=path%>/${essay.userImagePath}" alt="用户头像">
													</a>
													<div class="name">
														<a href="users/${essay.userId}/latest_articles" class="user-name" target="_blank">${essay.userName}</a>
													</div>
													<div class="time">${essay.subEssayTime}</div>
												</div>
												<a href="<%=path%>/essay/${essay.id}" class="title" target="_blank">${essay.essayTitle}</a>
												<p class="abstact">${essay.essayContent}</p>
												<div class="meta">
													<a href="essay/${essay.id}" target="_blank">
														<span class="glyphicon glyphicon-eye-open"></span>
														<span class="watch-num">${essay.essayReadingNumber}</span>
													</a>
													<a href="essay/${essay.id}" target="_blank">
														<span class="glyphicon glyphicon-comment"></span>
														<span class="comment-num">${essay.essayCommentNumber}</span>
													</a>
													<a href="essay/${essay.id}" target="_blank">
														<span class="glyphicon glyphicon-heart"></span>
														<span class="like-num">${essay.essayGoodNumber}</span>
													</a>
												</div>
											</div>
										</li>
									</c:forEach>
								</c:if>
							</ul>
						</div>
						<!-- search-article end -->

						<!-- 搜索用户  -->
						<div role="tabpanel" class="tab-pane" id="search-user">
							<ul class="note-list list-unstyled">
								<c:if test="${userPageParam.data == null || fn:length(userPageParam.data) == 0}">
									<!-- 搜索失败提示 -->
									<p class="searchFail">你要找的用户不存在 : )</p>
								</c:if>
								<c:if test="${userPageParam.data != null && fn:length(userPageParam.data) > 0}">
									<c:forEach items="${userPageParam.data}" var="user" varStatus="status">
										<li class="my-idol-list">
											<a href="<%=path%>/users/${user.id}/latest_articles">
												<img class="idol-avatar" src="<%=path%>/${user.userImagePath}" alt="用户的头像">
											</a>
											<div class="idol-content">
												<a href="<%=path%>/users/${user.id}/latest_articles">${user.userName}</a>
												<div class="info">${user.userIntroduce}</div>
												<div class="idol-meta">
													<span>${user.userEssayNumber}篇文章</span>
													<span>|</span>
													<span>0个文集</span>
													<span>|</span>
													<span>${user.userFansNumber}人的学习榜样</span>
												</div>
												<button class="btn btn-success watch-idol">
													<span class="glyphicon glyphicon-plus"></span>
													设为榜样
												</button>
											</div>
										</li>
									</c:forEach>
								</c:if>
							</ul>
						</div>
						<!-- search-user end -->

						<!-- 搜索专题  -->
						<div role="tabpanel" class="tab-pane" id="search-album">
							<ul class="note-list list-unstyled">
								<c:if test="${corpusPageParam.data == null || fn:length(corpusPageParam.data) == 0}">
									<!-- 搜索失败提示 -->
									<p class="searchFail">你要找的专题不存在 : )</p>
								</c:if>
								<c:if test="${corpusPageParam.data != null && fn:length(corpusPageParam.data) > 0}">
									<c:forEach items="${corpusPageParam.data}" var="corpus" varStatus="status">
										<li class="album-list">
											<c:if test="${corpus.corpusImagePath == null}">
												<a href="#">
													<img class="album-img" src="<%=path%>/image/今日看点.png" alt="文集图片">
												</a>
											</c:if>
											<c:if test="${corpus.corpusImagePath != null}">
												<a href="#">
													<img class="album-img" src="<%=path%>/${corpus.corpusImagePath}" alt="文集图片">
												</a>
											</c:if>
											<div class="album-content">
												<a href="#">${corpus.corpusName}</a>
												<div class="list-meta">
													<a href="<%=path%>/users/${corpus.userName}" class="author">${corpus.userName}</a>
													<span>收录了${corpus.essayNumber}篇文章</span>
													<span>,</span>
													<span>${corpus.userFocusNumber}人关注</span>
												</div>
												<button class="btn btn-success watch-album">
													<span class="glyphicon glyphicon-plus"></span>
													关注
												</button>
											</div>
										</li>
									</c:forEach>
								</c:if>
							</ul>
						</div>
						<!-- search-album end -->
					</div>
				</div>

			</div>
			<div class="col-md-2"></div>
		</div>
	</div>

	<%@ include file="common/common-js.jsp"%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common/tag.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="common/head.jsp"%>
<title>喜爱/收藏页 - 秀知识</title>

<link href="<%=path%>/css/like.css" rel="stylesheet">
<link href="<%=path%>/css/nav.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<%@ include file="common/nav.jsp"%>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2 blank"></div>
			<div class="col-md-8">
				<div>
					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active">
							<a href="#favourite-note" aria-controls="favourite-note" role="tab" data-toggle="tab">
								<img src="<%=path%>/icon/like-article2.png">
								喜爱的文章
							</a>
						</li>
						<li role="presentation">
							<a href="#watch-album" aria-controls="watch-album" role="tab" data-toggle="tab">
								<img src="<%=path%>/icon/watch-album2.png">
								关注的专题/文集
							</a>
						</li>
						<li role="presentation">
							<a href="#my-idol" aria-controls="my-idol" role="tab" data-toggle="tab">
								<img src="<%=path%>/icon/my-idol22.png">
								我的学习榜样
							</a>
						</li>
						<li role="presentation">
							<a href="#favourite-kmap" aria-controls="favourite-kmap" role="tab" data-toggle="tab">
								<img src="<%=path%>/icon/collection22.png">
								喜欢的知识地图
							</a>
						</li>
					</ul>

					<!-- Tab panes fade -->
					<div class="tab-content">
						<!-- 喜欢的文章 -->
						<div role="tabpanel" class="tab-pane fade" id="favourite-note">
							<ul class="note-list list-unstyled" id="article-list">
								<c:forEach items="${favouriteEssayList}" var="essay">
									<li class="have-img">
										<c:if test="${essay.essayImagePath != null}">
											<a href="<%=path%>/essay/${essay.id}" target="_blank">
												<img class="wrap-img" src="<%=path%>/${essay.essayImagePath}" alt="缩略图">
											</a>
										</c:if>
										<div class="content">
											<div class="author">
												<a href="<%=path%>/users/${essay.userId}/latest_articles" target="_blank">
													<img class="avatar" src="<%=path%>/${essay.userImagePath}" alt="用户头像">
												</a>
												<div class="name">
													<a href="<%=path%>/users/${essay.userId}/latest_articles" class="user-name"
														target="_blank">${essay.userName}</a>
												</div>
												<div class="time">${essay.subEssayTime}</div>
											</div>
											<a href="<%=path%>/essay/${essay.id}" class="title" target="_blank">${essay.essayTitle}</a>
											<p class="abstact">${essay.essayContent}</p>
											<div class="meta">
												<a href="<%=path%>/essay/${essay.id}" target="_blank">
													<span class="glyphicon glyphicon-eye-open"></span>
													<span class="watch-num">${essay.essayReadingNumber}</span>
												</a>
												<a href="<%=path%>/essay/${essay.id}" target="_blank">
													<span class="glyphicon glyphicon-comment"></span>
													<span class="comment-num">${essay.essayCommentNumber}</span>
												</a>
												<a href="<%=path%>/essay/${essay.id}" target="_blank">
													<span class="glyphicon glyphicon-heart"></span>
													<span class="like-num">${essay.essayGoodNumber}</span>
												</a>
											</div>
										</div>
									</li>
								</c:forEach>
							</ul>
						</div>

						<!-- 关注的文集 -->
						<div role="tabpanel" class="tab-pane fade" id="watch-album">
							<ul class="note-list list-unstyled" id="corpus-list">
								<c:forEach items="${focusCorpusList}" var="corpus">
									<li class="album-list">
										<a href="<%=path%>/notebooks/${corpus.id}/latest">
											<img class="album-img" src="<%=path%>/${corpus.corpusImagePath}" alt="文集图片">
										</a>
										<div class="album-content">
											<a href="<%=path%>/notebooks/${corpus.id}/latest">${corpus.corpusName}</a>
											<div class="list-meta">
												<a href="#" class="author">${corpus.userName}</a>
												<span>收录了${corpus.essayNumber}篇文章</span>
												<span>,</span>
												<span>${corpus.userFocusNumber}人关注</span>
											</div>
											<c:if test="${corpus.userId != userIdInSession}">
												<c:if test="${corpus.isUserFocused}">
													<button id="focus-corpus-button-${corpus.id}"
														class="btn not-watch not-watch-album btn-danger"
														onclick="likeJS.focusCorpus('${corpus.id}','<%=path%>');">取消关注</button>
												</c:if>
												<c:if test="!${corpus.isUserFocused}">
													<button id="focus-corpus-button-${corpus.id}"
														class="btn not-watch not-watch-album btn-success"
														onclick="likeJS.focusCorpus('${corpus.id}','<%=path%>');">
														<span class='glyphicon glyphicon-plus'></span>
														关注
													</button>
												</c:if>
											</c:if>
										</div>
									</li>
								</c:forEach>
							</ul>
						</div>

						<!-- 我的学习榜样 -->
						<div role="tabpanel" class="tab-pane fade" id="my-idol">
							<ul class="note-list list-unstyled" id="user-list">
								<c:forEach items="${userList}" var="user">
									<li class="my-idol-list">
										<a href="<%=path%>/users/${user.id}/latest_articles">
											<img class="idol-avatar" src="<%=path%>/${user.userImagePath}" alt="榜样的头像">
										</a>
										<div class="idol-content">
											<a href="<%=path%>/users/${user.id}/latest_articles">${user.userName}</a>
											<div class="info">${user.userIntroduce}</div>
											<div class="idol-meta">
												<span>${user.userEssayNumber}篇文章</span>
												<span>|</span>
												<span>${user.userFansNumber}人的学习榜样</span>
											</div>
											<c:if test="${user.id != userIdInSession}">
												<c:if test="${user.isFocused}">
													<button id="focus-user-button-${user.id}"
														class="btn not-watch not-watch-idol btn-danger"
														onclick="likeJS.focusUser('${user.id}','<%=path%>');">取消关注</button>
												</c:if>
												<c:if test="!${user.isFocused}">
													<button id="focus-user-button-${user.id}"
														class="btn not-watch not-watch-idol btn-success"
														onclick="likeJS.focusUser('${user.id}','<%=path%>');">
														<span class='glyphicon glyphicon-plus'></span>
														关注
													</button>
												</c:if>
											</c:if>
										</div>
									</li>
								</c:forEach>
							</ul>
						</div>

						<!-- 喜欢的知识地图 -->
						<div role="tabpanel" class="tab-pane fade" id="favourite-kmap">
							<ul class="note-list list-unstyled" id="kmap-list">
								<c:forEach items="${kmapList}" var="kmap">
									<li>
										<img class="mindmap-img" src="<%=path%>/icon/map.png" alt="icon">
										<div class="mindmap-content">
											<a href="<%=path%>/mindmap/${kmap.id}" class="mindmap-title">${kmap.kmapName}</a>
											<p class="mindmap-info">${kmap.kmapDescribe}</p>

											<div class="meta" style="color:#969696;">
												<span>
													<i class="glyphicon glyphicon-eye-open"></i>
													${kmap.kmapLookNumber}
												</span>
												<span>
													<i class="glyphicon glyphicon-heart"></i>
													${kmap.kmapLikeNumber}
												</span>
											</div>
										</div>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-2 blank"></div>
		</div>
	</div>

	<%@ include file="common/common-js.jsp"%>
	<script src="<%=path%>/js/like.js"></script>
</body>
</html>
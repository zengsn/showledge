<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common/tag.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@include file="common/head.jsp"%>
<title>文集 - ${corpus.corpusName}</title>

<link href="<%=path%>/css/nav.css" rel="stylesheet">
<link href="<%=path%>/css/corpus.css" rel="stylesheet">

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
			<div class="col-md-2"></div>

			<div class="col-md-8">
				<!-- main -->
				<div class="col-md-9 main">
					<!-- 专题头部模块 -->
					<div class="main-top">
						<a class="album-avatar" href="<%=path%>/notebooks/${corpus.id}/latest">
							<img src="<%=path%>/${corpus.corpusImagePath}" alt="专辑封面">
						</a>

						<c:if test="${corpus.userId != userIdInSession}">
							<c:if test="${!user.isFocused}">
								<button type="button" id="follow-btn" class="no-focus"
									onclick="corpusJS.addFocusCorpus('${corpus.id}','<%=path%>');">
									<span class="glyphicon glyphicon-plus"></span>
									<span id="focus-mess">关注</span>
								</button>
							</c:if>
							<c:if test="${user.isFocused}">
								<button type="button" id="follow-btn" class="focus"
									onclick="corpusJS.removeFocusCorpus('${corpus.id}','<%=path%>');">
									<span id="focus-mess">已关注</span>
								</button>
							</c:if>
						</c:if>

						<c:if test="${corpus.userId == userIdInSession}">
							<button id="contribute-btn" class="contribute-btn" type="button" onclick="corpusJS.toEditCorpus('${corpus.id}','<%=path%>');">
								<span>编辑</span>
							</button>
						</c:if>

						<div class="title">
							<a href="<%=path%>/notebooks/${corpus.id}/latest">${corpus.corpusName}</a>
						</div>
						<div class="info">收录了${corpus.essayNumber}篇文章 · ${corpus.userFocusNumber}人关注</div>
					</div>
					<!-- main-top end -->

					<!-- 内容导航栏 -->
					<ul class="nav nav-tabs nav-pills trigger-menu" role="tablist">
						<li role="presentation" class="active">
							<a href="#new-collections" aria-controls="new-collections" role="tab" data-toggle="tab">
								<span class="glyphicon glyphicon-list-alt"></span>
								<span>最新收录</span>
							</a>
						</li>
						<li role="presentation">
							<a href="#hot-collections" aria-controls="hot-collections" role="tab" data-toggle="tab">
								<span class="glyphicon glyphicon-fire"></span>
								<span>热门</span>
							</a>
						</li>
					</ul>
					<!-- trigger-menu end -->

					<!-- 导航栏对应的内容 -->
					<div class="tab-content">
						<!-- 最新收录 -->
						<div role="tabpanel" class="tab-pane fade in active" id="new-collections">
							<!--  文章列表 -->
							<div class="list-container">
								<ul class="note-list">
									<c:forEach items="${essayListOrderByTime}" var="essay">
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
												<a href="article-page.html" class="note-title" target="_blank">${essay.essayTitle}</a>
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
										<hr>
									</c:forEach>
								</ul>
							</div>
						</div>
						<!-- 最新收录 end -->

						<!-- 热门 -->
						<div role="tabpanel" class="tab-pane fade" id="hot-collections">
							<!--  文章列表 -->
							<div class="list-container">
								<ul class="note-list">
									<c:forEach items="${essayListOrderByFame}" var="essay">
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
												<a href="article-page.html" class="note-title" target="_blank">${essay.essayTitle}</a>
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
										<hr>
									</c:forEach>
								</ul>
							</div>
						</div>
						<!-- 热门 end -->
					</div>

				</div>
				<!-- main end -->

				<!-- aside -->
				<div class="col-md-3 aside">
					<!-- 专题公告 -->
					<div class="announcement">
						<p>专题公告</p>
						<div class="announce-content">${corpus.corpusDiscribe}</div>
						<!-- 详细内容btn -->
						<button id="announce-detail-btn" data-toggle="modal" data-target="#announce-detail">
							<span>详细内容</span>
							<span class="glyphicon glyphicon-chevron-right"></span>
						</button>

						<!-- 详细内容模态框 -->
						<!-- Modal -->
						<div class="modal fade" id="announce-detail" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title" id="myModalLabel">公告详细内容</h4>
									</div>
									<div class="modal-body">${corpus.corpusDiscribe}</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 专题公告 end -->
					<hr>

					<!-- 管理员列表 -->
					<div class="manager-list">
						<p>管理员</p>
						<ul class="managers" style="list-style:none;padding-left:0;">
							<li>
								<a href="<%=path%>/users/${corpus.userId}/latest_articles" target="_blank">
									<img class="avatar" src="<%=path%>/${corpus.userImagePath}" alt="用户头像">
								</a>
								<div class="name">
									<a href="<%=path%>/users/${corpus.userId}/latest_articles" class="manager-name"
										target="_blank"> ${corpus.userName} </a>
								</div>
								<span>创建者</span>
							</li>
						</ul>
					</div>
					<!-- manager-list -->
					<hr>

					<!-- 关注的人 -->
					<div class="watch-user">
						<p>
							关注的人(
							<span>${corpus.userFocusNumber}</span>
							)
						</p>
						<hr>
					</div>
					<!-- aside -->
				</div>

				<div class="col-md-2"></div>
			</div>
		</div>

		<%@ include file="common/common-js.jsp"%>
		<script src="<%=path%>/js/corpus.js" type="text/javascript"></script>
</body>
</html>

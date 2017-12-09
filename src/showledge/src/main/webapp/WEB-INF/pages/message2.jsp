<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common/tag.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="common/head.jsp"%>
<title>消息 - 简随记</title>

<link href="<%=path%>/css/nav.css" rel="stylesheet">
<link href="<%=path%>/css/message.css" rel="stylesheet">

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
				<div class="row">
					<div class="col-md-4 aside">
						<div>
							<!-- Nav tabs -->
							<ul class="nav nav-stack" role="tablist">
								<li id="comment" role="presentation" class="active">
									<a id="new-comment" href="#new-comment-list" aria-controls="new-comment-list" role="tab"
										data-toggle="tab">
										<img src="icon/comment.png" style="margin-right:15px;" alt="icon">
										最新评论
										<c:if test="${commentMessageNoReadingNumber != 0}">
											<span id="new-comment-number" class="badge">${commentMessageNoReadingNumber}</span>
										</c:if>
									</a>
								</li>
								<li id="watch" role="presentation">
									<a id="new-watch" href="#new-watch-list" aria-controls="new-watch-list" role="tab"
										data-toggle="tab">
										<img src="icon/watch.png" style="margin-right:15px;" alt="icon">
										关注
										<c:if test="${focusMessageNoReadingNumber != 0}">
											<span id="new-watch-number" class="badge">${focusMessageNoReadingNumber}</span>
										</c:if>
									</a>
								</li>
							</ul>
						</div>
					</div>

					<div class="col-md-8 main">
						<!-- Tab panes fade-->
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane fade in active" id="new-comment-list">
								<ul>
									<c:if test="${commentMessageList == null || fn:length(commentMessageList) == 0}">
										<li>
											<p>暂无消息~</p>
										</li>
										<hr>
									</c:if>
									<c:if test="${commentMessageList != null && fn:length(commentMessageList) != 0}">
										<c:forEach items="${commentMessageList}" var="commentMessage">
											<li>
												<div>
													<a href="users/${commentMessage.replyUserId}/latest_articles" target="_blank">${commentMessage.replyUserName}</a>
													在 《
													<a href="essay/${commentMessage.essayId}" target="_blank">${commentMessage.essayTitle}</a>
													》对您进行了回复
												</div>
												<p>${commentMessage.cotent}</p>
												<p class="comment-time">${commentMessage.subUpdateTime}</p>
											</li>
											<hr>
										</c:forEach>
									</c:if>
								</ul>
							</div>
							<!-- new-comment-list end -->

							<div role="tabpanel" class="tab-pane fade" id="new-watch-list">
								<ul>
									<c:if test="${focusMessageList == null || fn:length(focusMessageList) == 0}">
										<li>
											<p>暂无消息~</p>
										</li>
										<hr>
									</c:if>
									<c:if test="${focusMessageList != null && fn:length(focusMessageList) != 0}">
										<c:forEach items="${focusMessageList}" var="focusMessage">
											<c:if test="${focusMessage.corpusId == 0 && focusMessage.essayId != 0}">
												<li>
													你的学习榜样
													<a href="users/${focusMessage.userId}/latest_articles" target="_blank">${focusMessage.userName}</a>
													更新了
													<a href="essay/${focusMessage.essayId}" target="_blank">文章</a>
													<p class="comment-time">${focusMessage.subUpdateTime}</p>
												</li>
												<hr>
											</c:if>

											<c:if test="${focusMessage.kmapId != 0}">
												<li>
													你的学习榜样
													<a href="users/${focusMessage.userId}/latest_articles" target="_blank">${focusMessage.userName}</a>
													更新了
													<a href="mindmap/${focusMessage.kmapId}" target="_blank">知识地图</a>
													<p class="comment-time">${focusMessage.subUpdateTime}</p>
												</li>
												<hr>
											</c:if>

											<c:if test="${focusMessage.corpusId != 0 && focusMessage.essayId != 0}">
												<li>
													你所关注的专辑 《
													<a href="notebooks/${focusMessage.corpusId}/latest" target="_blank">${focusMessage.corpusName}</a>
													》 更新了内容 《
													<a href="essay/${focusMessage.essayId}" target="_blank">${focusMessage.essayTitle}</a>
													》
													<p class="comment-time">${focusMessage.subUpdateTime}</p>
												</li>
												<hr>
											</c:if>


										</c:forEach>
									</c:if>
								</ul>
							</div>
							<!-- new-watch-list -->

						</div>
					</div>
				</div>
			</div>
			<div class="col-md-2 blank"></div>
		</div>
	</div>

	<%@ include file="common/common-js.jsp"%>
	<script src="<%=path%>/js/message.js" type="text/javascript"></script>
</body>
</html>
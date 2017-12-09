<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common/tag.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="common/head.jsp"%>
<title>${essay.essayTitle}-简随记</title>

<link href="<%=path%>/css/nav.css" rel="stylesheet">
<link href="<%=path%>/css/essay.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->
</head>

<body>
	<%@ include file="common/nav.jsp"%>
	<input id="userIdInSession" type="hidden" value="${userIdInSession}" />

	<!-- 主要内容 -->
	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="post">
					<div class="article">
						<h1 class="title">${essay.essayTitle}</h1>
						<div class="author">
							<!-- 头像 -->
							<a href="<%=path%>/users/${essay.userId}/latest_articles">
								<img class="avatar" src="<%=path%>/${essayUserImage}" alt="用户头像">
							</a>
							<!-- 作者、文章信息 -->
							<div class="info">
								<span class="tag">作者</span>
								<span class="name">
									<a href="<%=path%>/users/${essay.userId}/latest_articles">${essay.userName}</a>
								</span>
								<!-- 用户关注按钮（设置为榜样） -->
								<c:if test="${userIdInSession != essay.userId}">
									<c:if test="${!user.isFocused}">
										<a class="btn btn-xs follow btn-success">
											<span class="glyphicon glyphicon-plus" style="margin-right:0px;"></span>
											<span id="focus" onclick="essayJS.addFocusUser('${essay.userId}', '<%=path%>');">设为榜样</span>
										</a>
									</c:if>
									<c:if test="${user.isFocused}">
										<a class="btn btn-xs follow btn-default">
											<span class="glyphicon glyphicon-ok" style="margin-right:0px;"></span>
											<span id="focus" onclick="essayJS.removeFocusUser('${essay.userId}', '<%=path%>');">我的榜样</span>
										</a>
									</c:if>
								</c:if>
								<!-- 文章数据信息 -->
								<div class="meta">
									<span class="publish-time">${essay.formatEssayTime}&nbsp;</span>
									<span class="words-count">字数&nbsp;${essay.essayWordNumber}&nbsp;</span>
									<span class="views-count">阅读&nbsp;	&nbsp;</span>
									<span class="comments-count">评论&nbsp;${essay.essayCommentNumber}&nbsp;</span>
									<span class="comments-count">喜欢&nbsp;${essay.essayGoodNumber}</span>
								</div>
							</div>
							<!--info end -->
						</div>
						<!--author end-->
						<hr />
						<div class="article-content">
							<p>${essay.essayContent}</p>
						</div>
						<!-- article-content end-->
						<hr />
						<div class="article-foot">
							<a href="<%=path%>/notebooks/${essay.corpusId}/latest" class="notebook">
								<span class="glyphicon glyphicon-book"></span>
								${essay.corpusName}
							</a>
							<div class="copyright" data-toggle="tooltip" data-html="true"
								data-original-title="转载请联系作者获得授权，并标注出处。">© 著作权归作者所有</div>
						</div>
						<!--article-foot end-->
					</div>
					<!-- article end -->
					<div class="meta-bottom">
						<c:if test="${!essay.isFavourited}">
							<div class="like" style="background-color: white; color: #00CC33;">
								<div id="favourite-btn" onclick="essayJS.addFavourite('${essay.userId}','${essay.id}','<%=path%>');">
									<span id="favourite-icon" class="glyphicon glyphicon-heart-empty" style="font-size:26px;vertical-align:middle;"></span>
									<span style="margin-right:3px;">喜欢</span>
									<span>|&nbsp;</span>
									<span id="likes-count">${essay.essayGoodNumber}</span>
								</div>
							</div>
						</c:if>
						<c:if test="${essay.isFavourited}">
							<div class="like" style="background-color: #00CC33; color: white;">
								<div id="favourite-btn" onclick="essayJS.removeFavourite('${essay.userId}','${essay.id}','<%=path%>');">
									<span id="favourite-icon" class="glyphicon glyphicon-heart" style="font-size:26px;vertical-align:middle;"></span>
									<span style="margin-right:3px;">喜欢</span>
									<span>|&nbsp;</span>
									<span id="likes-count">${essay.essayGoodNumber}</span>
								</div>
							</div>
						</c:if>
					</div>
					<!-- meta-bottom end -->
					<div class="comments">
						<div>
							<form class="new-comment">
								<c:if test="${userIdInSession != null}">
									<a class="avatar" href="<%=path%>/users/${userIdInSession}/latest_articles">
										<img class="avatar" src="<%=path%>/${userImagePathInSession}" alt="用户头像">
									</a>
								</c:if>
								<textarea id="commentContent" name="commentContent" cols="30" rows="10"
									placeholder="写下你的评论..."></textarea>
								<div class="write-function-block">
									<a class="emoji">
										<img src="<%=path%>/icon/smiling24x24.png" alt="smiling-icon">
									</a>
									<a class="cancel">取消</a>
									<button class="btn btn-success btn-lg send"
										onclick="essayJS.addComment(${essay.id}, '<%=path%>/');">发表</button>
								</div>
							</form>
							<!-- new-comment end -->
							<!-- 评论部分 -->
							<div id="comment-list" class="comment-list">
								<div class="comment-list-count">
									<span>${essay.essayCommentNumber}&nbsp;条评论</span>
								</div>
								<hr>
								<!-- 每一条评论都有一个自己的id -->
								<c:forEach items="${commentList}" var="comment">
									<div class="comment" id="child_comment_${comment.id}">
										<div class="origin-comment">
											<!-- 原始评论 -->
											<div class="author">
												<a href="<%=path%>/users/${comment.commentDiscussantId}/latest_articles">
													<img class="avatar" src="<%=path%>/${comment.commentDiscussantImagePath}" alt="用户头像">
												</a>
												<div class="info">
													<a href="<%=path%>/users/${comment.commentDiscussantId}/latest_articles"
														target="_blank" class="name">${comment.commentDiscussantName}</a>
													<div class="meta">
														<span>${comment.commentBuildingNumber} 楼 · ${comment.formatCommentTime}</span>
													</div>
												</div>
											</div>
											<div class="comment-wrap">
												<p>${comment.commentContent}</p>
												<div class="tool-group">
													<a>
														<span class="glyphicon glyphicon-thumbs-up"></span>
														<span>赞</span>
													</a>
													<a class="apply-comment">
														<span class="glyphicon glyphicon-comment"></span>
														<span>回复</span>
													</a>
													<c:if test="${comment.commentDiscussantId == userIdInSession}">
														<a class="delete-comment"
															onclick="essayJS.deleteComment('${essay.id}','${comment.id}');">
															<span>删除评论</span>
														</a>
													</c:if>
												</div>
											</div>
										</div>
										<!-- origin-comment end -->
										<c:if test="${comment.replyList != null && fn:length(comment.replyList) > 0}">
											<div class="sub-comment-list">
												<!-- 回复评论 -->
												<div class="sub-comment" id="reply_${comment.id}">
													<c:forEach items="${comment.replyList}" var="reply" varStatus="status">
														<div id="child_reply_${reply.id}">
															<p>
																<a href="<%=path%>/users/${reply.replyUserId}/latest_articles" target="_blank"
																	class="name">${reply.replyUserName}</a>
																:
																<span>${reply.replyContent}</span>
															</p>
															<div class="sub-tool-group">
																<span>${reply.formatReplyTime}</span>
																<a class="apply-comment">
																	<span class="glyphicon glyphicon-comment"></span>
																	<span>回复</span>
																</a>
																<c:if test="${reply.replyUserId == userIdInSession}">
																	<a onclick="essayJS.deleteReply('${essay.id}','${reply.id}', '<%=path%>');">
																		<span>删除评论</span>
																	</a>
																</c:if>
															</div>
															<c:if test="${status.index < (fn:length(comment.replyList) - 1)}">
																<hr>
															</c:if>
															<c:if test="${status.index == (fn:length(comment.replyList) - 1)}">
																<div id="add-new-reply-${comment.id}" class="sub-tool-group more-comment">
																	<a class="apply-comment">
																		<span class="glyphicon glyphicon-pencil"></span>
																		添加新评论
																	</a>
																</div>
															</c:if>
														</div>
													</c:forEach>
													<!-- new-comment end -->
												</div>
											</div>
										</c:if>
										<!-- sub-comment-list end -->
										<hr id="hr_${comment.id}">
										<div>
											<form class="new-comment new-comment-sub" style="margin-top:20px;margin-bottom:50px;">
												<textarea id="reply_content_${comment.id}" style="margin-left:0;width:100%;" rows="10"
													placeholder="写下你的评论..."></textarea>
												<div class="write-function-block">
													<a class="emoji">
														<img src="<%=path%>/icon/smiling24x24.png" alt="smiling-icon">
													</a>
													<a class="cancel">取消</a>
													<a class="btn btn-success btn-lg send"
														onclick="essayJS.addReply('${comment.commentDiscussantId}','${essay.id}','${essay.essayTitle}','${comment.id}','<%=path%>');">发送</a>
												</div>
											</form>
										</div>
									</div>
								</c:forEach>
							</div>
							<!-- comment-list end -->
						</div>
					</div>
					<!-- comments end -->
				</div>
				<!-- post end -->
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>

	<%@ include file="common/common-js.jsp"%>
	<script src="<%=path%>/js/essay.js" type="text/javascript"></script>
</body>
</html>
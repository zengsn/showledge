<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Comments -->
<div id="comments" class="comment-list clearfix">
	<div class="comment-head clearfix">${essay.essayCommentNumber}条评论
		<span class="order">（ <a data-order="asc" class="active" hidefocus="true"
				onFocus="this.blur()" href="javascript:void(0)">按时间正序</a>· <a data-order="desc" hidefocus="true"
				onFocus="this.blur()" href="javascript:void(0)">按时间倒序</a>· <a data-order="likes_count"
				hidefocus="true" onFocus="this.blur()" href="javascript:void(0)">按喜欢排序</a>）
		</span>
		<a hidefocus="true" onFocus="this.blur()" href="#commentContent" class="goto-comment pull-right">
			<i class="fa fa-pencil"></i>
			添加新评论
		</a>
		<a class="close-comment pull-right" disable_with="请等待..." data-remote="true" rel="nofollow"
			data-method="put" hidefocus="true" onFocus="this.blur()" href="javascript:void(null)">关闭评论</a>
	</div>
	<div id="comment-list">
		<c:forEach items="${commentList}" var="comment">
			<div id="child_comment_${comment.id}" class="note-comment clearfix">
				<div class="content">
					<div class="meta-top">
						<a class="avatar" hidefocus="true" onFocus="this.blur()"
							href="<%=path%>/users/${comment.commentDiscussantId}/latest_articles">
							<img src="<%=path%>/${comment.commentDiscussantImagePath}" alt="100">
						</a>
						<p>
							<a class="author-name" hidefocus="true" onFocus="this.blur()"
								href="<%=path%>/users/${comment.commentDiscussantId}/latest_articles">${comment.commentDiscussantName}</a>
						</p>
						<span class="reply-time"> <small>${comment.commentBuildingNumber} 楼 ·</small> <a
								hidefocus="true" onFocus="this.blur()" href="javascript:void(null)">${comment.formatCommentTime}</a></span>
					</div>
					<p>${comment.commentContent}</p>
					<div class="comment-footer clearfix text-right">
						<a class="like pull-left" hidefocus="true" onFocus="this.blur()" href="javascript:void(0)">
							<i class="fa fa-heart-o"></i>
							喜欢 <span>(0)</span>
						</a>
						<a data-nickname="" class="reply" hidefocus="true" onFocus="this.blur()" hidefocus="true"
							onFocus="this.blur()" href="javascript:void(0)"
							onclick="essayJS.showNewReplyForm(${comment.id}, '<%=path%>/');">回复</a>
						<c:if test="${comment.commentDiscussantName == userNameInSession}">
							<a class="delete" data-remote="true" rel="nofollow" hidefocus="true" onFocus="this.blur()"
								href="javascript:void(null)" onclick="essayJS.deleteComment(${essay.id},${comment.id});">删除</a>
						</c:if>
					</div>
					<div class="child-comment-list">
						<div id="reply_${comment.id}">
							<c:forEach items="${comment.replyList}" var="reply">
								<div id="child_reply_${reply.id}" class="child-comment">
									<p>
										<a class="blue-link" hidefocus="true" onFocus="this.blur()"
											href="<%=path%>/users/${reply.replyUserId}/latest_articles">${reply.replyUserName}</a>
										： ${reply.replyContent}
									</p>
									<div class="child-comment-footer text-right clearfix">
										<a class="reply" hidefocus="true" onFocus="this.blur()" hidefocus="true"
											onFocus="this.blur()" href="javascript:void(null)"
											onclick="essayJS.showNewReplyForm(${comment.id}, '<%=path%>/')">回复</a>
										<span class="reply-time pull-left"> <a hidefocus="true" onFocus="this.blur()"
												href="javascript:void(null)">${reply.formatReplyTime}</a></span>
										<c:if test="${reply.replyUserName == userNameInSession}">
											<a class="delete" data-remote="true" rel="nofollow" hidefocus="true"
												onFocus="this.blur()" hidefocus="true" onFocus="this.blur()"
												href="javascript:void(null)" onclick="essayJS.deleteReply(${essay.id},${reply.id})">删除</a>
										</c:if>
									</div>
								</div>
							</c:forEach>
						</div>

						<form id="new_reply_form_${comment.id}" style="display: none" class="new_comment"
							accept-charset="UTF-8" method="post" action="">
							<div class="comment-text">
								<textarea id="reply_content_${comment.id}" maxlength="2000" placeholder="写下你的评论…"
									class="mousetrap"></textarea>
								<div>
									<input type="button" value="发 表" class="btn btn-info" hidefocus="true"
										onFocus="this.blur()" onclick="essayJS.addReply(${essay.id},${comment.id},'<%=path%>/')">
									<div class="emoji">
										<span> <i class="fa fa-smile-o"></i>
										</span>
									</div>
									<span class="hotkey">Ctrl+Enter 发表</span>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<form id="new_comment_form" class="new_comment" accept-charset="UTF-8" method="post" action="">
		<input id="essay.id" name="essay.id" type="hidden" value="${essay.id}" />
		<div class="comment-text">
			<textarea id="commentContent" name="commentContent" maxlength="2000" placeholder="写下你的评论…"
				class="mousetrap"></textarea>
			<div>
				<input type="button" value="发 表" class="btn btn-info" hidefocus="true" onFocus="this.blur()"
					onclick="essayJS.addComment(${essay.id}, '<%=path%>/');" />
				<div class="emoji">
					<span> <i class="fa fa-smile-o"></i>
					</span>
				</div>
				<span class="hotkey">Ctrl+Enter 发表</span>
			</div>
		</div>
	</form>
</div>
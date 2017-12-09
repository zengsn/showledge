<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common/tag.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="common/head.jsp"%>
<title>${essay.essayTitle}-秀知识</title>

<link href="<%=path%>/css/nav.css" rel="stylesheet">
<link href="<%=path%>/css/essay.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->
</head>

<body id="note-page">
	<%@ include file="common/nav.jsp"%>
	<input id="userIdInSession" type="hidden" value="${userIdInSession}" />

  <!-- 更多推荐页 #intro-user-page -->
    <div class="container main-content">
      <div class="row">
        <div class="col-md-2 blank"></div>
        <div class="col-md-8 main">
          <div class="row">
            <div class="col-md-1 blank"></div>
            <div class="col-md-10">
              <div class="box" id="note-id-001">
                <h2 class="note-title">${essay.essayTitle}</h2>
                <div class="note-info">
                  <a href="<%=path%>/user.do" target="_blank"><img src="<%=path%>/${essayUserImage}" alt="用户头像-sm" class="avatar-sm"></a>
                  <a href="<%=path%>/user.do" target="_blank" class="user-name">${essay.userName}</a>
                  
                  <!-- 如果文章不是自己才需要有关注按钮 -->
                  <c:if test="${userIdInSession != essay.userId}">
                  	<c:if test="${!user.isFocused}">
                  		<a class="follow-btn" onclick="essayJS.changeFocusUser('${essay.userId}',this);"><span class="fa fa-plus-circle"></span>关注</a>
                  	</c:if>
                  	<c:if test="${user.isFocused}">
                  		<a class="follow-btn not-follow" onclick="essayJS.changeFocusUser('${essay.userId}',this);"><span class="fa"></span>已关注</a>
                  	</c:if>
                  </c:if>
                  
                  <div class="note-count">
                    <span class="note-date">${essay.formatEssayTime}</span>
                    <span class="note-read-count">阅读量 <span>${essay.essayReadingNumber}</span></span>
                    <span class="note-comment-count">评论数 <span>${essay.essayCommentNumber}</span></span>
                    <span class="note-like-count">点赞数 <span>${essay.essayGoodNumber}</span></span>
                    <span class="note-collect-count">收藏数 <span>${essay.essayCollectNumber}</span></span>
                  </div>
                </div>
                <div class="note-category">
                  <span><span class="fa fa-tags fa-fw"></span>分类</span>
                  <a href="#" style="pointer-events: none;" target="_blank" class="note-tag">${type.name }</a>
                </div>
                <div class="note-entity">
                	${essay.essayContent}
                </div>
                <hr>
                <c:if test="${userIdInSession != essay.userId}">
                <div class="note-like-and-collect-btn">
                	<c:if test="${!essay.isFavourited}">
                  		<button class="btn btn-lg btn-green like-btn" onclick="essayJS.changeFavourite('${essay.id}',this);"><span class="fa fa-heart fa-fw"></span>点赞</button>
                  	</c:if>
                  	<c:if test="${essay.isFavourited}">
                  		<button class="btn btn-lg btn-green like-btn note-like-and-collect-btn-active" onclick="essayJS.changeFavourite('${essay.id}',this);"><span class="fa fa-heart fa-fw"></span>已点赞</button>
                  	</c:if>
                	<c:if test="${!essay.isCollected}">
                		<button class="btn btn-lg btn-green collect-btn" onclick="essayJS.changeCollection('${essay.id}',this);"><span class="fa fa-bookmark fa-fw"></span>收藏</button>
                  	</c:if>
                  	<c:if test="${essay.isCollected}">
                  		<button class="btn btn-lg btn-green collect-btn note-like-and-collect-btn-active" onclick="essayJS.changeCollection('${essay.id}',this);"><span class="fa fa-bookmark fa-fw"></span>已收藏</button>
                  	</c:if>
                </div>
                <hr>
                 </c:if>
                <div class="input-comment">
                  <a href="<%=path%>/user.do" target="_blank"><img src="<%=path%>/${userImagePathInSession}" alt="用户头像-sm" class="avatar-sm"></a>
                  <textarea name="input-comment-area" id="commentContent" class="form-control" rows="4" placeholder="你的评论写这里哦~"></textarea>
                  <button class="btn btn-green send-comment-btn" onclick="essayJS.addComment(${essay.id}, '<%=path%>/');">提交评论</button>
                </div>
                <div class="comments-list">
                  <div class="comments-list-count">
                    <span>${essay.essayCommentNumber}条评论</span>
                  </div>
                  <hr>
                  <ul id="comment-list">
                  
                  <c:forEach items="${commentList}" var="comment">
	                  <li id="comment-${comment.id}">
	                      <div class="comment-user">
	                        <a href="<%=path%>/user.do?userId=${comment.commentDiscussantId}" target="_blank"><img src="/${comment.commentDiscussantImagePath}" alt="用户头像-ssm" class="avatar-ssm"></a> 
	                        <a href="<%=path%>/user.do?userId=${comment.commentDiscussantId}" target="_blank" class="user-name">${comment.commentDiscussantName}</a>
	                        <div>
	                          <span>${comment.commentBuildingNumber}楼</span>
	                          <span> · </span>
	                          <span>${comment.formatCommentTime}</span>
	                        </div>
	                      </div>
	                      <div class="comment-content">
	                        <p>${comment.commentContent}</p>
	                      </div>
	                 </li>
				</c:forEach>
<!--                   
                    <li id="comment-001">
                      <div class="comment-user">
                        <a href="personal-page.html" target="_blank"><img src="image/user-avatar3.jpg" alt="用户头像-ssm" class="avatar-ssm"></a> 
                        <a href="personal-page.html" target="_blank" class="user-name">奥利奥饼干</a>
                        <div>
                          <span>3楼</span>
                          <span> · </span>
                          <span>2017.01.06 12:40</span>
                        </div>
                      </div>
                      <div class="comment-content">
                        <p>作者总结的不错~</p>
                      </div>
                      <div class="comment-function-btn">
                        <a class="good-btn"><span class="fa fa-thumbs-o-up fa-fw"></span>点赞</a>
                        <a class="reply-btn"><span class="fa fa-comment fa-fw"></span>回复</a>
                      </div>
                      <div class="reply-comment">
                        <ul>
                          <li id="reply-commen-001">
                            <p>
                              <a href="personal-page.html" target="_blank" class="user-name at-who">飞翔的粑粑</a>
                              <span class="fa fa-caret-right fa-fw"></span>
                              <a href="personal-page.html" target="_blank" class="user-name">奥利奥饼干</a>
                              <span class="fa fa-fw"></span>
                              谢谢支持(回复正文)
                            </p>
                            <span>2017.01.06 14:40</span>
                            <a class="reply-btn"><span class="fa fa-comment fa-fw"></span>回复</a>
                          </li>
                          <li id="reply-commen-002">
                            <p>
                              <a href="personal-page.html" target="_blank" class="user-name at-who">饼干</a>
                              <span class="fa fa-caret-right fa-fw"></span>
                              <a href="personal-page.html" target="_blank" class="user-name">飞翔的粑粑</a>
                              <span class="fa fa-fw"></span>
                              谢谢支持(回复正文)
                            </p>
                            <span>2017.01.06 14:40</span>
                            <a class="reply-btn"><span class="fa fa-comment fa-fw"></span>回复</a>
                          </li>
                        </ul>
                        <div class="reply-block">
                          <textarea name='reply-comment-area' id='reply-comment-area' class='form-control' rows='4' placeholder='你的评论写这里哦~'></textarea>
                          <div>
                            <button class='btn btn-green send-reply-btn'>提交回复</button>
                            <button class='btn cancel-reply-btn'>取消</button>
                          </div>
                        </div>
                      </div>
                    </li> -->
                  </ul>
                </div><!-- comment-list end -->
              </div>              
            </div>
            <div class="col-md-1 blank"></div>
          </div>
        </div>
        <div class="col-md-2 blank"></div>
      </div>
    </div>

	<%@ include file="common/common-js.jsp"%>
	<%-- <script src="<%=path%>/js/essay.js" type="text/javascript"></script>
	 --%>
	<!-- 警告框js -->
    <script src="<%=path%>/js/alert.js"></script>
    <!-- 关注按钮切换js -->
    <script src="<%=path%>/js/reco-follow-btn-toggle.js"></script>
    <!-- note-page.js -->
    <script src="<%=path%>/js/note-page.js"></script>

    <script src="<%=path%>/js/essay.js"></script>

    <script>
      $(function () {
    	  $("[data-toggle='tooltip']").tooltip(); 
    	  }
      );
    </script>
	
	
</body>
</html>
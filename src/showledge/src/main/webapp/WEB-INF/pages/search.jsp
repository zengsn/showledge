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

    <link rel="stylesheet" href="css/search-page.css">

</head>
<body>
	<%@ include file="common/nav.jsp"%>

	<div class="container-fluid main-content">
      <div class="row">
        <div class="col-md-2 _blank"></div>
        <div class="col-md-8 main">
          <div class="row">
            <div class="col-md-1 _blank"></div>
            <div class="col-md-10">
              <p id="searh-title">
                <span class="fa fa-search fa-fw"></span>
                <span>搜索结果</span>
              </p>
              <!-- Nav tabs -->
               <ul class="nav nav-pills" role="tablist">
                <li role="presentation" class="active"><a href="#search-user" aria-controls="search-user" role="tab" data-toggle="tab">用户</a></li>
                <li role="presentation"><a href="#search-note" aria-controls="search-note" role="tab" data-toggle="tab">学习笔记</a></li>
                <!-- <li role="presentation"><a href="#search-map" aria-controls="search-map" role="tab" data-toggle="tab">知识地图</a></li> -->
              </ul>
              <!-- Tab panes -->
              <div class="tab-content">
                <!-- 搜索用户 -->                        
                <div role="tabpanel" class="tab-pane  active" id="search-user">
                  <!-- 搜索失败提示 -->
                  <c:if test="${userPageParam.data == null || fn:length(userPageParam.data) == 0}">
					<!-- 搜索失败提示 -->
					<p class="searchFail">你要找的用户不存在 : )</p>
				</c:if>
                  <ul>
                  <c:forEach items="${userPageParam.data }" var="user" varStatus="status">
  					<li class="box" id="idol-${status.index }">
	                    <a href="/user.do?userId=${user.id }"><img src="${user.userImagePath }" alt="用户头像-sm" class="avatar-sm"></a>
	                    <a href="personal-page.html" class="user-name">${user.userName }</a>
	                    <p class="user-summary">${user.userIntroduce }</p>
	                    <c:if test="${user.isFocused }">
	                    	<button class="btn btn-green follow-btn"  onclick="userJS.changeFocusUser(${user.id},this)">已关注</button>	
	                    </c:if>
	                    <c:if test="${!user.isFocused }">
	                    	<button class="btn btn-green follow-btn not-follow"  onclick="userJS.changeFocusUser(${user.id},this)"><span class='fa fa-plus-circle'></span>关注</button>
	                    </c:if>
	                  </li>
                  </c:forEach>
                  </ul>
                </div><!-- search-user end    -->            
                
                <!-- 搜索笔记 -->
                <div role="tabpanel" class="tab-pane" id="search-note">
                  <!-- 搜索失败提示 -->
                  <c:if test="${essayPageParam.data == null || fn:length(essayPageParam.data) == 0}">
					<!-- 搜索失败提示 -->
					<p class="searchFail">你要找的文章不存在 : )</p>
				</c:if>
                  <ul>
                    <c:forEach items="${essayPageParam.data}" var="essay" varStatus="status">
						<li class="box" id="my-note-001">
	                    <div class="user-info">
	                      <div class="user-avatar">
	                        <a href="/user.do?userId=${essay.userId }"><img src="${essay.userImagePath}" alt="用户头像-sm" class="avatar-sm"></a>
	                        <a href="/user.do?userId=${essay.userId }" class="user-name">${essay.userName}</a>
	                        <span> - </span>
	                        <span class="user-act-time">${essay.subEssayTime}</span>
	                      </div>
	                    </div>  
	                    <a href="<%=path%>/essay/${essay.id}.do" target="_blank" class="note-title-sm">${essay.essayTitle}</a>
	                    <p class="note-content">
	                    	${essay.essayContent}
	                    </p>
	                    <a href="<%=path%>/essay/${essay.id}.do" target="_blank" class="more-detail-btn">详细内容 > </a>
	                    <%-- <div class="act-info">
		                  <div class="like-count green-count eye">
	                        <span class="glyphicon glyphicon-eye-open"></span>
	                        <span>${essay.essayReadingNumber}</span>
		                  </div>
	                      <div class="comments-count green-count" data-toggle="modal" data-target="#comment-modal" onclick="userJS.getComment(${essay.id})">
	                        <span class="glyphicon glyphicon-comment"></span>
	                        <span>${essay.essayCommentNumber}</span>
	                      </div>
	                      <c:if test="${essay.isFavourited }">
		                      <div class="like-count green-count" onclick="userJS.changeFavourite(${essay.id},this,${essay.essayGoodNumber})">
		                        <span class="glyphicon glyphicon-heart"></span>
		                        <span class="num">${essay.essayGoodNumber}</span>
		                      </div>
	                      </c:if>
	                      <c:if test="${!essay.isFavourited }" >
		                      <div class="like-count" onclick="userJS.changeFavourite(${essay.id},this,${essay.essayGoodNumber})">
		                        <span class="glyphicon glyphicon-heart"></span>
		                        <span class="num">${essay.essayGoodNumber}</span>
		                      </div>
	                      </c:if>	
	                      <div class="collection-count green-count" onclick="userJS.changeCollection(${essay.id},this,${essay.essayCollectNumber})">
	                          <span class="fa fa-bookmark"></span>
	                          <span class="num">${essay.essayCollectNumber}</span>
	                        </div>
	                      <!-- <div class="share-count">
	                        <span class="glyphicon glyphicon-share"></span>
	                        <span>665</span>
	                      </div> -->                      
	                    </div>       --%>                
	                  </li>
					</c:forEach>
                  </ul>
                </div><!-- search-note end -->
                <!-- 搜索专题 -->
                <!-- <div role="tabpanel" class="tab-pane" id="search-map">
                  搜索失败提示
                  <p class="searchFail">你要找的专题不存在 : )</p>
                  <ul>
                    <li class="box" id="map-001">
                      <div class="user-info">
                        <div class="user-avatar">
                          <a href="personal-page.html" target="_blank"><img src="image/user-avatar3.jpg" alt="用户头像-sm" class="avatar-sm"></a>
                          <a href="personal-page.html" target="_blank" class="user-name">嘉顿饼干</a>
                          <span> - </span>
                          <span class="user-act-time">2017.7.3 20:30:30</span>
                        </div>
                      </div>
                      <a href="user-mindmap.html" target="_blank" class="map-title-sm">python学习重点知识谱图</a>
                      <div class="map-keyword">
                        <span><span class="fa fa-tags fa-fw"></span>关键词</span>
                        <a href="topic-page.html" class="keyword" target="_blank">前端</a>
                        <a href="topic-page.html" class="keyword" target="_blank">html</a>
                        <a href="topic-page.html" class="keyword" target="_blank">css</a>
                        <a href="topic-page.html" class="keyword" target="_blank">javascript</a>
                        <span>...</span>
                      </div>
                      <div class="act-info">
                        <div class="comments-count" data-toggle="modal" data-target="#comment-modal">
                          <span class="glyphicon glyphicon-comment"></span>
                          <span>124</span>
                        </div>
                        <div class="like-count">
                          <span class="glyphicon glyphicon-heart"></span>
                          <span>543</span>
                        </div>
                        <div class="share-count">
                          <span class="fa fa-bookmark"></span>
                          <span>665</span>
                        </div>                      
                      </div>
                    </li>
                    <li class="box" id="map-002">
                      <div class="user-info">
                        <div class="user-avatar">
                          <a href="personal-page.html" target="_blank"><img src="image/user-avatar3.jpg" alt="用户头像-sm" class="avatar-sm"></a>
                          <a href="personal-page.html" target="_blank" class="user-name">嘉顿饼干</a>
                          <span> - </span>
                          <span class="user-act-time">2017.7.3 20:30:30</span>
                        </div>
                      </div>
                      <a href="user-mindmap.html" target="_blank" class="map-title-sm">前端知识谱图</a>
                      <div class="map-keyword">
                        <span><span class="fa fa-tags fa-fw"></span>关键词</span>
                        <a href="topic-page.html" class="keyword" target="_blank">前端</a>
                        <a href="topic-page.html" class="keyword" target="_blank">html</a>
                        <a href="topic-page.html" class="keyword" target="_blank">css</a>
                        <a href="topic-page.html" class="keyword" target="_blank">javascript</a>
                        <span>...</span>
                      </div>
                      <div class="act-info">
                        <div class="comments-count" data-toggle="modal" data-target="#comment-modal">
                          <span class="glyphicon glyphicon-comment"></span>
                          <span>124</span>
                        </div>
                        <div class="like-count">
                          <span class="glyphicon glyphicon-heart"></span>
                          <span>543</span>
                        </div>
                        <div class="share-count">
                          <span class="fa fa-bookmark"></span>
                          <span>665</span>
                        </div>                      
                      </div>
                    </li>                    
                  </ul>
                </div>search-map end -->
              </div>                             
            </div>
            <div class="col-md-1 _blank"></div>
          </div>              
        </div>
        <div class="col-md-2 _blank"></div>
      </div>
    </div>

    <!-- 评论窗口模态框 -->
    <div class="modal fade" id="comment-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="exampleModalLabel">评论<span>(10)</span></h4>
          </div>
          <div class="modal-body">
            <a href="personal-page.html"><img src="image/user-avatar1.jpg" alt="用户头像-sm" class="avatar-sm"></a>
            <textarea name="comment-box" id="comment-box" class="form-control" rows="4"></textarea>
            <button class="btn btn-green comment-enter">评论</button>
          </div>
          <div class="modal-footer" style="text-align:left;">
            <ul class="comment-list">
              <li id="comment-001">
                <div class="user-info">
                  <a href="personal-page.html"><img src="image/user-avatar1.jpg" alt="用户头像-sm" class="avatar-ssm"></a>
                  <a href="personal-page.html" class="user-name">飞翔的便便</a>
                  <span> - </span>
                  <span class="user-act-time">2017.7.3 20:30:30</span>
                </div>
                <p class="comment-content">
                  加油！
                </p>
                <div class="comment-info">
                  <span class="glyphicon glyphicon-thumbs-up">123</span>
                </div>
              </li>
              <li id="comment-002">
                <div class="user-info">
                  <a href="personal-page.html"><img src="image/user-avatar2.jpg" alt="用户头像-sm" class="avatar-ssm"></a>
                  <a href="personal-page.html" class="user-name">飞翔的便便</a>
                  <span> - </span>
                  <span class="user-act-time">2017.7.3 20:30:30</span>
                </div>
                <p class="comment-content">
                  加油！
                </p>
                <div class="comment-info">
                  <span class="glyphicon glyphicon-thumbs-up">123</span>
                </div>                
              </li>
              <li id="comment-003">
                <div class="user-info">
                  <a href="personal-page.html"><img src="image/user-avatar1.jpg" alt="用户头像-sm" class="avatar-ssm"></a>
                  <a href="personal-page.html" class="user-name">飞翔的便便</a>
                  <span> - </span>
                  <span class="user-act-time">2017.7.3 20:30:30</span>
                </div>
                <p class="comment-content">
                  加油！
                </p>
                <div class="comment-info">
                  <span class="glyphicon glyphicon-thumbs-up">123</span>
                </div>                
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>    

	<%@ include file="common/common-js.jsp"%>
	    <!-- counts-active.js -->
    <script src="js/counts-active.js"></script>
    <!-- commit-enter.js -->
    <script src="js/comment-enter.js"></script>
	<script src="js/user.js"></script>
	
</body>
</html>













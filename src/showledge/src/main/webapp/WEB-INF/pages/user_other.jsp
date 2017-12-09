<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common/tag.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="common/head.jsp"%>
<title>${user.userName }的个人主页 - 简随记</title>

<link href="<%=path%>/css/user.css" rel="stylesheet">
<link href="<%=path%>/css/nav.css" rel="stylesheet">

<link href="css/general-style.css" rel="stylesheet">

</head>

<body id="personal-page" class="my-personal-page">
	<%@ include file="common/nav.jsp"%>
	
	<!-- 顶部背景图 -->
    <div id="profile-top-cover">
      <!-- 用户头像 -->
      <a href="#"><img src="${user.userImagePath}" alt="用户头像-bg" class="avatar-bg"></a>
    </div>

    <!-- 顶部切换栏 -->
    <div id="profile-top-navbar">
      <ul class="nav nav-tabs" role="tablist">
        <li role="presentation" class="active"><a href="#study-act" aria-controls="act" role="tab" data-toggle="tab">学习动态<span>${user.userDynNumber }</span></a></li>
        <li role="presentation"><a href="#study-note" aria-controls="study-note" role="tab" data-toggle="tab">学习笔记<span>${user.userEssayNumber }</span></a></li>
        <li role="presentation"><a href="#study-map" aria-controls="study-map" role="tab" data-toggle="tab">知识地图<span>${user.userKMapNumber }</span></a></li>
        <li role="presentation"><a href="#study-idol" aria-controls="study-idol" role="tab" data-toggle="tab">学习榜样<span>${user.userFocusUserNumber }</span></a></li>
        <li role="presentation"><a href="#study-watcher" aria-controls="study-watcher" role="tab" data-toggle="tab">关注者<span>${user.userFocusNumber }</span></a></li>
        <%-- <li role="presentation"><a href="#collection" aria-controls="collection" role="tab" data-toggle="tab">收藏库<span>${user.userCollectTotleNumber }</span></a></li> --%>
        <!-- <li id="edit-profile-btn"><button class="btn btn-green" onclick="window.open('settings.do','_blank')"><a target="_blank">修改个人资料</a></button></li> -->
      </ul>
    </div>
    <!-- 个人主页 #personal-page -->
    <div class="container-fluid main-content">      
      <div class="row">
        <div class="col-md-1 blank"></div>
        <div class="col-md-10 main">
          <div class="row">
            <!-- 个人资料 -->
            <div class="col-md-3 user-profile">
              <a href="#" class="user-name">${user.userName}</a>              <p class="user-summary">${user.userInfo.introduction}</p>
              <div id="user-address"><span class="fa fa-map-marker fa-fw"></span>${user.userInfo.location}</div>
              <div id="user-graduation"><span class="fa fa-graduation-cap fa-fw"></span>${user.userInfo.academy}</div>
              <div id="user-join-date"><span class="fa fa-calendar fa-fw"></span>加入于 <span>${user.userFormatCreateTime}</span></div>
              <a href="/resume/${user.id }.do" id="user-resume-btn" target="_blank"><button class="btn btn-green">个人知识简历</button></a>
            </div>

            <!-- 动态、笔记、地图、关注等 -->
            <div class="col-md-6 tab-content" style="padding-left:0;padding-right:0;">
              <div role="tabpanel" class="tab-pane active" id="study-act">
                <ul>
                  <c:forEach items="${dynPage.list }" var="dyn" varStatus="statuc">
                  <li class="box" id="my-act-001">
                  	<button class="btn btn-danger delete-btn" style="float:right;" onclick="userJS.deleteDyn(${dyn.id},this)">删除</button>
                    <div class="user-info">
                      <div class="user-avatar">
                        <a href="/user.do"><img src="/${dyn.user.userImagePath }" alt="用户头像-sm" class="avatar-sm"></a>
                        <a href="/user.do" class="user-name">${dyn.user.userName }</a>
                        <span> - </span>
                        <span class="user-act-time">${dyn.formatTime }</span>
                      </div>
                      <div class="user-mood">
                        <span>心情</span>
                        <span>${dyn.mood }</span>
                      </div>
                    </div>
                    <div class="user-act">
                    	${dyn.content }
                    </div>
                    <div class="user-library">
                      <div class="xxzl">
                        <span>学习资料</span>
                        <c:forEach items="${dyn.dynDataList }" var="data" varStatus="status">
                        	<a  href="${data.url }" target="_blank">《${data.title }》</a>
                        </c:forEach>
                      </div>
                      <div class="xxbj">
                        <span>学习笔记</span>
                        <c:forEach items="${dyn.essayList }" var="essay" varStatus="status">
                        	<a href="/essay/${essay.id }.do" class="user-note-entrance" target="_blank" class="user-note-entrance">${essay.essayTitle }</a>
                        </c:forEach>
                      </div>              
                    </div>
                    <!-- <div class="act-info">
                      <div class="comments-count" data-toggle="modal" data-target="#comment-modal">
                        <span class="glyphicon glyphicon-comment"></span>
                        <span>124</span>
                      </div>
                      <div class="like-count">
                        <span class="glyphicon glyphicon-heart"></span>
                        <span>543</span>
                      </div>
                      <div class="share-count">
                        <span class="glyphicon glyphicon-share"></span>
                        <span>665</span>
                      </div>                      
                    </div> -->
                  </li>
                  </c:forEach>
                </ul>
                <c:if test="${dynPage.hasNextPage }">
                	<button class="btn btn-green load-more load-more-act">加载更多</button>               
                </c:if>
              </div>
              <div role="tabpanel" class="tab-pane" id="study-note">
                <ul>
                <c:forEach items="${essayList}" var="essay" varStatus="status">
					<li class="box" id="my-note-001">
					<%-- <button class="btn btn-danger delete-btn" style="float:right; margin-left:10px;" onclick="userJS.deleteEssay(${essay.id },this)">删除</button> --%>
                  	<%-- <button class="btn btn-info edit-note-btn" style="float:right;" onclick="window.open('updatenode.do?essayId=${essay.id}','_blank')"><a style="display:inline;color: white;text-decoration: none;">编辑笔记</a></button> --%>
                    <div class="user-info">
                      <div class="user-avatar">
                        <a href="#"><img src="${user.userImagePath}" alt="用户头像-sm" class="avatar-sm"></a>
                        <a href="#" class="user-name">${user.userName}</a>
                        <span> - </span>
                        <span class="user-act-time">${essay.subEssayTime}</span>
                      </div>
                    </div>  
                    <a href="<%=path%>/essay/${essay.id}.do" target="_blank" class="note-title-sm">${essay.essayTitle}</a>
                    <p class="note-content">
                    	${essay.essayContent}
                    </p>
                    <a href="<%=path%>/essay/${essay.id}.do" target="_blank" class="more-detail-btn">详细内容 > </a>
                    <div class="act-info">
	                  <div class="like-count green-count eye">
                        <span class="glyphicon glyphicon-eye-open"></span>
                        <span>${essay.essayReadingNumber}</span>
	                  </div>
                      <div class="comments-count green-count" data-toggle="modal" data-target="#comment-modal" onclick="userJS.getComment(${essay.id})">
                        <span class="glyphicon glyphicon-comment"></span>
                        <span>${essay.essayCommentNumber}</span>
                      </div>
                      <div class="like-count green-count">
                        <span class="glyphicon glyphicon-heart"></span>
                        <span>${essay.essayGoodNumber}</span>
                      </div>
                      <div class="collection-count green-count">
                          <span class="fa fa-bookmark"></span>
                          <span>${essay.essayCollectNumber}</span>
                        </div>
                      <!-- <div class="share-count">
                        <span class="glyphicon glyphicon-share"></span>
                        <span>665</span>
                      </div> -->                      
                    </div>                      
                  </li>
				</c:forEach>
                <%-- <c:forEach items="${essayList}" var="essay" varStatus="status">
					<li>
						<div class="content">
							<div class="author">
								<a class="avatar" href="<%=path%>/users/${user.id}/latest_articles">
									<img thumbnail="180x180" src="<%=path%>/${user.userImagePath}" alt="5">
								</a>
								<div class="name">
									<a class="blue-link" href="<%=path%>/users/${user.id}/latest_articles">${user.userName}</a>
									<span data-type="share_note"> 发表了文章 · ${essay.subEssayTime}</span>
								</div>
							</div>
							<a class="title" href="<%=path%>/essay/${essay.id}">${essay.essayTitle}</a>
							<p class="abstract">${essay.essayContent}</p>

							<div class="meta">
								<a href="<%=path%>/essay/${essay.id}">
									<i class="glyphicon glyphicon-eye-open"></i>
									${essay.essayReadingNumber}
								</a>
								<a href="<%=path%>/essay/${essay.id}">
									<i class="glyphicon glyphicon-comment"></i>
									${essay.essayCommentNumber}
								</a>
								<span>
									<i class="glyphicon glyphicon-heart"></i>
									${essay.essayGoodNumber}
								</span>
							</div>
						</div>
					</li>
				</c:forEach> --%>
                </ul>
                
                <c:if test="${essayHasMore }">
					<button class="btn btn-green load-more load-more-note">加载更多</button>                	
                </c:if>
                
              </div>
              <div role="tabpanel" class="tab-pane" id="study-map">
                <ul>
                    <c:forEach items="${kmapPage.list }" var="map" varStatus="status">
                    <li class="box" id="my-map-${status.index }">
                      <div class="user-info">
                        <div class="user-avatar">
                          <a href="#"><img src="${user.userImagePath}" alt="用户头像-sm" class="avatar-sm"></a>
                          <a href="#" class="user-name">${user.userName}</a>
                          <!-- <span> - </span> -->
                          <!-- <span class="user-act-time"></span> -->
                        </div>
                      </div>
                      <a href="/mindmap/${map.id }.do" target="_blank" class="map-title-sm">${map.kmapName }</a>
                      <div class="map-keyword"  id="mapKey" >
                        <span><span class="fa fa-tags fa-fw"></span>关键词</span>
                        <c:forEach items="${map.keyWordList }" var="key" varStatus="status">
	                        <a href="#" class="keyword" >${key.keyWord }</a>
                        </c:forEach>
                        <span>...</span>
                      </div>
                      <!-- <div class="act-info">
                        <div class="comments-count" data-toggle="modal" data-target="#comment-modal">
                          <span class="glyphicon glyphicon-comment"></span>
                          <span>124</span>
                        </div>
                        <div class="like-count">
                          <span class="glyphicon glyphicon-heart"></span>
                          <span>543</span>
                        </div>
                        <div class="collection-count">
                          <span class="fa fa-bookmark"></span>
                          <span>665</span>
                        </div>                      
                      </div> -->
                    </li>
                    </c:forEach>               
                </ul>
                <button class="btn btn-green load-more load-more-map">加载更多</button>  
              </div>
              <div role="tabpanel" class="tab-pane" id="study-idol">
                <ul>
                <!-- 我的榜样的内容 -->
                <c:forEach items="${dyPage.list }" var="user" varStatus="status">
  					<li class="box" id="idol-${status.index }">
	                    <a href="/user.do?userId=${user.id }"><img src="${user.userImagePath }" alt="用户头像-sm" class="avatar-sm"></a>
	                    <a href="/user.do?userId=${user.id }" class="user-name">${user.userName }</a>
	                    <p class="user-summary">${user.userIntroduce }</p>
	                    <a class="follow-btn not-follow" onclick="userJS.changeFocusUser(${user.id},this)">已关注</a>
	                  </li>
                </c:forEach>
                </ul>
                <c:if test="${dyPage.hasNextPage }">
	                <button class="btn btn-green load-more load-more-idol">加载更多</button>
                </c:if>
              </div>
              <div role="tabpanel" class="tab-pane" id="study-watcher">
                <ul>
                <!-- 关注我的人 -->
                <c:forEach items="${fmPage.list }" var="user" varStatus="status">
  					<li class="box" id="idol-${status.index }">
	                    <a href="/user.do?userId=${user.id }"><img src="${user.userImagePath }" alt="用户头像-sm" class="avatar-sm"></a>
	                    <a href="/user.do?userId=${user.id }" class="user-name">${user.userName }</a>
	                    <p class="user-summary">${user.userIntroduce }</p>
	                    
	                    <c:if test="${user.isFocused }">
	                    	<a class="follow-btn not-follow" onclick="userJS.changeFocusUser(${user.id},this)">已关注</a>
	                    </c:if>
	                    <c:if test="${!user.isFocused }">
	                    	<a class="follow-btn not-follow" onclick="userJS.changeFocusUser(${user.id},this)"><span class='fa fa-plus-circle'></span>关注</a>
	                    </c:if>
	                  </li>
                </c:forEach>
                </ul>
                <c:if test="${fmPage.hasNextPage }">
                	<button class="btn btn-green load-more load-more-watcher">加载更多</button>
                </c:if>
              </div>  
              <div role="tabpanel" class="tab-pane" id="collection">
                <!-- 标签切换按钮 -->
                <ul class="nav nav-tabs" role="tablist">
                  <li role="presentation" class="active"><a href="#note-collection" aria-controls="profile" role="tab" data-toggle="tab">笔记收藏</a></li>
                  <li role="presentation"><a href="#map-collection" aria-controls="messages" role="tab" data-toggle="tab">地图收藏</a></li>
                </ul>
                <!-- 笔记收藏、地图收藏内容 -->
                <div class="tab-content">
                  <div role="tabpanel" class="tab-pane active" id="note-collection">
                    <ul>
                      <c:forEach items="${cePage.list}" var="essay" varStatus="status">
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
	                    <div class="act-info">
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
	                    </div>                      
	                  </li>
					</c:forEach>               
                    </ul>
                    <c:if test="${cePage.hasNextPage }">
                    	<button class="btn btn-green load-more load-more-collection">加载更多</button>
                    </c:if>
                  </div>
                  <div role="tabpanel" class="tab-pane" id="map-collection">
                    <ul>
                      <li class="box" id="collection-map-001">
                        <button class="btn collection-btn btn-success btn-danger">取消收藏</button>
                        <div class="user-info">
                          <div class="user-avatar">
                            <a href="personal-page.html"><img src="image/user-avatar3.jpg" alt="用户头像-sm" class="avatar-sm"></a>
                            <a href="personal-page.html" class="user-name">嘉顿饼干</a>
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
                    <button class="btn btn-green load-more load-more-collection">加载更多</button>            
                  </div>
                </div>
              </div>
                                       
            </div>

            <div class="col-md-3" id="right-reco">
              <div class="box reco-xb">
                <span>推荐关注</span>
                <ul class="xb-list">
                <c:forEach items="${userRecPage.list }" var="user" varStatus="status">
                  <li>
                    <a href="user.do?userId=${user.id }" target="_blank"><img src="${user.userImagePath }" alt="用户头像-sm" class="avatar-ssm"></a>
                    <a class="follow-btn not-follow" onclick="userJS.changeFocusUser(${user.id},this)"><span class='fa fa-plus-circle'></span>关注</a>
                    <a href="user.do?userId=${user.id }"  target="_blank" class="reco-user-name">${user.userName }</a>
                    <p>${user.userFocusNumber }粉丝</p>
                  </li>
                  </c:forEach>
                </ul>
                <c:if test="${userRecPage.hasNextPage }">
                	<button class="btn btn-default more-recommend-writer"><a href="#" target="_blank" style="text-decoration:none;">更多推荐 </a> </button> 
                </c:if>
              </div>
              <!-- 页脚 -->
              <div class="box page-footer">
                Copyright © 2017, showledge.cn
              </div>
            </div><!-- 右边推荐栏end -->
          </div>
        </div>
        <div class="col-md-1 blank"></div>
      </div>
    </div>

    <!-- 评论窗口模态框 -->
    <div class="modal fade" id="comment-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="exampleModalLabel">评论<span>(<span id="ccount">10</span>)</span></h4>
          </div>
          <div class="modal-body">
            <a href="<%=path%>/user.do"><img src="<%=path%>/${user.userImagePath}" alt="用户头像-sm" class="avatar-sm"></a>
            <textarea name="comment-box" id="comment-box" class="form-control" rows="4"></textarea>
            <input type="hidden" id="essayId">
            <button class="btn btn-green comment-enter" id="subComment" onclick="userJS.addComment()">评论</button>
          </div>
          <div class="modal-footer" style="text-align:left;">
            <ul class="comment-list" id="comList">
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
	<!-- 警告框js -->
    <script src="js/alert.js"></script>
    <!-- 页面右边推荐栏的关注按钮切换js -->
    <script src="js/reco-follow-btn-toggle.js"></script>
    <!-- counts-active.js -->
    <script src="js/counts-active.js"></script>
    <!-- personal-page.html -->
    
    <script src="js/personal-page.js"></script>
    <!-- commit-enter.js -->
    <script src="js/comment-enter.js"></script>    
    <script src="js/user.js"></script>    
    
    <script>
      $(function () { $("[data-toggle='tooltip']").tooltip(); });
    </script>
	
</body>
</html>















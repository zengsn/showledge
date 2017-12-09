<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common/tag.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="common/head.jsp"%>
<title>首页 - 秀知识</title>

<link href="<%=path%>/css/nav.css" rel="stylesheet">

<%-- <link href="<%=path%>/css/nav.css" rel="stylesheet">
<link href="<%=path%>/css/index.css" rel="stylesheet">
 --%>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->
	
	
</head>

<body id="index-page">
	<%@ include file="common/nav.jsp"%>
	
	<!--主要内容部分-->
	<div class="container-fluid main-content">
      <div class="row">
        <div class="col-md-1 blank"></div>
        <div class="col-md-10 main">
          <div class="row">
            <!-- 左边功能按钮栏 -->
            <div class="col-md-3" id="left-sidebar">
              <div class="box">
                <ul id="nav-cat" role="tablist">
                	<%-- <c:forEach items="${essaytype}" var="corpus" varStatus="status" begin="0">
                	<c:if test="${status.index == 0 }">
                		<li role="presentation" class="active"><a href="#category${corpus.id }" target="_blank" style="text-decoration:none;" aria-controls="home" role="tab" data-toggle="tab"><button class="btn cat btn-green">${corpus.name }</button></a></li>
                	</c:if>
                	<c:if test="${status.index != 0 }">
                  		<li role="presentation"><a href="#category${corpus.id }" target="_blank" style="text-decoration:none;" aria-controls="profile" role="tab" data-toggle="tab"><button class="btn cat btn-green">${corpus.name }</button></a></li>
                    </c:if>
                  </c:forEach> --%>
                  <li role="presentation"  class="active"><a href="#category1" target="_blank" style="text-decoration:none;" aria-controls="profile" role="tab" data-toggle="tab"><button class="btn cat btn-green">热门动态</button></a></li>
                  <li role="presentation"><a href="#category2" target="_blank" style="text-decoration:none;" aria-controls="profile" role="tab" data-toggle="tab"><button class="btn cat btn-green">热门笔记</button></a></li>
                  <li role="presentation"><a href="#category3" target="_blank" style="text-decoration:none;" aria-controls="profile" role="tab" data-toggle="tab"><button class="btn cat btn-green">热门地图</button></a></li>
                </ul>
              </div>
            </div><!-- 左边功能按钮end -->

            <!-- 中间主要内容栏 -->
            <div class="col-md-6" id="middle-main">
              <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="category1">
                  <!-- 标签页头 -->
      <!--             <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"><a href="#hot-act1" aria-controls="home" role="tab" data-toggle="tab">热门动态</a></li>
                    <li role="presentation"><a href="#hot-note1" aria-controls="profile" role="tab" data-toggle="tab">热门笔记</a></li>
                    <li role="presentation"><a href="#hot-map1" aria-controls="messages" role="tab" data-toggle="tab">热门地图</a></li>
                  </ul> -->
                  <!-- 热门推荐 标签内容 -->
                  <div class="tab-content" id="hot-intro">
                    <div role="tabpanel" class="tab-pane active" id="hot-act1">
                      <ul>
                      <!-- 热门动态 -->
                        <c:forEach items="${dynPage.list }" var="dyn" varStatus="statuc">
                  <li class="box" id="my-act-001">
                  	<%-- <button class="btn btn-danger delete-btn" style="float:right;" onclick="userJS.deleteDyn(${dyn.id},this)">删除</button> --%>
                    <div class="user-info">
                      <div class="user-avatar">
                        <a href="/user.do?userId=${dyn.user.id }" target="_blank"><img src="/${dyn.user.userImagePath }" alt="用户头像-sm" class="avatar-sm"></a>
                        <a href="/user.do?userId=${dyn.user.id }" class="user-name" target="_blank">${dyn.user.userName }</a>
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
                  </div>                  
                </div>

                <div role="tabpanel" class="tab-pane" id="category2">
                  <!-- 标签页头 -->
                  <ul class="nav nav-tabs" role="tablist">
                  <c:forEach items="${essaytype}" var="corpus" varStatus="status" begin="0" end="4">
                	<c:if test="${status.index == 0 }">
                	    <li role="presentation" class="active"><a href="#cat${corpus.id }" aria-controls="home" role="tab" data-toggle="tab">${corpus.name }</a></li>
                	</c:if>
                	<c:if test="${status.index != 0 }">
                		<li role="presentation"><a href="#cat${corpus.id }" aria-controls="profile" role="tab" data-toggle="tab">${corpus.name }</a></li>
                    </c:if>
                  </c:forEach>
                   <li role="presentation" class="dropdown">
                      <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                        更多分类 <span class="caret"></span>
                      </a>
                      <ul class="dropdown-menu">
	                  <c:forEach items="${essaytype}" var="corpus" varStatus="status" begin="5" >
	                		<li role="presentation"><a href="#cat${corpus.id }" aria-controls="profile" role="tab" data-toggle="tab">${corpus.name }</a></li>
	                  </c:forEach>
                         </ul>
                       <li> 
                  </ul>
                  <!-- 热门笔记 -->
                  <div class="tab-content" id="hot-intro">
                  <c:forEach items="${noteList}" var="data" varStatus="status" >
                  	<c:if test="${status.index==0 }">
                  		<div role="tabpanel" class="tab-pane active" id="cat${data.t.id }">
                  	</c:if>
                    <c:if test="${status.index!=0 }">
                  		<div role="tabpanel" class="tab-pane" id="cat${data.t.id }">
                  	</c:if>
                      <ul>
                      <c:forEach items="${data.e.list}" var="note" varStatus="status" >
                        <li class="box" id="hot-note-${status.index }">
                          <div class="user-info">
                            <div class="user-avatar">
                              <a href="/user.do?userId=${note.userId }" target="_blank"><img src="/${note.userImagePath }" alt="用户头像-sm" class="avatar-sm"></a>
                              <a href="/user.do?userId=${note.userId }" class="user-name" target="_blank">${note.userName }</a>
                              <span> - </span>
                              <span class="user-act-time">${note.subEssayTime }</span>
                            </div>
                          </div>  
                          <a href="/essay/${note.id }.do" target="_blank" class="note-title-sm">${note.essayTitle }</a>
                          <p class="note-content">
                          	${note.essayContent }
                          </p>
                          <a href="/essay/${note.id }.do" target="_blank" class="more-detail-btn">详细内容 > </a>
                          <div class="act-info">
		                  <div class="like-count green-count eye">
	                        <span class="glyphicon glyphicon-eye-open"></span>
	                        <span>${note.essayReadingNumber}</span>
		                  </div>
	                      <div class="comments-count green-count" data-toggle="modal" data-target="#comment-modal" onclick="userJS.getComment(${note.id})">
	                        <span class="glyphicon glyphicon-comment"></span>
	                        <span>${note.essayCommentNumber}</span>
	                      </div>
	                      <c:if test="${note.isFavourited }">
		                      <div class="like-count green-count" onclick="userJS.changeFavourite(${note.id},this,${note.essayGoodNumber})">
		                        <span class="glyphicon glyphicon-heart"></span>
		                        <span class="num">${note.essayGoodNumber}</span>
		                      </div>
	                      </c:if>
	                      <c:if test="${!note.isFavourited }" >
		                      <div class="like-count" onclick="userJS.changeFavourite(${note.id},this,${note.essayGoodNumber})">
		                        <span class="glyphicon glyphicon-heart"></span>
		                        <span class="num">${note.essayGoodNumber}</span>
		                      </div>
	                      </c:if>
	                  	  <c:if test="${note.isCollected }" >
	                      	<div class="collection-count green-count" onclick="userJS.changeCollection(${note.id},this,${note.essayCollectNumber})">
	                          <span class="fa fa-bookmark"></span>
	                          <span class="num">${note.essayCollectNumber}</span>
	                        </div>
	                      </c:if>
	                      <c:if test="${!note.isCollected }" >
	                      	<div class="collection-count" onclick="userJS.changeCollection(${note.id},this,${note.essayCollectNumber})">
	                          <span class="fa fa-bookmark"></span>
	                          <span class="num">${note.essayCollectNumber}</span>
	                        </div>
	                      </c:if>
	                      <!-- <div class="share-count">
	                        <span class="glyphicon glyphicon-share"></span>
	                        <span>665</span>
	                      </div> -->                      
	                    </div>     
                        </li>
                        </c:forEach>
                      </ul>
                      <c:if test="${data.e.hasNextPage }">
                      	 	<button class="btn btn-green load-more load-more-note">加载更多</button>
                      </c:if>
                    </div>
                    </c:forEach>
                  </div>                  
                </div>

                <div role="tabpanel" class="tab-pane" id="category3">
                  <!-- 标签页头 -->
                  <!-- <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"><a href="#hot-act3" aria-controls="home" role="tab" data-toggle="tab">热门动态</a></li>
                    <li role="presentation"><a href="#hot-note3" aria-controls="profile" role="tab" data-toggle="tab">热门笔记</a></li>
                    <li role="presentation"><a href="#hot-map3" aria-controls="messages" role="tab" data-toggle="tab">热门地图</a></li>
                  </ul> -->
                  <!-- 热门推荐 标签内容 -->
                  <div class="tab-content" id="hot-intro">
                    <div role="tabpanel" class="tab-pane active" id="hot-act3">
                      <ul>
                        <c:forEach items="${kMapPage.list }" var="map" varStatus="status">
	                    <li class="box" id="my-map-${status.index }">
	                      <div class="user-info">
	                        <div class="user-avatar">
	                          <a href="#"><img src="${map.user.userImagePath}" alt="用户头像-sm" class="avatar-sm"></a>
	                          <a href="#" class="user-name">${map.user.userName}</a>
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
                      <c:if test="${kMapPage.hasNextPage }">
                      	<button class="btn btn-green load-more load-more-map">加载更多</button>
                      </c:if>
                    </div>
                  </div>                  
                </div>

              </div>              
            </div><!-- 中间主要内容栏end -->

            <!-- 右边推荐栏 -->
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
	<script src="<%=path%>/js/index.js" type="text/javascript"></script>
	    <!-- counts-active.js -->
    <script src="js/counts-active.js"></script>
    <!-- commit-enter.js -->
    <script src="js/comment-enter.js"></script>
    <script src="js/user.js"></script>
    
    
    
</body>
</html>













<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common/tag.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="common/head.jsp"%>
<title>榜样动态 - 秀知识</title>

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
	
	<!-- 已登录 - 首页内容 -->
    <div class="container-fluid main-content">
      <div class="row">
        <div class="col-md-1 blank"></div>
        <div class="col-md-10 main">
          <div class="row">
            <!-- 左边用户资料卡+功能按钮栏 -->
            <div class="col-md-3" id="left-sidebar">
              <!-- 用户资料卡 -->
              <div class="box user-dashboard">
                <a href="personal-page.html" class="user-dashboard-bg" target="_blank"></a>
                <div class="user-dashboard-profile-card">
                  <a href="/user.do" class="profile-card-avartar" target="_blank"><img src="${user.userImagePath }" class="avatar-md" alt="用户头像-md"></a>
                  <a href="/user.do" class="profile-card-account" target="_blank">嘉顿饼干</a>
                  <ul class="profile-card-state">
                    <li class="count-act">
                      <a href="personal-page.html" target="_blank">
                        <span>学习动态</span>
                        <span>${user.userDynNumber }</span>
                      </a>
                    </li>
                    <li class="count-watch-others">
                      <a href="personal-page.html" target="_blank">
                        <span>关注榜样</span>
                        <span>${user.userFocusUserNumber }</span>
                      </a>                      
                    </li>
                    <li class="count-watched">
                      <a href="personal-page.html" target="_blank">
                        <span>关注者</span>
                        <span>${user.userFocusNumber }</span>
                      </a>                      
                    </li>
                  </ul>
                </div>
              </div>
              <!-- 功能按钮栏 -->
              <!-- <div class="box function-btn-list">
                <ul>
                  <li>
                    <a href="edit-note-page.html" target="_blank"><img src="icon/function-btn-1.png" alt="功能按钮icon"><span>学习笔记</span></a>
                  </li>
                  <li>
                    <a href="edit-mindmap.html" target="_blank"><img src="icon/function-btn-2.png" alt="功能按钮icon"><span>知识地图</span></a>
                  </li>
                  <li>
                    <a href="personal-page.html" target="_blank"><img src="icon/function-btn-3.png" alt="功能按钮icon"><span>我的收藏</span></a>
                  </li>
                  <li>
                    <a href="resume-page.html" target="_blank"><img src="icon/function-btn-4.png" alt="功能按钮icon"><span>我的简历</span></a>
                  </li>
                </ul>
              </div> -->
              <!-- 分类栏 
              <div class="box">
                <button class="btn cat btn-green">全部</button>
                <button class="btn cat btn-green">前端</button>
                <button class="btn cat btn-green">后端</button>
                <button class="btn cat btn-green">java</button>
                <button class="btn cat btn-green">html</button>
              </div>-->
            </div><!-- 左边功能按钮end -->

            <!-- 中间主要内容栏 -->
            <div class="col-md-6" id="middle-main">
              <!-- 学习动态编辑框 -->
              <div class="box send-act-box">
                <a href="/user.do" target="_blank"><img src="${user.userImagePath }" alt="用户头像-ssm" class="avatar-ssm"></a>
                <form>
                  <textarea name="input-act" id="input-act" class="form-control" rows="4" placeholder="把今天学到的东西写下来吧~"></textarea>
                </form>
                <ul class="input-emotion-library-list">
                  <li>
                    <a id="input-emotion" data-toggle="tooltip" data-placement="right" title="心情"><span class="fa fa-heart fa-lg fa-fw"></span></a>
                  </li>
                  <li>
                    <a id="input-xxzl" data-toggle="tooltip" data-placement="right" title="学习资料"><span class="fa fa-external-link fa-lg fa-fw"></span></a>
                  </li>
                  <li>
                    <a id="input-xxbj" data-toggle="tooltip" data-placement="right" title="学习笔记"><span class="fa fa-book fa-lg fa-fw"></span></a>
                  </li>
                </ul>
                <div class="input-emotion-form">
                  <label for="emotion-form">心情</label>
                  <input type="text" class="form-control-green-border" id="emotion-form">
                </div>
                <div class="input-xxzl-form">
                  <label for="xxzl">学习资料</label>
                  <input type="text" class="form-control-green-border" placeholder="http://"><span class="fa fa-external-link"></span>
                  <input type="text" class="form-control-green-border" placeholder="资料标题">
                  <button class="btn btn-sm btn-green" id="add-xxzl">添加</button>
                </div>
                <div class="input-xxbj-form">
                  <label for="xxbj-form" id="xxbj-form">学习笔记</label>
                  <div class="picked-note">
                    <!-- 选择出笔记的位置 -->
                  </div>
                  <button class="btn btn-sm btn-green" data-toggle="modal" data-target="#pick-note-modal">从我的笔记中选择</button>
                </div>
                <button class="btn btn-green" id="send-act-btn">发布动态</button>
              </div>
              <!-- 标签页头 -->
              <ul class="nav nav-tabs" role="tablist">
                <li role="presentation" class="active"><a href="#by-act" aria-controls="home" role="tab" data-toggle="tab">榜样动态</a></li>
                <li role="presentation"><a href="#by-note" aria-controls="profile" role="tab" data-toggle="tab">榜样笔记</a></li>
                <li role="presentation"><a href="#by-map" aria-controls="messages" role="tab" data-toggle="tab">榜样地图</a></li>
              </ul>

              <!-- 热门推荐 标签内容 -->
              <div class="tab-content" id="by-intro">
                <div role="tabpanel" class="tab-pane active" id="by-act">
                  <ul>
                  <!-- 榜样的动态 -->
                    <c:forEach items="${dynList }" var="dyn" varStatus="statuc">
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
                  <!-- <button class="btn btn-green load-more load-more-act">加载更多</button> -->               
                </div>
                <div role="tabpanel" class="tab-pane" id="by-note">
                  <ul>
                   <!-- 榜样的笔记 -->
                   <c:forEach items="${notePage.list}" var="essay" varStatus="status">
						<li class="box" id="my-note-001">
	                    <div class="user-info">
	                      <div class="user-avatar">
	                        <a href="/user.do?userId=${essay.userId }" target="_blank"><img src="${essay.userImagePath}" alt="用户头像-sm" class="avatar-sm"></a>
	                        <a href="/user.do?userId=${essay.userId }" target="_blank" class="user-name">${essay.userName}</a>
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
	                      <c:if test="${essay.isCollected }" >
	                      	<div class="collection-count green-count" onclick="userJS.changeCollection(${essay.id},this,${essay.essayCollectNumber})">
	                          <span class="fa fa-bookmark"></span>
	                          <span class="num">${essay.essayCollectNumber}</span>
	                        </div>
	                      </c:if>
	                      <c:if test="${!essay.isCollected }" >
	                      	<div class="collection-count" onclick="userJS.changeCollection(${essay.id},this,${essay.essayCollectNumber})">
	                          <span class="fa fa-bookmark"></span>
	                          <span class="num">${essay.essayCollectNumber}</span>
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
                  <c:if test="${notePage.hasNextPage }">
                  	<button class="btn btn-green load-more load-more-note">加载更多</button>
                  </c:if>
                </div>
                <div role="tabpanel" class="tab-pane" id="by-map">
                  <ul>
                  	<!-- 榜样的地图 -->
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
	
    
    <!-- 笔记选择窗口模态框 -->
    <div class="modal fade" id="pick-note-modal" tabindex="-1" role="dialog">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">我的学习笔记</h4>
          </div>
          <div class="modal-body">
            <ul>
            <c:forEach varStatus="status" var="essay" items="${essayList}">
              <li id="pick-note-${status.index }">
                <a href="/essay/${essay.id }.do" target="_blank" value="${essay.id }">${essay.essayTitle }</a>
                <button class="btn btn-warning btn-info btn-sm pick-btn">选择</button>
              </li>
             </c:forEach>
            </ul>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-green enter-pick" data-dismiss="modal">选好了</button>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->    
	

	<%@ include file="common/common-js.jsp"%>
	    <script src="js/alert.js"></script>
    <!-- index-login.js -->
    <script src="js/index-login.js"></script>
    <!-- 页面右边推荐栏的关注按钮切换js -->
    <script src="js/reco-follow-btn-toggle.js"></script>
    <!-- counts-active.js -->
    <script src="js/counts-active.js"></script>
    <!-- commit-enter.js -->
    <script src="js/comment-enter.js"></script>    
    <script src="js/user.js"></script>
    
    <script>
      $(function () { $("[data-toggle='tooltip']").tooltip(); });
    </script>
	
</body>
</html>













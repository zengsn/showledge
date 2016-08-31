<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  	<%
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
    <!DOCTYPE html>
    <html>
      <head>
        <meta content="IE=11.0000" http-equiv="X-Ua-Compatible">
        <meta charset="utf-8">
        <meta http-equiv="X-Ua-Compatible" content="iE=Edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0,user-scalable=no">
        <title>首页 - 简随记</title>
        <link href="css/css_1.css" rel="stylesheet" media="all">
        <link href="css/css_2.css" rel="stylesheet" media="all">
        <link href="css/css_3.css" rel="stylesheet" media="all">
        <link href="images/favicon.ico" rel="icon">
        <script src="js/js_1.js"></script>
        <script src="js/vue.js"></script>
        <script src="js/my-vue.js"></script>
        <script src="js/index.js"></script>
      </head>
      
      <body class="output fluid zh cn win reader-day-mode reader-font2" data-locale="zh-CN" data-js-module="recommendation" id="my-vueJS" v-cloak>
        <c:if test="${userNameInSession == null}">
          <my-nologin-top-sidebar login-path="<%=path%>/login" register-path="<%=path%>/register"></my-nologin-top-sidebar>
          <my-nologin-sidebar index-path="<%=path%>/index" login-path="<%=path%>/login"></my-nologin-sidebar>
        </c:if>
        <c:if test="${userNameInSession != null}">
          <my-login-top-sidebar img-src="<%=path%>/${userImagePathInSession}" writer-path="<%=path%>/writer" user-path="<%=path%>/user" favourite-path="<%=path%>/favourite" collect-path="<%=path%>/collect" setting-path="<%=path%>/setting"></my-login-top-sidebar>
          <my-login-sidebar index-path="<%=path%>/index" writer-path="<%=path%>/writer" user-path="<%=path%>/user" collect-path="<%=path%>/collect" setting-path="<%=path%>/setting"></my-login-sidebar>
        </c:if>
        <div class="row-fluid">
          <div class="timeline">
            <div class="span3 left-aside">
              <div class="cover-img" style="background-image: url(http://upload.jianshu.io/daily_images/images/KE3AwKqJ1oeCdxSW5SNT.jpg)"></div>
              <div class="bottom-block">
                <h1>简友圈</h1>
                <h3>以文会友</h3>
                <a class="btn btn-large btn-success" href="writer">提笔写篇文章</a></div>
              <div class="img-info">
                <i class="fa fa-info"></i>
                <div class="info">Photo by
                  <a target="_blank" href="">linlis</a></div>
              </div>
            </div>
            <div class="offset3 span7 timeline-list">
              <div class="page-title">
                <ul class="timeline-nav navigation clearfix" data-js-module="timeline-navbar">
                  <li class="">
                    <a data-pjax="timeline-container" href="">简友圈</a></li>
                  <li class="active">
                    <a data-pjax="timeline-container" href="collect">我的收藏</a></li>
                  <li class="search">
                    <form class="search-form" action="searchInIndex.do" method="post" target="_blank" accept-charset="UTF-8">
                      <input id="searchKeyword" name="searchKeyword" class="input-medium search-query" type="search" placeholder="搜索" value="">
                      <span class="search_trigger" onclick="searchEssay()">
                        <I class="fa fa-search"></I>
                      </span>
                    </form>
                  </li>
                </ul>
              </div>
              <div id="timeline-container">
                <ul id="bookmarks" class="article-list" data-js-module="timeline-bookmarks">
                  <c:forEach items="${essayList}" var="essay">
                    <li class="have-img">
                      <a class="wrap-img" href="essay/${essay.id}">
                        <img src="images/index/1480410-dc9d2be35d880969.png" alt="300"></a>
                      <div>
                        <p class="list-top">
                          <a class="author-name blue-link" target="_blank" href="users/${essay.userName}">${essay.userName}</a>
                          <em>·</em></p>
                        <h4 class="title">
                          <a target="_blank" href="essay/${essay.id}">${essay.essayTitle}</a></h4>
                        <div class="list-footer">
                          <span>阅读 ${essay.essayReadingNumber}</span>
                          <span>· 评论 ${essay.essayReadingNumber}</span>
                          <span>· 喜欢 ${essay.essayGoodNumber}</span></div>
                      </div>
                    </li>
                  </c:forEach>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </body>
    </html>
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
        <title>我喜欢的 | 简随记 - 简随记</title>
        <link href="css/css_1.css" rel="stylesheet" media="all">
        <link href="css/css_2.css" rel="stylesheet" media="all">
        <link href="css/css_3.css" rel="stylesheet" media="all">
        <link href="images/favicon.ico" rel="icon">
        <script src="js/js_1.js"></script>
        <script src="js/vue.js"></script>
        <script src="js/my-vue.js"></script>
      </head>
      
      <body class="output no-fluid zh cn win reader-day-mode reader-font2" data-locale="zh-CN" data-js-module="recommendation" id="my-vueJS" v-cloak>
        <c:if test="${userNameInSession == null}">
          <my-nologin-top-sidebar login-path="<%=path%>/login" register-path="<%=path%>/register"></my-nologin-top-sidebar>
          <my-nologin-sidebar index-path="<%=path%>/index" login-path="<%=path%>/login"></my-nologin-sidebar>
        </c:if>
        <c:if test="${userNameInSession != null}">
          <my-login-top-sidebar img-src="<%=path%>/${userImagePathInSession}" writer-path="<%=path%>/writer" user-path="<%=path%>/user" favourite-path="<%=path%>/favourite" collect-path="<%=path%>/collect" setting-path="<%=path%>/setting" logout-path="<%=path%>/logout.do"></my-login-top-sidebar>
          <my-login-sidebar index-path="<%=path%>/index" writer-path="<%=path%>/writer" user-path="<%=path%>/user" collect-path="<%=path%>/collect" setting-path="<%=path%>/setting" logout-path="<%=path%>/logout.do"></my-login-sidebar>
        </c:if>
        <div class="container">
          <div class="favorite">
            <div class="recommended">
              <h2 class="page-title">我喜欢的文章</h2>
              <ul class="like-article article-list" data-js-module="user-favourites">
                <c:forEach items="${essayList}" var="essay">
                  <li class="have-img">
                    <a class="wrap-img" href="essay/${essay.id}">
                      <img src="images/index/1480410-dc9d2be35d880969.png" alt="300"></a>
                    <div>
                      <p class="list-top">
                        <a class="author-name blue-link" target="_blank" href="users/${essay.userName}">${essay.userName}</a>
                        <em>·</em>
                        <span class="time">${essay.subEssayTime}</span></p>
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
      </body>
    </html>
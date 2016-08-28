<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html>
      <head>
        <meta http-equiv="Content-Type" content="text/html;
        charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
        <meta name="viewport" content="width=device-width,
        initial-scale=1.0,user-scalable=no">
        <meta http-equiv="Cache-Control" content="no-siteapp">
        <title>${user.userName}-简随记</title>
        <link href="css/css_1.css" rel="stylesheet" media="all">
        <link href="css/css_2.css" rel="stylesheet" media="all">
        <link href="css/css_3.css" rel="stylesheet" media="all">
        <link href="images/favicon.ico" rel="icon">
        <script src="js/js_1.js"></script>
        <script src="js/vue.js"></script>
        <script src="js/my-vue.js"></script>
        <script src="js/search.js"></script>
        <script src="js/user.js"></script>
      </head>
      
      <body class="user output zh cn win reader-day-mode reader-font2 " data-js-module="user-show" data-locale="zh-CN" id="my-vueJS">
        <my-login-top-sidebar img-src="${userImagePathInSession}"></my-login-top-sidebar>
        <my-login-sidebar></my-login-sidebar>
        <div class="row-fluid">
          <div class="user-aside span3">
            <div class="people">
              <div class="basic-info">
                <div class="avatar">
                  <img src="${user.userImagePath}" alt="100"></div>
                <h3>
                  <a id="user_name" href="users.html?userName=${user.userName}">${user.userName}</a></h3>
                <div class="about">
                  <p id="user_introduce" class="intro">${user.userIntroduce}</p>
                  <a id="user_introduce_click" class="edit-intro blue-link" href="javascript:void(0)" onclick="showUserForm();">编辑个人介绍</a>
                  <form id="user_form" class="intro-form" data-type="json" action="" accept-charset="UTF-8" method="post">
                    <input id="userName" name="userName" placeholder="" type="text" value="${user.userName}">
                    <p id="error_message" class="form-error-message hide"></p>
                    <textarea id="userIntroduce" name="userIntroduce">${user.userIntroduce}</textarea>
                    <input id="user_form_button" type="button" value="保存" class="btn btn-info">
                    <a class="btn cancel" href="javascript:void(0)" onclick="hideUserForm();">取消</a></form>
                </div>
                <div class="sns"></div>
              </div>
              <div class="user-stats">
                <ul class="clearfix">
                  <li>
                    <a href="">
                      <b>0</b>
                      <span>关注</span></a>
                  </li>
                  <li>
                    <a href="">
                      <b>0</b>
                      <span>粉丝</span></a>
                  </li>
                  <br>
                  <li>
                    <a href="">
                      <b>${essayList.size()}</b>
                      <span>文章</span></a>
                  </li>
                  <li>
                    <a>
                      <b>0</b>
                      <span>字数</span></a>
                  </li>
                  <li>
                    <a>
                      <b>0</b>
                      <span>收获喜欢</span></a>
                  </li>
                </ul>
              </div>
            </div>
            <div class="my-books">
              <h5 class="title">我的文集：</h5>
              <ul class="unstyled">
                <c:forEach items="${corpusList}" var="corpus">
                  <li>
                    <a class="fa fa-book" href="corpus.html?corpusId=${corpus.id}">${corpus.corpusName}</a></li>
                </c:forEach>
              </ul>
            </div>
          </div>
          <!-- content -->
          <div class="span9 offset3 recent-post">
            <!-- navigation -->
            <ul class="nav nav-tabs nav-articles">
              <li class="active">
                <a data-pjax="list-container" href="">
                  <i class="fa fa-file-text-o"></i>最新文章</a>
              </li>
              <li class="">
                <a data-pjax="list-container" href="">
                  <i class="fa fa-users"></i>最新动态</a>
              </li>
              <li class="">
                <a data-pjax="list-container" href="">
                  <i class="fa fa-signal"></i>热门文章</a>
              </li>
            </ul>
            <div class="tab-content">
              <div id="list-container" class="tab-pane active">
                <ul class="article-list latest-notes">
                  <c:forEach items="${essayList}" var="essay">
                    <li>
                      <div>
                        <p class="list-top">
                          <a class="author-name blue-link" target="_blank" href="">${essay.userName}</a>
                          <em>·</em>
                          <span class="time">${essay.subEssayTime}</span></p>
                        <h4 class="title">
                          <a target="_blank" href="essay.html?id=${essay.id}">${essay.essayTitle}</a></h4>
                        <div class="list-footer">
                          <span>阅读 ${essay.essayReadingNumber}</span>
                          <span>· 评论 ${essay.essayCommentNumber}</span>
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
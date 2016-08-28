<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html>
      <head>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
        <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
        <meta http-equiv="Cache-Control" content="no-siteapp">
        <title>${corpus.userName} - 文集   - 简随记</title>
        <link href="css/css_1.css" rel="stylesheet" media="all">
        <link href="css/css_2.css" rel="stylesheet" media="all">
        <link href="css/css_3.css" rel="stylesheet" media="all">
        <link href="images/favicon.ico" rel="icon">
        <script src="js/js_1.js"></script>
        <script src="js/vue.js"></script>
        <script src="js/my-vue.js"></script>
      </head>
      
      <body class="book output fluid zh cn win reader-day-mode reader-font2 " data-js-module="notebook-show" data-locale="zh-CN" id="my-vueJS">
        <my-login-top-sidebar img-src="${userImagePathInSession}"></my-login-top-sidebar>
        <my-login-sidebar></my-login-sidebar>
        <div class="fixed-btn">
          <a class="go-top hide-go-top" href="http://www.jianshu.com/notebooks/3138434/latest#">
            <i class="fa fa-angle-up"></i>
          </a>
          <a class="qrcode" data-target="#bottom-qrcode" data-toggle="modal" href="javascript:void(0)">
            <i class="fa fa-qrcode"></i>
          </a>
          <a class="writer" href="writer.html" data-toggle="tooltip" data-placement="left" title="" data-original-title="写篇文章">
            <i class="fa fa-pencil"></i>
          </a>
        </div>
        <div class="row-fluid">
          <div class="notebook-list new-view">
            <div class="aside span3">
              <h3 class="title">
                <a href="corpus.html?corpusId=${corpus.id}">${corpus.userName}</a></h3>
              <ul class="meta">
                <a href="">${essayList.size()} 篇文章</a>・
                <a href="">0 人关注</a>・
                <span class="wordage">字数: 0</span></ul>
              <div class="btn-group" id="subscribe_share_notebook_3138434">
                <div class="btn btn-small btn-success follow" id="subscribe_notebook_3138434">
                  <a data-type="json" data-remote="true" rel="nofollow" data-method="post" href="">
                    <i class="fa fa-plus"></i>
                    <span>添加关注</span></a>
                </div>
                <a class="btn btn-small btn-success notebook-share" data-toggle="dropdown" href="javascript:void(0)">
                  <i class="fa fa-share-square-o"></i>
                </a>
                <ul class="dropdown-menu arrow-top">
                  <li>
                    <a href="" src="./生活随想录 - 文集 - 简书_files/weibo.png" alt="Weibo"></a>
                  </li>
                  <li>
                    <a href="" src="./生活随想录 - 文集 - 简书_files/tweibo.png" alt="Tweibo"></a>
                  </li>
                  <li>
                    <a href="" src="./生活随想录 - 文集 - 简书_files/qzone.png" alt="Qzone"></a>
                  </li>
                  <li>
                    <a href="" src="./生活随想录 - 文集 - 简书_files/douban.png" alt="Douban"></a>
                  </li>
                  <li>
                    <a href="" src="./生活随想录 - 文集 - 简书_files/twitter.png" alt="Twitter"></a>
                  </li>
                  <li>
                    <a href="" src="./生活随想录 - 文集 - 简书_files/facebook.png" alt="Facebook"></a>
                  </li>
                  <li>
                    <a href="" src="./生活随想录 - 文集 - 简书_files/google_plus.png" alt="Google plus"></a>
                  </li>
                  <li>
                    <a href="">
                      <img src="./生活随想录 - 文集 - 简书_files/renren.png" alt="Renren"></a>
                  </li>
                </ul>
              </div>
              <div class="author">
                <div class="avatar">
                  <a href="users.html?userName=${corpus.userName}">
                    <img src="${userImagePath}" alt="100"></a>
                </div>
                <a href="users.html?userName=${corpus.userName}">${corpus.userName}</a>著</div></div>
            <!-- content -->
            <div class="tab-content offset3 span9 ">
              <div class="toolbar">
                <ul class="nav nav-tabs nav-notebooks">
                  <li class="latest-articles active">
                    <a data-pjax="list-container" href="">目录</a></li>
                  <li class="top-articles ">
                    <a data-pjax="list-container" href="">热门文章</a></li>
                </ul>
              </div>
              <div id="list-container" class="tab-pane active">
                <ul class="article-list">
                  <c:forEach items="${essayList}" var="essay">
                    <li class="have-img">
                      <!-- <a class="wrap-img" href="http://www.jianshu.com/p/2c8542137bb1"><img src="" alt="300"></a> -->
                      <div>
                        <p class="list-top">
                          <a class="author-name blue-link" target="_blank" href="">${essay.userName}</a>
                          <em>·</em>
                          <span class="time">${essay.subEssayTime}</span></p>
                        <h4 class="title">
                          <a target="_blank" href="essay.html?id=${essay.id}">${essay.essayTitle}</a></h4>
                        <div class="list-footer">
                          <a target="_blank" href="http://www.jianshu.com/p/2c8542137bb1">阅读 ${essay.essayReadingNumber}</a>
                          <a target="_blank" href="http://www.jianshu.com/p/2c8542137bb1#comments">· 评论 ${essay.essayCommentNumber}</a>
                          <span>· 喜欢 ${essay.essayGoodNumber}</span></div>
                      </div>
                    </li>
                  </c:forEach>
                </ul>
                <div class="hidden">
                  <div class="load-more">
                    <button class="ladda-button " data-style="slide-left" data-type="script" data-remote="" data-size="medium" data-url="/notebooks/3138434/latest?page=2" data-color="maleskine" data-method="get">
                      <span class="ladda-label">点击查看更多</span>
                      <span class="ladda-spinner"></span>
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </body>
    </html>
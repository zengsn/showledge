<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  	<%
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
      <!DOCTYPE html>
      <html>
        <head>
          <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
          <meta http-equiv="X-UA-Compatible" content="IE=Edge">
          <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
          <meta http-equiv="Cache-Control" content="no-siteapp">
          <title>${corpus.userName} - 文集 - 简随记</title>
          <link href="<%=path%>/css/css_1.css" rel="stylesheet" media="all">
          <link href="<%=path%>/css/css_2.css" rel="stylesheet" media="all">
          <link href="<%=path%>/css/css_3.css" rel="stylesheet" media="all">
          <link href="<%=path%>/images/favicon.ico" rel="icon">
          <script src="<%=path%>/js/js_1.js"></script>
          <script src="<%=path%>/js/vue.js"></script>
          <script src="<%=path%>/js/my-vue.js"></script>
          <script src="<%=path%>/js/subscribe.js"></script>
        </head>
        
        <body class="book output fluid zh cn win reader-day-mode reader-font2 " data-js-module="notebook-show" data-locale="zh-CN" id="my-vueJS">
          <c:if test="${userNameInSession == null}">
            <my-nologin-top-sidebar login-path="<%=path%>/login" register-path="<%=path%>/register"></my-nologin-top-sidebar>
            <my-nologin-sidebar index-path="<%=path%>/index" login-path="<%=path%>/login"></my-nologin-sidebar>
          </c:if>
          <c:if test="${userNameInSession != null}">
            <my-login-top-sidebar img-src="<%=path%>/${userImagePathInSession}" writer-path="<%=path%>/writer" user-path="<%=path%>/user" favourite-path="<%=path%>/favourite" collect-path="<%=path%>/collect" setting-path="<%=path%>/setting" logout-path="<%=path%>/logout.do"></my-login-top-sidebar>
            <my-login-sidebar index-path="<%=path%>/index" writer-path="<%=path%>/writer" user-path="<%=path%>/user" collect-path="<%=path%>/collect" setting-path="<%=path%>/setting" logout-path="<%=path%>/logout.do"></my-login-sidebar>
          </c:if>
          <div class="fixed-btn">
            <a class="go-top hide-go-top" href="javascript:void(0)">
              <i class="fa fa-angle-up"></i>
            </a>
            <a class="qrcode" data-target="#bottom-qrcode" data-toggle="modal" href="javascript:void(0)">
              <i class="fa fa-qrcode"></i>
            </a>
            <a class="writer" href="<%=path%>/writer" data-toggle="tooltip" data-placement="left" title="" data-original-title="写篇文章">
              <i class="fa fa-pencil"></i>
            </a>
          </div>
          <div class="row-fluid">
            <div class="notebook-list new-view">
              <div class="aside span3">
                <h3 class="title">
                  <a href="<%=path%>/corpus/${corpus.id}">${corpus.userName}</a></h3>
                <ul class="meta">
                  <a href="">${essayList.size()} 篇文章</a>
                  <!-- ・ -->
                  <%-- <a href="">${user.userFansNumber} 人关注</a>・
                    <span class="wordage">字数: ${user.userWordsNumber}</span></ul>--%>
                <div class="btn-group">
                  <c:if test="${!user.isFocused}">
                    <div id="focus_at_users" class="btn btn-small btn-success follow">
                      <a id="focus_at_users_a" href="javascript:void(0)" hidefocus="true" onFocus="this.blur()" onclick="addFocusAtUsersCorpus(${user.id}, '<%=path%>');">
                        <i id="focus_at_users_i" class="fa fa-plus"></i>
                        <span>添加关注</span></a>
                    </div>
                    <a id="focus_at_users_ul" class="btn btn-small btn-success notebook-share" data-toggle="dropdown" href="javascript:void(0)">
                      <i class="fa fa-share-square-o"></i>
                    </a>
                    <ul class="dropdown-menu arrow-top">
                      <li>
                        <a href="" src="<%=path%>/images/corpus/weibo.png" alt="Weibo"></a>
                      </li>
                      <li>
                        <a href="" src="<%=path%>/images/corpus/tweibo.png" alt="Tweibo"></a>
                      </li>
                      <li>
                        <a href="" src="<%=path%>/images/corpus/qzone.png" alt="Qzone"></a>
                      </li>
                      <li>
                        <a href="" src="<%=path%>/images/corpus/douban.png" alt="Douban"></a>
                      </li>
                      <li>
                        <a href="" src="<%=path%>/images/corpus/twitter.png" alt="Twitter"></a>
                      </li>
                      <li>
                        <a href="" src="<%=path%>/images/corpus/facebook.png" alt="Facebook"></a>
                      </li>
                      <li>
                        <a href="" src="<%=path%>/images/corpus/google_plus.png" alt="Google plus"></a>
                      </li>
                      <li>
                        <a href="">
                          <img src="<%=path%>/images/corpus/renren.png" alt="Renren"></a>
                      </li>
                    </ul>
                  </c:if>
                  <c:if test="${!user.isFocused}">
                    <div id="focus_at_users" class="btn btn-small follow following">
                      <a id="focus_at_users_a" href="javascript:void(0)" hidefocus="true" onFocus="this.blur()" onclick="removeFocusAtUsersCorpus(${user.id}, '<%=path%>');">
                        <i id="focus_at_users_i" class="fa fa-fw fa-check"></i>
                        <span>添加关注</span></a>
                    </div>
                    <a id="focus_at_users_ul" class="btn btn-small notebook-share" data-toggle="dropdown" href="javascript:void(0)">
                      <i class="fa fa-share-square-o"></i>
                    </a>
                    <ul class="dropdown-menu arrow-top">
                      <li>
                        <a href="" src="<%=path%>/images/corpus/weibo.png" alt="Weibo"></a>
                      </li>
                      <li>
                        <a href="" src="<%=path%>/images/corpus/tweibo.png" alt="Tweibo"></a>
                      </li>
                      <li>
                        <a href="" src="<%=path%>/images/corpus/qzone.png" alt="Qzone"></a>
                      </li>
                      <li>
                        <a href="" src="<%=path%>/images/corpus/douban.png" alt="Douban"></a>
                      </li>
                      <li>
                        <a href="" src="<%=path%>/images/corpus/twitter.png" alt="Twitter"></a>
                      </li>
                      <li>
                        <a href="" src="<%=path%>/images/corpus/facebook.png" alt="Facebook"></a>
                      </li>
                      <li>
                        <a href="" src="<%=path%>/images/corpus/google_plus.png" alt="Google plus"></a>
                      </li>
                      <li>
                        <a href="">
                          <img src="<%=path%>/images/corpus/renren.png" alt="Renren"></a>
                      </li>
                    </ul>
                  </c:if>
                </div>
                <div class="author">
                  <div class="avatar">
                    <a href="<%=path%>/users/${corpus.userName}">
                      <img src="<%=path%>/${userImagePath}" alt="100"></a>
                  </div>
                  <a href="<%=path%>/users/${corpus.userName}">${corpus.userName}</a>著</div></div>
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
                            <a class="author-name blue-link" target="_blank" href="<%=path%>/users/${essay.userName}">${essay.userName}</a>
                            <em>·</em>
                            <span class="time">${essay.subEssayTime}</span></p>
                          <h4 class="title">
                            <a target="_blank" href="<%=path%>/essay/${essay.id}">${essay.essayTitle}</a></h4>
                          <div class="list-footer">
                            <span>阅读 ${essay.essayReadingNumber}</span>
                            <span>· 评论 ${essay.essayCommentNumber}</span>
                            <span>· 喜欢 ${essay.essayGoodNumber}</span></div>
                        </div>
                      </li>
                    </c:forEach>
                  </ul>
                  <div class="hidden">
                    <div class="load-more">
                      <button class="ladda-button " data-style="slide-left" data-type="script" data-remote="" data-size="medium" data-url="" data-color="maleskine" data-method="get">
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  	<%
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
      <!DOCTYPE html>
      <html>
        <head>
          <meta http-equiv="Content-Type" content="text/html;
          charset=UTF-8">
          <meta http-equiv="X-UA-Compatible" content="IE=Edge">
          <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
          <meta http-equiv="Cache-Control" content="no-siteapp">
          <title>${user.userName} - 简随记</title>
          <link href="<%=path%>/css/css_1.css" rel="stylesheet" media="all">
          <link href="<%=path%>/css/css_2.css" rel="stylesheet" media="all">
          <link href="<%=path%>/css/css_3.css" rel="stylesheet" media="all">
          <link href="<%=path%>/images/favicon.ico" rel="icon">
          <script src="<%=path%>/js/js_1.js"></script>
          <script src="<%=path%>/js/vue.js"></script>
          <script src="<%=path%>/js/my-vue.js"></script>
          <script src="<%=path%>/js/subscribe.js"></script>
          <script src="<%=path%>/js/user.js"></script>
        </head>
        
        <body class="user output zh cn win reader-day-mode reader-font2 " data-js-module="user-show" data-locale="zh-CN" id="my-vueJS">
          <c:if test="${userNameInSession == null}">
            <my-nologin-top-sidebar login-path="<%=path%>/login" register-path="<%=path%>/register"></my-nologin-top-sidebar>
            <my-nologin-sidebar index-path="<%=path%>/index" login-path="<%=path%>/login"></my-nologin-sidebar>
          </c:if>
          <c:if test="${userNameInSession != null}">
            <my-login-top-sidebar img-src="<%=path%>/${userImagePathInSession}" writer-path="<%=path%>/writer" user-path="<%=path%>/user" favourite-path="<%=path%>/favourite" collect-path="<%=path%>/collect" setting-path="<%=path%>/setting" logout-path="<%=path%>/logout.do"></my-login-top-sidebar>
            <my-login-sidebar index-path="<%=path%>/index" writer-path="<%=path%>/writer" user-path="<%=path%>/user" collect-path="<%=path%>/collect" setting-path="<%=path%>/setting" logout-path="<%=path%>/logout.do"></my-login-sidebar>
          </c:if>
          <div class="row-fluid">
            <!-- aside -->
            <div class="user-aside span3">
              <div class="people">
                <div class="basic-info">
                  <div class="avatar">
                    <img src="<%=path%>/${user.userImagePath}" alt="100"></div>
                  <h3>
                    <a href="<%=path%>/users/${user.userName}">${user.userName}</a></h3>
                  <c:if test="${user.userName != userNameInSession}">
                    <div class="btn-group">
                      <c:if test="${!user.isFocused}">
                        <div id="focus_at_users" class="btn btn-small btn-success follow">
                          <a id="focus_at_users_a" href="javascript:void(0)" hidefocus="true" onFocus="this.blur()" onclick="addFocusAtUsers(${user.id}, '<%=path%>');">
                            <i id="focus_at_users_i" class="fa fa-plus"></i>
                            <span> 添加关注</span></a>
                        </div>
                        <a id="focus_at_users_ul" class="btn btn-small btn-list btn-success" data-toggle="dropdown" href="javascript:void(0)" hidefocus="true" onFocus="this.blur()">
                          <i class="fa fa-bars"></i>
                        </a>
                        <ul class="dropdown-menu arrow-top" role="menu" aria-labelledby="dLabel">
                          <li>
                            <a href="javascript:void(0)" hidefocus="true" onFocus="this.blur()">
                              <i class="fa fa-fw fa-envelope"></i>写简信</a>
                          </li>
                          <li class="divider"></li>
                          <li>
                            <a id="" data-remote="true" rel="nofollow" data-method="post" href="javascript:void(0)" hidefocus="true" onFocus="this.blur()">
                              <i class="fa fa-fw fa-lock"></i>加入黑名单</a>
                          </li>
                          <li class="dropdown-submenu" data-js-module="report">
                            <a href="javascript:void(0)" hidefocus="true" onFocus="this.blur()">
                              <i class="fa fa-fw fa-flag-o"></i>举报用户</a>
                            <ul class="dropdown-menu">
                              <li>
                                <a data-type="json" data-remote="true" rel="nofollow" data-method="post" href="">广告或垃圾信息</a></li>
                              <li>
                                <a data-type="json" data-remote="true" rel="nofollow" data-method="post" href="">抄袭或未授权转载</a></li>
                              <li>
                                <a data-toggle="modal" href="">其他</a></li>
                            </ul>
                          </li>
                        </ul>
                      </c:if>
                      <c:if test="${user.isFocused}">
                        <div id="focus_at_users" class="btn btn-small follow following">
                          <a id="focus_at_users_a" href="javascript:void(0)" hidefocus="true" onFocus="this.blur()" onclick="removeFocusAtUsers(${user.id}, '<%=path%>');">
                            <i id="focus_at_users_i" class="fa fa-check"></i><span> 正在关注</span></a>
                        </div>
                        <a id="focus_at_users_ul" class="btn btn-small btn-list" data-toggle="dropdown" href="javascript:void(0)" hidefocus="true" onFocus="this.blur()">
                          <i class="fa fa-bars"></i>
                        </a>
                        <ul class="dropdown-menu arrow-top" role="menu" aria-labelledby="dLabel">
                          <li>
                            <a href="javascript:void(0)" hidefocus="true" onFocus="this.blur()">
                              <i class="fa fa-fw fa-envelope"></i>写简信</a>
                          </li>
                          <li class="divider"></li>
                          <li>
                            <a id="" data-remote="true" rel="nofollow" data-method="post" href="javascript:void(0)" hidefocus="true" onFocus="this.blur()">
                              <i class="fa fa-fw fa-lock"></i>加入黑名单</a>
                          </li>
                          <li class="dropdown-submenu" data-js-module="report">
                            <a href="javascript:void(0)" hidefocus="true" onFocus="this.blur()">
                              <i class="fa fa-fw fa-flag-o"></i>举报用户</a>
                            <ul class="dropdown-menu">
                              <li>
                                <a data-type="json" data-remote="true" rel="nofollow" data-method="post" href="">广告或垃圾信息</a></li>
                              <li>
                                <a data-type="json" data-remote="true" rel="nofollow" data-method="post" href="">抄袭或未授权转载</a></li>
                              <li>
                                <a data-toggle="modal" href="">其他</a></li>
                            </ul>
                          </li>
                        </ul>
                      </c:if>
                    </div>
                  </c:if>
                  <div class="about">
                    <p class="intro">${user.userIntroduce}</p>
                    <c:if test="${user.userName == userNameInSession}">
                      <a id="user_introduce_click" class="edit-intro blue-link" href="javascript:void(0)" onclick="showUserForm();">编辑个人介绍</a>
                      <form id="user_form" class="intro-form" data-type="json" action="" accept-charset="UTF-8" method="post">
                        <input id="userName" name="userName" placeholder="" type="text" value="${user.userName}">
                        <p id="error_message" class="form-error-message hide"></p>
                        <textarea id="userIntroduce" name="userIntroduce">${user.userIntroduce}</textarea>
                        <input id="user_form_button" type="button" value="保存" class="btn btn-info">
                        <a class="btn cancel" href="javascript:void(0)" onclick="hideUserForm();">取消</a></form>
                    </c:if>
                  </div>
                  <div class="sns"></div>
                </div>
                <div class="user-stats">
                  <ul class="clearfix">
                    <li>
                      <a href="<%=path%>/followings/${user.userName}">
                        <b>${user.userFocusNumber}</b>
                        <span>关注</span></a>
                    </li>
                    <li>
                      <a href="<%=path%>/followers/${user.userName}">
                        <b>${user.userFansNumber}</b>
                        <span>粉丝</span></a>
                    </li>
                    <br>
                    <li>
                      <a href="<%=path%>/users/${user.userName}">
                        <b>${user.userEssayNumber}</b>
                        <span>文章</span></a>
                    </li>
                    <li>
                      <a href="javascript:void(0)">
                        <b>${user.userWordsNumber}</b>
                        <span>字数</span></a>
                    </li>
                    <li>
                      <a href="javascript:void(0)">
                        <b>${user.userLikesNumber}</b>
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
                      <a class="fa fa-book" href="<%=path%>/corpus/${corpus.id}" hidefocus="true" onFocus="this.blur()"> ${corpus.corpusName}</a></li>
                  </c:forEach>
                </ul>
              </div>
            </div>
            <!-- content -->
            <div class="span9 offset3 recent-post relationships">
              <!-- navigation -->
              <ul class="nav nav-tabs nav-relationships">
                <li class="">
       			  <a data-pjax="list-container" href="<%=path%>/subscriptions/${user.userName}">关注专题/文集(${user.userFocusCorpusNumber})</a></li>
                <li class="active">
                  <a data-pjax="list-container" href="<%=path%>/followings/${user.userName}" hidefocus="true" onFocus="this.blur()">关注用户(${user.userFocusUserNumber})</a></li>
                <li class="">
                  <a data-pjax="list-container" href="<%=path%>/followers/${user.userName}" hidefocus="true" onFocus="this.blur()">粉丝(${user.userFansNumber})</a></li>
              </ul>
              <div class="tab-content">
                <div id="list-container" class="tab-pane active">
                  <ul class="users">
                    <c:forEach items="${userList}" var="user" varStatus="status">
                      <li>
                        <a class="avatar" target="_blank" href="<%=path%>/users/${user.userName}" hidefocus="true" onFocus="this.blur()">
                          <img src="<%=path%>/${user.userImagePath}" alt="4"></a>
                        <c:if test="${user.userName != userNameInSession}">
                          <c:if test="${!user.isFocused}">
                            <div id="focus_at_users_${status.index}" class="btn btn-small btn-success follow">
                              <a id="focus_at_users_a_${status.index}" hidefocus="true" onFocus="this.blur()" onclick="addFocusAtUsersLi(${status.index}, ${user.id}, '<%=path%>');">
                                <i id="focus_at_users_i_${status.index}" class="fa fa-plus"></i>
                                <span> 添加关注</span></a>
                            </div>
                          </c:if>
                          <c:if test="${user.isFocused}">
                            <div id="focus_at_users_${status.index}" class="btn btn-small follow following">
                              <a id="focus_at_users_a_${status.index}" hidefocus="true" onFocus="this.blur()" onclick="removeFocusAtUsersLi(${status.index}, ${user.id}, '<%=path%>');">
                                <i id="focus_at_users_i_${status.index}" class="fa fa-check"></i>
                                <span> 正在关注</span></a>
                            </div>
                          </c:if>
                        </c:if>
                        <h4>
                          <a target="_blank" href="<%=path%>/users/${user.userName}" hidefocus="true" onFocus="this.blur()">${user.userName}</a></h4>
                        <p>
                          <a href="<%=path%>/followers/${user.userName}">粉丝 ${user.userFansNumber}</a> ｜
                          <a href="<%=path%>/users/${user.userName}">文章 ${user.userEssayNumber}</a></p>
                        <p class="article-info author-info">写了 ${user.userWordsNumber} 字, 获得了 ${user.userLikesNumber} 个喜欢</p></li>
                    </c:forEach>
                    <div class="hidden">
                      <div class="pagination">
                        <ul class="pagination">
                          <li class="first">
                            <a data-remote="true" href="http://www.jianshu.com/users/8f4f698c32fa/following?_=1472554613455">首页</a></li>
                          <li class="prev">
                            <a rel="prev" data-remote="true" href="http://www.jianshu.com/users/8f4f698c32fa/following?_=1472554613455">上一页</a></li>
                          <li class="">
                            <a rel="prev" data-remote="true" href="http://www.jianshu.com/users/8f4f698c32fa/following?_=1472554613455">1</a></li>
                          <li class=" active">
                            <a data-remote="true" href="javascript:null;">2</a></li>
                          <li class="">
                            <a rel="next" data-remote="true" href="http://www.jianshu.com/users/8f4f698c32fa/following?_=1472554613455&amp;page=3">3</a></li>
                          <li class="">
                            <a data-remote="true" href="http://www.jianshu.com/users/8f4f698c32fa/following?_=1472554613455&amp;page=4">4</a></li>
                          <li class="">
                            <a data-remote="true" href="http://www.jianshu.com/users/8f4f698c32fa/following?_=1472554613455&amp;page=5">5</a></li>
                          <li class="">
                            <a data-remote="true" href="http://www.jianshu.com/users/8f4f698c32fa/following?_=1472554613455&amp;page=6">6</a></li>
                          <li class="next">
                            <a rel="next" data-remote="true" href="http://www.jianshu.com/users/8f4f698c32fa/following?_=1472554613455&amp;page=3">下一页</a></li>
                          <li class="last">
                            <a data-remote="true" href="http://www.jianshu.com/users/8f4f698c32fa/following?_=1472554613455&amp;page=12">终页</a></li>
                        </ul>
                      </div>
                    </div>
                </div>
              </div>
            </div>
        </body>
      </html>
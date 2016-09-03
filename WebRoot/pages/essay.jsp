<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  	<%
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
    <!DOCTYPE html>
    <html>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0,user-scalable=no">
        <meta http-equiv="Cache-Control" content="no-siteapp">
        <title>${essay.essayTitle} - 简随记</title>
        <link hidefocus="true" onFocus="this.blur()" href="<%=path%>/css/css_1.css" rel="stylesheet" media="all">
        <link hidefocus="true" onFocus="this.blur()" href="<%=path%>/css/css_2.css" rel="stylesheet" media="all">
        <link hidefocus="true" onFocus="this.blur()" href="<%=path%>/css/css_3.css" rel="stylesheet" media="all">
        <link hidefocus="true" onFocus="this.blur()" href="<%=path%>/images/favicon.ico" rel="icon">
        <script src="<%=path%>/js/js_1.js"></script>
        <script src="<%=path%>/js/vue.js"></script>
        <script src="<%=path%>/js/my-vue.js"></script>
        <script src="<%=path%>/js/essay.js"></script>
      </head>
      
      <body class="post output zh cn win reader-day-mode reader-font2" data-js-module="note-show" data-locale="zh-CN" id="my-vueJS">
        <input id="userNameInSession" type="hidden" value="${userNameInSession}" />
        <c:if test="${userNameInSession == null}">
          <my-nologin-sidebar index-path="<%=path%>/index" login-path="<%=path%>/login"></my-nologin-sidebar>
        </c:if>
        <c:if test="${userNameInSession != null}">
          <my-login-sidebar index-path="<%=path%>/index" writer-path="<%=path%>/writer" user-path="<%=path%>/user" collect-path="<%=path%>/collect" setting-path="<%=path%>/setting" logout-path="<%=path%>/logout.do"></my-login-sidebar>
        </c:if>
        <div id="show-note-container">
          <div class="post-bg" id="flag">
            <c:if test="${userNameInSession == null}">
              <div class="wrap-btn">
                <div class="article-related pull-left">
                  <a class="collection-menu-btn" data-toggle="modal" data-target="#collection-menu" hidefocus="true" onFocus="this.blur()" href="javascript:void(null);">
                    <i class="fa fa-th"></i>
                  </a>
                  <a class="notebooks-menu-btn" data-toggle="modal" data-target="#notebooks-menu" hidefocus="true" onFocus="this.blur()" href="javascript:void(null);">
                    <i class="fa fa-list-ul"></i>
                  </a>
                  <div class="related-avatar-group activities"></div>
                </div>
                <a class="login" data-signup-link="true" data-toggle="modal" hidefocus="true" onFocus="this.blur()" href="<%=path%>/register">
                  <i class="fa fa-user"></i> 注册</a>
                <a class="login" data-signin-link="true" data-toggle="modal" hidefocus="true" onFocus="this.blur()" href="<%=path%>/login">
                  <i class="fa fa-sign-in"></i> 登录</a>
              </div>
            </c:if>
            <c:if test="${userNameInSession != null}">
              <div class="wrap-btn" style="top: -1px;">
                <div class="article-related pull-left">
                  <a data-toggle="tooltip" data-placement="bottom" data-original-title="未加入专题" hidefocus="true" onFocus="this.blur()" href="javascript:void(null);">
                    <i class="fa fa-th"></i>
                  </a>
                  <a class="notebooks-menu-btn" data-toggle="modal" data-target="#notebooks-menu" hidefocus="true" onFocus="this.blur()" href="javascript:void(null);">
                    <i class="fa fa-list-ul"></i>
                  </a>
                  <div class="related-avatar-group activities"></div>
                </div>
                <a class="user avatar" data-toggle="dropdown" hidefocus="true" onFocus="this.blur()" href="javascript:void(0)">
                  <img src="<%=path%>/${userImagePathInSession}" alt="11">
                  <b class="caret"></b>
                </a>
                <ul class="dropdown-menu arrow-top" role="menu" aria-labelledby="dLabel">
                  <li>
                    <a hidefocus="true" onFocus="this.blur()" href="<%=path%>/writer">
                      <i class="fa fa-pencil"></i>写文章</a>
                  </li>
                  <li>
                    <a target="_blank" hidefocus="true" onFocus="this.blur()" href="<%=path%>/user">
                      <i class="fa fa-user"></i>我的主页</a>
                  </li>
                  <li>
                    <a hidefocus="true" onFocus="this.blur()" href="<%=path%>/favourite">
                      <i class="fa fa-heart"></i>我喜欢的</a>
                  </li>
                  <li>
                    <a hidefocus="true" onFocus="this.blur()" href="<%=path%>/collect">
                      <i class="fa fa-bookmark"></i>我的收藏</a>
                  </li>
                  <li>
                    <a hidefocus="true" onFocus="this.blur()" href="javascript:void(null)">
                      <i class="fa fa-bell"></i>提醒</a>
                  </li>
                  <li>
                    <a hidefocus="true" onFocus="this.blur()" href="javascript:void(null)">
                      <i class="fa fa-envelope"></i>简信</a>
                  </li>
                  <li>
                    <a hidefocus="true" onFocus="this.blur()" href="<%=path%>/setting">
                      <i class="fa fa-cogs"></i>设置</a>
                  </li>
                  <li>
                    <a hidefocus="true" onFocus="this.blur()" href="javascript:void(null)">
                      <i class="fa fa-credit-card"></i>钱包</a>
                  </li>
                  <li class="dropdown-submenu">
                    <a tabindex="-1" hidefocus="true" onFocus="this.blur()" href="javascript:void(null)">
                      <i class="fa fa-question-circle"></i>帮助</a>
                    <ul class="dropdown-menu">
                      <li>
                        <a hidefocus="true" onFocus="this.blur()" href="javascript:void(null)" target="_blank">帮助中心</a></li>
                      <li>
                        <a target="_blank" hidefocus="true" onFocus="this.blur()" href="javascript:void(null)">联系我们</a></li>
                    </ul>
                  </li>
                  <li>
                    <a rel="nofollow" data-method="DELETE" hidefocus="true" onFocus="this.blur()" href="<%=path%>/logout.do">
                      <i class="fa fa-sign-out"></i>登 出</a>
                  </li>
                </ul>
                <div class="btn-group editor-article">
                  <a class="daytime set-view-mode" hidefocus="true" onFocus="this.blur()" href="javascript:void(0)">
                    <i class="fa fa-moon-o"></i>
                  </a>
                  <span>
                    <c:if test="${userNameInSession == essay.userName}">
                      <a class="btn" hidefocus="true" onFocus="this.blur()" href="writer">
                        <i class="fa fa-pencil-square-o"></i>
                      </a>
                    </c:if>
                    <c:if test="${!essay.isCollected}">
                      <a id="top-collect-button" class="bookmark" hidefocus="true" onFocus="this.blur()" hidefocus="true" onFocus="this.blur()" href="javascript:void(null)" title="收藏文章" onclick="addCollect(${essay.id});">
                      	<i id="top-collect-button-i" class="fa fa-bookmark-o"></i>
                      <span>收藏文章</span></a>
                    </c:if>
                    <c:if test="${essay.isCollected}">
                      <a id="top-collect-button" class="bookmarked" hidefocus="true" onFocus="this.blur()" hidefocus="true" onFocus="this.blur()" href="javascript:void(null)" title="收藏文章" onclick="removeCollect(${essay.id});">
					  	<i id="top-collect-button-i" class="fa fa-bookmark"></i>
					  <span>收藏文章</span></a>
                    </c:if>
                    <!-- <div class="tooltip fade bottom in" style="display: block; top: 24px;left:-10px">
                    	啦啦啦
                    </div> -->
                    <a id="top-share-button" hidefocus="true" onFocus="this.blur()" href="javascript:void(null)" hidefocus="true" onFocus="this.blur()">
                      <i class="fa fa-share-square-o"></i>
                    </a>
                  </span>
                </div>
              </div>
            </c:if>
            <div class="container">
              <div class="related-avatar-group activities"></div>
              <div class="article">
                <div class="preview">
                  <div class="author-info">
                    <a class="avatar" hidefocus="true" onFocus="this.blur()" href="<%=path%>/users/${essay.userName}">
                      <img src="<%=path%>/${essayUserImage}" alt="11"></a>
                    <span class="label">作者</span>
                    <a class="author-name blue-link" hidefocus="true" onFocus="this.blur()" href="<%=path%>/users/${essay.userName}">
                      <span>${essay.userName}</span></a>
                    <span data-toggle="tooltip">${essay.formatEssayTime}</span>
                    <div>
                      <span>被 ${user.userFansNumber} 人关注</span>,
                      <span> 获得了 ${user.userLikesNumber} 个喜欢</span></div>
                  </div>
                  <h1 class="title">${essay.essayTitle}</h1>
                  <div class="meta-top">
                    <span>字数 ${essay.essayWordNumber}</span>
                    <span>阅读 ${essay.essayReadingNumber}</span>
                    <span>评论 ${essay.essayCommentNumber}</span>
                    <span>喜欢 ${essay.essayGoodNumber}</span></div>
                  <!-- Collection/Bookmark/Share for width under 768px -->
                  <div class="article-share"></div>
                  <!-- -->
                  <div class="show-content">
                    <p>${essay.essayContent}</p>
                  </div>
                </div>
              </div>
              <div class="visitor_edit">
                <!-- further readings -->
                <div id="further-readings" data-user-slug="af5e3096ebc7" data-user-nickname="lovely菜头">
                  <div id="further-reading-line" class="hide further-reading-line"></div>
                  <ul id="further-readings-list" class="reading-list unstyled"></ul>
                  <div id="further-reading-new" class="reading-edit">
                    <a id="further-reading-new-prompt" hidefocus="true" onFocus="this.blur()" hidefocus="true" onFocus="this.blur()" href="javascript:void(null)">
                      <i class="fa fa-plus-circle"></i>推荐拓展阅读</a>
                    <div id="further-reading-form"></div>
                  </div>
                </div>
                <div class="pull-right">
                  <!-- copyright -->
                  <div class="author-copyright pull-right" data-toggle="tooltip" data-html="true" title="" data-original-title="转载请联系作者获得授权，并标注“简书作者”。">
                    <a>
                      <i class="fa fa-copyright"></i>著作权归作者所有</a>
                  </div>
                </div>
              </div>
              <!-- Reward / Support Author -->
              <div class="support-author">
                <p>如果觉得我的文章对您有用，请随意打赏。您的支持将鼓励我继续创作！</p>
                <span>本文已收到
                  <a class="rewards-total-count" data-toggle="modal" hidefocus="true" onFocus="this.blur()" hidefocus="true" onFocus="this.blur()" href="">0</a>次打赏</span>
                <div class="avatar-list"></div>
              </div>
              <!-- article meta bottom -->
              <div class="meta-bottom clearfix">
                <!-- Like Button -->
                <c:if test="${!essay.isFavourited}">
                <div id="mid-favourite-button" class="like">
                  <div class="like-button">
                    <a id="mid-favourite-button-a" class="like-content" hidefocus="true" onFocus="this.blur()" data-remote="true" rel="nofollow" hidefocus="true" onFocus="this.blur()" href="javascript:void(null)" onclick="addFavourite(${essay.id})">
                      <i id="mid-favourite-button-i" class="fa fa-heart-o"></i> 喜欢</a>
                  </div>
                  <span id="likes-count" data-toggle="tooltip" data-placement="right">${essay.essayGoodNumber}</span></div>
                </c:if>
                
                <c:if test="${essay.isFavourited}">
                  <div id="mid-favourite-button" class="like note-liked">
                  	<div class="like-button">
                    <a id="mid-favourite-button-a" class="like-content" hidefocus="true" onFocus="this.blur()" data-remote="true" rel="nofollow" hidefocus="true" onFocus="this.blur()" href="javascript:void(null)" onclick="removeFavourite(${essay.id})">
                      <i id="mid-favourite-button-i" class="fa fa-heart"></i> 喜欢</a>
                  </div>
                  <span id="likes-count" data-toggle="tooltip" data-placement="right">${essay.essayGoodNumber}</span></div>
                </c:if>
                <!-- share group -->
                <div class="share-group pull-right">
                  <a hidefocus="true" onFocus="this.blur()" hidefocus="true" onFocus="this.blur()" href="javascript:void(null)" data-name="weibo">
                    <i class="fa fa-weibo"></i>
                    <span>分享到微博</span></a>
                  <a data-toggle="modal" hidefocus="true" onFocus="this.blur()" hidefocus="true" onFocus="this.blur()" href="javascript:void(null)" data-name="weixin">
                    <i class="fa fa-weixin"></i>
                    <span>分享到微信</span></a>
                  <div class="more">
                    <a hidefocus="true" onFocus="this.blur()" hidefocus="true" onFocus="this.blur()" href="javascript:void(0)" data-toggle="dropdown">更多分享
                      <i class="fa fa-caret-down"></i></a>
                    <ul class="dropdown-menu arrow-top">
                      <li>
                        <a hidefocus="true" onFocus="this.blur()" href="javascript:void(null)" target="_blank" data-name="changweibo">
                          <i class="fa fa-arrow-circle-o-down"></i>下载长微博图片</a>
                      </li>
                      <li>
                        <a data-name="tweibo" hidefocus="true" onFocus="this.blur()" href="javascript:void(null)" <img src="<%=path%>/images/post_detail/tweibo.png" alt="Tweibo">分享到腾讯微博</a></li>
                      <li>
                        <a data-name="qzone" hidefocus="true" onFocus="this.blur()" href="javascript:void(null)" <img src="<%=path%>/images/post_detail/qzone.png" alt="Qzone">分享到QQ空间</a></li>
                      <li>
                        <a data-name="twitter" hidefocus="true" onFocus="this.blur()" href="javascript:void(null)" <img src="<%=path%>/images/post_detail/twitter.png" alt="Twitter">分享到Twitter</a></li>
                      <li>
                        <a data-name="facebook" hidefocus="true" onFocus="this.blur()" href="javascript:void(null)" <img src="<%=path%>/images/post_detail/facebook.png" alt="Facebook">分享到Facebook</a></li>
                      <li>
                        <a data-name="google_plus" hidefocus="true" onFocus="this.blur()" href="javascript:void(null)" <img src="<%=path%>/images/post_detail/google_plus.png" alt="Google plus">分享到Google+</a></li>
                      <li>
                        <a data-name="douban" hidefocus="true" onFocus="this.blur()" href="javascript:void(null)" <img src="<%=path%>/images/post_detail/douban.png" alt="Douban">分享到豆瓣</a></li>
                    </ul>
                  </div>
                </div>
              </div>
              <!-- Modals -->
              <div id="share-weixin-modal" class="modal hide fade share-weixin-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button></div>
                <div class="modal-body" title="">
                  <h5>打开微信“扫一扫”，打开网页后点击屏幕右上角分享按钮</h5>
                  <canvas width="170" height="170" style="display: none;"></canvas>
                  <img src="" style="display: block;"></div>
              </div>
              <div id="contribute-modal" tabindex="-1" class="arrow-top user-editor-actions modal hide fade" aria-hidden="true" style="display: none;">
                <div class="modal-header">
                  <b>向专题投稿
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button></b>
                </div>
                <div class="modal-body">
                  <div class="search">
                    <input type="text" name="search_term" id="search_term" class="input-large search-query" placeholder="搜索更多专题投稿" data-search-collections-url="/collections/search?note_id=4785107"></div>
                  <ul class="add-list"></ul>
                </div>
              </div>
              <div id="rewards-modal" class="modal modal_new support_list-modal fullscreen hide fade" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                      <h3>读者打赏</h3></div>
                    <div class="modal-body">
                      <ul class="unstyled users">
                        <img class="loader-tiny editor-loading" src="<%=path%>/images/post_detail/tiny.gif" alt="Tiny"></ul>
                    </div>
                  </div>
                </div>
              </div>
              <!-- Comments -->
              <div id="comments" class="comment-list clearfix">
                <div class="comment-head clearfix">${essay.essayCommentNumber}条评论
                  <span class="order">（
                    <a data-order="asc" class="active" hidefocus="true" onFocus="this.blur()" href="javascript:void(0)">按时间正序</a>·
                    <a data-order="desc" hidefocus="true" onFocus="this.blur()" href="javascript:void(0)">按时间倒序</a>·
                    <a data-order="likes_count" hidefocus="true" onFocus="this.blur()" href="javascript:void(0)">按喜欢排序</a>）</span>
                  <a hidefocus="true" onFocus="this.blur()" href="#commentContent" class="goto-comment pull-right">
                    <i class="fa fa-pencil"></i>添加新评论</a>
                  <a class="close-comment pull-right" disable_with="请等待..." data-remote="true" rel="nofollow" data-method="put" hidefocus="true" onFocus="this.blur()" href="javascript:void(null)">关闭评论</a></div>
                <div id="comment-list">
                  <c:forEach items="${commentList}" var="comment">
                    <div id="child_comment_${comment.id}" class="note-comment clearfix">
                      <div class="content">
                        <div class="meta-top">
                          <a class="avatar" hidefocus="true" onFocus="this.blur()" href="<%=path%>/users/${comment.commentDiscussantName}">
                            <img src="<%=path%>/${comment.commentDiscussantImagePath}" alt="100"></a>
                          <p>
                            <a class="author-name" hidefocus="true" onFocus="this.blur()" href="<%=path%>/users/${comment.commentDiscussantName}">${comment.commentDiscussantName}</a></p>
                          <span class="reply-time">
                            <small>${comment.commentBuildingNumber} 楼 ·</small>
                            <a hidefocus="true" onFocus="this.blur()" href="javascript:void(null)">${comment.formatCommentTime}</a></span>
                        </div>
                        <p>${comment.commentContent}</p>
                        <div class="comment-footer clearfix text-right">
                          <a class="like pull-left" hidefocus="true" onFocus="this.blur()" href="javascript:void(0)">
                            <i class="fa fa-heart-o"></i>喜欢
                            <span>(0)</span></a>
                          <a data-nickname="" class="reply" hidefocus="true" onFocus="this.blur()" hidefocus="true" onFocus="this.blur()" href="javascript:void(0)" onclick="showNewReplyForm(${comment.id})">回复</a>
                          <c:if test="${comment.commentDiscussantName == userNameInSession}">
                            <a class="delete" data-remote="true" rel="nofollow" hidefocus="true" onFocus="this.blur()" href="javascript:void(null)" onclick="deleteComment(${comment.essayId},${comment.id})">删除</a></c:if>
                        </div>
                        <div class="child-comment-list">
                          <div id="reply_${comment.id}">
                            <c:forEach items="${comment.replyList}" var="reply">
                              <div id="child_reply_${reply.id}" class="child-comment">
                                <p>
                                  <a class="blue-link" hidefocus="true" onFocus="this.blur()" href="<%=path%>/users/${reply.replyUserName}">${reply.replyUserName}</a>： ${reply.replyContent}</p>
                                <div class="child-comment-footer text-right clearfix">
                                  <a class="reply" hidefocus="true" onFocus="this.blur()" hidefocus="true" onFocus="this.blur()" href="javascript:void(null)" onclick="showNewReplyForm(${comment.id})">回复</a>
                                  <span class="reply-time pull-left">
                                    <a hidefocus="true" onFocus="this.blur()" href="javascript:void(null)">${reply.formatReplyTime}</a></span>
                                  <c:if test="${comment.commentDiscussantName == userNameInSession}">
                                    <a class="delete" data-remote="true" rel="nofollow" hidefocus="true" onFocus="this.blur()" hidefocus="true" onFocus="this.blur()" href="javascript:void(null)" onclick="deleteReply(${reply.id})">删除</a></c:if>
                                </div>
                              </div>
                            </c:forEach>
                          </div>
                          <%-- <c:if test="${comment.replyList != []}">
                            <div class="comment-toolbar clearfix">
                              <span class="pull-right">
                                <a data-id="3667945" class="reply" hidefocus="true" onFocus="this.blur()" href="javascript:void(null)" onclick="showNewReplyForm(${comment.id})">
                                  <i class="fa fa-pencil"></i>添加新回复</a>
                              </span>
                            </div>
                            </c:if>--%>
                            <form id="new_reply_form_${comment.id}" style="display: none" class="new_comment" accept-charset="UTF-8" method="post" action="">
                              <div class="comment-text">
                                <textarea id="reply_content_${comment.id}" maxlength="2000" placeholder="写下你的评论…" class="mousetrap"></textarea>
                                <div>
                                  <input type="button" value="发 表" class="btn btn-info" hidefocus="true" onFocus="this.blur()" onclick="addReply(${comment.id},'<%=path%>/')">
                                  <div class="emoji">
                                    <span>
                                      <i class="fa fa-smile-o"></i>
                                    </span>
                                  </div>
                                  <span class="hotkey">Ctrl+Enter 发表</span></div>
                              </div>
                            </form>
                        </div>
                      </div>
                    </div>
                  </c:forEach>
                </div>
                <form id="new_comment_form" class="new_comment" accept-charset="UTF-8" method="post" action="">
                  <input id="essayId" name="essayId" type="hidden" value="${essayId}" />
                  <div class="comment-text">
                    <textarea id="commentContent" name="commentContent" maxlength="2000" placeholder="写下你的评论…" class="mousetrap"></textarea>
                    <div>
                      <input type="button" value="发 表" class="btn btn-info" hidefocus="true" onFocus="this.blur()" onclick="addComment('<%=path%>/')" />
                      <div class="emoji">
                        <span>
                          <i class="fa fa-smile-o"></i>
                        </span>
                      </div>
                      <span class="hotkey">Ctrl+Enter 发表</span></div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </body>
    </html>
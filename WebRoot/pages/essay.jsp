<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@include file="common/tag.jsp" %>
        <!DOCTYPE HTML>
        <html>
            <head>
                <%@include file="common/head.jsp" %>
                <title>${essay.essayTitle}-简随记</title>
            </head>
            
            <body class="post output zh cn win reader-day-mode reader-font2" data-js-module="note-show" data-locale="zh-CN">
                <input id="userIdInSession" type="hidden" value="${userIdInSession}" />
                <c:if test="${userIdInSession == null}">
                    <%@include file="common/nologin-sidebar.jsp" %></c:if>
                <c:if test="${userIdInSession != null}">
                    <%@include file="common/login-sidebar.jsp" %></c:if>
                <div id="show-note-container">
                    <div class="post-bg" id="flag">
                        <c:if test="${userIdInSession == null}">
                            <%@include file="common/essay-nologin-headbar.jsp" %></c:if>
                        <c:if test="${userIdInSession != null}">
                            <%@include file="common/essay-login-headbar.jsp" %></c:if>
                        <div class="container">
                            <div class="related-avatar-group activities"></div>
                            <div class="article">
                                <div class="preview">
                                    <div class="author-info">
                                        <a class="avatar" hidefocus="true" onFocus="this.blur()" href="<%=path%>/users/${essay.userId}/latest_articles">
                                            <img src="<%=path%>/${essayUserImage}" alt="11"></a>
                                        <span class="label">作者</span>
                                        <a class="author-name blue-link" hidefocus="true" onFocus="this.blur()" href="<%=path%>/users/${essay.userId}/latest_articles">
                                            <span>${essay.userName}</span></a>
                                        <span data-toggle="tooltip">${essay.formatEssayTime}</span>
                                        <div>
                                            <span>被 ${user.userFansNumber} 人关注</span>,
                                            <span>获得了 ${user.userLikesNumber} 个喜欢</span></div>
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
                                            <a id="mid-favourite-button-a" class="like-content" hidefocus="true" onFocus="this.blur()" data-remote="true" rel="nofollow" hidefocus="true" onFocus="this.blur()" href="javascript:void(null)" onclick="essayJS.addFavourite(${essay.id}, '<%=path%>/')">
                                                <i id="mid-favourite-button-i" class="fa fa-heart-o"></i>&nbsp;&nbsp;喜欢</a>
                                        </div>
                                        <span id="likes-count" data-toggle="tooltip" data-placement="right">${essay.essayGoodNumber}</span></div>
                                </c:if>
                                <c:if test="${essay.isFavourited}">
                                    <div id="mid-favourite-button" class="like note-liked">
                                        <div class="like-button">
                                            <a id="mid-favourite-button-a" class="like-content" hidefocus="true" onFocus="this.blur()" data-remote="true" rel="nofollow" hidefocus="true" onFocus="this.blur()" href="javascript:void(null)" onclick="essayJS.removeFavourite(${essay.id}, '<%=path%>/');">
                                                <i id="mid-favourite-button-i" class="fa fa-heart"></i>&nbsp;&nbsp;喜欢</a>
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
                            <%@include file="common/essay-comment.jsp" %></div>
                    </div>
                </div>
                
                <%@include file="common/common-js.jsp" %>
                <script src="<%=path%>/js/essay.js" type="text/javascript"></script>
            </body>
        </html>
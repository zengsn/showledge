<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="common/tag.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<%@include file="common/head.jsp"%>
<title>${corpus.corpusName} - 文集   - 简随记</title>
</head>

<body class="book output fluid zh cn win reader-day-mode reader-font2 "
	data-js-module="notebook-show" data-locale="zh-CN" id="my-vueJS">
	<c:if test="${userIdInSession == null}">
		<%@include file="common/no-login.jsp"%>
	</c:if>
	<c:if test="${userIdInSession != null}">
		<%@include file="common/login.jsp"%>
	</c:if>
	<div class="fixed-btn">
		<a class="go-top hide-go-top" href="javascript:void(0)" hidefocus="true">
			<i class="fa fa-angle-up"></i>
		</a>
		<a class="qrcode" data-target="#bottom-qrcode" data-toggle="modal" href="javascript:void(0)"
			hidefocus="true">
			<i class="fa fa-qrcode"></i>
		</a>
		<a class="writer" href="<%=path%>/writer" data-original-title="写篇文章" hidefocus="true">
			<i class="fa fa-pencil"></i>
		</a>
	</div>
	<div class="row-fluid">
		<div class="notebook-list new-view">
			<div class="aside span3">
				<h3 class="title">
					<a href="<%=path%>/notebooks/${corpus.id}/latest" hidefocus="true">${corpus.corpusName}</a>
				</h3>
				<ul class="meta">
					<a href="<%=path%>/notebooks/${corpus.id}/latest" hidefocus="true">${corpus.essayNumber}
						篇文章</a>
					・
					<a href="<%=path%>/subscribers/${corpus.id}" hidefocus="true">${corpus.userFocusNumber} 人关注</a>
					・
					<span class="wordage">字数: ${corpus.essayWordNumber}</span>
				</ul>
				<div class="btn-group">
					<c:if test="${userIdInSession != corpus.userId}">
						<c:if test="${!user.isFocused}">
							<div id="focus_at_users" class="btn btn-small btn-success follow">
								<a id="focus_at_users_a" href="javascript:void(0)" hidefocus="true"
									onclick="subscribeJS.addFocusCorpusAtUserCorpus(${corpus.id}, '<%=path%>');">
									<i id="focus_at_users_i" class="fa fa-plus"></i>
									<span>添加关注</span>
								</a>
							</div>
							<a id="focus_at_users_ul" class="btn btn-small btn-success notebook-share"
								data-toggle="dropdown" href="javascript:void(0)" hidefocus="true">
								<i class="fa fa-share-square-o"></i>
							</a>
							<ul class="dropdown-menu arrow-top">
								<li>
									<a href="javascript:void(0)">
										<img src="<%=path%>/images/corpus/weibo.png" alt="Weibo">
									</a>
								</li>
								<li>
									<a href="javascript:void(0)">
										<img src="<%=path%>/images/corpus/tweibo.png" alt="Tweibo">
									</a>
								</li>
								<li>
									<a href="javascript:void(0)">
										<img src="<%=path%>/images/corpus/qzone.png" alt="Qzone">
									</a>
								</li>
								<li>
									<a href="javascript:void(0)">
										<img src="<%=path%>/images/corpus/douban.png" alt="Douban">
									</a>
								</li>
								<li>
									<a href="javascript:void(0)">
										<img src="<%=path%>/images/corpus/twitter.png" alt="Twitter">
									</a>
								</li>
								<li>
									<a href="javascript:void(0)">
										<img src="<%=path%>/images/corpus/facebook.png" alt="Facebook">
									</a>
								</li>
								<li>
									<a href="javascript:void(0)">
										<img src="<%=path%>/images/corpus/google_plus.png" alt="Google plus">
									</a>
								</li>
								<li>
									<a href="javascript:void(0)">
										<img src="<%=path%>/images/corpus/renren.png" alt="Renren">
									</a>
								</li>
							</ul>
						</c:if>
						<c:if test="${user.isFocused}">
							<div id="focus_at_users" class="btn btn-small follow following">
								<a id="focus_at_users_a" href="javascript:void(0)" hidefocus="true"
									onclick="subscribeJS.removeFocusCorpusAtUserCorpus(${corpus.id}, '<%=path%>');">
									<i id="focus_at_users_i" class="fa fa-fw fa-check"></i>
									<span>正在关注</span>
								</a>
							</div>
							<a id="focus_at_users_ul" class="btn btn-small notebook-share" data-toggle="dropdown"
								href="javascript:void(0)">
								<i class="fa fa-share-square-o"></i>
							</a>
							<ul class="dropdown-menu arrow-top">
								<li>
									<a href="javascript:void(0)">
										<img src="<%=path%>/images/corpus/weibo.png" alt="Weibo">
									</a>
								</li>
								<li>
									<a href="javascript:void(0)">
										<img src="<%=path%>/images/corpus/tweibo.png" alt="Tweibo">
									</a>
								</li>
								<li>
									<a href="javascript:void(0)">
										<img src="<%=path%>/images/corpus/qzone.png" alt="Qzone">
									</a>
								</li>
								<li>
									<a href="javascript:void(0)">
										<img src="<%=path%>/images/corpus/douban.png" alt="Douban">
									</a>
								</li>
								<li>
									<a href="javascript:void(0)">
										<img src="<%=path%>/images/corpus/twitter.png" alt="Twitter">
									</a>
								</li>
								<li>
									<a href="javascript:void(0)">
										<img src="<%=path%>/images/corpus/facebook.png" alt="Facebook">
									</a>
								</li>
								<li>
									<a href="javascript:void(0)">
										<img src="<%=path%>/images/corpus/google_plus.png" alt="Google plus">
									</a>
								</li>
								<li>
									<a href="javascript:void(0)">
										<img src="<%=path%>/images/corpus/renren.png" alt="Renren">
									</a>
								</li>
							</ul>
						</c:if>
					</c:if>
				</div>
				<div class="author">
					<div class="avatar">
						<a href="<%=path%>/users/${corpus.userId}/latest_articles" hidefocus="true">
							<img src="<%=path%>/${corpus.userImagePath}" alt="100">
						</a>
					</div>
					<a href="<%=path%>/users/${corpus.userId}/latest_articles" hidefocus="true">${corpus.userName}</a>
					著
				</div>
			</div>
			<!-- content -->
			<div class="tab-content offset3 span9 ">
				<div class="toolbar">
					<ul class="nav nav-tabs nav-notebooks">
						<li class="latest-articles active">
							<a data-pjax="list-container" href="javascript:void(0)" hidefocus="true">目录</a>
						</li>
						<li class="top-articles ">
							<a data-pjax="list-container" href="javascript:void(0)" hidefocus="true">热门文章</a>
						</li>
					</ul>
				</div>
				<div id="list-container" class="tab-pane active">
					<ul class="article-list">
						<c:forEach items="${essayList}" var="essay">
							<li class="have-img">
								<!-- <a class="wrap-img" href="http://www.jianshu.com/p/2c8542137bb1"><img src="" alt="300"></a> -->
								<div>
									<p class="list-top">
										<a class="author-name blue-link" target="_blank"
											href="<%=path%>/users/${essay.userId}/latest_articles" hidefocus="true">${essay.userName}</a>
										<em>·</em> <span class="time">${essay.subEssayTime}</span>
									</p>
									<h4 class="title">
										<a target="_blank" href="<%=path%>/essay/${essay.id}" hidefocus="true">${essay.essayTitle}</a>
									</h4>
									<div class="list-footer">
										<span>阅读 ${essay.essayReadingNumber}</span> <span>· 评论 ${essay.essayCommentNumber}</span>
										<span>· 喜欢 ${essay.essayGoodNumber}</span>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
					<div class="hidden">
						<div class="load-more">
							<button class="ladda-button " data-style="slide-left" data-type="script" data-remote=""
								data-size="medium" data-url="" data-color="maleskine" data-method="get">
								<span class="ladda-label">点击查看更多</span> <span class="ladda-spinner"></span>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="common/common-js.jsp"%>
	<script src="<%=path%>/js/subscribe.js" type="text/javascript"></script>
</body>
</html>
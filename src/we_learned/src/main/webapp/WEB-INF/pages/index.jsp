<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common/tag.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="common/head.jsp"%>
<title>首页 - 秀知识</title>

<link href="<%=path%>/css/nav.css" rel="stylesheet">
<link href="<%=path%>/css/index.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->
</head>
<body>
	<%@ include file="common/nav.jsp"%>

	<!--主要内容部分-->
	<div class="container index">
		<div class="row">
			<div class="col md-3"></div>
			<div class="col md-6">
				<div class="col-md-1"></div>
				<div class="col-md-7 main">
					<!--顶部轮播图-->
					<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
							<li data-target="#carousel-example-generic" data-slide-to="1"></li>
							<li data-target="#carousel-example-generic" data-slide-to="2"></li>
						</ol>

						<!-- Wrapper for slides -->
						<div class="carousel-inner" role="listbox">
							<div class="item active">
								<img class="lunbo-img" src="image/lunbo1.jpg" alt="lunbotu">
							</div>
							<div class="item">
								<img class="lunbo-img" src="image/lunbo2.jpg" alt="lunbotu">
							</div>
							<div class="item">
								<img class="lunbo-img" src="image/lunbo3.jpg" alt="lunbotu">
							</div>
						</div>

						<!-- Controls -->
						<a class="left carousel-control" href="#carousel-example-generic" role="button"
							data-slide="prev">
							<span class="glyphicon glyphicon-chevron-left"></span>
							<span class="sr-only">Previous</span>
						</a>
						<a class="right carousel-control" href="#carousel-example-generic" role="button"
							data-slide="next">
							<span class="glyphicon glyphicon-chevron-right"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
					<div class="list-container">
						<input id="hideCurrentPage" type="hidden" value="${pageParam.currentPage}">
						<!--文章列表模块-->
						<ul id="essay_list" class="note-list list-unstyled">
							<c:forEach items="${pageParam.data}" var="essay" varStatus="status">
								<li id="essay_${status.index}" class="note-li have-img">
									<c:if test="${status.index == pageParam.data.size() - 1}">
										<input id="hideCurrentNumber" type="hidden" value="${status.index}">
									</c:if>
									<c:if test="${essay.essayImagePath != null}">
										<a href="essay/${essay.id}" target="_blank">
											<img class="wrap-img" src="${essay.essayImagePath}" alt="缩略图">
										</a>
									</c:if>
									<div class="content">
										<div class="author">
											<a href="users/${essay.userId}/latest_articles" target="_blank">
												<img class="avatar" src="${essay.userImagePath}" alt="用户头像">
											</a>
											<div class="name">
												<a href="users/${essay.userId}/latest_articles" class="user-name" target="_blank">${essay.userName}</a>
											</div>
											<div class="time">${essay.subEssayTime}</div>
										</div>
										<a href="essay/${essay.id}" class="title" target="_blank">${essay.essayTitle}</a>
										<p class="abstact">${essay.essayContent}</p>
										<div class="meta">
											<a href="essay/${essay.id}" target="_blank">
												<span class="glyphicon glyphicon-eye-open"></span>
												<span class="watch-num">${essay.essayReadingNumber}</span>
											</a>
											<a href="essay/${essay.id}" target="_blank">
												<span class="glyphicon glyphicon-comment"></span>
												<span class="comment-num">${essay.essayCommentNumber}</span>
											</a>
											<a href="essay/${essay.id}" target="_blank">
												<span class="glyphicon glyphicon-heart"></span>
												<span class="like-num">${essay.essayGoodNumber}</span>
											</a>
										</div>
									</div>
								</li>
							</c:forEach>
						</ul>
						<c:if test="${pageParam.currentPage < (pageParam.totalPage - 1)}">
							<div id="lookmore-btn" class="more" onclick="indexJS.lookMoreEssay();">点击查看更多</div>
						</c:if>
					</div>
				</div>

				<div class="col-md-3 aside">
					<!-- 侧栏按钮 -->
					<div class="aside-btn">
						<ul class="btn-list">
							<li>
								<a href="<%=path%>/writer" target="_blank">
									<img src="icon/article.png" alt="icon">
									<span>撰写文章</span>
								</a>
							</li>
							<li>
								<a href="<%=path%>/newmindmap" target="_blank">
									<img src="icon/nav-map.png" alt="icon">
									<span>编制地图</span>
								</a>
							</li>
							<c:if test="${userIdInSession != null}">
								<li>
									<a href="<%=path%>/user" target="_blank">
										<img src="icon/me.png" alt="icon">
										<span>我的主页</span>
									</a>
								</li>
								<li>
									<a href="<%=path%>/users/${userIdInSession}/like" target="_blank">
										<img src="icon/gift_32px.png" alt="icon">
										<span>我的收藏</span>
									</a>
								</li>
								<li>
									<a href="<%=path%>/resume/${userIdInSession}" target="_blank">
										<img src="icon/id-card.png" alt="icon">
										<span>我的简历</span>
									</a>
								</li>
								<li>
									<a href="<%=path%>/settings" target="_blank">
										<img src="icon/setting_32px.png" alt="icon">
										<span>个人设置</span>
									</a>
								</li>
							</c:if>
						</ul>
					</div>
					<hr>

					<!-- 热门专题 -->
					<div class="recommend-album">
						<div class="block-title">
							<span>热门专题</span>
						</div>
						<ul class="album-list">
							<li>
								<a href="album-page.html" target="_blank">
									<img src="image/album-pic.jpg" class="reco-album-pic" alt="album-pic">
									<span class="reco-album-name">奇思妙想</span>
								</a>
							</li>
							<li>
								<a href="album-page.html" target="_blank">
									<img src="image/touxiang.jpg" class="reco-album-pic" alt="album-pic">
									<span class="reco-album-name">中世纪艺术</span>
								</a>
							</li>
							<li>
								<a href="album-page.html" target="_blank">
									<img src="image/see.png" class="reco-album-pic" alt="album-pic">
									<span class="reco-album-name">今日看点</span>
								</a>
							</li>
						</ul>
						<button class="btn btn-default more-recommend-album" data-toggle="modal"
							data-target="#more-reco-album">更多推荐 ></button>

						<!-- more-recommend-album 的模态框 -->
						<div class="modal fade" id="more-reco-album" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title" id="myModalLabel">热门专题</h4>
									</div>
									<div class="modal-body">
										<ul class="writer-list">
											<li>
												<a href="album-page.html" target="_blank">
													<img src="image/user-avatar2.jpg" alt="user-title" class="reco-album-pic-sub">
												</a>
												<a class="follow-btn">
													<span class="glyphicon glyphicon-plus"></span>
													关注
												</a>
												<a href="album-page.html" target="_blank" class="reco-writer-name">奇思妙想</a>
												<p>1545篇投稿 · 40k关注</p>
											</li>
											<li>
												<a href="album-page.html" target="_blank">
													<img src="image/album-pic.jpg" alt="user-title" class="reco-album-pic-sub">
												</a>
												<a class="follow-btn">
													<span class="glyphicon glyphicon-plus"></span>
													关注
												</a>
												<a href="album-page.html" target="_blank" class="reco-writer-name">奇思妙想</a>
												<p>1545篇投稿 · 40k关注</p>
											</li>
											<li>
												<a href="album-page.html" target="_blank">
													<img src="image/touxiang.jpg" alt="user-title" class="reco-album-pic-sub">
												</a>
												<a class="follow-btn">
													<span class="glyphicon glyphicon-plus"></span>
													关注
												</a>
												<a href="album-page.html" target="_blank" class="reco-writer-name">奇思妙想</a>
												<p>1545篇投稿 · 40k关注</p>
											</li>
										</ul>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
									</div>
								</div>
							</div>
						</div>
						<!--模态框 end-->
					</div>
					<!-- recommend-album end -->
					<hr>

					<!-- 领域大神 -->
					<div class="recommend-writer">
						<div class="block-title">
							<span>领域大神</span>
						</div>

						<ul class="writer-list">
							<li>
								<a href="personal-page.html" target="_blank">
									<img src="image/user-avatar2.jpg" alt="user-title" class="reco-writer-avatar">
								</a>
								<a class="follow-btn">
									<span class="glyphicon glyphicon-plus"></span>
									关注
								</a>
								<a href="personal-page.html" target="_blank" class="reco-writer-name">奥利奥</a>
								<p>30k粉丝 · 535个赞</p>
							</li>
							<li>
								<a href="personal-page.html" target="_blank">
									<img src="image/idol-avatar2.jpg" alt="user-title" class="reco-writer-avatar">
								</a>
								<a class="follow-btn">
									<span class="glyphicon glyphicon-plus"></span>
									关注
								</a>
								<a href="personal-page.html" target="_blank" class="reco-writer-name">fuc_123</a>
								<p>20k粉丝 · 16个赞</p>
							</li>
							<li>
								<a href="personal-page.html" target="_blank">
									<img src="image/pic.png" alt="user-title" class="reco-writer-avatar">
								</a>
								<a class="follow-btn">
									<span class="glyphicon glyphicon-plus"></span>
									关注
								</a>
								<a href="personal-page.html" target="_blank" class="reco-writer-name">趣多多</a>
								<p>465k粉丝 · 4K个赞</p>
							</li>
							<li>
								<a href="personal-page.html" target="_blank">
									<img src="image/touxiang.jpg" alt="user-title" class="reco-writer-avatar">
								</a>
								<a class="follow-btn">
									<span class="glyphicon glyphicon-plus"></span>
									关注
								</a>
								<a href="personal-page.html" target="_blank" class="reco-writer-name">德芙</a>
								<p>234k粉丝 · 31K个赞</p>
							</li>
							<li>
								<a href="personal-page.html" target="_blank">
									<img src="image/idol-avatar.jpg" alt="user-title" class="reco-writer-avatar">
								</a>
								<a class="follow-btn">
									<span class="glyphicon glyphicon-plus"></span>
									关注
								</a>
								<a href="personal-page.html" target="_blank" class="reco-writer-name">比尔盖茨</a>
								<p>330k粉丝 · 344.3K个赞</p>
							</li>
						</ul>
						<button class="btn btn-default more-recommend-writer" data-toggle="modal"
							data-target="#more-reco-wrtier">更多推荐 ></button>

						<!-- more-recommend-writer 的模态框 -->
						<div class="modal fade" id="more-reco-wrtier" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title" id="myModalLabel">领域大神</h4>
									</div>
									<div class="modal-body">
										<ul class="writer-list">
											<li>
												<a href="personal-page.html" target="_blank">
													<img src="image/user-avatar2.jpg" alt="user-title" class="reco-writer-avatar">
												</a>
												<a class="follow-btn">
													<span class="glyphicon glyphicon-plus"></span>
													关注
												</a>
												<a href="personal-page.html" target="_blank" class="reco-writer-name">奥利奥</a>
												<p>30k粉丝 · 535个赞</p>
											</li>
											<li>
												<a href="personal-page.html" target="_blank">
													<img src="image/idol-avatar2.jpg" alt="user-title" class="reco-writer-avatar">
												</a>
												<a class="follow-btn">
													<span class="glyphicon glyphicon-plus"></span>
													关注
												</a>
												<a href="personal-page.html" target="_blank" class="reco-writer-name">fuc_123</a>
												<p>20k粉丝 · 16个赞</p>
											</li>
											<li>
												<a href="personal-page.html" target="_blank">
													<img src="image/pic.png" alt="user-title" class="reco-writer-avatar">
												</a>
												<a class="follow-btn">
													<span class="glyphicon glyphicon-plus"></span>
													关注
												</a>
												<a href="personal-page.html" target="_blank" class="reco-writer-name">趣多多</a>
												<p>465k粉丝 · 4K个赞</p>
											</li>
											<li>
												<a href="personal-page.html" target="_blank">
													<img src="image/touxiang.jpg" alt="user-title" class="reco-writer-avatar">
												</a>
												<a class="follow-btn">
													<span class="glyphicon glyphicon-plus"></span>
													关注
												</a>
												<a href="personal-page.html" target="_blank" class="reco-writer-name">德芙</a>
												<p>234k粉丝 · 31K个赞</p>
											</li>
											<li>
												<a href="personal-page.html" target="_blank">
													<img src="image/idol-avatar.jpg" alt="user-title" class="reco-writer-avatar">
												</a>
												<a class="follow-btn">
													<span class="glyphicon glyphicon-plus"></span>
													关注
												</a>
												<a href="personal-page.html" target="_blank" class="reco-writer-name">比尔盖茨</a>
												<p>330k粉丝 · 344.3K个赞</p>
											</li>
										</ul>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- recommend-writer end -->

				</div>
				<div class="col-md-1"></div>
			</div>
			<div class="col md-3"></div>
		</div>
	</div>

	<%@ include file="common/common-js.jsp"%>
	<script src="<%=path%>/js/index.js" type="text/javascript"></script>
</body>
</html>
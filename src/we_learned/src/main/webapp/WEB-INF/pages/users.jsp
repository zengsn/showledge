<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common/tag.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="common/head.jsp"%>
<title>个人主页 - 简随记</title>

<link href="<%=path%>/css/user.css" rel="stylesheet">
<link href="<%=path%>/css/nav.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
	<%@ include file="common/nav.jsp"%>

	<!-- 主要内容 -->
	<div class="container-fluid person">
		<div class="row">
			<div class="col-md-2"></div>

			<div class="col-md-8 main">
				<div class="row">
					<div class="col-md-9">
						<div class="main-top">
							<a href="<%=path%>/users/${user.id}/latest_articles">
								<img class="avatar" src="<%=path%>/${user.userImagePath}" alt="240">
							</a>
							<div class="title">
								<a class="name" href="<%=path%>/users/${user.id}/latest_articles">${user.userName}</a>
							</div>
							<div class="info">
								<ul>
									<li>
										<div class="meta-block">
											<p>${user.userFocusUserNumber}</p>
											<a href="javascript:void(0)">榜样 </a>
										</div>
									</li>
									<li>
										<div class="meta-block">
											<p>${user.userFansNumber}</p>
											<a href="javascript:void(0)">粉丝 </a>
										</div>
									</li>
									<li>
										<div class="meta-block">
											<p>${user.userEssayNumber}</p>
											<a href="javascript:void(0)">文章 </a>
										</div>
									</li>
									<li>
										<div class="meta-block">
											<p>${user.userWordsNumber}</p>
											<div>字数</div>
										</div>
									</li>
									<li>
										<div class="meta-block">
											<p>0</p>
											<a href="javascript:void(0)">知识地图 </a>
										</div>
									</li>
									<li>
										<div class="meta-block">
											<p>${user.userLikesNumber}</p>
											<div>收获喜欢</div>
										</div>
									</li>
									<c:if test="${userIdInSession != user.id}">
										<c:if test="${!user.isFocused}">
											<li>
												<button type="button" id="follow-btn" class="no-focus"
													onclick="userJS.addFocusUser('${user.id}','<%=path%>');">
													<span class="glyphicon glyphicon-plus"></span>
													<span id="focus-mess">关注</span>
												</button>
											</li>
										</c:if>
										<c:if test="${user.isFocused}">
											<li>
												<button type="button" id="follow-btn" class="focus"
													onclick="userJS.removeFocusUser('${user.id}','<%=path%>');">
													<span id="focus-mess">已关注</span>
												</button>
											</li>
										</c:if>
									</c:if>
								</ul>
							</div>
						</div>
						<div id="outer-container">
							<!-- 新.标签导航 -->
							<ul class="nav nav-tabs trigger-menu" role="tablist">
								<li role="presentation" class="active">
									<a href="#my-article" aria-controls="my-article" role="tab" data-toggle="tab">
										<img src="<%=path%>/icon/article.png" alt="icon" class="sub-nav-icon">
										文章
									</a>
								</li>
								<li role="presentation">
									<a href="#my-mindmap" aria-controls="my-mindmap" role="tab" data-toggle="tab">
										<img src="<%=path%>/icon/nav-map.png" alt="icon" class="sub-nav-icon">
										知识地图
									</a>
								</li>
								<li role="presentation">
									<a href="#my-profile" aria-controls="my-profile" role="tab" data-toggle="tab">
										<img src="<%=path%>/icon/id-card.png" alt="icon" class="sub-nav-icon">
										知识简历
									</a>
								</li>
							</ul>

							<!-- 各个标签对应的内容 -->
							<div class="tab-content">
								<div id="my-article" role="tabpanel" class="tab-pane in fade active">
									<div id="list-container">
										<!-- 动态列表模块 -->
										<!-- 发布了文章 -->
										<ul class="note-list">
											<c:forEach items="${essayList}" var="essay" varStatus="status">
												<li>
													<div class="content">
														<div class="author">
															<a class="avatar" href="<%=path%>/users/${user.id}/latest_articles">
																<img thumbnail="180x180" src="<%=path%>/${user.userImagePath}" alt="5">
															</a>
															<div class="name">
																<a class="blue-link" href="<%=path%>/users/${user.id}/latest_articles">${user.userName}</a>
																<span data-type="share_note"> 发表了文章 · ${essay.subEssayTime}</span>
															</div>
														</div>

														<a class="title" href="<%=path%>/essay/${essay.id}">${essay.essayTitle}</a>
														<p class="abstract">${essay.essayContent}</p>

														<div class="meta">
															<a href="<%=path%>/essay/${essay.id}">
																<i class="glyphicon glyphicon-eye-open"></i>
																${essay.essayReadingNumber}
															</a>
															<a href="<%=path%>/essay/${essay.id}">
																<i class="glyphicon glyphicon-comment"></i>
																${essay.essayCommentNumber}
															</a>
															<span>
																<i class="glyphicon glyphicon-heart"></i>
																${essay.essayGoodNumber}
															</span>
														</div>
													</div>
												</li>
											</c:forEach>
										</ul>
									</div>
								</div>

								<!-- my-article end -->
								<div role="tabpanel" class="tab-pane fade" id="my-mindmap">
									<ul class="mindmap-list">
										<c:if test="${kmapList!=null && fn:length(kmapList) > 0}">
											<c:forEach items="${kmapList}" var="kmap">
												<li>
													<img class="mindmap-img" src="<%=path%>/icon/map.png" alt="icon">
													<div class="mindmap-content">
														<a href="<%=path%>/mindmap/${kmap.id}" class="mindmap-title">${kmap.kmapName}</a>
														<p class="mindmap-info">${kmap.kmapDescribe}</p>

														<div class="meta" style="color:#969696;">
															<span>
																<i class="glyphicon glyphicon-eye-open"></i>
																${kmap.kmapLookNumber}
															</span>
															<span>
																<i class="glyphicon glyphicon-heart"></i>
																${kmap.kmapLikeNumber}
															</span>
														</div>
													</div>
												</li>
											</c:forEach>
										</c:if>
									</ul>
								</div>

								<!-- my-mindmap end -->
								<div role="tabpanel" class="tab-pane fade" id="my-profile">
									<div class="profile-box">
										<div class="profile-box-pic">
											<img src="<%=path%>/icon/jianli1.png" alt="icon">
										</div>
										<div class="profile-detail">
											<a href="<%=path%>/resume/${user.id}" target="_blank" class="profile-title">${user.userName}的个人知识简历</a>
											<div class="profile-abstract">
												<span>个人信息：${user.userName}</span>
												<span>联系方式：${user.userPhone}</span>
												<span>联系邮箱：${user.userEmail}</span>
											</div>
											<a href="<%=path%>/resume/${user.id}" target="_blank" id="more-profile-detail">点击查看完整简历
												> </a>
										</div>
									</div>
								</div>
								<!-- my-profile end -->
							</div>
						</div>
					</div>
					<div class="col-md-3 aside">
						<div class="title">个人介绍</div>
						<div class="description">
							<div id="user_introduce" class="js-intro">${user.userIntroduce}</div>
						</div>
						<ul class="list user-dynamic" style="padding-left:0;">
							<li>
								<a href="<%=path%>/users/${user.id}/like">
									<img src="<%=path%>/icon/star.png" alt=".">
									<span>我关注的专题/文集</span>
								</a>
							</li>
							<li>
								<a href="<%=path%>/users/${user.id}/like">
									<img src="<%=path%>/icon/heart.png" style="width:33px;" alt="">
									<span>我喜欢的文章</span>
								</a>
							</li>
						</ul>
						<!-- 专题和文集 -->
						<div>
							<div class="album-title" style="color:#969696;margin-bottom:10px;">我创建的专题</div>
							<!-- 我的专辑列表 -->
							<ul class="album-list">
								<c:forEach items="${corpusList}" var="corpus">
									<li>
										<a href="<%=path%>/notebooks/${corpus.id}/latest" target="_blank">
											<img class="album-pic" src="<%=path%>/${corpus.corpusImagePath}" alt="专辑缩略图">
										</a>
										<a class="album-name" href="<%=path%>/notebooks/${corpus.id}/latest" target="_blank">${corpus.corpusName}</a>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
					<!-- aside end -->
				</div>
			</div>
			<!-- main end -->

			<div class="col-md-2"></div>
		</div>
		<!-- row end -->
	</div>
	<!-- container end -->

	<%@ include file="common/common-js.jsp"%>
	<script src="<%=path%>/js/user.js"></script>
</body>
</html>
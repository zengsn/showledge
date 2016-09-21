<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="common/tag.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<%@include file="common/head.jsp"%>
<title>我喜欢的   | 简随记 - 简随记</title>
</head>

<body class="output no-fluid zh cn win reader-day-mode reader-font2" data-locale="zh-CN"
	data-js-module="recommendation">
	<%@include file="common/login.jsp"%>
	<div class="container">
		<div class="favorite">
			<div class="recommended">
				<h2 class="page-title">我喜欢的文章</h2>
				<ul class="like-article article-list" data-js-module="user-favourites">
					<c:forEach items="${essayList}" var="essay">
						<li class="have-img">
							<a class="wrap-img" href="essay/${essay.id}">
								<img src="images/index/1480410-dc9d2be35d880969.png" alt="300">
							</a>
							<div>
								<p class="list-top">
									<a class="author-name blue-link" target="_blank" href="users/${essay.userName}">${essay.userName}</a>
									<em>·</em> <span class="time">${essay.subEssayTime}</span>
								</p>
								<h4 class="title">
									<a target="_blank" href="essay/${essay.id}">${essay.essayTitle}</a>
								</h4>
								<div class="list-footer">
									<span>阅读 ${essay.essayReadingNumber}</span> <span>· 评论 ${essay.essayReadingNumber}</span> <span>·
										喜欢 ${essay.essayGoodNumber}</span>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>

	<%@include file="common/common-js.jsp"%>
</body>
</html>
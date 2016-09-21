<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="common/tag.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<%@include file="common/head.jsp"%>
<title>${user.userName} - 简随记</title>
</head>

<body class="user output zh cn win reader-day-mode reader-font2 " data-js-module="user-show"
	data-locale="zh-CN">
	<c:if test="${userIdInSession == null}">
		<%@include file="common/no-login.jsp"%>
	</c:if>
	<c:if test="${userIdInSession != null}">
		<%@include file="common/login.jsp"%>
	</c:if>
	<div class="row-fluid">
		<%@include file="common/user-tag.jsp"%>
		<!-- content -->
		<div class="span9 offset3 recent-post relationships">
			<!-- navigation -->
			<ul class="nav nav-tabs nav-relationships">
				<li class="active">
					<a data-pjax="list-container" href="<%=path%>/users/${user.id}/subscriptions">关注专题/文集(${user.userFocusCorpusNumber})</a>
				</li>
				<li class="">
					<a data-pjax="list-container" href="<%=path%>/users/${user.id}/following" hidefocus="true"
						onFocus="this.blur()">关注用户(${user.userFocusUserNumber})</a>
				</li>
				<li class="">
					<a data-pjax="list-container" href="<%=path%>/users/${user.id}/followers" hidefocus="true"
						onFocus="this.blur()">粉丝(${user.userFansNumber})</a>
				</li>
			</ul>
			<div class="tab-content">
				<div id="list-container" class="tab-pane active">
					<ul class="subscribing">
						<c:forEach items="${corpusFocusList}" var="corpusFocus" varStatus="status">
							<li>
								<div class="avatar">
									<i class="fa fa-th"></i>
								</div>
								<c:if test="${!corpusFocus.isUserFocused}">
									<div id="focus_at_corpus_${status.index}" class="btn btn-success follow">
										<a id="focus_at_corpus_a_${status.index}" hidefocus="true" onFocus="this.blur()"
											onclick="subscribeJS.addFocusCorpusAtUserCorpusLi(${status.index}, ${corpusFocus.id}, '<%=path%>');">
											<i id="focus_at_corpus_i_${status.index}" class="fa fa-fw fa-plus"></i>
											<span> 添加关注</span>
										</a>
										<span></span>
									</div>
								</c:if>
								<c:if test="${corpusFocus.isUserFocused}">
									<div id="focus_at_corpus_${status.index}" class="btn follow following">
										<a id="focus_at_corpus_a_${status.index}" hidefocus="true" onFocus="this.blur()"
											onclick="subscribeJS.removeFocusCorpusAtUserCorpusLi(${status.index}, ${corpusFocus.id}, '<%=path%>');">
											<i id="focus_at_corpus_i_${status.index}" class="fa fa-fw fa-check"></i>
											<span> 正在关注</span>
										</a>
										<span></span>
									</div>
								</c:if>
								<h4>
									<a href="<%=path%>/notebooks/${corpusFocus.id}/latest">${corpusFocus.corpusName}</a>
								</h4>
								<p class="article-info author-info">
									<!-- <a href="">简随记</a> -->
									共收录了 ${corpusFocus.essayNumber} 篇文章, ${corpusFocus.userFocusNumber} 人关注
								</p>
							</li>
						</c:forEach>
						<!-- <div class="hidden">
							<div class="pagination">
								<ul class="pagination">
									<li class="first">
										<a data-remote="true"
											href="http://www.jianshu.com/users/8f4f698c32fa/following?_=1472554613455">首页</a>
									</li>
									<li class="prev">
										<a rel="prev" data-remote="true"
											href="http://www.jianshu.com/users/8f4f698c32fa/following?_=1472554613455">上一页</a>
									</li>
									<li class="">
										<a rel="prev" data-remote="true"
											href="http://www.jianshu.com/users/8f4f698c32fa/following?_=1472554613455">1</a>
									</li>
									<li class=" active">
										<a data-remote="true" href="javascript:null;">2</a>
									</li>
									<li class="">
										<a rel="next" data-remote="true"
											href="http://www.jianshu.com/users/8f4f698c32fa/following?_=1472554613455&amp;page=3">3</a>
									</li>
									<li class="">
										<a data-remote="true"
											href="http://www.jianshu.com/users/8f4f698c32fa/following?_=1472554613455&amp;page=4">4</a>
									</li>
									<li class="">
										<a data-remote="true"
											href="http://www.jianshu.com/users/8f4f698c32fa/following?_=1472554613455&amp;page=5">5</a>
									</li>
									<li class="">
										<a data-remote="true"
											href="http://www.jianshu.com/users/8f4f698c32fa/following?_=1472554613455&amp;page=6">6</a>
									</li>
									<li class="next">
										<a rel="next" data-remote="true"
											href="http://www.jianshu.com/users/8f4f698c32fa/following?_=1472554613455&amp;page=3">下一页</a>
									</li>
									<li class="last">
										<a data-remote="true"
											href="http://www.jianshu.com/users/8f4f698c32fa/following?_=1472554613455&amp;page=12">终页</a>
									</li>
								</ul>
							</div>
						</div> -->
				</div>
			</div>
		</div>

		<%@include file="common/common-js.jsp"%>
		<script src="<%=path%>/js/subscribe.js" type="text/javascript"></script>
		<script src="<%=path%>/js/user.js" type="text/javascript"></script>
</body>
</html>
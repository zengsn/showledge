<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="common/tag.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<%@include file="common/head.jsp"%>
<title>简随记</title>
</head>

<body class="output fluid zh cn win reader-day-mode reader-font2 " data-js-module=""
	data-locale="zh-CN">
	<c:if test="${userIdInSession == null}">
		<%@include file="common/no-login.jsp"%>
	</c:if>
	<c:if test="${userIdInSession != null}">
		<%@include file="common/login.jsp"%>
	</c:if>
	<div class="row-fluid">
		<div class="search-page" data-js-module="search-show">
			<div class="span3">
				<ul class="nav nav-list">
					<li id="essay_li" data-type="notes" class="active">
						<a href="javascript:void(0)" onclick="searchJS.searchEssay('<%=path%>/', 1);">文章</a>
					</li>
					<li id="corpus_li" data-type="notebooks" class="">
						<a href="javascript:void(0)" onclick="searchJS.searchCorpus('<%=path%>/', 1);">文集</a>
					</li>
					<li id="user_li" data-type="users" class="">
						<a href="javascript:void(0)" onclick="searchJS.searchUser('<%=path%>/', 1);">作者</a>
					</li>
				</ul>
			</div>
			<div class="span7">
				<div class="page-title clearfix">
					<div class="input-prepend pull-right">
						<form>
							<div class="btn-group">
								<button id="choose_button_content" class="btn dropdown-toggle" data-toggle="dropdown"
									type="button">
									文章
									<span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li id="choose_essay_li" data-type="notes" style="display: none;">
										<a href="javascript:void(0)" onclick="searchJS.showEssayButton()">文章</a>
									</li>
									<li id="choose_corpus_li" data-type="notebooks">
										<a href="javascript:void(0)" onclick="searchJS.showCorpusButton()">文集</a>
									</li>
									<li id="choose_user_li" data-type="users">
										<a href="javascript:void(0)" onclick="searchJS.showUserButton()">作者</a>
									</li>
								</ul>
							</div>
							<input id="hideSearchKeyword" type="hidden" value="${searchKeyword}">
							<input id="searchKeyword" name="searchKeyword" type="search" placeholder="搜索"
								class="input-medium"
								onkeypress="if(event.keyCode==13) {searchJS.search('<%=path%>/');return false;}">
							<span class="search_trigger">
								<i class="fa fa-search" onclick="searchJS.search('<%=path%>/');"></i>
							</span>
						</form>
					</div>
				</div>
				<div class="search-results-container">
					<ul id="search_ul" class="unstyled list">
						<c:forEach items="${pageParam.data}" var="essay" varStatus="status">
							<li>
								<h4 class="title">
									<a href="<%=path%>/essay/${essay.id}" target="_blank">
										<i class="fa fa-file-text"></i>${essay.essayTitle}</a>
								</h4>
								<p>${essay.essayContent}</p>
								<div class="list-footer">
									<a href="<%=path%>/users/${essay.userName}">${essay.userName}</a>
									<span>· 阅读 ${essay.essayReadingNumber}</span>
									<span>· 评论 ${essay.essayCommentNumber}</span>
									<span>· 喜欢 ${essay.essayGoodNumber}</span>
									·
									<span>${essay.subEssayTime}</span>
								</div>
							</li>
						</c:forEach>
					</ul>
					<c:if test="${pageParam.data.size() == 0 || pageParam.data == null}">
						<div id="no_find" class="no-results text-center">
							<i class="fa fa-search fa-2x"></i>
							<h5>未找到相关内容</h5>
						</div>
					</c:if>
					<c:if test="${pageParam.data.size() != 0}">
						<div id="no_find" class="no-results text-center" style="display: none">
							<i class="fa fa-search fa-2x"></i>
							<h5>未找到相关内容</h5>
						</div>
					</c:if>
					<div class="pagination">
						<ul id="page-btn">
							<c:if test="${pageParam.data.size() > 6}">
								<li class="active">
									<a href="javascript:void(0)" onclick="searchJS.searchEssay('<%=path%>/', 1)">1</a>
								</li>
							</c:if>

							<c:if test="${pageParam.totalPage > 1 && pageParam.totalPage < 10}">
								<c:forEach var="p" begin="2" end="${pageParam.totalPage}">
									<li>
										<a href="javascript:void(0)" onclick="searchJS.searchEssay('<%=path%>/', ${p})">${p}</a>
									</li>
								</c:forEach>
								<li id="${pageParam.currentPage + 1}">
									<a href="javascript:void(0)" onclick="searchJS.searchEssay('<%=path%>/', ${pageParam.currentPage + 1})">下一页</a>
								</li>
							</c:if>

							<c:if test="${pageParam.totalPage > 10}">
								<c:forEach var="p" begin="2" end="10">
									<li data-page="${p}">
										<a href="javascript:void(0)" onclick="searchJS.searchEssay('<%=path%>/', ${p})">${p}</a>
									</li>
								</c:forEach>
								<li id="${pageParam.currentPage + 1}">
									<a href="javascript:void(0)" onclick="searchJS.searchEssay('<%=path%>/', ${pageParam.currentPage + 1})">下一页</a>
								</li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="common/common-js.jsp"%>
	<script src="<%=path%>/js/search.js"></script>
</body>
</html>
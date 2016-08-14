<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,user-scalable=no">
<meta http-equiv="Cache-Control" content="no-siteapp">

<title>简随记</title>

<link href="css/css_1.css" rel="stylesheet" media="all">
<link href="css/css_2.css" rel="stylesheet" media="all">
<link href="css/css_3.css" rel="stylesheet" media="all">

<link href="images/favicon.ico" rel="icon">

<script src="js/js_1.js"></script>
<script src="js/vue.js"></script>
<script src="js/my-vue.js"></script>
<script src="js/search.js"></script>
</head>

<body class="output fluid zh cn win reader-day-mode reader-font2 "
	data-js-module="" data-locale="zh-CN" id="my-vueJS">
	<c:if test="${userNameInSession == null}">
		<div class="wrap-btn">
			<div class="article-related pull-left">
				<a class="collection-menu-btn" data-toggle="modal"
					data-target="#collection-menu" href="javascript:void(null);"> <i
					class="fa fa-th"></i>
				</a> <a class="notebooks-menu-btn" data-toggle="modal"
					data-target="#notebooks-menu" href="javascript:void(null);"><i
					class="fa fa-list-ul"></i></a>
				<div class="related-avatar-group activities"></div>
			</div>
			<a class="login" data-signup-link="true" data-toggle="modal"
				href="register.html"> <i class="fa fa-user"></i> 注册
			</a> <a class="login" data-signin-link="true" data-toggle="modal"
				href="login.html"> <i class="fa fa-sign-in"></i> 登录
			</a>
		</div>
	</c:if>
	<c:if test="${userNameInSession != null}">
		<div class="navbar-user">
			<a class="user avatar" data-toggle="dropdown"
				href="javascript:void(0)"> <img src="${userImagePathInSession}"
				alt="11"> <b class="caret"></b>
			</a>
			<ul class="dropdown-menu arrow-top" role="menu"
				aria-labelledby="dLabel">
				<li><a href="writer.html"><i class="fa fa-pencil"></i> 写文章</a></li>
				<li><a target="_blank" href=""><i class="fa fa-user"></i>
						我的主页</a></li>
				<li><a href=""> <i class="fa fa-heart"></i> 我喜欢的
				</a></li>
				<li><a href=""> <i class="fa fa-bookmark"></i> 我的收藏
				</a></li>
				<li><a href=""> <i class="fa fa-bell"></i> 提醒
				</a></li>
				<li><a href=""> <i class="fa fa-envelope"></i> 简信
				</a></li>
				<li><a href="setting.html"><i class="fa fa-cogs"></i> 设置</a></li>
				<li><a href=""> <i class="fa fa-credit-card"></i> 钱包
				</a></li>
				<li class="dropdown-submenu"><a tabindex="-1" href=""><i
						class="fa fa-question-circle"></i> 帮助</a>
					<ul class="dropdown-menu">
						<li><a href="" target="_blank">帮助中心</a></li>
						<li><a target="_blank" href="">联系我们</a></li>
					</ul></li>
				<li><a rel="nofollow" data-method="DELETE" href="logout.do">
						<i class="fa fa-sign-out"></i> 登 出
				</a></li>
			</ul>
			<a class="daytime set-view-mode pull-right" href="javascript:void(0)"><i
				class="fa fa-moon-o"></i></a>
		</div>
	</c:if>
	<c:if test="${userNameInSession == null}">
		<my-nologin-sidebar></my-nologin-sidebar>
	</c:if>
	<c:if test="${userNameInSession != null}">
		<div class="navbar navbar-jianshu expanded">
			<div class="dropdown">
				<a class="active logo" role="button" data-original-title="个人主页"
					data-container="div.expanded" href="index.html"> <b>简</b><i
					class="fa fa-home"></i><span class="title">首页</span>
				</a> <a data-toggle="tooltip" data-placement="right"
					data-original-title="专题" data-container="div.expanded" href="">
					<i class="fa fa-th"></i><span class="title">专题</span>
				</a> <a data-toggle="tooltip" data-placement="right"
					data-original-title="简友圈" data-container="div.expanded" href="">
					<i class="fa fa-users"></i><span class="title">简友圈</span>
				</a> <a data-toggle="tooltip" data-placement="right"
					data-original-title="写文章" data-container="div.expanded"
					href="writer.html"> <i class="fa fa-pencil"></i><span
					class="title">写文章</span>
			</div>
			<div class="nav-user">
				<a data-toggle="tooltip" data-placement="right"
					data-original-title="我的主页" data-container="div.expanded" href="">
					<i class="fa fa-user"></i><span class="title">我的主页</span>
				</a> <a data-toggle="tooltip" data-placement="right"
					data-original-title="我的收藏" data-container="div.expanded" href="">
					<i class="fa fa-bookmark"></i><span class="title">我的收藏</span>
				</a> <a data-toggle="tooltip" data-placement="right"
					data-original-title="提醒" data-container="div.expanded" href="">
					<i id="notify-icon" class="fa fa-bell"></i><span class="title">提醒</span>
				</a> <a data-toggle="tooltip" data-placement="right"
					data-original-title="简信" data-container="div.expanded" href="">
					<i id="chat-message-icon" class="fa fa-envelope"></i><span
					class="title">简信</span>
				</a> <a href="" data-toggle="modal"><i class="fa fa-font"></i><span
					class="title">显示模式</span></a> <a data-toggle="tooltip"
					data-placement="right" data-original-title="设置"
					data-container="div.expanded" href="setting.html"> <i
					class="fa fa-cogs"></i><span class="title">设置</span>
				</a> <a data-toggle="tooltip" data-placement="right"
					data-original-title="登 出" data-container="div.expanded"
					rel="nofollow" data-method="delete" href="logout.do"> <i
					class="fa fa-sign-out"></i><span class="title">登 出</span>
				</a>
			</div>
		</div>
	</c:if>

	<div class="row-fluid">
		<div class="search-page" data-js-module="search-show">
			<div class="span3">
				<ul class="nav nav-list">
					<li id="essay_li" data-type="notes" class="active"><a
						href="javascript:void(0)" onclick="searchEssay();">文章</a></li>
					<li id="corpus_li" data-type="notebooks" class=""><a
						href="javascript:void(0)" onclick="searchCorpus();">文集</a></li>
					<li id="user_li" data-type="users" class=""><a
						href="javascript:void(0)" onclick="searchUser();">作者</a></li>
				</ul>
			</div>

			<div class="span7">
				<div class="page-title clearfix">
					<div class="input-prepend pull-right">
						<form>
							<div class="btn-group">
								<button id="choose_button_content" class="btn dropdown-toggle"
									data-toggle="dropdown" type="button">
									文章 <span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li id="choose_essay_li" data-type="notes"
										style="display: none;"><a href="javascript:void(0)"
										onclick="showEssayButton()">文章</a></li>
									<li id="choose_corpus_li" data-type="notebooks"><a
										href="javascript:void(0)" onclick="showCorpusButton()">文集</a></li>
									<li id="choose_user_li" data-type="users"><a
										href="javascript:void(0)" onclick="showUserButton()">作者</a></li>
								</ul>
							</div>
							<input id="hideSearchKeyword" type="hidden"
								value="${searchKeyword}"> <input id="searchKeyword"
								name="searchKeyword" type="search" placeholder="搜索"
								class="input-medium"
								onkeypress="if(event.keyCode==13) {search();return false;}">
							<span class="search_trigger"><i class="fa fa-search"
								onclick="search();"></i></span>
						</form>
					</div>
				</div>

				<div class="search-results-container">
					<ul id="search_ul" class="unstyled list">
						<c:forEach items="${essayList}" var="essay" varStatus="status">
							<li>
								<h4 class="title">
									<a href="" target="_blank"> <i class="fa fa-file-text"></i>
										${essay.essayTitle}
									</a>
								</h4>
								<p>${essay.essayContent}</p>
								<div class="list-footer">
									<a href="http://www.jianshu.com/users/0316c0b011b1">${essay.userName}</a>
									<a href="http://www.jianshu.com/p/c83e312e0703">· 阅读
										${essay.essayReadingNumber}</a> <a target="_blank"
										href="http://www.jianshu.com/p/c83e312e0703#comments">· 评论
										${essay.essayCommentNumber}</a> <span>·
										喜欢${essay.essayGoodNumber} </span> · <span data-timeago=""
										title="2015-05-17T03:57:08.000Z">大约1年之前</span>
								</div>
							</li>
						</c:forEach>
					</ul>
					<c:if test="${essayList.size() == 0 || essayList == null}">
						<div id="no_find" class="no-results text-center">
							<i class="fa fa-search fa-2x"></i>
							<h5>未找到相关内容</h5>
						</div>
					</c:if>
					<c:if test="${essayList.size() != 0}">
						<div id="no_find" class="no-results text-center"
							style="display: none">
							<i class="fa fa-search fa-2x"></i>
							<h5>未找到相关内容</h5>
						</div>
					</c:if>
					<!-- <div class="pagination">
						<ul>
							Prev
							On the left
							<li class="active"><a href="javascript:void(null)">1</a></li>
							On the right
							<li data-page="2"><a href="javascript:void(null)">2</a></li>
							<li data-page="3"><a href="javascript:void(null)">3</a></li>
							<li data-page="4"><a href="javascript:void(null)">4</a></li>
							<li data-page="5"><a href="javascript:void(null)">5</a></li>
							<li data-page="6"><a href="javascript:void(null)">6</a></li>
							<li data-page="7"><a href="javascript:void(null)">7</a></li>
							<li data-page="8"><a href="javascript:void(null)">8</a></li>
							<li data-page="9"><a href="javascript:void(null)">9</a></li>
							<li data-page="10"><a href="javascript:void(null)">10</a></li>
							Next
							<li data-page="2"><a href="javascript:void(null)">下一页</a></li>
						</ul>
					</div> -->
				</div>
			</div>
		</div>
	</div>

	<div id="flash" class="hide"></div>

	<div id="view-mode-modal" tabindex="-1" class="modal hide read-modal"
		aria-hidden="false" data-js-module="view-mode-modal">
		<div class="btn-group change-background" data-toggle="buttons-radio">

			<a class="btn btn-daytime active" data-mode="day" data-remote="true"
				rel="nofollow" data-method="put"
				href="http://www.jianshu.com/preferences?read_mode=day"> <i
				class="fa fa-sun-o"></i>
			</a> <a class="btn btn-nighttime " data-mode="night" data-remote="true"
				rel="nofollow" data-method="put"
				href="http://www.jianshu.com/preferences?read_mode=night"> <i
				class="fa fa-moon-o"></i>
			</a>
		</div>
		<div class="btn-group change-font" data-toggle="buttons-radio">
			<a class="btn font " data-font="font1" data-remote="true"
				rel="nofollow" data-method="put"
				href="http://www.jianshu.com/preferences?default_font=font1">宋体</a>
			<a class="btn font hei active" data-font="font2" data-remote="true"
				rel="nofollow" data-method="put"
				href="http://www.jianshu.com/preferences?default_font=font2">黑体</a>
		</div>
		<div class="btn-group change-locale" data-toggle="buttons-radio">
			<a class="btn font active" data-locale="zh-CN" data-remote="true"
				rel="nofollow" data-method="put"
				href="http://www.jianshu.com/preferences/set_locale?locale=zh-CN">简</a>
			<a class="btn font hei " data-locale="zh-TW" data-remote="true"
				rel="nofollow" data-method="put"
				href="http://www.jianshu.com/preferences/set_locale?locale=zh-TW">繁</a>
		</div>
	</div>
</body>
</html>
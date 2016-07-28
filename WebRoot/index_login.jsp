<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta content="IE=11.0000" http-equiv="X-Ua-Compatible">
<meta charset="utf-8">
<meta http-equiv="X-Ua-Compatible" content="iE=Edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,user-scalable=no">

<title>简笔记</title>

<link href="css/css_1.css" rel="stylesheet" media="all">
<link href="css/css_2.css" rel="stylesheet" media="all">
<link href="css/css_3.css" rel="stylesheet" media="all">

<link href="img/favicon.ico" rel="icon">
<link href="img/img_1.png" rel="apple-touch-icon-precomposed"
	sizes="57x57">
<link href="img/img_2.png" rel="apple-touch-icon-precomposed"
	sizes="72x72">
<link href="img/img_3.png" rel="apple-touch-icon-precomposed"
	sizes="76x76">
<link href="img/img_4.png" rel="apple-touch-icon-precomposed"
	sizes="114x114">
<link href="img/img_5.png" rel="apple-touch-icon-precomposed"
	sizes="120x120">
<link href="img/img_6.png" rel="apple-touch-icon-precomposed"
	sizes="152x152">

<script src="js/js_6.js"></script>
<script src="js/vue.js"></script>
<script src="js/my-vue.js"></script>
</head>

<body class="output fluid zh cn win reader-day-mode reader-font2"
	data-js-module="recommendation" data-locale="zh-CN" id="my-vueJS"
	v-cloak>
	<div class="navbar-user">
		<a class="user avatar" data-toggle="dropdown"
			href="javascript:void(0)"> <img
			src="img/index_login/11-bfaf6775ca414a8854c9ca910e05b7a1.jpg"
			alt="11"> <b class="caret"></b>
		</a>
		<ul class="dropdown-menu arrow-top" role="menu"
			aria-labelledby="dLabel">
			<li><a href="writer.jsp"><i class="fa fa-pencil"></i> 写文章</a></li>
			<li><a target="_blank"
				href="http://www.jianshu.com/users/af5e3096ebc7"><i
					class="fa fa-user"></i> 我的主页</a></li>
			<li><a href="http://www.jianshu.com/favourites"> <i
					class="fa fa-heart"></i> 我喜欢的
			</a></li>
			<li><a href="http://www.jianshu.com/bookmarks"> <i
					class="fa fa-bookmark"></i> 我的收藏
			</a></li>
			<li><a href="http://www.jianshu.com/notifications"> <i
					class="fa fa-bell"></i> 提醒
			</a></li>
			<li><a href="http://www.jianshu.com/chats"> <i
					class="fa fa-envelope"></i> 简信
			</a></li>
			<li><a
				href="print_setting?user.name=<s:property value="user.name" />"><i
					class="fa fa-cogs"></i> 设置</a></li>
			<li><a href="http://www.jianshu.com/wallet"> <i
					class="fa fa-credit-card"></i> 钱包
			</a></li>
			<li class="dropdown-submenu"><a tabindex="-1"
				href="http://www.jianshu.com/#"><i class="fa fa-question-circle"></i>
					帮助</a>
				<ul class="dropdown-menu">
					<li><a href="http://www.jianshu.com/notebooks/547/latest"
						target="_blank">帮助中心</a></li>
					<li><a target="_blank" href="http://www.jianshu.com/contact">联系我们</a></li>
				</ul></li>
			<li><a rel="nofollow" data-method="DELETE"
				href="http://www.jianshu.com/sign_out"> <i
					class="fa fa-sign-out"></i> 登 出
			</a></li>
		</ul>
	</div>
	<div class="navbar navbar-jianshu expanded">
		<div class="dropdown">
			<a class="active logo" role="button" data-original-title="个人主页"
				data-container="div.expanded" href="http://www.jianshu.com/"> <b>简</b><i
				class="fa fa-home"></i><span class="title">首页</span>
			</a> <a data-toggle="tooltip" data-placement="right"
				data-original-title="专题" data-container="div.expanded"
				href="http://www.jianshu.com/collections"> <i class="fa fa-th"></i><span
				class="title">专题</span>
			</a> <a data-toggle="tooltip" data-placement="right"
				data-original-title="简友圈" data-container="div.expanded"
				href="http://www.jianshu.com/timeline"> <i class="fa fa-users"></i><span
				class="title">简友圈</span>
			</a> <a data-toggle="tooltip" data-placement="right"
				data-original-title="写文章" data-container="div.expanded"
				href="http://www.jianshu.com/writer#/"> <i class="fa fa-pencil"></i><span
				class="title">写文章</span>
		</div>
		<div class="nav-user">
			<a data-toggle="tooltip" data-placement="right"
				data-original-title="我的主页" data-container="div.expanded"
				href="http://www.jianshu.com/users/af5e3096ebc7"> <i
				class="fa fa-user"></i><span class="title">我的主页</span>
			</a> <a data-toggle="tooltip" data-placement="right"
				data-original-title="我的收藏" data-container="div.expanded"
				href="http://www.jianshu.com/bookmarks"> <i
				class="fa fa-bookmark"></i><span class="title">我的收藏</span>
			</a> <a data-toggle="tooltip" data-placement="right"
				data-original-title="提醒" data-container="div.expanded"
				href="http://www.jianshu.com/notifications"> <i id="notify-icon"
				class="fa fa-bell"></i><span class="title">提醒</span>
			</a> <a data-toggle="tooltip" data-placement="right"
				data-original-title="简信" data-container="div.expanded"
				href="http://www.jianshu.com/chats"> <i id="chat-message-icon"
				class="fa fa-envelope"></i><span class="title">简信</span>
			</a> <a href="http://www.jianshu.com/#view-mode-modal"
				data-toggle="modal"><i class="fa fa-font"></i><span
				class="title">显示模式</span></a> <a data-toggle="tooltip"
				data-placement="right" data-original-title="设置"
				data-container="div.expanded"
				href="print_setting?<s:property value="user.name" />"> <i
				class="fa fa-cogs"></i><span class="title">设置</span>
			</a> <a data-toggle="tooltip" data-placement="right"
				data-original-title="登 出" data-container="div.expanded"
				rel="nofollow" data-method="delete"
				href="http://www.jianshu.com/sign_out"> <i
				class="fa fa-sign-out"></i><span class="title">登 出</span>
			</a>
		</div>
	</div>
	<div class="row-fluid">
		<div class="recommended">
			<my-min-pic-bar></my-min-pic-bar>
			<div class="span7 offset3">
				<div class="page-title" style="width: 705px;">
					<ul class="recommened-nav navigation clearfix"
						data-container="#list-container" data-loader=".loader-tiny"
						data-user-slug="af5e3096ebc7">
						<!-- 用户未订阅专题或人，或者未完成订阅 or 用户订阅列表已准备就绪 -->
						<li data-name="recommended_notes" class="active"><a
							data-pjax="true" href="http://www.jianshu.com/trending/now"><i
								class="fa fa-bars"></i> 发现</a></li>
						<li data-name="subscription_notes" class=""><a
							data-pjax="true" href="http://www.jianshu.com/subscription_notes"><i
								class="fa fa-bars"></i> 关注</a></li>
						<li class="bonus disabled"><a
							href="http://www.jianshu.com/zodiac/2015">2015精选</a></li>
						<img class="hide loader-tiny" src="img/index_login/tiny.gif"
							alt="Tiny">
						<li class="search">
							<form class="search-form" target="_blank"
								action="http://www.jianshu.com/search" accept-charset="UTF-8"
								method="get">
								<input name="utf8" type="hidden" value="✓"> <input
									type="search" name="q" id="q" placeholder="搜索"
									class="input-medium search-query"> <span
									class="search_trigger" onclick=""><i
									class="fa fa-search"></i></span>
							</form>
						</li>
					</ul>
				</div>
				<div id="list-container">
					<my-navigation-bar></my-navigation-bar>
					<ul class="article-list thumbnails">
						<s:iterator value="#request.postsList" var="post" status="status">
							<!--value为Action中返回的List对象名，id随便给名称-->
							<%
								request.setCharacterEncoding("UTF-8");
							%>
							<li class="have-img"><a class="wrap-img"
								href="http://www.jianshu.com/p/1ff4aa74163d"><img
									src="img/index_login/1881750-f2d078e8e34bbd1b.jpg" alt="300"></a>
								<div>
									<p class="list-top">
										<a class="author-name blue-link" target="_blank"
											href="http://www.jianshu.com/users/4ba7e1c34d90"><s:property
												value="#post.userName" /></a> <em>·</em> <span class="time"
											data-shared-at="2016-07-13T09:59:07+08:00">大约6小时之前</span>
									</p>
									<h4 class="title">
										<a target="_blank"
											href="post_detail?post.postTitle=<s:property
												value="#post.postTitle" />&post.postTime=<s:property
												value="#post.postTime" />"><s:property
												value="#post.postTitle" /></a>
									</h4>
									<div class="list-footer">
										<a target="_blank"
											href="http://www.jianshu.com/p/1ff4aa74163d"> 阅读 <s:property
												value="#post.readingsNumber" />
										</a> <a target="_blank"
											href="http://www.jianshu.com/p/1ff4aa74163d#comments"> ·
											评论 <s:property value="#post.commentsNumber" />
										</a> <span> · 喜欢 <s:property value="#post.goodsNumber" /></span>
									</div>
								</div></li>
						</s:iterator>
						<li class="have-img"><a class="wrap-img"
							href="http://www.jianshu.com/p/1ff4aa74163d"><img
								src="img/index_login/1881750-f2d078e8e34bbd1b.jpg" alt="300"></a>
							<div>
								<p class="list-top">
									<a class="author-name blue-link" target="_blank"
										href="http://www.jianshu.com/users/4ba7e1c34d90">虫儿飞2222</a> <em>·</em>
									<span class="time" data-shared-at="2016-07-13T09:59:07+08:00">大约6小时之前</span>
								</p>
								<h4 class="title">
									<a target="_blank" href="http://www.jianshu.com/p/1ff4aa74163d">从学渣到英语学霸的蜕变史</a>
								</h4>
								<div class="list-footer">
									<a target="_blank" href="http://www.jianshu.com/p/1ff4aa74163d">
										阅读 8907 </a> <a target="_blank"
										href="http://www.jianshu.com/p/1ff4aa74163d#comments"> ·
										评论 163 </a> <span> · 喜欢 673</span>
								</div>
							</div></li>
						<li class="have-img"><a class="wrap-img"
							href="http://www.jianshu.com/p/a48bcd781fab"><img
								src="img/index_login/1961227-80fc24aa0416e0bf.jpg" alt="300"></a>
							<div>
								<p class="list-top">
									<a class="author-name blue-link" target="_blank"
										href="http://www.jianshu.com/users/02505ce4d220">奇奇境界</a> <em>·</em>
									<span class="time" data-shared-at="2016-07-11T23:14:51+08:00">1天之前</span>
								</p>
								<h4 class="title">
									<a target="_blank" href="http://www.jianshu.com/p/a48bcd781fab">潇洒离职前
										请先看看这里</a>
								</h4>
								<div class="list-footer">
									<a target="_blank" href="http://www.jianshu.com/p/a48bcd781fab">
										阅读 2977 </a> <a target="_blank"
										href="http://www.jianshu.com/p/a48bcd781fab#comments"> ·
										评论 35 </a> <span> · 喜欢 122</span>
								</div>
							</div></li>

						<li class="have-img"><a class="wrap-img"
							href="http://www.jianshu.com/p/cbb2f094572d"><img
								src="img/index_login/2007654-cd34c7b0250478b2.jpg" alt="300"></a>
							<div>
								<p class="list-top">
									<a class="author-name blue-link" target="_blank"
										href="http://www.jianshu.com/users/6fba959c5af0">红尘笑笑生</a> <em>·</em>
									<span class="time" data-shared-at="2016-07-12T20:47:54+08:00">大约19小时之前</span>
								</p>
								<h4 class="title">
									<a target="_blank" href="http://www.jianshu.com/p/cbb2f094572d">别说瘦身太难，我亲历的3个方法总有一款适合你（男女通用）
									</a>
								</h4>
								<div class="list-footer">
									<a target="_blank" href="http://www.jianshu.com/p/cbb2f094572d">
										阅读 3025 </a> <a target="_blank"
										href="http://www.jianshu.com/p/cbb2f094572d#comments"> ·
										评论 29 </a> <span> · 喜欢 103</span> <span> · 打赏 1</span>
								</div>
							</div></li>
					</ul>
					<div class="load-more">
						<button class="ladda-button " data-style="slide-left"
							data-type="script" data-remote="" data-size="medium"
							data-color="maleskine" data-method="get">
							<span class="ladda-label">点击查看更多</span> <span
								class="ladda-spinner"></span>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
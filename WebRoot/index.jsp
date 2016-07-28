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

<script src="js/vue.js"></script>
<script src="js/my-vue.js"></script>
</head>

<body class="output fluid zh cn win reader-day-mode reader-font2"
	data-locale="zh-CN" data-js-module="recommendation" id="my-vueJS"
	v-cloak>
	<my-nologin-sidebar></my-nologin-sidebar>
	<div class="row-fluid">
		<div class="recommended">
			<my-min-pic-bar></my-min-pic-bar>
			<div class="span7 offset3">
				<div class="page-title">
					<ul class="recommened-nav navigation clearfix"
						data-container="#list-container" data-loader=".loader-tiny">
						<li class="active"><A
							href="http://www.jianshu.com/trending/now" data-pjax="true">发现</A>
						</li>
						<li class="bonus"><A
							href="http://www.jianshu.com/zodiac/2015"><I
								class="fa fa-bars"></I> 2015精选</A></li>
						<li class="search">
							<form class="search-form" action="" method="post" target="_blank"
								accept-charset="UTF-8">
								<input name="q" class="input-medium search-query" type="search"
									placeholder="搜索" value=""> <span class="search_trigger"
									onclick=""><I class="fa fa-search"></I></span>
							</form>
						</li>
					</ul>
				</div>
				<div id="list-container">
					<my-navigation-bar></my-navigation-bar>
					<ul class="article-list thumbnails">
						<li class="have-img"><A class="wrap-img"
							href="http://www.jianshu.com/p/cb254b7647d7"><img alt="300"
								src="img/index/1480410-dc9d2be35d880969.png"></A>
							<div>
								<P class="list-top">
									<A class="author-name blue-link"
										href="http://www.jianshu.com/users/db6171d91553"
										target="_blank">丧心病狂的小坚果儿</A> <EM>·</EM> <span class="time"
										data-shared-at="2016-07-10T14:43:28+08:00"></span>
								</P>
								<H4 class="title">
									<A href="http://www.jianshu.com/p/cb254b7647d7" target="_blank">这些含金量十足的英语证书你一定要考！吐血整理（附真题、答案及听力音频下载）</A>
								</H4>
								<div class="list-footer">
									<A href="http://www.jianshu.com/p/cb254b7647d7" target="_blank">
										阅读 4249 </A> <A
										href="http://www.jianshu.com/p/cb254b7647d7#comments"
										target="_blank"> · 评论 65 </A> <span> · 喜欢 495</span> <span>
										· 打赏 2</span>
								</div>
							</div></li>
						<li class="have-img"><A class="wrap-img"
							href="http://www.jianshu.com/p/83e384033137"><img alt="300"
								src="img/index/1665079-20a33463f8cfb898.jpg"></A>
							<div>
								<P class="list-top">
									<A class="author-name blue-link"
										href="http://www.jianshu.com/users/c8e648cfa354"
										target="_blank">南下的夏天</A> <EM>·</EM> <span class="time"
										data-shared-at="2016-07-10T17:09:30+08:00"></span>
								</P>
								<H4 class="title">
									<A href="http://www.jianshu.com/p/83e384033137" target="_blank">《大鱼·海棠》：他这般风骨，我们却恶意满怀</A>
								</H4>
								<div class="list-footer">
									<A href="http://www.jianshu.com/p/83e384033137" target="_blank">
										阅读 7812 </A> <A
										href="http://www.jianshu.com/p/83e384033137#comments"
										target="_blank"> · 评论 62 </A> <span> · 喜欢 42</span>
								</div>
							</div></li>
						<li class="have-img"><A class="wrap-img"
							href="http://www.jianshu.com/p/557d7fc478ba"><img alt="300"
								src="img/index/2007654-b848ab76317aaba2.jpg"></A>
							<div>
								<P class="list-top">
									<A class="author-name blue-link"
										href="http://www.jianshu.com/users/6fba959c5af0"
										target="_blank">红尘笑笑生</A> <EM>·</EM> <span class="time"
										data-shared-at="2016-07-10T12:52:43+08:00"></span>
								</P>
								<H4 class="title">
									<A href="http://www.jianshu.com/p/557d7fc478ba" target="_blank">想做出颜值一流的PPT，有秋叶老师的这些私家干货就够了</A>
								</H4>
								<div class="list-footer">
									<A href="http://www.jianshu.com/p/557d7fc478ba" target="_blank">
										阅读 399 </A> <A
										href="http://www.jianshu.com/p/557d7fc478ba#comments"
										target="_blank"> · 评论 3 </A> <span> · 喜欢 49</span>
								</div>
							</div></li>
					</ul>
					<div class="load-more">
						<button class="ladda-button " data-style="slide-left"
							data-size="medium" data-color="maleskine" data-method="get"
							data-remote="" data-type="script">
							<span class="ladda-label">点击查看更多</span>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
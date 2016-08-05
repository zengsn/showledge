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

<title>随记详情页面</title>

<link href="css/css_1.css" rel="stylesheet" media="all">
<link href="css/css_2.css" rel="stylesheet" media="all">
<link href="css/css_3.css" rel="stylesheet" media="all">

<link href="images/favicon.ico" rel="icon">

<script src="js/js_1.js"></script>
</head>

<body class="post output zh cn win reader-day-mode reader-font2"
	data-js-module="note-show" data-locale="zh-CN">
	<div class="navbar-user">
		<ul class="dropdown-menu arrow-top" role="menu"
			aria-labelledby="dLabel">
			<li><a href="http://www.jianshu.com/writer#/"><i
					class="fa fa-pencil"></i> 写文章</a></li>
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
			<li><a href="http://www.jianshu.com/settings"><i
					class="fa fa-cogs"></i> 设置</a></li>
			<li><a href="http://www.jianshu.com/wallet"> <i
					class="fa fa-credit-card"></i> 钱包
			</a></li>
			<li class="dropdown-submenu"><a tabindex="-1"
				href="http://www.jianshu.com/p/df86eacb7b45#"><i
					class="fa fa-question-circle"></i> 帮助</a>
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
			</a> <a class="ad-selector" href="http://www.jianshu.com/apps"> <i
				class="fa fa-mobile"></i><span class="title">下载手机应用</span>
			</a>
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
			</a> <a data-toggle="tooltip" data-placement="right"
				data-original-title="设置" data-container="div.expanded"
				href="http://www.jianshu.com/settings"> <i class="fa fa-cogs"></i><span
				class="title">设置</span>
			</a> <a data-toggle="tooltip" data-placement="right"
				data-original-title="登 出" data-container="div.expanded"
				rel="nofollow" data-method="delete"
				href="http://www.jianshu.com/sign_out"> <i
				class="fa fa-sign-out"></i><span class="title">登 出</span>
			</a>
		</div>
	</div>

	<div id="show-note-container">
		<div class="post-bg" id="flag">
			<div class="wrap-btn" style="top: -1px;">
				<div class="article-related pull-left">
					<a data-toggle="tooltip" data-placement="bottom"
						data-original-title="未加入专题" href="javascript:void(null);"> <i
						class="fa fa-th"></i>
					</a> <a class="notebooks-menu-btn" data-toggle="modal"
						data-target="#notebooks-menu" href="javascript:void(null);"><i
						class="fa fa-list-ul"></i></a>
					<div class="related-avatar-group activities"></div>
				</div>

				<a class="user avatar" data-toggle="dropdown"
					href="javascript:void(0)"> <img
					src="images/post_detail/11-bfaf6775ca414a8854c9ca910e05b7a1.jpg"
					alt="11"> <b class="caret"></b>
				</a>

				<ul class="dropdown-menu arrow-top" role="menu"
					aria-labelledby="dLabel">
					<li><a href="http://www.jianshu.com/writer#/"><i
							class="fa fa-pencil"></i> 写文章</a></li>
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
					<li><a href="http://www.jianshu.com/settings"><i
							class="fa fa-cogs"></i> 设置</a></li>
					<li><a href="http://www.jianshu.com/wallet"> <i
							class="fa fa-credit-card"></i> 钱包
					</a></li>
					<li class="dropdown-submenu"><a tabindex="-1"
						href="http://www.jianshu.com/p/df86eacb7b45#"><i
							class="fa fa-question-circle"></i> 帮助</a>
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

				<div class="btn-group editor-article">
					<a class="daytime set-view-mode" href="javascript:void(0)"><i
						class="fa fa-moon-o"></i></a> <span> <a class="btn"
						href="http://www.jianshu.com/writer#/notebooks/4232734/notes/4785107">
							<i class="fa fa-pencil-square-o"></i>
					</a> <a href="javascript:void(null)" class="btn add-collection"
						data-toggle="modal" data-target="#contribute-modal"
						data-original-title="" title=""> <i class="fa fa-plus"></i><span><span
								class="translation_missing"
								title="translation missing: zh-CN.notes.show.add_to_collection">Add
									To Collection</span></span>
					</a> <a data-type="json" data-mcomponent="easy-bookmark"
						class="bookmark" data-remote="true" rel="nofollow"
						data-method="post"
						href="http://www.jianshu.com/notes/4785107/bookmark"
						data-original-title="" title=""> <i class="fa fa-bookmark-o"></i><span>收藏文章</span>
					</a>
						<ul class="dropdown-menu top-share-dropdown arrow-top">
							<li><a data-toggle="modal"
								href="http://www.jianshu.com/p/df86eacb7b45#share-weixin-modal"><img
									src="images/post_detail/weixin.png"> 分享到微信</a></li>
							<li><a
								href="javascript:void((function(s,d,e,r,l,p,t,z,c){var%20f=&#39;http://v.t.sina.com.cn/share/share.php?appkey=1881139527&#39;,u=z||d.location,p=[&#39;&amp;url=&#39;,e(u),&#39;&amp;title=&#39;,e(t||d.title),&#39;&amp;source=&#39;,e(r),&#39;&amp;sourceUrl=&#39;,e(l),&#39;&amp;content=&#39;,c||&#39;gb2312&#39;,&#39;&amp;pic=&#39;,e(p||&#39;&#39;)].join(&#39;&#39;);function%20a(){if(!window.open([f,p].join(&#39;&#39;),&#39;mb&#39;,[&#39;toolbar=0,status=0,resizable=1,width=440,height=430,left=&#39;,(s.width-440)/2,&#39;,top=&#39;,(s.height-430)/2].join(&#39;&#39;)))u.href=[f,p].join(&#39;&#39;);};if(/Firefox/.test(navigator.userAgent))setTimeout(a,0);else%20a();})(screen,document,encodeURIComponent,&#39;&#39;,&#39;&#39;,&#39;http://cwb.assets.jianshu.io/notes/images/4785107/weibo/image_c82c1437c869.jpg&#39;, &#39;我写了新文章《测试》（ 分享自 @简书 ）&#39;,&#39;http://www.jianshu.com/p/df86eacb7b45&#39;,&#39;页面编码gb2312|utf-8默认gb2312&#39;));"><img
									src="images/post_detail/weibo.png"> 分享到微博</a></li>
							<li><a
								href="javascript:void(function(){var d=document,e=encodeURIComponent,r=&#39;http://share.v.t.qq.com/index.php?c=share&amp;a=index&amp;url=&#39;+e(&#39;http://www.jianshu.com/p/df86eacb7b45&#39;)+&#39;&amp;title=&#39;+e(&#39;我写了新文章《测试》（ 分享自 @jianshuio ）&#39;),x=function(){if(!window.open(r,&#39;tweibo&#39;,&#39;toolbar=0,resizable=1,scrollbars=yes,status=1,width=600,height=600&#39;))location.href=r};if(/Firefox/.test(navigator.userAgent)){setTimeout(x,0)}else{x()}})();"><img
									src="images/post_detail/tweibo.png"> 分享到腾讯微博</a></li>
							<li><a
								href="javascript:void(function(){var d=document,e=encodeURIComponent,r=&#39;http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url=&#39;+e(&#39;http://www.jianshu.com/p/df86eacb7b45&#39;)+&#39;&amp;title=&#39;+e(&#39;我写了新文章《测试》&#39;),x=function(){if(!window.open(r,&#39;qzone&#39;,&#39;toolbar=0,resizable=1,scrollbars=yes,status=1,width=600,height=600&#39;))location.href=r};if(/Firefox/.test(navigator.userAgent)){setTimeout(x,0)}else{x()}})();"><img
									src="images/post_detail/qzone.png"> 分享到QQ空间</a></li>
							<li><a
								href="javascript:void(function(){var d=document,e=encodeURIComponent,r=&#39;https://twitter.com/share?url=&#39;+e(&#39;http://www.jianshu.com/p/df86eacb7b45&#39;)+&#39;&amp;text=&#39;+e(&#39;我写了新文章《测试》（ 分享自 @jianshucom ）&#39;)+&#39;&amp;related=&#39;+e(&#39;jianshucom&#39;),x=function(){if(!window.open(r,&#39;twitter&#39;,&#39;toolbar=0,resizable=1,scrollbars=yes,status=1,width=600,height=600&#39;))location.href=r};if(/Firefox/.test(navigator.userAgent)){setTimeout(x,0)}else{x()}})();"><img
									src="images/post_detail/twitter.png"> 分享到Twitter</a></li>
							<li><a
								href="javascript:void(function(){var d=document,e=encodeURIComponent,s1=window.getSelection,s2=d.getSelection,s3=d.selection,s=s1?s1():s2?s2():s3?s3.createRange().text:&#39;&#39;,r=&#39;http://www.douban.com/recommend/?url=&#39;+e(&#39;http://www.jianshu.com/p/df86eacb7b45&#39;)+&#39;&amp;title=&#39;+e(&#39;测试&#39;)+&#39;&amp;sel=&#39;+e(s)+&#39;&amp;v=1&#39;,x=function(){if(!window.open(r,&#39;douban&#39;,&#39;toolbar=0,resizable=1,scrollbars=yes,status=1,width=450,height=330&#39;))location.href=r+&#39;&amp;r=1&#39;};if(/Firefox/.test(navigator.userAgent)){setTimeout(x,0)}else{x()}})()"><img
									src="images/post_detail/douban.png"> 分享到豆瓣</a></li>
							<li><a
								href="javascript:void(function(){var d=document,e=encodeURIComponent,r=&#39;https://www.facebook.com/dialog/share?app_id=483126645039390&amp;display=popup&amp;href=http://www.jianshu.com/p/df86eacb7b45&#39;,x=function(){if(!window.open(r,&#39;facebook&#39;,&#39;toolbar=0,resizable=1,scrollbars=yes,status=1,width=450,height=330&#39;))location.href=r};if(/Firefox/.test(navigator.userAgent)){setTimeout(x,0)}else{x()}})();"><img
									src="images/post_detail/facebook.png"> 分享到Facebook</a></li>
							<li><a
								href="javascript:void(function(){var d=document,e=encodeURIComponent,r=&#39;https://plus.google.com/share?url=&#39;+e(&#39;http://www.jianshu.com/p/df86eacb7b45&#39;),x=function(){if(!window.open(r,&#39;google_plus&#39;,&#39;toolbar=0,resizable=1,scrollbars=yes,status=1,width=450,height=330&#39;))location.href=r};if(/Firefox/.test(navigator.userAgent)){setTimeout(x,0)}else{x()}})();"><img
									src="images/post_detail/google_plus.png"> 分享到Google+</a></li>
							<li><a
								href="http://cwb.assets.jianshu.io/notes/images/4785107/weibo/image_c82c1437c869.jpg"
								target="_blank"><i class="fa fa-arrow-circle-o-down"></i>下载长微博图片</a></li>
						</ul></span>
				</div>
			</div>

			<div class="container">
				<div class="related-avatar-group activities"></div>
				<div class="article">
					<div class="preview">
						<div class="author-info">
							<a class="avatar"
								href="http://www.jianshu.com/users/af5e3096ebc7"> <img
								src="images/post_detail/11-bfaf6775ca414a8854c9ca910e05b7a1.jpg"
								alt="11">
							</a> <span class="label"> 作者 </span> <a class="author-name blue-link"
								href="http://www.jianshu.com/users/af5e3096ebc7"> <span>${essay.userName}</span>
							</a> <span data-toggle="tooltip">${essay.essayTime}</span>
							<div>
								<span>被0人关注</span>，<span>获得了0个喜欢</span>
							</div>
						</div>
						<h1 class="title">${essay.essayTitle}</h1>
						<div class="meta-top">
							<span>字数 ${essay.essayWordNumber}</span> <span>阅读
								${essay.essayReadingNumber}</span> <span>评论
								${essay.essayCommentNumber}</span> <span>喜欢
								${essay.essayGoodNumber}</span>
						</div>
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
					<div id="further-readings" data-user-slug="af5e3096ebc7"
						data-user-nickname="lovely菜头">
						<div id="further-reading-line" class="hide further-reading-line"></div>
						<ul id="further-readings-list" class="reading-list unstyled"></ul>
						<div id="further-reading-new" class="reading-edit">
							<a id="further-reading-new-prompt" href="javascript:void(null)">
								<i class="fa fa-plus-circle"></i> 推荐拓展阅读
							</a>
							<div id="further-reading-form"></div>
						</div>
					</div>
					<div class="pull-right">
						<!-- copyright -->
						<div class="author-copyright pull-right" data-toggle="tooltip"
							data-html="true" title=""
							data-original-title="转载请联系作者获得授权，并标注“简书作者”。">
							<a><i class="fa fa-copyright"></i> 著作权归作者所有</a>
						</div>
					</div>
				</div>

				<!-- Reward / Support Author -->
				<div class="support-author">
					<p>如果觉得我的文章对您有用，请随意打赏。您的支持将鼓励我继续创作！</p>
					<span>本文已收到 <a class="rewards-total-count"
						data-toggle="modal"
						href="http://www.jianshu.com/p/df86eacb7b45#rewards-modal">0</a>
						次打赏
					</span>
					<div class="avatar-list"></div>
				</div>

				<!-- article meta bottom -->
				<div class="meta-bottom clearfix">
					<!--  Like Button -->
					<div class="like ">
						<div class="like-button">
							<a class="like-content" data-remote="true" rel="nofollow"
								data-method="post"
								href="http://www.jianshu.com/notes/4785107/like"> <i
								class="fa fa-heart-o"></i> 喜欢
							</a>
						</div>
						<span id="likes-count" data-toggle="tooltip"
							data-placement="right" title="" data-original-title="查看所有喜欢的用户">0</span>
					</div>
					<!--  share group -->
					<div class="share-group pull-right">
						<a
							href="javascript:void((function(s,d,e,r,l,p,t,z,c){var%20f=&#39;http://v.t.sina.com.cn/share/share.php?appkey=1881139527&#39;,u=z||d.location,p=[&#39;&amp;url=&#39;,e(u),&#39;&amp;title=&#39;,e(t||d.title),&#39;&amp;source=&#39;,e(r),&#39;&amp;sourceUrl=&#39;,e(l),&#39;&amp;content=&#39;,c||&#39;gb2312&#39;,&#39;&amp;pic=&#39;,e(p||&#39;&#39;)].join(&#39;&#39;);function%20a(){if(!window.open([f,p].join(&#39;&#39;),&#39;mb&#39;,[&#39;toolbar=0,status=0,resizable=1,width=440,height=430,left=&#39;,(s.width-440)/2,&#39;,top=&#39;,(s.height-430)/2].join(&#39;&#39;)))u.href=[f,p].join(&#39;&#39;);};if(/Firefox/.test(navigator.userAgent))setTimeout(a,0);else%20a();})(screen,document,encodeURIComponent,&#39;&#39;,&#39;&#39;,&#39;http://cwb.assets.jianshu.io/notes/images/4785107/weibo/image_c82c1437c869.jpg&#39;, &#39;我写了新文章《测试》（ 分享自 @简书 ）&#39;,&#39;http://www.jianshu.com/p/df86eacb7b45&#39;,&#39;页面编码gb2312|utf-8默认gb2312&#39;));"
							data-name="weibo"> <i class="fa fa-weibo"></i><span>分享到微博</span>
						</a> <a data-toggle="modal"
							href="http://www.jianshu.com/p/df86eacb7b45#share-weixin-modal"
							data-name="weixin"> <i class="fa fa-weixin"></i><span>分享到微信</span>
						</a>
						<div class="more">
							<a href="javascript:void(0)" data-toggle="dropdown">更多分享<i
								class="fa fa-caret-down"></i></a>
							<ul class="dropdown-menu arrow-top">
								<li><a
									href="http://cwb.assets.jianshu.io/notes/images/4785107/weibo/image_c82c1437c869.jpg"
									target="_blank" data-name="changweibo"><i
										class="fa fa-arrow-circle-o-down"></i> 下载长微博图片</a></li>
								<li><a data-name="tweibo"
									href="javascript:void(function(){var d=document,e=encodeURIComponent,r=&#39;http://share.v.t.qq.com/index.php?c=share&amp;a=index&amp;url=&#39;+e(&#39;http://www.jianshu.com/p/df86eacb7b45&#39;)+&#39;&amp;title=&#39;+e(&#39;我写了新文章《测试》（ 分享自 @jianshuio ）&#39;),x=function(){if(!window.open(r,&#39;tweibo&#39;,&#39;toolbar=0,resizable=1,scrollbars=yes,status=1,width=600,height=600&#39;))location.href=r};if(/Firefox/.test(navigator.userAgent)){setTimeout(x,0)}else{x()}})();">
										<img src="images/post_detail/tweibo.png" alt="Tweibo">
										分享到腾讯微博
								</a></li>
								<li><a data-name="qzone"
									href="javascript:void(function(){var d=document,e=encodeURIComponent,r=&#39;http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url=&#39;+e(&#39;http://www.jianshu.com/p/df86eacb7b45&#39;)+&#39;&amp;title=&#39;+e(&#39;我写了新文章《测试》&#39;),x=function(){if(!window.open(r,&#39;qzone&#39;,&#39;toolbar=0,resizable=1,scrollbars=yes,status=1,width=600,height=600&#39;))location.href=r};if(/Firefox/.test(navigator.userAgent)){setTimeout(x,0)}else{x()}})();">
										<img src="images/post_detail/qzone.png" alt="Qzone">
										分享到QQ空间
								</a></li>
								<li><a data-name="twitter"
									href="javascript:void(function(){var d=document,e=encodeURIComponent,r=&#39;https://twitter.com/share?url=&#39;+e(&#39;http://www.jianshu.com/p/df86eacb7b45&#39;)+&#39;&amp;text=&#39;+e(&#39;我写了新文章《测试》（ 分享自 @jianshucom ）&#39;)+&#39;&amp;related=&#39;+e(&#39;jianshucom&#39;),x=function(){if(!window.open(r,&#39;twitter&#39;,&#39;toolbar=0,resizable=1,scrollbars=yes,status=1,width=600,height=600&#39;))location.href=r};if(/Firefox/.test(navigator.userAgent)){setTimeout(x,0)}else{x()}})();">
										<img src="images/post_detail/twitter.png" alt="Twitter">
										分享到Twitter
								</a></li>
								<li><a data-name="facebook"
									href="javascript:void(function(){var d=document,e=encodeURIComponent,r=&#39;https://www.facebook.com/dialog/share?app_id=483126645039390&amp;display=popup&amp;href=http://www.jianshu.com/p/df86eacb7b45&#39;,x=function(){if(!window.open(r,&#39;facebook&#39;,&#39;toolbar=0,resizable=1,scrollbars=yes,status=1,width=450,height=330&#39;))location.href=r};if(/Firefox/.test(navigator.userAgent)){setTimeout(x,0)}else{x()}})();">
										<img src="images/post_detail/facebook.png" alt="Facebook">
										分享到Facebook
								</a></li>
								<li><a data-name="google_plus"
									href="javascript:void(function(){var d=document,e=encodeURIComponent,r=&#39;https://plus.google.com/share?url=&#39;+e(&#39;http://www.jianshu.com/p/df86eacb7b45&#39;),x=function(){if(!window.open(r,&#39;google_plus&#39;,&#39;toolbar=0,resizable=1,scrollbars=yes,status=1,width=450,height=330&#39;))location.href=r};if(/Firefox/.test(navigator.userAgent)){setTimeout(x,0)}else{x()}})();">
										<img src="images/post_detail/google_plus.png"
										alt="Google plus"> 分享到Google+
								</a></li>
								<li><a data-name="douban"
									href="javascript:void(function(){var d=document,e=encodeURIComponent,s1=window.getSelection,s2=d.getSelection,s3=d.selection,s=s1?s1():s2?s2():s3?s3.createRange().text:&#39;&#39;,r=&#39;http://www.douban.com/recommend/?url=&#39;+e(&#39;http://www.jianshu.com/p/df86eacb7b45&#39;)+&#39;&amp;title=&#39;+e(&#39;测试&#39;)+&#39;&amp;sel=&#39;+e(s)+&#39;&amp;v=1&#39;,x=function(){if(!window.open(r,&#39;douban&#39;,&#39;toolbar=0,resizable=1,scrollbars=yes,status=1,width=450,height=330&#39;))location.href=r+&#39;&amp;r=1&#39;};if(/Firefox/.test(navigator.userAgent)){setTimeout(x,0)}else{x()}})()">
										<img src="images/post_detail/douban.png" alt="Douban">
										分享到豆瓣
								</a></li>
							</ul>
						</div>
					</div>
				</div>

				<!-- Modals -->
				<div id="share-weixin-modal"
					class="modal hide fade share-weixin-modal" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
					</div>
					<div class="modal-body"
						title="http://www.jianshu.com/p/df86eacb7b45?utm_campaign=maleskine&amp;utm_content=note&amp;utm_medium=reader_share&amp;utm_source=weixin">
						<h5>打开微信“扫一扫”，打开网页后点击屏幕右上角分享按钮</h5>
						<canvas width="170" height="170" style="display: none;"></canvas>
						<img
							src="data:image/png;base64,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"
							style="display: block;">
					</div>
				</div>

				<div id="contribute-modal" tabindex="-1"
					class="arrow-top user-editor-actions modal hide fade"
					aria-hidden="true" style="display: none;">
					<div class="modal-header">
						<b> 向专题投稿
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
						</b>
					</div>
					<div class="modal-body">
						<div class="search">
							<input type="text" name="search_term" id="search_term"
								class="input-large search-query" placeholder="搜索更多专题投稿"
								data-search-collections-url="/collections/search?note_id=4785107">
						</div>
						<ul class="add-list"></ul>
					</div>
				</div>

				<div id="rewards-modal"
					class="modal modal_new support_list-modal fullscreen hide fade"
					tabindex="-1" role="dialog" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">×</button>
								<h3>读者打赏</h3>
							</div>
							<div class="modal-body">
								<ul class="unstyled users">
									<img class="loader-tiny editor-loading"
										src="images/post_detail/tiny.gif" alt="Tiny">
								</ul>
							</div>
						</div>
					</div>
				</div>

				<!-- Comments -->
				<div id="comments" class="comment-list clearfix">
					<div class="comment-head clearfix">
						${essay.essayCommentNumber}条评论 <span class="order"> （ <a
							data-order="asc" class="active" href="javascript:void(0)">按时间正序</a>·
							<a data-order="desc" href="javascript:void(0)">按时间倒序</a>· <a
							data-order="likes_count" href="javascript:void(0)">按喜欢排序</a> ）
						</span> <a href="javascript:void(null)" class="goto-comment pull-right"><i
							class="fa fa-pencil"></i>添加新评论</a> <a
							class="close-comment pull-right" disable_with="请等待..."
							data-remote="true" rel="nofollow" data-method="put"
							href="http://www.jianshu.com/notes/df86eacb7b45/toggle_comment">关闭评论</a>
					</div>

					<div id="comment-list">
						<c:forEach items="${commentList}" var="comment">
							<div class="note-comment clearfix">
								<div class="content">
									<div class="meta-top">
										<a class="avatar"
											href="http://www.jianshu.com/users/9da2a9e9e24c"> <img
											src="images/post_detail/f19e74a22aea.jpg" alt="100">
										</a>
										<p>
											<a class="author-name" href="">${comment.commentDiscussantName}</a>
										</p>
										<span class="reply-time"> <small>${comment.commentBuildingNumber}
												楼 · </small> <a href="">${comment.commentTime}</a></span>
									</div>
									<p>${comment.commentContent}</p>
									<div class="comment-footer clearfix text-right">
										<a data-id="3099623" class="like pull-left"
											href="javascript:void(0)"> <i class="fa fa-heart-o"></i>喜欢<span>(0)</span>
										</a>
										<div class="dropdown report" data-commenter-id="2401748"
											style="display: none;">
											<a class="report_comment" href="javascript:void(0)"
												data-toggle="dropdown">举报</a>
											<ul class="dropdown-menu arrow-top">
												<li><a data-type="json" data-remote="true"
													rel="nofollow" data-method="post"
													href="http://www.jianshu.com/comments/3099623/abuse_reports?type=ad">广告及垃圾信息</a></li>
												<li><a data-toggle="modal"
													data-url="/comments/3099623/abuse_reports"
													href="http://www.jianshu.com/p/1ff4aa74163d#report-modal">其他</a></li>
											</ul>
										</div>
										<a data-id="3099623" data-nickname="" class="reply"
											href="javascript:void(0)">回复</a>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>

					<form class="new_comment" accept-charset="UTF-8" method="post"
						action="addComment.do">
						<input type="hidden" name="essayId" id="essayId"
							value="${essayId}" />
						<div class="comment-text">
							<textarea maxlength="2000" placeholder="写下你的评论…"
								class="mousetrap" name="commentContent"></textarea>
							<div>
								<input type="submit" value="发 表" class="btn btn-info">
								<div class="emoji">
									<a href="http://www.jianshu.com/p/df86eacb7b45#emoji-modal"
										data-toggle="modal"><i class="fa fa-smile-o"></i></a>
									<div id="emoji-modal" class="emoji-modal arrow-top hide"
										tabindex="-1" aria-hidden="true">
										<ul id="emojiTab" class="emoji-nav-tabs modal-header">
											<li class="active"><a
												href="http://www.jianshu.com/p/df86eacb7b45#emoji-pane-1"
												data-toggle="tab">1</a></li>
											<li class=""><a
												href="http://www.jianshu.com/p/df86eacb7b45#emoji-pane-2"
												data-toggle="tab">2</a></li>
											<li class=""><a
												href="http://www.jianshu.com/p/df86eacb7b45#emoji-pane-3"
												data-toggle="tab">3</a></li>
											<li class=""><a
												href="http://www.jianshu.com/p/df86eacb7b45#emoji-pane-4"
												data-toggle="tab">4</a></li>
										</ul>
										<div id="emojiTabContent" class="tab-content">
											<div class="tab-pane fade active in" id="emoji-pane-1">
												<ul>
												</ul>
											</div>
											<div class="tab-pane fade  in" id="emoji-pane-2">
												<ul>
												</ul>
											</div>
											<div class="tab-pane fade  in" id="emoji-pane-3">
												<ul>
												</ul>
											</div>
											<div class="tab-pane fade  in" id="emoji-pane-4">
												<ul>
												</ul>
											</div>
										</div>
									</div>
								</div>

								<span class="hotkey">Ctrl+Enter 发表</span> <span class="warning"
									style="display: none"><i
									class="fa fa-exclamation-circle"></i><span class="warning-text"></span></span>
							</div>
						</div>
					</form>
				</div>
			</div>

			<!-- Modal -->
			<div class="modal pay-modal text-center hide fade" id="pay-modal">
				<div class="modal-header clearfix">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
				</div>
				<form id="new_reward" class="new_reward" target="_blank"
					action="http://www.jianshu.com/notes/4785107/rewards"
					accept-charset="UTF-8" method="post">
					<input name="utf8" type="hidden" value="✓"><input
						type="hidden" name="authenticity_token"
						value="lU8GsmEvpdp1o8dEdQlu2m8xVX5bxbRrFoHg9xYc3TtYqgEZgByz6GXAF001tDSYAdk7wxYbDQvle7g0P2V5WA==">
					<div class="modal-body">
						<a href="http://www.jianshu.com/users/af5e3096ebc7">
							<div class="avatar">
								<img
									src="images/post_detail/11-bfaf6775ca414a8854c9ca910e05b7a1.jpg"
									alt="11">
							</div>
						</a>
						<p>
							<i class="fa fa-quote-left pull-left"></i>如果觉得我的文章对您有用，请随意打赏。您的支持将鼓励我继续创作！<i
								class="fa fa-quote-right pull-right"></i>
						</p>
						<div class="main-inputs text-left">
							<div class="control-group">
								<label for="reward_amount">打赏金额</label><i class="fa fa-yen"></i>
								<input value="2.00" type="text" name="reward[amount_in_yuan]"
									id="reward_amount_in_yuan">
							</div>
							<div class="control-group message">
								<textarea placeholder="给Ta留言" name="reward[message]"
									id="reward_message"></textarea>
							</div>
						</div>
						<div class="choose-pay text-left">
							<h5>选择支付方式：</h5>
							<div>
								<label for="reward_channel_alipay">
									<div class="iradio_minimal checked" style="position: relative;">
										<input type="radio" value="alipay" checked="checked"
											name="reward[channel]" id="reward_channel_alipay"
											style="position: absolute; opacity: 0;">
										<ins class="iCheck-helper"
											style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins>
									</div> <span class="alipay-bg"></span>
								</label> <label for="reward_channel_balance">
									<div class="iradio_minimal" style="position: relative;">
										<input type="radio" value="balance" name="reward[channel]"
											id="reward_channel_balance"
											style="position: absolute; opacity: 0;">
										<ins class="iCheck-helper"
											style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins>
									</div> 简书余额（ 余额：¥ 0.00 ）
								</label> <label for="reward_channel_wx_pub_qr">
									<div class="iradio_minimal" style="position: relative;">
										<input type="radio" value="wx_pub_qr" name="reward[channel]"
											id="reward_channel_wx_pub_qr"
											style="position: absolute; opacity: 0;">
										<ins class="iCheck-helper"
											style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins>
									</div> 微信支付
								</label>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button name="button" type="submit" class="btn btn-large btn-pay">立即支付</button>
					</div>
				</form>
			</div>

			<div class="modal success-pay text-center hide fade" id="success-pay">
				<div class="modal-header clearfix">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
				</div>
				<div class="modal-body">
					<h3>
						<i class="icon-ok"></i>打赏成功
					</h3>
					<img
						src="images/post_detail/complete-pay-25426877089eb23bd76d9d0e6aad89c1.png"
						alt="Complete pay">
				</div>
				<div class="modal-footer">
					<a class="blue-link" href="http://www.jianshu.com/wallet">查看打赏记录</a>
				</div>
			</div>
		</div>
	</div>

	<div id="
	rep
	ort-modal"
		class="modal hide fade modal_report fullscreen" tabindex="-1"
		role="dialog" aria-labelledby="reportModal" aria-hidden="true"
		data-js-module="report-modal">
		<form id="report-form" data-type="json" action="javascript:void(0)"
			accept-charset="UTF-8" data-remote="true" method="post">
			<input name="utf8" type="hidden" value="✓"> <input
				type="hidden" name="type" id="type" value="other">

			<div class="modal-header">
				<b>举报原因</b>
			</div>
			<div class="modal-body">
				<textarea name="content" id="content" maxlength="2000"
					placeholder="写下你的举报原因..."></textarea>
			</div>
			<div class="modal-footer">
				<a class="btn" data-dismiss="modal" aria-hidden="true"
					href="javascript:void(0)">取消</a> <input type="submit" name="commit"
					value="确认" class="btn btn-info">
			</div>
		</form>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">

<title>随记发布成功页面</title>

<link href="css/css_1.css" rel="stylesheet" media="all">
<link href="css/css_2.css" rel="stylesheet" media="all">
<link href="css/css_3.css" rel="stylesheet" media="all">

<link href="img/favicon.ico" rel="icon">
<link rel="apple-touch-icon-precomposed"
	href="http://cdn-qn0.jianshu.io/assets/icon114-2f8f53b3d61f20906f666458f4647b78.png">
</head>

<body class="input zh cn win reader-day-mode reader-font2">
	<div id="share-modal"
		class="modal fade share-directly-modal fullscreen in">
		<a href="index_login.jsp" class="close" data-dismiss="modal"><i
			class="fa fa-times"></i></a>
		<div class="container">
			<div class="modal-header">
				<h3 class="">
					<i class="fa fa-check"></i> 文章发布成功！
				</h3>
			</div>
			<div class="modal-body">
				<div class="social-network">
					<h2 class="title" data-toggle="tooltip" data-title="点击标题可以查看已发布的文章"
						data-trigger="manual" data-placement="right"
						data-container=".share-directly-modal" data-original-title=""
						title="">
						<a href="http://www.jianshu.com/p/df86eacb7b45" class="text-info"
							target="_blank"><s:property value="message" /></a>
					</h2>
					<p>分享文章</p>
					<ul class="share unstyled">
						<li class="item-1 share-link"><a class="dropdown-toggle"
							data-toggle="dropdown" href="javascript:void(null)"> <i
								class="fa fa-link"></i>
						</a>
							<div class="arrow-top dropdown-menu permlink"
								href="http://www.jianshu.com/p/df86eacb7b45">
								<input id="permlink-text" class="text-left" readonly="">
								<a href="javascript:void(null)"
									class="btn btn-info btn-small copy-to-clipboard"
									data-clipboard-target="permlink-text">复制链接</a>
							</div></li>
						<li class="weibo"><a
							href="http://www.jianshu.com/writer#share-weibo-modal"
							role="button" data-toggle="modal" data-action="share-to-weibo">
								<i class="fa fa-weibo"></i>
						</a></li>
						<li class="weixin share-wechat"><a
							href="javascript:void(null)" class="dropdown-toggle"
							data-toggle="dropdown"> <i class="fa fa-weixin"></i>
						</a>
							<div class="arrow-top dropdown-menu"
								title="http://www.jianshu.com/p/df86eacb7b45?utm_campaign=maleskine&amp;utm_content=note&amp;utm_medium=reader_share&amp;utm_source=weixin">
								<canvas width="100" height="100" style="display: none;"></canvas>
								<img style="display: block;"
									src="data:image/png;base64,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">
							</div></li>
						<li class="ellipsis"><a class="dropdown-toggle"
							data-toggle="dropdown" href="javascript:void(null)"> <i
								class="fa fa-ellipsis-h"></i>
						</a>
							<ul class="dropdown-menu arrow-top more-sns">
								<li><a
									href="javascript:void(function(){var d=document,e=encodeURIComponent,r=&#39;http://share.v.t.qq.com/index.php?c=share&amp;a=index&amp;url=&#39;+e(&#39;http%3A%2F%2Fwww.jianshu.com%2Fp%2Fdf86eacb7b45%3Futm_campaign%3Dmaleskine%26utm_content%3Dnote%26utm_medium%3Dwriter_share%26utm_source%3Dtweibo&#39;)+&#39;&amp;title=&#39;+e(&#39;我写了新文章《测试》 （ 分享自 @jianshuio ）&#39;),x=function(){if(!window.open(r,&#39;tweibo&#39;,&#39;toolbar=0,resizable=1,scrollbars=yes,status=1,width=600,height=600&#39;))location.href=r};if(/Firefox/.test(navigator.userAgent)){setTimeout(x,0)}else{x()}})();"
									data-sns="tweibo"> <img src="img/post_success/tweibo.png">
										分享到腾讯微博
								</a></li>
								<li><a
									href="javascript:void(function(){var d=document,e=encodeURIComponent,r=&#39;http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url=&#39;+e(&#39;http%3A%2F%2Fwww.jianshu.com%2Fp%2Fdf86eacb7b45%3Futm_campaign%3Dmaleskine%26utm_content%3Dnote%26utm_medium%3Dwriter_share%26utm_source%3Dqzone&#39;)+&#39;&amp;title=&#39;+e(&#39;我写了新文章《测试》 &#39;),x=function(){if(!window.open(r,&#39;qzone&#39;,&#39;toolbar=0,resizable=1,scrollbars=yes,status=1,width=600,height=600&#39;))location.href=r};if(/Firefox/.test(navigator.userAgent)){setTimeout(x,0)}else{x()}})();"
									data-sns="qzone"> <img src="img/post_success/qzone.png">
										分享到QQ空间
								</a></li>
								<li><a
									href="javascript:void(function(){var d=document,e=encodeURIComponent,r=&#39;https://twitter.com/share?url=&#39;+e(&#39;http%3A%2F%2Fwww.jianshu.com%2Fp%2Fdf86eacb7b45%3Futm_campaign%3Dmaleskine%26utm_content%3Dnote%26utm_medium%3Dwriter_share%26utm_source%3Dtwitter&#39;)+&#39;&amp;text=&#39;+e(&#39;我写了新文章《测试》 （ 分享自 @jianshucom ）&#39;)+&#39;&amp;related=&#39;+e(&#39;jianshuio&#39;),x=function(){if(!window.open(r,&#39;twitter&#39;,&#39;toolbar=0,resizable=1,scrollbars=yes,status=1,width=600,height=600&#39;))location.href=r};if(/Firefox/.test(navigator.userAgent)){setTimeout(x,0)}else{x()}})();"
									data-sns="twitter"> <img src="img/post_success/twitter.png">
										分享到Twitter
								</a></li>
								<li><a
									href="javascript:void(function(){var d=document,e=encodeURIComponent,r=&#39;http://www.facebook.com/sharer.php?s=100&amp;p[url]=&#39;+e(&#39;http%3A%2F%2Fwww.jianshu.com%2Fp%2Fdf86eacb7b45%3Futm_campaign%3Dmaleskine%26utm_content%3Dnote%26utm_medium%3Dwriter_share%26utm_source%3Dfacebook&#39;)+&#39;&amp;p[title]=&#39;+e(&#39;测试 - 简书社&#39;)+&#39;&amp;p[summary]=&#39;+e(&#39;我写了新文章《测试》 &#39;),x=function(){if(!window.open(r,&#39;facebook&#39;,&#39;toolbar=0,resizable=1,scrollbars=yes,status=1,width=600,height=600&#39;))location.href=r};if(/Firefox/.test(navigator.userAgent)){setTimeout(x,0)}else{x()}})();"
									data-sns="facebook"> <img
										src="img/post_success/facebook.png"> 分享到Facebook
								</a></li>
								<li><a
									href="javascript:void(function(){var d=document,e=encodeURIComponent,r=&#39;https://plus.google.com/share?url=&#39;+e(&#39;http%3A%2F%2Fwww.jianshu.com%2Fp%2Fdf86eacb7b45%3Futm_campaign%3Dmaleskine%26utm_content%3Dnote%26utm_medium%3Dwriter_share%26utm_source%3Dgoogle_plus&#39;),x=function(){if(!window.open(r,&#39;google_plus&#39;,&#39;toolbar=0,resizable=1,scrollbars=yes,status=1,width=450,height=330&#39;))location.href=r};if(/Firefox/.test(navigator.userAgent)){setTimeout(x,0)}else{x()}})();"
									data-sns="google_plus"> <img
										src="img/post_success/google_plus.png"> 分享到Google+
								</a></li>
							</ul></li>
					</ul>
				</div>
				<div class="submission">
					<span>为了您的文章被更多人发现，您可以选择投稿到对应专题</span>
					<div class="search">
						<input class="input-large search-query" placeholder="搜索"
							type="text">
					</div>
					<div class="loader" style="display: none;">
						<img src="img/post_success/tiny.gif" class="lodaer loader-tiny">
					</div>
					<div class="no-search-result" style="display:none">
						<p>没有找到相关的专题</p>
					</div>
					<div class="contribute">
						<p>以下专题可能与您的文章相关：</p>
						<ul class="unstyled clearfix">
							<li data-collection-id="47"><a
								href="http://www.jianshu.com/collection/bDHhpK" target="_blank">
									<div class="avatar">
										<img alt="rdn_4ddb18fddd2e9_(1).jpg"
											src="img/post_success/rdn_4ddb18fddd2e9_(1).jpg"
											thumbnail="180x180">
									</div>
									<h4>首页投稿</h4>
							</a>
								<p>76719 篇文章，114358 人关注</p> <a class="btn btn-success add"
								href="http://www.jianshu.com/writer/submissions?collection_id=47&amp;note_id=4785107"
								data-method="post" data-remote="true" rel="nofollow"> 投稿 </a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
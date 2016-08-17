<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">

<title>简随记</title>

<link href="css/css_1.css" rel="stylesheet" media="all">
<link href="css/css_2.css" rel="stylesheet" media="all">
<link href="css/css_3.css" rel="stylesheet" media="all">

<link href="images/favicon.ico" rel="icon">
</head>

<body class="input zh cn win reader-day-mode reader-font2">
	<div id="share-modal"
		class="modal fade share-directly-modal fullscreen in">
		<a href="index.html" class="close" data-dismiss="modal"><i
			class="fa fa-times"></i></a>
		<div class="container">
			<div class="modal-header">
				<h3 class="">
					<i class="fa fa-check"></i> 随记发布成功！
				</h3>
			</div>
			<div class="modal-body">
				<div class="social-network">
					<h2 class="title" data-toggle="tooltip" data-title="点击标题可以查看已发布的文章"
						data-trigger="manual" data-placement="right"
						data-container=".share-directly-modal" data-original-title=""
						title="">
						<a href="essay.html?id=${essayId}" class="text-info"
							target="_blank">${essayTitle}</a>
					</h2>
					<p>分享文章</p>
					<ul class="share unstyled">
						<li class="item-1 share-link"><a class="dropdown-toggle"
							data-toggle="dropdown" href="javascript:void(null)"> <i
								class="fa fa-link"></i>
						</a>
							<div class="arrow-top dropdown-menu permlink" href="">
								<input id="permlink-text" class="text-left" readonly="">
								<a href="javascript:void(null)"
									class="btn btn-info btn-small copy-to-clipboard"
									data-clipboard-target="permlink-text">复制链接</a>
							</div></li>
						<li class="weibo"><a href="" role="button"
							data-toggle="modal" data-action="share-to-weibo"> <i
								class="fa fa-weibo"></i>
						</a></li>
						<li class="weixin share-wechat"><a
							href="javascript:void(null)" class="dropdown-toggle"
							data-toggle="dropdown"> <i class="fa fa-weixin"></i>
						</a>
							<div class="arrow-top dropdown-menu" title="">
								<canvas width="100" height="100" style="display: none;"></canvas>
								<img style="display: block;" src="">
							</div></li>
						<li class="ellipsis"><a class="dropdown-toggle"
							data-toggle="dropdown" href="javascript:void(null)"> <i
								class="fa fa-ellipsis-h"></i>
						</a>
							<ul class="dropdown-menu arrow-top more-sns">
								<li><a href="" data-sns="tweibo"> <img
										src="img/post_success/tweibo.png"> 分享到腾讯微博
								</a></li>
								<li><a href="" data-sns="qzone"> <img
										src="img/post_success/qzone.png"> 分享到QQ空间
								</a></li>
								<li><a href="" data-sns="twitter"> <img
										src="img/post_success/twitter.png"> 分享到Twitter
								</a></li>
								<li><a href="" data-sns="facebook"> <img
										src="img/post_success/facebook.png"> 分享到Facebook
								</a></li>
								<li><a href="" data-sns="google_plus"> <img
										src="img/post_success/google_plus.png"> 分享到Google+
								</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<!-- saved from url=(0031)http://www.jianshu.com/writer#/ -->
<html
	class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths">
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<meta name="description" content="最好的写作和阅读平台">
<meta name="google-site-verification"
	content="HF7lfF8YEGs1qtCE-kPml8Z469e2RHhGajy6JPVy5XI">
<meta property="wb:webmaster" content="294ec9de89e7fadb">
<meta property="qc:admins" content="104102651453316562112116375">
<meta property="qc:admins" content="11635613706305617">
<meta http-equiv="mobile-agent"
	content="format=html5; url=http://www.jianshu.com/writer">

<title>简书</title>
<meta name="csrf-param" content="authenticity_token">
<meta name="csrf-token"
	content="AlwPKYLGcz4IC+y5/pgkuMz/oD3N2//vxaz4M5BrsjYN5zYD0teGu+5EWUSrNfMsg32CkZx1RQAXL6LfdbkHCg==">
<!--[if lte IE 8]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<LINK href="css/css_1.css" rel="stylesheet" media="all">
<link rel="stylesheet" media="all"
	href="css/writer/writer-0115c67175d681b0ce9facf3c65caf11.css">
<LINK href="css/css_3.css" rel="stylesheet" media="all">
<script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="js/writer/push.js"></script>
<script type="text/javascript" async="" src="js/writer/ga.js"></script>
<script src="js/writer/modernizr-613ea63b5aa2f0e2a1946e9c28c8eedb.js"></script>
<!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
<!--[if IE 8]><link rel="stylesheet" media="all" href="http://cdn-qn0.jianshu.io/assets/scaffolding/for_ie-7f1c477ffedc13c11315103e8787dc6c.css" /><![endif]-->
<!--[if lt IE 9]><link rel="stylesheet" media="all" href="http://cdn-qn0.jianshu.io/assets/scaffolding/for_ie-7f1c477ffedc13c11315103e8787dc6c.css" /><![endif]-->
<link href="http://baijii-common.b0.upaiyun.com/icons/favicon.ico"
	rel="icon">
<link rel="apple-touch-icon-precomposed"
	href="http://cdn-qn0.jianshu.io/assets/icon114-2f8f53b3d61f20906f666458f4647b78.png">
<meta id="current_user_slug" value="af5e3096ebc7">
</head>

<body class="input zh cn win reader-day-mode reader-font2">
	<div id="writer" class="container-fluid" data-writer-version="10">

		<div id="kalamu-video-modal"
			class="modal kalamu-video-modal hide fade" tabindex="-1"
			aria-hidden="true" data-keyboard="false">
			<div class="modal-header">
				<h3>插入视频</h3>
				<!-- <span>目前只支持<a href="http://www.youku.com/" target="_blank">优酷</a>、<a href="http://www.tudou.com/" target="_blank">土豆</a>、<a href="http://v.qq.com/" target="_blank">腾讯视频</a>、<a href="http://www.acfun.tv/" target="_blank">A站视频</a>与<a href="http://vww.bilibili.com/" target="_blank">B站视频</a>。</span> -->
				<span>目前只支持<a href="http://www.youku.com/" target="_blank">优酷</a>、<a
					href="http://www.tudou.com/" target="_blank">土豆</a>、<a
					href="http://v.qq.com/" target="_blank">腾讯视频</a>。
				</span>
			</div>
			<div class="modal-body">
				<div class="input-prepend">
					<span class="add-on"><i class="fa fa-link"></i></span> <input
						class="span2" name="url-input" placeholder="请输入视频链接" type="text">
				</div>
				<span class="message-text" style="display: none"></span>
				<button class="btn-link" name="ok">确认</button>
				<button class="btn-link" data-dismiss="modal" aria-hidden="true">取消</button>
			</div>
		</div>
		<div class="stack expansion" style="padding-left: 45px;">
			<div class="row-fluid normal-mode active">
				<div class="navbar">
					<div class="writer-nav-header"></div>
					<div class="navbar navbar-jianshu shrink">
						<div class="dropdown">
							<a target="_blank" class="dropdown-toggle logo" id="dLabel"
								role="button" data-toggle="dropdown" data-target="#"
								href="javascript:void(0)"> 简 </a>
							<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
								<li class=""><a target="_blank"
									href="http://www.jianshu.com/"><i class="fa fa-home"></i>
										首页</a></li>
								<li><a target="_blank"
									href="http://www.jianshu.com/collections"> <i
										class="fa fa-th"></i> 专题
								</a></li>
								<li><a target="_blank"
									href="http://www.jianshu.com/timeline"> <i
										class="fa fa-users"></i> 简友圈
								</a></li>
							</ul>
						</div>
					</div>
					<div class="navbar navbar-jianshu expanded">
						<div class="dropdown">
							<a target="_blank" href="http://www.jianshu.com/" class="logo"
								data-container="body" data-original-title="个人主页" role="button">
								<b>简</b><i class="fa fa-home"></i> <span class="title">首页</span>
							</a> <a target="_blank" href="http://www.jianshu.com/collections"
								data-container="body" data-original-title="专题"
								data-placement="right" data-toggle="tooltip"> <i
								class="fa fa-th"></i><span class="title">专题</span>
							</a> <a target="_blank" href="http://www.jianshu.com/timeline"
								data-container="body" data-original-title="简友圈"
								data-placement="right" data-toggle="tooltip"> <i
								class="fa fa-users"></i><span class="title">简友圈</span>
							</a> <a class="active" href="javascript:void(null)"
								data-container="body" data-original-title="写文章"
								data-placement="right" data-toggle="tooltip"> <i
								class="fa fa-pencil"></i><span class="title">写文章</span>
							</a>
						</div>
						<div class="nav-user">
							<a target="_blank"
								href="http://www.jianshu.com/users/af5e3096ebc7"
								data-container="body" data-original-title="我的主页"
								data-placement="right" data-toggle="tooltip"> <i
								class="fa fa-user"></i><span class="title">我的主页</span>
							</a> <a target="_blank" href="http://www.jianshu.com/bookmarks"
								data-container="body" data-original-title="我的收藏"
								data-placement="right" data-toggle="tooltip"> <i
								class="fa fa-bookmark"></i><span class="title">我的收藏</span>
							</a> <a target="_blank" href="http://www.jianshu.com/notifications"
								data-container="body" data-original-title="提醒"
								data-placement="right" data-toggle="tooltip"> <i
								class="fa fa-bell" id="notify-icon"></i><span class="title">提醒</span>
							</a> <a target="_blank" href="http://www.jianshu.com/chats"
								data-container="body" data-original-title="简信"
								data-placement="right" data-toggle="tooltip"> <i
								class="fa fa-envelope" id="chat-message-icon"></i><span
								class="title">简信</span>
							</a> <a href="http://www.jianshu.com/writer#view-mode-modal"
								data-toggle="modal"> <i class="fa fa-font"></i><span
								class="title">显示模式</span>
							</a> <a target="_blank" href="http://www.jianshu.com/settings"
								data-container="body" data-original-title="设置"
								data-placement="right" data-toggle="tooltip"> <i
								class="fa fa-cogs"></i><span class="title">设置</span>
							</a> <a target="_blank" href="http://www.jianshu.com/sign_out"
								data-container="body" data-method="delete"
								data-original-title="登出" data-placement="right"
								data-toggle="tooltip" rel="nofollow"> <i
								class="fa fa-sign-out"></i><span class="title">登出</span>
							</a>
						</div>
					</div>
				</div>
				<div class="span2 aside" style="height: 641px;">
					<div class="new-notebook">
						<a href="javascript:void(0)" class="create-notebook win-text">
							+新建文集 <img src="img/writer/tiny.gif"
							class="hide loader-tiny create-notebook-loader">
						</a>
						<div class="new-notebook-form hide">
							<form class="create-notebook-form">
								<input placeholder="请输入文集名..." type="text" name="name"
									class="input-medium notebook-input"> <a
									href="javascript:void(0)" class="btn cancel"
									data-action="cancel-create-notebook"> 取消 </a><input
									class="btn btn-mainRed submit" name="commit" type="submit"
									value="提交" data-action="submit">
							</form>
						</div>
					</div>
					<ul class="nav nav-list notebooks ui-sortable"
						style="max-height: 362px; min-height: 362px;">
						<li class="one-notebook item active" data-model="notebook"
							data-cid="c-0"><a href="javascript:void(0)"
							data-type="active" class="notebook-name"><i
								class="icon icon-notebook"></i><span>日记本</span></a> <a
							href="javascript:void(0)" data-type="edit"
							class="edit-notebook dropdown-toggle" data-toggle="dropdown">
								<i class="fa fa-gear"></i>
						</a>
							<ul class="dropdown-menu arrow-top">
								<li><a href="javascript:void(0)"
									data-action="rename-notebook" data-toggle="modal"> <i
										class="fa fa-pencil-square-o"></i> 修改文集名
								</a></li>
								<li class="divider"></li>
								<li><a href="javascript:void(0)"
									data-action="delete-notebook"> <i class="fa fa-trash-o"></i>
										删除文集
								</a></li>
							</ul></li>
						<li class="one-notebook item" data-model="notebook" data-cid="c-1">
							<a href="javascript:void(0)" data-type="active"
							class="notebook-name"><i class="icon icon-notebook"></i><span>随笔</span></a>
							<a href="javascript:void(0)" data-type="edit"
							class="edit-notebook dropdown-toggle" data-toggle="dropdown">
								<i class="fa fa-gear"></i>
						</a>
							<ul class="dropdown-menu arrow-top">
								<li><a href="javascript:void(0)"
									data-action="rename-notebook" data-toggle="modal"> <i
										class="fa fa-pencil-square-o"></i> 修改文集名
								</a></li>
								<li class="divider"></li>
								<li><a href="javascript:void(0)"
									data-action="delete-notebook"> <i class="fa fa-trash-o"></i>
										删除文集
								</a></li>
							</ul>
						</li>
					</ul>
					<div class="commercial">
						<p>属于写作者的文集, 一个简洁而优雅的环境让你专注于书写。</p>
						<a class="btn" href="javascript:void(null)"
							data-action="recycle-mode">回收站</a>
					</div>
				</div>
				<div class="span3 middle" style="height: 641px;">
					<div id="notes-list">
						<div id="new-note">
							<a href="javascript:void(0)" data-action="create-note"
								class="new-note-link"> <i class="icon fa fa-pencil"></i> <span
								class="win-text">+新建文章 <img src="img/writer/tiny.gif"
									class="hide cnlt loader-tiny"></span>
							</a>
						</div>
						<ul class="nav nav-list notes ui-sortable">
							<li class="one-note active" data-model="note" data-cid="c-2">
								<i class="icon icon-note note-icon stop-share"></i>
								<p class="abbreviate"></p>
								<p class="wordage win-text">字数: 0</p> <a
								href="javascript:void(0)" data-type="edit"
								class="note-link title"></a> <a href="javascript:void(0)"
								data-type="share" class="share-note dropdown-toggle"
								data-toggle="dropdown"><i class="fa fa-gear"></i></a>
								<ul class="dropdown-menu arrow-top">
									<li><a href="javascript:void(0)" class="share-link"
										data-action="open-share-note"> <i class="fa fa-share"></i>
											直接发布
									</a></li>
									<li class="divider"></li>
									<li><a href="javascript:void(0)"
										data-action="open-move-note"> <i class="fa fa-folder-open"></i>
											移动文章
									</a></li>
									<li><a href="javascript:void(0)"
										data-action="trigger-history-mode"> <i
											class="fa fa-clock-o"></i> 历史版本
									</a></li>
									<li class="divider"></li>
									<li><a href="javascript:void(0)" data-action="delete-note">
											<i class="fa fa-trash-o"></i> 删除文章
									</a></li>
								</ul> <!--a href='javascript:void(null)' class='delete-note'><i class="fa fa-trash-o"></i></a-->
							</li>
						</ul>
						<div class="one-note new-note-bottom">
							<a href="javascript:void(0)" data-action="create-note">+在下方新建文章
								<img src="img/writer/tiny.gif" class="hide cnlb loader-tiny">
							</a>
						</div>
					</div>
					<div id="move-note-modal" tabindex="-1" aria-hidden="true"
						class="move-note-modal modal hide fade fullscreen">
						<div class="modal-header">
							<b>移动文章到</b>
						</div>
						<div class="modal-body">
							<ul class="notebooks-select">
							</ul>
						</div>
						<div class="modal-footer">
							<button class="btn cancel-button">取消</button>
							<input data-action="submit-move-note" class="btn btn-info"
								name="commit" type="submit" value="提交">
						</div>
					</div>
				</div>
				<div class="span7 main">
					<s:form class="note-form rich-text" data-note-id="4785107"
						action="writer">
						<input class="title mousetrap" name="post.postTitle"
							id="note_title" type="text" value="">
						<textarea name="post.postContent" id="text-input"
							oninput="this.editer.update()"
							style="width:50%;height:560px;background:#CBEFD9;font-size:22px;"></textarea>
						<div id="preview"
							style="float:right;width:47%;height:100%;background:#e6e6e6;"></div>
						<div style="margin-left:160px;">
							<button class="btn btn-default" type="submit">发布文章</button>
						</div>
					</s:form>
				</div>
			</div>
			<div class="row-fluid preview-mode">
				<div class="span6 main">
					<ul class="loading" style="height: 706px;">
						<li class="loading-a"></li>
						<li class="loading-b"></li>
					</ul>
				</div>
				<div class="span6 preview"></div>
			</div>
			<div class="writing-mode">
				<div class="main">
					<ul class="loading" style="height: 706px;">
						<li class="loading-a"></li>
						<li class="loading-b"></li>
					</ul>
				</div>
			</div>
			<div class="row-fluid history-mode">
				<div class="history-list"></div>
				<div class="history-view"></div>
			</div>
			<div class="row-fluid recycle-mode">
				<div class="recycle-note-list"></div>
				<div class="recycle-note-content span7"></div>
			</div>
		</div>
		<div id="share-weibo-modal" tabindex="-1" aria-hidden="true"
			class="share-longweibo modal hide fade fullscreen">
			<div class="modal-header">
				<b>分享到微博</b>
			</div>
			<div class="modal-body">
				<div class="pic-processing">
					<img src="img/writer/tiny.gif" class="loader-tiny"><br>
					正在生成长微博图片
				</div>
				<div class="pic-done" style="display:none">
					<img class="imagebubble-image">
				</div>
				<div class="use-image-wrapper" style="display:none">
					<label><div class="icheckbox_minimal"
							style="position: relative;">
							<input class="use-image" type="checkbox"
								style="position: absolute; opacity: 0;">
							<ins class="iCheck-helper"
								style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins>
						</div>带长微博图片分享</label>
				</div>
				<p class="pic-Production">如果您不需要带长微博分享，可点击下面的分享按钮直接分享，无需等待。</p>
			</div>
			<div class="modal-footer">
				<button class="btn btn-info">
					<span>分 享</span>
				</button>
				<a href="javascript:void(0)" class="btn btn-link"
					data-action="close-weibo-share">关闭</a>
			</div>
		</div>
		<div id="share-modal" tabindex="-1" aria-hidden="true"
			class="modal hide fade share-directly-modal fullscreen">
			<a href="javascript:void(null)" class="close" data-dismiss="modal"><i
				class="fa fa-times"></i></a>
			<div class="container">
				<div class="modal-header">
					<h3 class="">
						<i class="fa fa-check"></i> 文章发布成功！
					</h3>
				</div>
				<div class="modal-body">
					<div class="social-network">
						<h2 class="title" data-toggle="tooltip"
							data-title="点击标题可以查看已发布的文章" data-trigger="manual"
							data-placement="right" data-container=".share-directly-modal">
							<a href="javascript:void(null)" class="text-info" target="_blank">
							</a>
						</h2>
						<p>分享文章</p>
						<ul class="share unstyled">
							<li class="item-1 share-link"><a class="dropdown-toggle"
								data-toggle="dropdown" href="javascript:void(null)"> <i
									class="fa fa-link"></i>
							</a>
								<div class="arrow-top dropdown-menu permlink">
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
								<div class="arrow-top dropdown-menu"></div></li>
							<li class="douban"><a href="javascript:void(null)"
								data-sns="douban"><i class="fa fa-douban"></i></a></li>
							<li class="ellipsis"><a class="dropdown-toggle"
								data-toggle="dropdown" href="javascript:void(null)"> <i
									class="fa fa-ellipsis-h"></i>
							</a>
								<ul class="dropdown-menu arrow-top more-sns">
									<li><a href="javascript:void(null)" data-sns="tweibo">
											<img src="img/writer/tweibo.png"> 分享到腾讯微博
									</a></li>
									<li><a href="javascript:void(null)" data-sns="qzone">
											<img src="img/writer/qzone.png"> 分享到QQ空间
									</a></li>
									<li><a href="javascript:void(null)" data-sns="twitter">
											<img src="img/writer/twitter.png"> 分享到Twitter
									</a></li>
									<li><a href="javascript:void(null)" data-sns="facebook">
											<img src="img/writer/facebook.png"> 分享到Facebook
									</a></li>
									<li><a href="javascript:void(null)" data-sns="google_plus">
											<img src="img/writer/google_plus.png"> 分享到Google+
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
						<div class="loader">
							<img src="img/writer/tiny.gif" class="lodaer loader-tiny">
						</div>
						<div class="no-search-result" style="display:none">
							<p>没有找到相关的专题</p>
						</div>
						<div class="contribute"></div>
					</div>
				</div>
				<div class="modal-footer">
					<!-- <a href="javascript:void(null)" class="btn" data-action="close-share-note">关闭</a> <a href="javascript:void(null)" class="btn btn-info share-l" data-action="submit-share-note">发布</a> -->
				</div>
			</div>
		</div>
		<div class="publish-loading writer-splash" style="display:none">
			<img src="img/writer/writer.gif"%="">
		</div>
		<div tabindex="-1" aria-hidden="true"
			class="modal hide fade rename-notebook-modal fullscreen"
			id="rename-notebook-modal">
			<div class="modal-header">
				<b>修改文集名</b>
			</div>
			<div class="modal-body">
				<form class="modal-form" onsubmit="return false">
					<input placeholder="新文集名" name="name" type="text"
						class="input-large notebook-input" size="30">
				</form>
			</div>
			<div class="modal-footer">
				<a href="javascript:void(0)" class="btn cancel-button"> 取消 </a> <input
					class="rename-a-notebook btn btn-info" name="commit" type="submit"
					value="提交" data-action="submit-rename-notebook">
			</div>
		</div>
		<div id="view-mode-modal" tabindex="-1" class="modal hide read-modal"
			aria-hidden="false">
			<div class="btn-group change-background" data-toggle="buttons-radio">
				<a class="btn btn-daytime active" href="javascript:void(null)"
					data-action="set-day" rel="nofollow"> <i class="fa fa-sun-o"></i>
				</a> <a class="btn btn-nighttime " href="javascript:void(null)"
					data-action="set-night" rel="nofollow"> <i class="fa fa-moon-o"></i>
				</a>
			</div>
			<div class="btn-group change-font" data-toggle="buttons-radio">
				<a class="btn font " href="javascript:void(null)"
					data-action="set-font1" rel="nofollow">宋体</a> <a
					class="btn font hei active" href="javascript:void(null)"
					data-action="set-font2" rel="nofollow">黑体</a>
			</div>
		</div>
		<div id="img-error-modal" tabindex="-1"
			class="modal hide img-error-modal" aria-hidden="false">
			<a class="close" data-dismiss="modal" aria-hidden="true">×</a>
			<div class="error-img error-size">
				<h4>
					有<span class="number"></span>张图片大小超出限制：
				</h4>
				<p>android_icon.png</p>
				<p>APPSTORE新版宣传图.png</p>
			</div>
			<div class="error-info error-info-size">
				<p>图片大小不得超过10MB。</p>
			</div>
			<div class="error-img line">
				<p></p>
			</div>
			<div class="error-info seperator">
				<p>
					<br>
				</p>
			</div>
			<div class="error-img error-format">
				<h4>
					有<span class="number"></span>张图片格式不正确：
				</h4>
				<p>android_icon.pdf</p>
				<p>img_wifi_off.tif</p>
				<p>APPSTORE新版宣传图.tif</p>
			</div>
			<div class="error-info error-info-format">
				<p>可用图片格式：jpg，jpeg，png，gif。</p>
				<p>可用图片大小：不超过5M。</p>
			</div>
		</div>
	</div>

	<script src="js/writer/base-ded41764c207f7ff545c28c670922d25.js"></script>

	<script id="init-script" type="text/javascript" charset="utf-8">
		I18n.defaultLocale = "zh-CN";
		I18n.locale = "zh-CN";

		//Setup Settings
		Maleskine.Settings["domain"] = "http://www.jianshu.com"

		// Checking IE8
		if (Maleskine.BrowserDetector.isIE8()
				|| Maleskine.BrowserDetector.lessThanIE8()) {
			var browser_support = "<div class='browsertip' aria-hidden='true'> \
                                <b></b> \
                                <h3>别再拖延，是时候更新您的浏览器啦</h3> \
                                <p class='meta'>为了给您带来更优质的在线写作体验，简书建议您使用最新版本的 Chrome 浏览器或其他推荐浏览器进行写作。</p> \
                                <ul class='unstyled'> \
                                  <li> \
                                    <a href='http://windows.microsoft.com/zh-CN/internet-explorer/download-ie'> \
                                      <span class='item-1'></span> \
                                      <p>IE 11</p> \
                                      官方网站 \
                                    </a> \
                                  </li> \
                                  <li> \
                                    <a href='http://www.google.com/chrome/'> \
                                      <span class='item-2'></span> \
                                      <p>Chrome</p> \
                                      官方网站 \
                                    </a> \
                                  </li> \
                                  <li> \
                                    <a href='https://www.mozilla.org/firefox/'> \
                                      <span class='item-3'></span> \
                                      <p>Firefox</p> \
                                      官方网站 \
                                    </a> \
                                  </li> \
                                  <li> \
                                    <a href='http://www.apple.com/safari/'> \
                                      <span class='item-4'></span> \
                                      <p>Safari</p> \
                                      官方网站 \
                                    </a> \
                                  </li> \
                                </ul> \
                                <a class='linkColor' href='/'>回到首页</a> \
                              </div>";
			$('body').html(browser_support);
		}

		//  else {
		//   var fileref = document.createElement('script');
		//   fileref.setAttribute('type', 'text/javascript');
		//   fileref.setAttribute('src', 'http://cdn-qn0.jianshu.io/assets/writing-4761c8643f546287574d0a909e258f70.js');
		//   document.getElementsByTagName("head")[0].appendChild(fileref)
		// }
	</script>

	<script src="js/writer/writing-4761c8643f546287574d0a909e258f70.js"></script>
	<div id="flash" class="hide"></div>
	<script type="text/javascript">
		var _gaq = _gaq || [];
		_gaq.push([ '_setAccount', 'UA-35169517-1' ]);
		_gaq.push([ '_setCustomVar', 2, 'User Type', 'Member', 1 ]);
		_gaq.push([ '_trackPageview' ]);

		(function() {
			var ga = document.createElement('script');
			ga.type = 'text/javascript';
			ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl'
					: 'http://www')
					+ '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(ga, s);
		})();
	</script>

	<script>
		(function() {
			var bp = document.createElement('script');
			bp.src = '//push.zhanzhang.baidu.com/push.js';
			var s = document.getElementsByTagName("script")[0];
			s.parentNode.insertBefore(bp, s);
		})();
	</script>

	<script src='js/markdown.min.js'></script>
	<script type="text/javascript">
		function Editor(input, preview) {
			this.update = function() {
				preview.innerHTML = markdown.toHTML(input.value);
			};
			input.editer = this
			this.update()
		}

		var $ = function(id) {
			return document.getElementById(id)
		}
		new Editor($("text-input"), $("preview"))
	</script>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="http://lib.sinaapp.com/js/jquery/1.9.1/jquery-1.9.1.min.js"></script>

</body>
</html>
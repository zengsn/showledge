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

<title>简书</title>

<link href="css/css_1.css" rel="stylesheet" media="all">
<link href="css/css_3.css" rel="stylesheet" media="all">
<link href="css/css_4.css" rel="stylesheet" media="all">

<script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="js/js_6.js"></script>

<link href="img/favicon.ico" rel="icon">
<link rel="apple-touch-icon-precomposed"
	href="http://cdn-qn0.jianshu.io/assets/icon114-2f8f53b3d61f20906f666458f4647b78.png">
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
	</div>
</body>
</html>
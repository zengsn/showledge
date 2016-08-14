<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,user-scalable=no">
<meta http-equiv="Cache-Control" content="no-siteapp">

<title>设置-简随记</title>

<link href="css/css_1.css" rel="stylesheet" media="all">
<link href="css/css_2.css" rel="stylesheet" media="all">
<link href="css/css_3.css" rel="stylesheet" media="all">
<link href="css/jquery.Jcrop.min.css" rel="stylesheet" media="all">

<script src="js/js_2.js"></script>
<script src="js/js_3.js"></script>
<script src="js/jquery.Jcrop.min.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/setting.js"></script>

<link href="images/favicon.ico" rel="icon">
</head>

<body class="output no-fluid zh cn win reader-day-mode reader-font2 "
	data-js-module="user-settings" data-locale="zh-CN">
	<div class="navbar-user">
		<a class="user avatar" data-toggle="dropdown"
			href="javascript:void(0)"> <img src="${user.userImagePath}"
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
	</div>
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
	<div class="container">
		<!-- big header -->
		<div class="setting">
			<h2 class="page-title">
				<i class="fa fa-cogs"></i> 设置
			</h2>
			<ul class="nav nav-tabs">
				<li class="active"><a href="" data-toggle="tab"
					onClick="onclick_div1()"> 基础设置 </a></li>
				<!-- profile sns misc -->
				<li><a href="" data-toggle="tab" onClick="onclick_div2()">
						个人资料 </a></li>
				<li><a href="" data-toggle="tab" onClick="onclick_div4()">
						修改密码 </a></li>
				<li><a href="" data-toggle="tab" onClick="onclick_div6()">
						打赏设置 </a></li>
				<li><a href="" data-toggle="tab" onClick="onclick_div7()">
						帐号管理 </a></li>
			</ul>

			<div class="tab-content">
				<!-- User Pane -->
				<div class="tab-pane active" id="basic">
					<form id="settings-basic" class="settings" data-type="json"
						action="" accept-charset="UTF-8" data-remote="true" method="post">
						<!-- Nickname -->
						<div class="control-group">
							<h4>昵称和电子邮件</h4>
							<label class="control-label">昵称</label> <input
								placeholder="2-15字符，中英文、数字和下划线" class="input-xlarge" type="text"
								value="${userNameInSession}" id="userName" name="userName"
								onfocus="clearNameCss()"> <span
								class="nickname-availability"></span> <span id="noNameMessage"
								style="color:red;display:none;font-size:16px;padding-left:14px;vertical-align:middle;"></span>
							<span id="yesNameMessage"
								style="color:green;display:none;font-size:16px;padding-left:14px;vertical-align:middle;"></span>

							<!-- Email -->
							<label class="control-label">电子邮件</label>

							<div data-js-module="email-check">
								<div class="input-append">
									<input class="input-xlarge" type="text" name="user[email]"
										id="user_email">
									<button class="btn btn-large email-confirmation" type="button">发送</button>
									<img style="padding-top: 20px;padding-left:10px"
										class="loader-tiny email-loader hide"
										src="images/setting/tiny.gif" alt="Tiny">
								</div>
								<br> <span class="email-notice"><i
									class="fa fa-info-circle email-sign"></i> 输入您的常用邮箱并点击发送按钮,
									我们会发给您一封邮件以确认您的邮箱地址</span>
							</div>
						</div>
						<button id="settings-basic-button" type="submit"
							class="ladda-button submit-button" data-color="blue"
							data-style="slide-left" style="display: inline-block;">
							<span class="ladda-label">保 存</span>
						</button>
					</form>
				</div>

				<div class="tab-pane" id="profile">
					<form id="personal-form" class="settings"
						enctype="multipart/form-data" action="" accept-charset="UTF-8"
						method="post">
						<div class="control-group">
							<label class="control-label">头像</label>
							<div id="preview-pane">
								<div class="avatar preview-container">
									<img src="${user.userImagePath}" class="jcrop-preview"
										alt="您还没有上传头像~">
								</div>
								<div class="btn-group change-avatar">
									<a class="btn dropdown-toggle" data-toggle="dropdown" href="">更换头像
										<span class="caret"></span>
									</a>
									<ul class="dropdown-menu arrow-top">
										<li class="upload-button"><a href=""
											class="upload-avatar"><i class="fa fa-pencil"></i> <input
												class="btn-link btn-large hidden-field" type="file"
												name="imgFile" id="fcupload" onchange="readURL(this);"">
												上传头像 </a></li>
									</ul>
									<img id="upload-loader" class="hide loader-tiny"
										src="images/setting/tiny.gif" alt="Tiny">
								</div>
							</div>

							<label class="control-label">简介</label>
							<textarea placeholder="填写您的个人简介可以帮助其他人更好的了解您。" rows="5"
								class="input-xxlarge" name="user[intro]" id="user_intro"></textarea>
							<label class="control-label">个人主页</label> <input
								placeholder="您的个人主页 http://example.com" class="input-xlarge"
								type="text" name="user[homepage]" id="user_homepage">

						</div>
						<div class="control-group">
							<h4>
								微信二维码<span class="notice">（ 将会显示在您的个人主页 ）</span>
							</h4>

							<div class="micro-code">
								<i class="fa fa-qrcode"></i>
							</div>
							<div class="btn-group change-avatar">
								<a class="btn dropdown-toggle" data-toggle="dropdown"
									href="http://www.jianshu.com/settings#">管理微信二维码 <span
									class="caret"></span></a>
								<ul class="dropdown-menu  arrow-top up-btn">
									<li class="upload-button"><a href="javascript:void(0)"
										class="upload-qrcode"><i class="fa fa-arrow-circle-o-up"></i>
											<input class="btn-link btn-large hidden-field" type="file"
											name="user[qrcode]" id="user_qrcode"> 上传</a></li>
									<li><a class="clear-qrcode" data-remote="true"
										rel="nofollow" data-method="post"
										href="http://www.jianshu.com/users/clear_qrcode"> <i
											class="fa fa-trash-o"></i> 清除
									</a></li>
								</ul>
							</div>
							<img class="hide loader-tiny qrcode-loader"
								src="images/setting/tiny.gif" alt="Tiny">
						</div>
						<button id="personal-button" type="button"
							class="ladda-button submit-button" data-color="blue"
							data-style="slide-left" click="" style="display: inline-block;">
							<span class="ladda-label">保 存</span>
						</button>
					</form>
				</div>

				<!-- Password Pane -->
				<div class="tab-pane" id="pass">
					<form id="settings-pass" class="settings" action=""
						accept-charset="UTF-8" data-remote="true" method="post">
						<div>
							<label class="control-label">当前密码</label> <input id="oldPassword"
								name="oldPassword" class="input-xlarge" type="password"
								onfocus="clearOldPasswordCss()"> <span
								id="noOldPasswordMessage"
								style="color:red;display:none;font-size:16px;padding-left:18px;vertical-align:middle;"></span>
							<label class="control-label">新密码</label> <input id="newPassword"
								name="newPassword" class="input-xlarge" type="password"
								onfocus="clearNewPasswordCss()"> <span
								id="yesNewPasswordMessage"
								style="color:green;display:none;font-size:16px;padding-left:18px;vertical-align:middle;"></span>
							<span id="noNewPasswordMessage"
								style="color:red;display:none;font-size:16px;padding-left:18px;vertical-align:middle;"></span>
							<label class="control-label">确认密码</label> <input
								id="confirmPassword" name="confirmPassword" class="input-xlarge"
								type="password" onfocus="clearConfirmPasswordCss()"> <span
								id="noConfirmPasswordMessage"
								style="color:red;display:none;font-size:16px;padding-left:18px;vertical-align:middle;"></span>
						</div>
						<button id="settings-pass-button"
							class="ladda-button submit-button" data-color="blue"
							data-style="slide-left"
							style="display: inline-block;margin-top: 10px">
							<span class="ladda-label">保 存</span>
						</button>
					</form>
				</div>

				<!-- Reward Pane -->
				<div class="tab-pane" id="reward">
					<h4>
						打赏管理 <span class="notice">启用后打赏按钮将出现在您的文章底部</span>
					</h4>
					<form id="settings-reward" class="settings"
						action="http://www.jianshu.com/users/af5e3096ebc7"
						accept-charset="UTF-8" data-remote="true" method="post">
						<input name="utf8" type="hidden" value="✓"><input
							type="hidden" name="_method" value="patch">
						<div class="control-group">
							<a class="btn btn-info" rel="nofollow" data-method="put"
								href="http://www.jianshu.com/users/toggle_all_notes_rewardable">为所有文章关闭打赏</a>
						</div>

						<div class="control-group">
							<label class="control-label">默认接受打赏金额</label>
							<div class="input-prepend">
								<span class="add-on"><i class="fa fa-cny fa-fw"></i></span> <input
									value="2.00" class="input-small" type="text"
									name="user[reward_setting][default_amount]"
									id="user_reward_setting_default_amount">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">打赏描述</label>
							<textarea placeholder="如果觉得我的文章对您有用，请随意打赏。您的支持将鼓励我继续创作！" rows="5"
								class="input-xxlarge" name="user[reward_setting][description]"
								id="user_reward_setting_description"></textarea>
						</div>
						<button class="ladda-button submit-button" data-color="blue"
							data-style="slide-left" style="display: inline-block;">
							<span class="ladda-label">保 存</span>
						</button>
					</form>
				</div>

				<!--- destroy Pane -->
				<div class="tab-pane" id="destroy" data-js-module="self-destroy">
					<h4>删除帐号</h4>
					<p>
						<i class="fa fa-exclamation-circle"></i> 此操作将删除用户在简随记的所有数据，请谨慎操作！
					</p>
					<p class="notice hide">
						<i class="fa fa-exclamation-circle"></i> 现在帐号已可删除, 该操作不可恢复, 请谨慎操作!
					</p>
					<a class="btn btn-large btn-danger delete" data-type="json"
						confirm="是否确定完全删除帐号及一切相关信息？" data-remote="true" rel="nofollow"
						data-method="delete" href="http://www.jianshu.com/mine">删除帐号</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
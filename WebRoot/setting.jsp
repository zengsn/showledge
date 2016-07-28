<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,user-scalable=no">

<title>设置 - 简书</title>

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

<script type="text/javascript">
	function removeclass() {
		$("#basic").removeClass("active");
		$("#profile").removeClass("active");
		$("#sns").removeClass("active");
		$("#pass").removeClass("active");
		$("#blacklist").removeClass("active");
		$("#reward").removeClass("active");
		$("#destroy").removeClass("active");
	}
	function onclick_div1() {
		removeclass();
		$("#basic").addClass("active");
	}
	function onclick_div2() {
		removeclass();
		$("#profile").addClass("active");
	}
	function onclick_div3() {
		removeclass();
		$("#sns").addClass("active");
	}
	function onclick_div4() {
		removeclass();
		$("#pass").addClass("active");
	}
	function onclick_div5() {
		removeclass();
		$("#blacklist").addClass("active");
	}
	function onclick_div6() {
		removeclass();
		$("#reward").addClass("active");
	}
	function onclick_div7() {
		removeclass();
		$("#destroy").addClass("active");
	}
</script>
</head>

<body class="output no-fluid zh cn win reader-day-mode reader-font2 "
	data-js-module="user-settings" data-locale="zh-CN">
	<div class="navbar-user">
		<a class="user avatar" data-toggle="dropdown"
			href="javascript:void(0)"> <img
			src="img/setting/11-bfaf6775ca414a8854c9ca910e05b7a1.jpg" alt="11">
			<b class="caret"></b>
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
				href="http://www.jianshu.com/settings#"><i
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
			<a class="logo" role="button" data-original-title="个人主页"
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
			</a> <a href="http://www.jianshu.com/settings#view-mode-modal"
				data-toggle="modal"><i class="fa fa-font"></i><span
				class="title">显示模式</span></a> <a data-toggle="tooltip"
				data-placement="right" data-original-title="设置"
				data-container="div.expanded" class="active"
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

	<div class="container">
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
				<li><a href="" data-toggle="tab" onClick="onclick_div3()">
						社交帐号 </a></li>
				<li><a href="" data-toggle="tab" onClick="onclick_div4()">
						修改密码 </a></li>
				<li><a href="" data-toggle="tab" onClick="onclick_div5()">
						黑名单 </a></li>
				<li><a href="" data-toggle="tab" onClick="onclick_div6()">
						打赏设置 </a></li>
				<li><a href="" data-toggle="tab" onClick="onclick_div7()">
						帐号管理 </a></li>
			</ul>

			<div class="tab-content">
				<!-- User Pane -->
				<div class="tab-pane active" id="basic">
					<form id="settings-basic" class="settings" data-type="json"
						action="update_base_setting" accept-charset="UTF-8"
						data-remote="true" method="post">
						<input type="hidden" name="user.email"
							value="<s:property value="user.email" />">
						<!-- Nickname -->
						<div class="control-group">
							<h4>昵称和电子邮件</h4>
							<label class="control-label">昵称</label> <input
								placeholder="2-15字符，中英文、数字和下划线" class="input-xlarge" type="text"
								value="<s:property value="user.name" />" name="user.name"
								id="user_nickname"> <span class="nickname-availability"></span>

							<!-- Email -->
							<label class="control-label">电子邮件</label>

							<div data-js-module="email-check">
								<div class="input-append">
									<input class="input-xlarge" type="text" name="user[email]"
										id="user_email">
									<button class="btn btn-large email-confirmation" type="button">发送</button>
									<img style="padding-top: 20px;padding-left:10px"
										class="loader-tiny email-loader hide"
										src="img/setting/tiny.gif" alt="Tiny">
								</div>
								<br> <span class="email-notice"><i
									class="fa fa-info-circle email-sign"></i> 输入您的常用邮箱并点击发送按钮,
									我们会发给您一封邮件以确认您的邮箱地址</span>
							</div>

							<!-- Sms verification -->
							<label class="control-label">绑定手机号码</label> <input
								class="input-xlarge" disabled="disabled" type="text"
								value="15767979645" name="user[mobile_number]"
								id="user_mobile_number"> <span
								class="unbind-mobile hide">解除绑定</span> <br> <span><i
								class="fa fa-check sms-verification-notice"></i> 手机号码已验证</span>
						</div>
					</form>
				</div>

				<div class="tab-pane" id="profile">
					<form id="settings-profile" class="settings"
						enctype="multipart/form-data" action="update_img"
						accept-charset="UTF-8" data-remote="true" method="post">
						<input type="hidden" name="user.name"
							value="<s:property value="user.name" />">
						<div class="control-group">
							<label class="control-label">头像</label>
							<div class="avatar">
								<img src="<s:property value="user.img" />" alt="11">
							</div>
							<div class="btn-group change-avatar">
								<a class="btn dropdown-toggle" data-toggle="dropdown" href="">更换头像
									<span class="caret"></span>
								</a>
								<ul class="dropdown-menu arrow-top">
									<li class="upload-button"><a href="" class="upload-avatar"><i
											class="fa fa-pencil"></i> <input
											class="btn-link btn-large hidden-field" type="file"
											name="file"> 上传头像</a></li>
								</ul>
								<img id="upload-loader" class="hide loader-tiny"
									src="img/setting/tiny.gif" alt="Tiny">
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
								src="img/setting/tiny.gif" alt="Tiny">
						</div>
					</form>
				</div>

				<div class="tab-pane" id="sns">
					<div class="control-group">
						<h4>
							社交帐号 <img class="sns-loader loader-tiny hide"
								src="img/setting/tiny.gif" alt="Tiny">
						</h4>
						<p>您可以通过绑定的社交帐号登录简书。如果您更新了社交网络的昵称或头像, 点击 "刷新"
							会将它们更新到简书。出于安全因素, 您最初用来创建账户的社交帐号不能移除。</p>

						<table class="table table-bordered">
							<thead>
								<tr>
									<th>社交网络</th>
									<th>账户名</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<!-- 已绑定的社交网络接入 -->

								<!-- 未绑定的社交网络接入 -->
								<tr class="info">
									<td><img src="img/setting/qq_connect_grey.png"
										alt="Qq connect grey"></td>
									<td colspan="2"><a
										href="http://www.jianshu.com/users/auth/qq_connect">
											点击绑定QQ账户 </a></td>
								</tr>
								<tr class="info">
									<td><img src="img/setting/weibo_grey.png" alt="Weibo grey"></td>
									<td colspan="2"><a
										href="http://www.jianshu.com/users/auth/weibo"> 点击绑定新浪微博账户
									</a></td>
								</tr>
								<tr class="info">
									<td><img src="img/setting/douban_grey.png"
										alt="Douban grey"></td>
									<td colspan="2"><a
										href="http://www.jianshu.com/users/auth/douban"> 点击绑定豆瓣账户
									</a></td>
								</tr>
								<tr class="info">
									<td><img src="img/setting/google_oauth2_grey.png"
										alt="Google oauth2 grey"></td>
									<td colspan="2"><a
										href="http://www.jianshu.com/users/auth/google_oauth2">
											点击绑定Google账户 </a></td>
								</tr>
								<tr class="info">
									<td><img src="img/setting/wechat_grey.png"
										alt="Wechat grey"></td>
									<td colspan="2"><a
										href="http://www.jianshu.com/users/auth/wechat"> 点击绑定微信账户
									</a></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="control-group">
						<h4>是否在个人主页显示社交帐号</h4>
						<form id="settings-account" class="settings" data-type="json"
							action="http://www.jianshu.com/users/af5e3096ebc7"
							accept-charset="UTF-8" data-remote="true" method="post">
							<input name="utf8" type="hidden" value="✓"><input
								type="hidden" name="_method" value="patch"> <input
								type="hidden" name="user[public_sns_ids][]"
								id="user_public_sns_ids_">
						</form>
					</div>

					<div class="control-group user-authentication">
						<h4>
							简书新浪微博联合认证<span class="tips">（简书推荐作者）</span>
						</h4>
						<div class="error-tips">
							<p>您需要满足以下条件才能开始申请</p>
							<ul class="icons-ul">
								<li><i class="fa fa-check"></i> 简书帐号注册超过 30 天</li>
								<li>简书帐号绑定新浪微博帐号</li>
								<li>邮箱通过验证</li>
								<li>在简书发表文章字数达到 20000 字</li>
								<li>在简书收获喜欢数达到 2000 个</li>
							</ul>
						</div>
					</div>
					<div class="control-group user-authentication">
						<h4>
							简书新浪微博联合认证<span class="tips">（简书专题运营）</span>
						</h4>
						<div class="error-tips">
							<p>您需要满足以下条件才能开始申请</p>
							<ul class="icons-ul">
								<li><i class="fa fa-check"></i> 简书帐号注册超过 30 天</li>
								<li>简书帐号绑定新浪微博帐号</li>
								<li>邮箱通过验证</li>
								<li>在简书参与编辑的专题收获订阅总数达到 1000 个</li>
							</ul>
						</div>
					</div>
				</div>

				<!-- Password Pane -->
				<div class="tab-pane" id="pass">
					<form id="settings-pass" class="settings" action="update_pwd"
						accept-charset="UTF-8" data-remote="true" method="post">
						<input type="hidden" name="user.name"
							value="<s:property value="user.name" />"> <label
							class="control-label">当前密码</label> <input class="input-xlarge"
							type="password" name="oldPwd" id="user_current_password">
						<label class="control-label">新密码</label> <input
							class="input-xlarge" type="password" name="user.password"
							id="user_password"> <label class="control-label">确认密码</label>
						<input class="input-xlarge" type="password"
							name="user[password_confirmation]"
							id="user_password_confirmation">
					</form>
				</div>

				<!-- Blacklist Pane -->
				<div class="tab-pane blacklist" id="blacklist">
					<p>您可以在用户主页将用户加入您的黑名单。在您黑名单中的用户无法在您的文章下面发表评论，无法在其他评论中提到您，也无法给您发送简信。</p>
					<form action="http://www.jianshu.com/blacklists/unblock"
						accept-charset="UTF-8" data-remote="true" method="post">
						<input name="utf8" type="hidden" value="✓">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<th colspan="2">黑名单用户</th>
									<th>操作</th>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="3">
										<div class="icheckbox_minimal" style="position: relative;">
											<input type="checkbox" name="selectall" id="selectall"
												value="1" style="position: absolute; opacity: 0;">
											<ins class="iCheck-helper"
												style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins>
										</div> 全选 <input type="submit" name="commit" value="批量移除"
										class="btn-link">
									</td>
								</tr>
							</tfoot>
						</table>
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
					</form>
				</div>

				<!--- destroy Pane -->
				<div class="tab-pane" id="destroy" data-js-module="self-destroy">
					<h4>删除帐号</h4>
					<p>
						<i class="fa fa-exclamation-circle"></i> 此操作将删除用户在简书的所有数据，请谨慎操作！
					</p>
					<p class="notice hide">
						<i class="fa fa-exclamation-circle"></i> 现在帐号已可删除, 该操作不可恢复, 请谨慎操作!
					</p>
					<a class="btn btn-large btn-danger delete" data-type="json"
						confirm="是否确定完全删除帐号及一切相关信息？" data-remote="true" rel="nofollow"
						data-method="delete" href="http://www.jianshu.com/mine">删除帐号</a>
				</div>

				<button class="ladda-button submit-button" data-size="m"
					data-color="blue" data-method="get" data-style="slide-left"
					style="display: inline-block;">
					<span class="ladda-label">保 存</span>
				</button>
			</div>
		</div>
	</div>
</body>
</html>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="common/tag.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@include file="common/head.jsp"%>
<title>设置 - 秀知识</title>

<link href="<%=path%>/css/nav.css" rel="stylesheet">
<link href="<%=path%>/css/setting.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<%@include file="common/nav.jsp"%>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2 blank"></div>
			<div class="col-md-8">
				<div class="row">
					<div class="col-md-4 aside">
						<div>
							<!-- Nav tabs -->
							<ul class="nav nav-stack" role="tablist">
								<li role="presentation" class="active">
									<a href="#basic-setting" aria-controls="basic-setting" role="tab" data-toggle="tab">
										<img src="icon/basic-setting.png" style="margin-right:10px;" alt="icon">
										基础设置
									</a>
								</li>
								<li role="presentation">
									<a href="#user-profile" aria-controls="user-profile" role="tab" data-toggle="tab">
										<img src="icon/user-profile.png" style="margin-left:6px;margin-right:15px;" alt="icon">
										个人资料
									</a>
								</li>
								<li role="presentation">
									<a href="#change-password" aria-controls="change-password" role="tab" data-toggle="tab">
										<img src="icon/change-password.png" style="margin-left:6px;margin-right:15px;" alt="icon">
										修改密码
									</a>
								</li>
								<li role="presentation">
									<a href="#account-manage" aria-controls="account-manage" role="tab" data-toggle="tab">
										<img src="icon/account-manage.png" style="margin-right:9px;" alt="icon">
										帐号管理
									</a>
								</li>
								<li role="presentation">
									<a href="#help" aria-controls="help" role="tab" data-toggle="tab">
										<img src="icon/help.png" style="margin-left:9px;margin-right:18px;" alt="icon">
										帮助与反馈
									</a>
								</li>
							</ul>
						</div>
					</div>

					<div class="col-md-8 main">
						<!-- Tab panes fade-->
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane fade in active" id="basic-setting">
								<form id="personal-form" class="form-horizontal" enctype="multipart/form-data"
									accept-charset="UTF-8" data-remote="true" method="post">
									<!-- 警告框 -->
									<div class="alert alert-success" role="alert">保存成功</div>
									<!-- 警告框 end -->

									<div class="form-group">
										<div id="preview">
											<img id="current-avatar" src="${user.userImagePath}" alt="您还没有上传头像~">
										</div>
										<div id="current-avatar-input">
											<label for="input-avatar">更换头像</label>
											<input id="imgFile" name="imgFile" type="file"
												onchange="settingJS.preview(this, '${user.userImagePath}');">
										</div>
									</div>
									<hr>
									<div class="form-group">
										<label for="input-name" class="col-sm-2 control-label">昵称</label>
										<div class="col-sm-10">
											<input id="userName" name="userName" type="text" class="form-control"
												value="${user.userName}" placeholder="2-15字符，中英文、数字和下划线">
										</div>
									</div>
									<hr>
									<div class="form-group">
										<label for="input-email" class="col-sm-2 control-label">电子邮箱</label>
										<div class="col-sm-10" style="padding-top:5px;">${user.userEmail}</div>
									</div>
									<hr>
									<div class="form-group">
										<label for="input-tel" class="col-sm-2 control-label">手机</label>
										<div class="col-sm-10">
											<input id="userPhone" name="" userPhone"" type="text" class="form-control"
												value="${user.userPhone}">
										</div>
									</div>
									<hr>
									<button type="button" class="btn btn-success btn-lg" style="margin-left:240px;"
										onclick="settingJS.updateBasicSetting('<%=path%>');">保存</button>
								</form>
							</div>
							<!-- basic-setting end -->

							<div role="tabpanel" class="tab-pane fade" id="user-profile">
								<form class="form-horizontal">
									<!-- 警告框 -->
									<div class="alert alert-success" role="alert">保存成功</div>
									<!-- 警告框 end -->

									<div class="form-group">
										<label for="input-name" class="col-sm-2 control-label">个人简介</label>
										<div class="col-sm-10">
											<textarea id="userIntroduce" name="userIntroduce" class="form-control" rows="5"
												placeholder="填写您的个人简介可以帮助其他人更好的了解您。">${user.userIntroduce}</textarea>
										</div>
									</div>
									<hr>
									<div class="form-group">
										<label for="input-website" class="col-sm-2 control-label">个人网站</label>
										<div class="col-sm-10">
											<input id="userWeb" type="text" class="form-control" placeholder="http://"
												value="${user.userWeb}">
										</div>
									</div>
									<hr>
									<button type="button" class="btn btn-success btn-lg save" style="margin-left:240px;"
										onclick="settingJS.updatePersonalData('<%=path%>');">保存</button>
								</form>
							</div>
							<!-- user-profile -->

							<div role="tabpanel" class="tab-pane fade" id="change-password">
								<form class="form-horizontal">
									<!-- 警告框 -->
									<div class="alert alert-success" role="alert">修改密码成功</div>
									<!-- 警告框 end -->

									<div class="form-group">
										<label for="old-password" class="col-sm-2 control-label">原密码</label>
										<div class="col-sm-10">
											<input id="oldPassword" name="oldPassword" type="password" class="form-control">
										</div>
									</div>
									<hr>
									<div class="form-group">
										<label for="new-password" class="col-sm-2 control-label">新密码</label>
										<div class="col-sm-10">
											<input id="newPassword" name="newPassword" type="password" class="form-control">
										</div>
									</div>
									<hr>
									<div class="form-group">
										<label for="enter-new-password" class="col-sm-2 control-label">确认密码</label>
										<div class="col-sm-10">
											<input id="confirmPassword" name="confirmPassword" type="password" class="form-control">
										</div>
									</div>
									<hr>
									<button type="button" class="btn btn-success btn-lg" style="margin-left:240px;"
										onclick="settingJS.updatePassword('<%=path%>');">确定</button>
								</form>
							</div>
							<!-- change-password end -->

							<div role="tabpanel" class="tab-pane fade" id="account-manage">
								<form class="form-horizontal">
									<!-- 警告框 -->
									<div class="alert alert-success" role="alert">保存成功</div>
									<!-- 警告框 end -->

									<div class="form-group">
										<label for="logout-account" class="col-sm-2 control-label">注销帐号</label>
										<div class="col-sm-10">
											<button type="submit" class="btn btn-default " id="logout-account">注销帐号</button>
										</div>
									</div>
									<hr>
									<div class="form-group">
										<label for="delete-account" class="col-sm-2 control-label">删除帐号</label>
										<div class="col-sm-10">
											<button type="submit" class="btn btn-danger " id="delete-account">删除帐号</button>
										</div>
									</div>
									<hr>
								</form>
							</div>
							<!-- accuont-manage -->

							<div role="tabpanel" class="tab-pane fade" id="help">提示一些信息</div>
							<!-- help end -->
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-2 blank"></div>
		</div>
	</div>

	<%@ include file="common/common-js.jsp"%>
	<script src="<%=path%>/js/setting.js"></script>
</body>
</html>
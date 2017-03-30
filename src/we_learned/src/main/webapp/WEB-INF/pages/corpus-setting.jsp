<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="common/tag.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="common/head.jsp"%>
<title>编辑专题 - 秀知识</title>

<link href="<%=path%>/css/nav.css" rel="stylesheet">
<link href="<%=path%>/css/corpus-setting.css" rel="stylesheet">

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
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<form id="personal-form" class="form-horizontal" enctype="multipart/form-data"
					accept-charset="UTF-8" data-remote="true" method="post">
					<!-- 警告框 -->
					<div class="alert alert-success" role="alert">保存成功</div>
					<!-- 警告框 end -->

					<!-- 标题 -->
					<h3 style="font-weight:bold;margin-bottom:30px;">编辑专题</h3>

					<!-- 表单 -->
					<div class="input-album-pic">
						<div id="preview" style="display:inline-block;">
							<img id="current-avatar" src="<%=path%>/${corpus.corpusImagePath}" alt="您还没有上传封面图片~">
						</div>
						<div id="current-avatar-input" class="upfilebox" style="display:inline-block;">
							<input id="imgFile" name="imgFile" type="file"
								onchange="corpusSettingJS.preview(this, '${corpus.corpusImagePath}');">
							<label>上传封面图片</label>
						</div>
					</div>
					<hr>

					<div class="form-group">
						<label for="album-name" class="col-sm-2 control-label">专辑名称</label>
						<div class="col-sm-7">
							<input id="corpus-name" type="text" class="form-control" placeholder="填写专辑名称"
								value="${corpus.corpusName}">
						</div>
					</div>
					<hr>

					<div class="form-group">
						<label for="album-discribe" class="col-sm-2 control-label">专辑描述</label>
						<div class="col-sm-10">
							<textarea id="corpus-discribe" class="form-control" rows="5" placeholder="填写描述">${corpus.corpusDiscribe}</textarea>
						</div>
					</div>
					<hr>
					<br>

					<div class="form-group">
						<div class="col-sm-10">
							<button type="button" class="btn btn-success btn-lg"
								onclick="corpusSettingJS.updateCorpusSetting('${corpus.id}','<%=path%>');">保存修改</button>
						</div>
					</div>
				</form>
			</div>
			<div class="col-md-3"></div>
		</div>
	</div>

	<%@ include file="common/common-js.jsp"%>
	<script src="<%=path%>/js/corpus-setting.js" type="text/javascript"></script>
</body>
</html>
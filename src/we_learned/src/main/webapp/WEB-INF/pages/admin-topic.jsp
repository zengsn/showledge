<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common/tag.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="common/head.jsp"%>
<title>简随记 | 控制台</title>

<link href="<%=path%>/css/admin.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
	<div class="container-fluid">
		<div class="panel panel-default">
			<!-- Default panel contents -->
			<div class="panel-heading">
				文集管理
				<form style="height:35px;display:inline-block;margin-left:650px;" role="search"
					class="form-inline">
					<div class="form-group">
						<input style="display:inline-block;width:200px;" type="text" class="form-control"
							placeholder="Search">
						<button style="" type="submit" class="btn btn-default">Submit</button>
					</div>
				</form>
			</div>

			<!-- Table -->
			<table class="table table-striped">
				<tr>
					<th>id</th>
					<th>标题</th>
					<th>文章数</th>
					<th>总字数</th>
					<th>关注数</th>
					<th>详情</th>
					<th>删除</th>
				</tr>
				<c:forEach items="${corpusList}" var="corpus">
					<tr>
						<th>${corpus.id}</th>
						<td>${corpus.corpusName}</td>
						<td>${corpus.essayNumber}</td>
						<td>${corpus.essayWordNumber}</td>
						<td>${corpus.userFocusNumber}</td>
						<td><button class="btn btn-primary" data-toggle="modal" data-target="#detail-info">详情</button></td>
						<td><button class="btn btn-danger">删除</button></td>
					</tr>
				</c:forEach>
			</table>

			<!-- 分页 -->
			<nav aria-label="Page navigation">
				<ul class="pager">
					<li>
						<a href="#" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
					<li>
						<a href="#">1</a>
					</li>
					<li>
						<a href="#">2</a>
					</li>
					<li>
						<a href="#">3</a>
					</li>
					<li>
						<a href="#">4</a>
					</li>
					<li>
						<a href="#">5</a>
					</li>
					<li>
						<a href="#" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</ul>
			</nav>
		</div>

		<!-- 详情模态框 -->
		<div class="modal fade" id="detail-info" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">详情</h4>
					</div>
					<!-- 详情表单 -->
					<div class="modal-body">
						<form class="form-horizontal">
							<div class="form-group">
								<label for="album-title" class="col-sm-2 control-label">专题标题</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="album-title" placeholder="专题标题">
								</div>
							</div>
							<div class="form-group">
								<label for="album-content" class="col-sm-2 control-label">内容数量</label>
								<div class="col-sm-8">
									<span id="album-content" class="form-control">43</span>
								</div>
							</div>
						</form>
					</div>
					<!-- 详情表单 end -->
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary">保存</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="common/common-js.jsp"%>
</body>
</html>
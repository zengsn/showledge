<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common/tag.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="common/head.jsp"%>
<title>秀知识 | 控制台</title>

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
			<div class="panel-heading">文集管理</div>

			<!-- Table -->
			<table class="table table-striped">
				<tr>
					<th>#</th>
					<th>标题</th>
					<th>文章数</th>
					<th>赞数</th>
					<th>关注</th>
				</tr>
				<tr>
					<th>1</th>
					<td>word哥张三的个人日记专题</td>
					<td>1234</td>
					<td>999</td>
					<td>599</td>
				</tr>
				<tr>
					<th>2</th>
					<td>亲戚李四的学习经历专题</td>
					<td>1234</td>
					<td>2345</td>
					<td>959</td>
				</tr>
				<tr>
					<th>3</th>
					<td>隔壁老王不得不说的故事专题</td>
					<td>1</td>
					<td>99</td>
					<td>998</td>
				</tr>
			</table>
		</div>
	</div>

	<%@ include file="common/common-js.jsp"%>
</body>
</html>
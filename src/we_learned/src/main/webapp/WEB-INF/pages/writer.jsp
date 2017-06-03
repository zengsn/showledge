<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common/tag.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="common/head.jsp"%>
<title>写文章 - 简随记</title>

<link href="<%=path%>/css/writer.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
	<!-- 页面主要内容 -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2 aside">
				<a class="home-wrap" href="index">
					<span class="glyphicon glyphicon-home"></span>
					<span>返回首页</span>
				</a>
				<!-- home-wrap end -->
				<div class="new-notebook-btn">
					<span class="glyphicon glyphicon-plus-sign"></span>
					<span>新建文集</span>
				</div>
				<!-- new-notebook-btn end-->
				<div class="new-notebook-panel">
					<form id="corpus_form" class="create-notebook-form" method="post">
						<input id="corpusName" name="corpusName" class="new-notebook-name" type="text"
							placeholder="请输入文集名...">
						<a href="#" class="glyphicon glyphicon-ok enter-btn"></a>
						<a href="#" class="glyphicon glyphicon-remove cancel-btn"></a>
					</form>
				</div>
				<!-- new-notebook-panel -->
				<ul class="nav nav-stacked notebook-list">
					<c:forEach items="${corpusList}" var="corpus" varStatus="status">
						<!--glyphicon glyphicon-cog-->
						<c:if test="${status.index == 0}">
							<input id="corpusListSize_hidden" type="hidden" value="${corpus.id}">
							<li id="corpus_li_${status.index}" class="one-notebook active">
								<div class="notebook-name">
									<div onclick="writerJS.getEssayByCorpusId(${corpus.id},${status.index})">${corpus.corpusName}</div>
									<div class="dropdown edit-notebook">
										<span class="glyphicon glyphicon-cog" id="dropdownMenu1" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="true"></span>
										<ul class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu1">
											<li data-toggle="modal" data-target=".bs-example-modal-sm">
												<a href="#" class="edit-notebook-name"
													onclick="writerJS.updateCorpusName('${corpus.id}');">
													<span class="glyphicon glyphicon-pencil" style="margin-right:10px;"></span>
													修改名称
												</a>
											</li>
											<li role="separator" class="divider"></li>
											<li>
												<a href="#" onclick="writerJS.deleteCorpusConfirm(${corpus.id});">
													<span class="glyphicon glyphicon-trashglyphicon glyphicon-trash"
														style="margin-right:10px;"></span>
													删除文集
												</a>
											</li>
										</ul>
									</div>
								</div>
							</li>
						</c:if>
						<c:if test="${status.index != 0}">
							<li class="one-notebook">
								<div class="notebook-name">
									<div onclick="writerJS.getEssayByCorpusId(${corpus.id},${status.index})">${corpus.corpusName}</div>
									<div class="dropdown edit-notebook">
										<span class="glyphicon glyphicon-cog" id="dropdownMenu1" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="true"></span>
										<ul class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu1">
											<li data-toggle="modal" data-target=".bs-example-modal-sm">
												<a href="#" class="edit-notebook-name"
													onclick="writerJS.updateCorpusName('${corpus.id}');">
													<span class="glyphicon glyphicon-pencil" style="margin-right:10px;"></span>
													修改名称
												</a>
											</li>
											<li role="separator" class="divider"></li>
											<li>
												<a href="#" onclick="writerJS.deleteCorpusConfirm(${corpus.id});">
													<span class="glyphicon glyphicon-trashglyphicon glyphicon-trash"
														style="margin-right:10px;"></span>
													删除文集
												</a>
											</li>
										</ul>
									</div>
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
				<!-- notebook-list end-->
				<div class="trash-bin">
					<!-- glyphicon glyphicon-trashglyphicon glyphicon-trash -->
					<span class="glyphicon glyphicon-trashglyphicon glyphicon-trash"></span>
					<span>回收站</span>
				</div>
				<!-- trash-bin end -->
			</div>

			<!-- aside end -->
			<div class="col-md-3 middle">
				<c:if test="${corpusList.size() != 0}">
					<div class="new-article-btn">
						<input id="essayListSize_hidden" type="hidden" value="${essayListSize}">
						<span class="glyphicon glyphicon-pencil"></span>
						<span>新建文章</span>
					</div>
					<!-- new-article-btn end -->
					<ul id="notes_list_div" class="nav nav-stacked article-list">
						<c:forEach items="${essayList}" var="essay" varStatus="status">
							<c:if test="${status.index == 0}">
								<li id="essay_li_${status.index}" class="one-article active">
									<div class="row">
										<div class="col-md-4 left">
											<img class="icon-file" src="icon/file-48px.png" alt="icon">
											<p class="char-count">字数：${essay.essayWordNumber}</p>
										</div>
										<div class="col-md-6 article-title"
											onclick="writerJS.getEssayContentByEssayId(${essay.id},${status.index})">${essay.essayTitle}
											<div id="essay-tag-${essay.id}" class="tag-bar">
												<span class="glyphicon glyphicon-tag"></span>
												<span>${essay.label.firstLabel}</span>
												<span>${essay.label.secondLabel}</span>
												<span>${essay.label.thirdLabel}</span>
											</div>
										</div>
										<div class="dropdown col-md-2 edit-article right" style="height:53px;">
											<span class="glyphicon glyphicon-cog" id="dropdownMenu2" data-toggle="dropdown"
												aria-haspopup="true" aria-expanded="true"></span>
											<ul class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu2">
												<li>
													<a href="#" class="edit-article-name">
														<span class="glyphicon glyphicon-share-alt" style="margin-right:20px;"></span>
														直接发布
													</a>
												</li>
												<li role="separator" class="divider"></li>
												<li>
													<a href="#" class="move-article">
														<span class="glyphicon glyphicon-folder-open" style="margin-right:20px;"></span>
														移动文章
													</a>
												</li>
												<li role="separator" class="divider"></li>
												<li>
													<a id="tag-btn-${essay.id}" href="#" data-toggle="modal" data-target="#myModal"
														onclick="writerJS.getTag(${essay.id});">
														<span class="glyphicon glyphicon-tag" style="margin-right:20px;"></span>
														文章标签
													</a>
												</li>
												<li role="separator" class="divider"></li>
												<li>
													<a href="#" class="edit-article-delete"
														onclick="writerJS.deleteEssayConfirm(${essay.id});">
														<span class="glyphicon glyphicon-trashglyphicon glyphicon-trash"
															style="margin-right:20px;"></span>
														删除文章
													</a>
												</li>
											</ul>
										</div>
									</div>
								</li>
							</c:if>

							<c:if test="${status.index != 0}">
								<li id="essay_li_${status.index}" class="one-article">
									<div class="row">
										<div class="col-md-4 left">
											<img class="icon-file" src="icon/file-48px.png" alt="icon">
											<p class="char-count">字数：${essay.essayWordNumber}</p>
										</div>
										<div class="col-md-6 article-title"
											onclick="writerJS.getEssayContentByEssayId(${essay.id},${status.index})">${essay.essayTitle}
											<div id="essay-tag-${essay.id}" class="tag-bar">
												<span class="glyphicon glyphicon-tag"></span>
												<span>${essay.label.firstLabel}</span>
												<span>${essay.label.secondLabel}</span>
												<span>${essay.label.thirdLabel}</span>
											</div>
										</div>
										<div class="dropdown col-md-2 edit-article right" style="height:53px;">
											<span class="glyphicon glyphicon-cog" id="dropdownMenu2" data-toggle="dropdown"
												aria-haspopup="true" aria-expanded="true"></span>
											<ul class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu2">
												<li>
													<a href="#" class="edit-article-name">
														<span class="glyphicon glyphicon-share-alt" style="margin-right:20px;"></span>
														直接发布
													</a>
												</li>
												<li role="separator" class="divider"></li>
												<li>
													<a href="#" class="move-article">
														<span class="glyphicon glyphicon-folder-open" style="margin-right:20px;"></span>
														移动文章
													</a>
												</li>
												<li role="separator" class="divider"></li>
												<li>
													<a id="tag-btn-${essay.id}" href="#" data-toggle="modal" data-target="#myModal"
														onclick="writerJS.getTag(${essay.id});">
														<span class="glyphicon glyphicon-tag" style="margin-right:20px;"></span>
														文章标签
													</a>
												</li>
												<li role="separator" class="divider"></li>
												<li>
													<a href="#" class="edit-article-delete"
														onclick="writerJS.deleteEssayConfirm(${essay.id});">
														<span class="glyphicon glyphicon-trashglyphicon glyphicon-trash"
															style="margin-right:20px;"></span>
														删除文章
													</a>
												</li>
											</ul>
										</div>
									</div>
								</li>
							</c:if>
						</c:forEach>
					</ul>
					<!-- article-list end -->
				</c:if>
			</div>
			<!-- glyphicon glyphicon-file -->
			<div id="main_essay" class="col-md-7 main">
				<div id="main_essay_tip"
					style="width:100%;height:100%;text-align:center;line-height:600px;font-size:70px;color:rgb(228,228,228);font-family:微软雅黑;weight:bold;">
					<span>简随记</span>
				</div>
				<div id="main_essay_form" style="display: none;">
					<form id="note-form" class="note-form rich-text" action="" method="post">
						<input id="essayIdHidden" name="essayIdHidden" type="hidden" value="">
						<div>
							<input id="essayTitle" name="essayTitle" class="form-control" type="text" value=""
								style="width: 600px; margin:10px 10px 10px 0px; display:inline-block; vertical-align: middle;">
							<input id="note-button" type="button" value="发布随记" class="btn btn-default note-button"
								style="display:inline-block;">
						</div>
						<textarea id="container" name="container"></textarea>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- 修改文章标签模态框 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">文章标签</h4>
				</div>
				<div class="modal-body">
					<form class="form-inline">
						<div class="form-group">
							<select name="level-one" class="select form-control" id="select1">
								<option value="0">--&nbsp;一级分类&nbsp;--</option>
								<option value="计算机">计算机</option>
							</select>
						</div>

						<div class="form-group">
							<select name="level-two" class="select form-control" id="select2">
								<option value="0">--&nbsp;二级分类&nbsp;--</option>
							</select>
						</div>

						<div class="form-group">
							<select name="level-three" class="select form-control" id="select3">
								<option value="0">--&nbsp;三级分类&nbsp;--</option>
							</select>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="save-tag-btn" data-dismiss="modal">保存</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 修改文集名称模态框 -->
	<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog"
		aria-labelledby="mySmallModalLabel">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">修改名称</h4>
				</div>
				<div class="modal-body">
					<input type="text" style="width:266px;" class="edit-name">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal" id="enter-edit-name">保存</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<%@ include file="common/common-js.jsp"%>
	<script src="<%=path%>/ueditor/ueditor.config.js" type="text/javascript"></script>
	<script src="<%=path%>/ueditor/ueditor.all.min.js" type="text/javascript"></script>
	<script src="<%=path%>/ueditor/lang/zh-cn/zh-cn.js" type="text/javascript"></script>
	<script src="<%=path%>/js/writer.js" type="text/javascript"></script>
</body>
</html>
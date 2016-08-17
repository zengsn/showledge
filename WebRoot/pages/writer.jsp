<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">

<title>简随记</title>

<link href="css/css_1.css" rel="stylesheet" media="all">
<link href="css/css_3.css" rel="stylesheet" media="all">
<link href="css/css_4.css" rel="stylesheet" media="all">
<link href="js/jDialog/jDialog.css" rel="stylesheet" type="text/css">

<script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>

<script src="ueditor/ueditor.config.js"></script>
<script src="ueditor/ueditor.all.min.js"></script>
<script src="ueditor/lang/zh-cn/zh-cn.js"></script>
<script src="js/jDialog.js"></script>
<script src="js/vue.js"></script>
<script src="js/my-vue.js"></script>
<script src="js/writer.js"></script>

<link href="images/favicon.ico" rel="icon">
</head>

<body class="input zh cn win reader-day-mode reader-font2" id="my-vueJS">
	<div id="writer" class="container-fluid" data-writer-version="10">
		<div id="main_div" class="stack expansion" style="padding-left: 45px;">
			<div class="row-fluid normal-mode active">
				<div class="navbar">
					<div class="writer-nav-header"></div>
					<my-login-sidebar></my-login-sidebar>
				</div>
				<div class="span2 aside" style="width: 164px;height: 832px;">
					<div class="new-notebook">
						<a href="javascript:void(0)" class="create-notebook win-text"
							onclick="showCorpusDefined();"> +新建文集 <img
							src="images/writer/tiny.gif"
							class="hide loader-tiny create-notebook-loader">
						</a>
						<div id="corpus_defined" class="new-notebook-form"
							style="display:none;">
							<form id="corpus_form" class="create-notebook-form" method="post">
								<input id="corpusName" name="corpusName" placeholder="请输入文集名..."
									type="text" class="input-medium notebook-input"> <a
									href="javascript:void(0)" class="btn cancel"
									data-action="cancel-create-notebook"
									onclick="hideCorpusDefined();"> 取消 </a><input
									id="corpus_submit" class="btn btn-mainRed submit" name="commit"
									type="submit" value="提交" data-action="submit">
							</form>
						</div>
					</div>
					<ul class="nav nav-list notebooks ui-sortable"
						style="max-height: 362px; min-height: 362px;">
						<c:forEach items="${corpusList}" var="corpus" varStatus="status">
							<c:if test="${status.index == 0}">
								<li id="corpus_li_${status.index}"
									class="one-notebook item active" data-model="notebook"
									data-cid="c-0"><a href="javascript:void(0)"
									data-type="active"
									onclick="getEssay(${corpus.id},${status.index})"
									class="notebook-name"><i class="icon icon-notebook"></i><span>${corpus.corpusName}</span></a>
									<a href="javascript:void(0)" data-type="edit"
									class="edit-notebook dropdown-toggle" data-toggle="dropdown">
										<i class="fa fa-gear"></i>
								</a>
									<ul class="dropdown-menu arrow-top">
										<li><a href="javascript:void(0)"
											onclick="updateCorpusName(${corpus.id},${corpus.corpusName});"
											data-action="rename-notebook" data-toggle="modal"> <i
												class="fa fa-pencil-square-o"></i> 修改文集名
										</a></li>
										<li class="divider"></li>
										<li><a href="javascript:void(0)"
											data-action="delete-notebook"
											onclick="deleteCorpusConfirm(${corpus.id});"> <i
												class="fa fa-trash-o"></i> 删除文集
										</a></li>
									</ul></li>
							</c:if>
							<c:if test="${status.index != 0}">
								<li id="corpus_li_${status.index}" class="one-notebook item"
									data-model="notebook" data-cid="c-0"><a
									href="javascript:void(0)" data-type="active"
									class="notebook-name"
									onclick="getEssay(${corpus.id},${status.index})"><i
										class="icon icon-notebook"></i><span>${corpus.corpusName}</span></a>
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
											onclick="updateCorpusName(${corpus.id},${corpus.corpusName});"
											data-action="delete-notebook"
											onclick="deleteCorpusConfirm(${corpus.id});"> <i
												class="fa fa-trash-o"></i> 删除文集
										</a></li>
									</ul></li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
				<div class="span3 middle" style="width: 240px;height: 832px;">
					<div id="notes-list">
						<div id="new-note">
							<input id="corpusListSize_hidden" type="hidden"
								value="${corpusListSize}"> <input
								id="essayListSize_hidden" type="hidden" value="${essayListSize}">
							<a id="new_essay" href="javascript:void(0)"
								onclick="createEssay();" data-action="create-note"
								class="new-note-link"> <i class="icon fa fa-pencil"></i> <span
								class="win-text">+新建文章 <img src="images/writer/tiny.gif"
									class="hide cnlt loader-tiny">
							</span>
							</a>
						</div>
						<div id="notes_list_div">
							<c:forEach items="${essayList}" var="essay" varStatus="status">
								<c:if test="${status.index == 0}">
									<ul class="nav nav-list notes ui-sortable">
										<li id="essay_li_${status.index}" class="one-note active"
											data-model="note" data-cid="c-2"><i
											class="icon icon-note note-icon stop-share"></i>
											<p class="abbreviate"></p>
											<p class="wordage win-text">字数: ${essay.essayWordNumber}</p>
											<a href="javascript:void(0)" data-type="edit"
											class="note-link title"
											onclick="getEssayContent(${essay.id},${status.index})">${essay.essayTitle}</a>
											<a href="javascript:void(0)" data-type="share"
											class="share-note dropdown-toggle" data-toggle="dropdown"><i
												class="fa fa-gear"></i></a>
											<ul class="dropdown-menu arrow-top">
												<li><a href="javascript:void(0)" class="share-link"
													data-action="open-share-note"> <i class="fa fa-share"></i>
														直接发布
												</a></li>
												<li class="divider"></li>
												<li><a href="javascript:void(0)"
													data-action="open-move-note"> <i
														class="fa fa-folder-open"></i> 移动文章
												</a></li>
												<li><a href="javascript:void(0)"
													data-action="trigger-history-mode"> <i
														class="fa fa-clock-o"></i> 历史版本
												</a></li>
												<li class="divider"></li>
												<li><a id="delete_essay_${status.index}"
													onclick="deleteEssayConfirm(${essay.id});"
													href="javascript:void(0)" data-action="delete-note"> <i
														class="fa fa-trash-o"></i> 删除文章
												</a></li>
											</ul></li>
									</ul>
								</c:if>
								<c:if test="${status.index != 0}">
									<ul class="nav nav-list notes ui-sortable">
										<li id="essay_li_${status.index}" class="one-note"
											data-model="note" data-cid="c-2"><i
											class="icon icon-note note-icon stop-share"></i>
											<p class="abbreviate"></p>
											<p class="wordage win-text">字数: ${essay.essayWordNumber}</p>
											<a href="javascript:void(0)" data-type="edit"
											class="note-link title"
											onclick="getEssayContent(${essay.id},${status.index})">${essay.essayTitle}</a>
											<a href="javascript:void(0)" data-type="share"
											class="share-note dropdown-toggle" data-toggle="dropdown"><i
												class="fa fa-gear"></i></a>
											<ul class="dropdown-menu arrow-top">
												<li><a href="javascript:void(0)" class="share-link"
													data-action="open-share-note"> <i class="fa fa-share"></i>
														直接发布
												</a></li>
												<li class="divider"></li>
												<li><a href="javascript:void(0)"
													data-action="open-move-note"> <i
														class="fa fa-folder-open"></i> 移动文章
												</a></li>
												<li><a href="javascript:void(0)"
													data-action="trigger-history-mode"> <i
														class="fa fa-clock-o"></i> 历史版本
												</a></li>
												<li class="divider"></li>
												<li><a id="delete_essay_${status.index}"
													onclick="deleteEssayConfirm(${essay.id});"
													href="javascript:void(0)" data-action="delete-note"> <i
														class="fa fa-trash-o"></i> 删除文章
												</a></li>
											</ul></li>
									</ul>
								</c:if>
							</c:forEach>
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
				<div id="main_essay" class="main"
					style="display:inline-block;background:#f1f1f1;width:823px;height:762px">
					<div id="main_essay_tip"
						style="width:100%;height:100%;text-align:center;line-height:600px;font-size:70px;color:rgb(228,228,228);font-family:微软雅黑;weight:bold;">
						<span>简笔记</span>
					</div>
					<div id="main_essay_form" style="display: none;">
						<form id="note-form" class="note-form rich-text" action=""
							method="post">
							<input id="essayIdHidden" name="essayIdHidden" type="hidden"
								value=""> <input id="essayTitle" name="essayTitle"
								class="title mousetrap" id="note_title" type="text" value="" />
							<div style="width:100%;">
								<input id="note-button" type="button" value="发布随记"
									class="btn btn-default" style="float:right">
							</div>
							<textarea id="container" name="container"
								style="clear:both; width:823px; height: 641px; margin: 0 auto;">
    					</textarea>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div id="rename-notebook-modal" tabindex="-1" aria-hidden="false"
			class="modal hide fade rename-notebook-modal fullscreen in disabled"
			style="display: none;">
			<div class="modal-header">
				<b>修改文集名</b>
			</div>
			<div class="modal-body">
				<form class="modal-form">
					<input id="new_corpus_name" placeholder="新文集名" name="name"
						type="text" class="input-large notebook-input" size="30">
				</form>
			</div>
			<div class="modal-footer">
				<a href="javascript:void(0)" class="btn cancel-button"
					onclick="updateCorpusNameCancel()"> 取消 </a> <input
					class="rename-a-notebook btn btn-info" name="commit" type="submit"
					value="提交" data-action="submit-rename-notebook"
					onclick="updateCorpusNameConfirm()">
			</div>
		</div>
	</div>
</body>
</html>
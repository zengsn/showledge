var corpusId = 0;
var essayId = 0;
var nowEssayId = 0;
var editor = new UE.ui.Editor();
var currentCorpusId = 0;
editor.render("container");
function showCorpusDefined() {
	$("#corpus_defined").slideToggle(); // 垂直方向的显示和隐藏切换
}
function hideCorpusDefined() {
	$("#corpus_defined").slideUp();
}
function removeAllCorpusLiCss() {
	for(i = 0; i < $("#corpusListSize_hidden").val(); i++){
		var liId="#corpus_li_" + i;
		$(liId).removeClass("active");
	};
}
function removeAllEssayLiCss() {
	for(i = 0; i < $("#essayListSize_hidden").val() + 1; i++){
		var liId="#essay_li_" + i;
		$(liId).removeClass("active");
	};
}
$(function() {
	$("#note-button").click(function() {
		$.ajax({
			type : "POST", // http请求方式
			url : "http://localhost:8080/learned/updateEssay.do", // 发送给服务器的url
			data : $("#note-form").serialize(), // 发送给服务器的参数
			dataType : "json", // 告诉JQUERY返回的数据格式(注意此处数据格式一定要与提交的controller返回的数据格式一致,不然不会调用回调函数complete)
			complete : function(msg) {
				var result = eval("(" + msg.responseText + ")");
				if (result.success) {
					var essayIdHidden = $("#essayIdHidden").val();
					var essayTitle = $("#essayTitle").val();
					location.href = "success?title=" + essayTitle + "/" + essayIdHidden; // location.href实现客户端页面的跳转
				} else {
					alert("发布失败");
				}
			},
			error : function() {
				alert("发布失败,请检查网络连接");
			},
		});
	})
});
$(function() {
	$("#corpus_submit").click(function() {
		$.ajax({
			type : "POST", // http请求方式
			url : "http://localhost:8080/learned/createCorpus.do", // 发送给服务器的url
			data : $("#corpus_form").serialize(), // 发送给服务器的参数
			dataType : "json", // 告诉JQUERY返回的数据格式(注意此处数据格式一定要与提交的controller返回的数据格式一致,不然不会调用回调函数complete)
			complete : function(msg) {
				var result = eval("(" + msg.responseText + ")");
				if (result.success) {
					alert("新建成功");
				} else {
					alert("新建失败");
				}
			},
			error : function() {
				alert("新建失败,请检查网络连接");
			},
		});
	})
});
function getEssay(id,index) {
	$("#corpusListSize_hidden").val(id);
	corpusId = id;
	var liId="#corpus_li_" + index;
	removeAllCorpusLiCss();
	$(liId).addClass("active");
	$.ajax({
		type : "POST", // http请求方式
		url : "http://localhost:8080/learned/selectEssayByCorpusId.do", // 发送给服务器的url
		data : "corpusId=" + id, // 发送给服务器的参数
		dataType : "json", // 告诉JQUERY返回的数据格式(注意此处数据格式一定要与提交的controller返回的数据格式一致,不然不会调用回调函数complete)
		cache : false,
		complete : function(msg) {
			var result = eval("(" + msg.responseText + ")");
			if (result.success) {
				$("#notes_list_div").html("");
				$("#main_essay_form").css("display", "none");
				$("#main_essay").css("background", "#f1f1f1");
				$("#main_essay_tip").css("display", "inline-block");
				var count = 0;
				jQuery.each(result.essayList, function(i, item) {
					count = i;
					if(i == 0) {
						$("#notes_list_div").append('<ul class="nav nav-list notes ui-sortable">' 
								+ '<li id="essay_li_' + i + '" class="one-note active" data-model="note" data-cid="c-2">'
								+ '<i class="icon icon-note note-icon stop-share"></i>'
								+ '<p class="abbreviate"></p>'
								+ '<p class="wordage win-text">字数: ' + item.essayWordNumber + '</p>'
								+ '<a href="javascript:void(0)" data-type="edit" class="note-link title" onclick="getEssayContent(' + item.id + ',' 
								+ i + ')">' + item.essayTitle + '</a>'
								+ '<a href="javascript:void(0)" data-type="share" class="share-note dropdown-toggle" data-toggle="dropdown">'
								+ '<i class="fa fa-gear"></i></a>'
								+ '<ul class="dropdown-menu arrow-top">'
								+ '<li><a href="javascript:void(0)" class="share-link" data-action="open-share-note">'
								+ '<i class="fa fa-share"></i>直接发布</a></li>'
								+ '<li class="divider"></li>'
								+ '<li><a href="javascript:void(0)" data-action="open-move-note"> <i class="fa fa-folder-open"></i>移动文章</a></li>'
								+ '<li><a href="javascript:void(0)" data-action="trigger-history-mode"> <i class="fa fa-clock-o"></i>历史版本</a></li>'
								+ '<li class="divider"></li>'
								+ '<li><a href="javascript:void(0)" data-action="delete-note" onclick="deleteEssayConfirm(' + item.id + ',' + item.corpusId + ');"> <i class="fa fa-trash-o"></i>删除文章</a></li></ul></li></ul>' );
					} else {
						$("#notes_list_div").append('<ul class="nav nav-list notes ui-sortable">' 
								+ '<li id="essay_li_' + i + '" class="one-note" data-model="note" data-cid="c-2">'
								+ '<i class="icon icon-note note-icon stop-share"></i>'
								+ '<p class="abbreviate"></p>'
								+ '<p class="wordage win-text">字数: ' + item.essayWordNumber + '</p>'
								+ '<a href="javascript:void(0)" data-type="edit" class="note-link title" onclick="getEssayContent(' + item.id + ',' 
								+ i + ')">' + item.essayTitle + '</a>'
								+ '<a href="javascript:void(0)" data-type="share" class="share-note dropdown-toggle" data-toggle="dropdown">'
								+ '<i class="fa fa-gear"></i></a>'
								+ '<ul class="dropdown-menu arrow-top">'
								+ '<li><a href="javascript:void(0)" class="share-link" data-action="open-share-note">'
								+ '<i class="fa fa-share"></i>直接发布</a></li>'
								+ '<li class="divider"></li>'
								+ '<li><a href="javascript:void(0)" data-action="open-move-note"> <i class="fa fa-folder-open"></i>移动文章</a></li>'
								+ '<li><a href="javascript:void(0)" data-action="trigger-history-mode"> <i class="fa fa-clock-o"></i>历史版本</a></li>'
								+ '<li class="divider"></li>'
								+ '<li><a href="javascript:void(0)" data-action="delete-note" onclick="deleteEssayConfirm(' + item.id + ',' + item.corpusId + ');"> <i class="fa fa-trash-o"></i>删除文章</a></li></ul></li></ul>' );
					}
					$("#essayListSize_hidden").val(count);
				});
			}
		},
		error : function() {
			alert("获取失败,请检查网络连接");
		},
	})
}
function createEssay() {
	corpusId = $("#corpusListSize_hidden").val();
	$.ajax({
		type : "POST", // http请求方式
		url : "http://localhost:8080/learned/createEssay.do", // 发送给服务器的url
		data : "corpusId=" + corpusId, // 发送给服务器的参数
		dataType : "json", // 告诉JQUERY返回的数据格式(注意此处数据格式一定要与提交的controller返回的数据格式一致,不然不会调用回调函数complete)
		cache : false,
		complete : function(msg) {
			var result = eval("(" + msg.responseText + ")");
			if (result.success) {
				$("#notes_list_div").html("");
				$("#main_essay_form").css("display", "none");
				$("#main_essay").css("background", "#f1f1f1");
				$("#main_essay_tip").css("display", "inline-block");
				var count = 0;
				jQuery.each(result.essayList, function(i, item) {
					count = i;
					if(i == 0) {
						$("#notes_list_div").append('<ul class="nav nav-list notes ui-sortable">' 
								+ '<li id="essay_li_' + i + '" class="one-note active" data-model="note" data-cid="c-2">'
								+ '<i class="icon icon-note note-icon stop-share"></i>'
								+ '<p class="abbreviate"></p>'
								+ '<p class="wordage win-text">字数: ' + item.essayWordNumber + '</p>'
								+ '<a href="javascript:void(0)" data-type="edit" class="note-link title" onclick="getEssayContent(' + item.id + ',' 
								+ i + ')">' + item.essayTitle + '</a>'
								+ '<a href="javascript:void(0)" data-type="share" class="share-note dropdown-toggle" data-toggle="dropdown">'
								+ '<i class="fa fa-gear"></i></a>'
								+ '<ul class="dropdown-menu arrow-top">'
								+ '<li><a href="javascript:void(0)" class="share-link" data-action="open-share-note">'
								+ '<i class="fa fa-share"></i>直接发布</a></li>'
								+ '<li class="divider"></li>'
								+ '<li><a href="javascript:void(0)" data-action="open-move-note"> <i class="fa fa-folder-open"></i>移动文章</a></li>'
								+ '<li><a href="javascript:void(0)" data-action="trigger-history-mode"> <i class="fa fa-clock-o"></i>历史版本</a></li>'
								+ '<li class="divider"></li>'
								+ '<li><a href="javascript:void(0)" data-action="delete-note" onclick="deleteEssayConfirm(' + item.id + ',' + item.corpusId + ');"> <i class="fa fa-trash-o"></i>删除文章</a></li></ul></li></ul>' );
					} else {
						$("#notes_list_div").append('<ul class="nav nav-list notes ui-sortable">' 
								+ '<li id="essay_li_' + i + '" class="one-note" data-model="note" data-cid="c-2">'
								+ '<i class="icon icon-note note-icon stop-share"></i>'
								+ '<p class="abbreviate"></p>'
								+ '<p class="wordage win-text">字数: ' + item.essayWordNumber + '</p>'
								+ '<a href="javascript:void(0)" data-type="edit" class="note-link title" onclick="getEssayContent(' + item.id + ',' 
								+ i + ')">' + item.essayTitle + '</a>'
								+ '<a href="javascript:void(0)" data-type="share" class="share-note dropdown-toggle" data-toggle="dropdown">'
								+ '<i class="fa fa-gear"></i></a>'
								+ '<ul class="dropdown-menu arrow-top">'
								+ '<li><a href="javascript:void(0)" class="share-link" data-action="open-share-note">'
								+ '<i class="fa fa-share"></i>直接发布</a></li>'
								+ '<li class="divider"></li>'
								+ '<li><a href="javascript:void(0)" data-action="open-move-note"> <i class="fa fa-folder-open"></i>移动文章</a></li>'
								+ '<li><a href="javascript:void(0)" data-action="trigger-history-mode"> <i class="fa fa-clock-o"></i>历史版本</a></li>'
								+ '<li class="divider"></li>'
								+ '<li><a href="javascript:void(0)" data-action="delete-note" onclick="deleteEssayConfirm(' + item.id + ',' + item.corpusId + ');"> <i class="fa fa-trash-o"></i>删除文章</a></li></ul></li></ul>' );
					}
				});
				$("#essayListSize_hidden").val(count);
			} else {
				alert("新建失败");
			}
		},
		error : function() {
			alert("新建失败,请检查网络连接");
		},
	})
}
function getEssayContent(id,index) {
	essayId = id;
	var liId="#essay_li_" + index;
	removeAllEssayLiCss();
	$(liId).addClass("active");
	$.ajax({
		type : "POST", // http请求方式
		url : "http://localhost:8080/learned/selectEssayById.do", // 发送给服务器的url
		data : "essayId=" + essayId, // 发送给服务器的参数
		dataType : "json", // 告诉JQUERY返回的数据格式(注意此处数据格式一定要与提交的controller返回的数据格式一致,不然不会调用回调函数complete)
		cache : false,
		complete : function(msg) {
			var result = eval("(" + msg.responseText + ")");
			if (result.success) {
				$("#essayIdHidden").val(result.essay.id);
				$("#essayTitle").val(result.essay.essayTitle);
				if(result.essay.essayContent == null) {
					editor.setContent("");
				} else {
					editor.setContent(result.essay.essayContent);
				}
				$("#main_essay").css("background", "#ffffff");
				$("#main_essay_tip").css("display", "none");
				$("#main_essay_form").css("display", "inline-block");
			}
		},
		error : function() {
			alert("获取失败,请检查网络连接");
		},
	})
}
function deleteCorpusConfirm(corpusId) {
	var dialog = jDialog.confirm('此操作将删除此文集及其下的所有文章,确定要删除吗？',{
		handler : function(button,dialog) {
			$.ajax({
				type : "POST", // http请求方式
				url : "http://localhost:8080/learned/deleteCorpusById.do", // 发送给服务器的url
				data : "corpusId=" + corpusId, // 发送给服务器的参数
				dataType : "json", // 告诉JQUERY返回的数据格式(注意此处数据格式一定要与提交的controller返回的数据格式一致,不然不会调用回调函数complete)
				cache : false,
				complete : function(msg) {
					var result = eval("(" + msg.responseText + ")");
					if (result.success) {
						location.href = "writer";
					}
				},
				error : function() {
					alert("删除失败,请检查网络连接");
				},
			})
			dialog.close();
		}
	},{
		handler : function(button,dialog) {
			dialog.close();
		}
	});
}
function deleteEssayConfirm(essayId) {
	var dialog = jDialog.confirm('确定要删除此文章吗？',{
		handler : function(button,dialog) {
			corpusId = $("#corpusListSize_hidden").val();
			$.ajax({
				type : "POST", // http请求方式
				url : "http://localhost:8080/learned/deleteEssayById.do", // 发送给服务器的url
				data : "corpusId=" + corpusId + "&essayId=" + essayId, // 发送给服务器的参数
				dataType : "json", // 告诉JQUERY返回的数据格式(注意此处数据格式一定要与提交的controller返回的数据格式一致,不然不会调用回调函数complete)
				cache : false,
				complete : function(msg) {
					var result = eval("(" + msg.responseText + ")");
					if (result.success) {
						$("#notes_list_div").html("");
						$("#main_essay_form").css("display", "none");
						$("#main_essay").css("background", "#f1f1f1");
						$("#main_essay_tip").css("display", "inline-block");
						var count = 0;
						jQuery.each(result.essayList, function(i, item) {
							count = i;
							if(i == 0) {
								$("#notes_list_div").append('<ul class="nav nav-list notes ui-sortable">' 
										+ '<li id="essay_li_' + i + '" class="one-note active" data-model="note" data-cid="c-2">'
										+ '<i class="icon icon-note note-icon stop-share"></i>'
										+ '<p class="abbreviate"></p>'
										+ '<p class="wordage win-text">字数: ' + item.essayWordNumber + '</p>'
										+ '<a href="javascript:void(0)" data-type="edit" class="note-link title" onclick="getEssayContent(' + item.id + ',' 
										+ i + ')">' + item.essayTitle + '</a>'
										+ '<a href="javascript:void(0)" data-type="share" class="share-note dropdown-toggle" data-toggle="dropdown">'
										+ '<i class="fa fa-gear"></i></a>'
										+ '<ul class="dropdown-menu arrow-top">'
										+ '<li><a href="javascript:void(0)" class="share-link" data-action="open-share-note">'
										+ '<i class="fa fa-share"></i>直接发布</a></li>'
										+ '<li class="divider"></li>'
										+ '<li><a href="javascript:void(0)" data-action="open-move-note"> <i class="fa fa-folder-open"></i>移动文章</a></li>'
										+ '<li><a href="javascript:void(0)" data-action="trigger-history-mode"> <i class="fa fa-clock-o"></i>历史版本</a></li>'
										+ '<li class="divider"></li>'
										+ '<li><a href="javascript:void(0)" data-action="delete-note" onclick="deleteEssayConfirm(' + item.id + ',' + item.corpusId + ');"> <i class="fa fa-trash-o"></i>删除文章</a></li></ul></li></ul>' );
							} else {
								$("#notes_list_div").append('<ul class="nav nav-list notes ui-sortable">' 
										+ '<li id="essay_li_' + i + '" class="one-note" data-model="note" data-cid="c-2">'
										+ '<i class="icon icon-note note-icon stop-share"></i>'
										+ '<p class="abbreviate"></p>'
										+ '<p class="wordage win-text">字数: ' + item.essayWordNumber + '</p>'
										+ '<a href="javascript:void(0)" data-type="edit" class="note-link title" onclick="getEssayContent(' + item.id + ',' 
										+ i + ')">' + item.essayTitle + '</a>'
										+ '<a href="javascript:void(0)" data-type="share" class="share-note dropdown-toggle" data-toggle="dropdown">'
										+ '<i class="fa fa-gear"></i></a>'
										+ '<ul class="dropdown-menu arrow-top">'
										+ '<li><a href="javascript:void(0)" class="share-link" data-action="open-share-note">'
										+ '<i class="fa fa-share"></i>直接发布</a></li>'
										+ '<li class="divider"></li>'
										+ '<li><a href="javascript:void(0)" data-action="open-move-note"> <i class="fa fa-folder-open"></i>移动文章</a></li>'
										+ '<li><a href="javascript:void(0)" data-action="trigger-history-mode"> <i class="fa fa-clock-o"></i>历史版本</a></li>'
										+ '<li class="divider"></li>'
										+ '<li><a href="javascript:void(0)" data-action="delete-note" onclick="deleteEssayConfirm(' + item.id + ',' + item.corpusId + ');"> <i class="fa fa-trash-o"></i>删除文章</a></li></ul></li></ul>' );
							}
							$("#essayListSize_hidden").val(count);
						});
					}
				},
				error : function() {
					alert("获取失败,请检查网络连接");
				},
			})
			dialog.close();
		}
	},{
		handler : function(button,dialog) {
			alert('你点击了取消！');
			dialog.close();
		}
	});
}
function updateCorpusName(corpusId,corpusName) {
	$("#new_corpus_name").val(corpusName);
	$("#main_div").css("display", "none");
	$("#rename-notebook-modal").css("display", "inline-block");
	currentCorpusId = corpusId;
}
function updateCorpusNameConfirm() {
	var newCorpusName = $.trim($("#new_corpus_name").val());
	$.ajax({
		type : "POST", // http请求方式
		url : "http://localhost:8080/learned/updateCorpusName.do", // 发送给服务器的url
		data : "corpusId=" + currentCorpusId + "&newCorpusName=" + newCorpusName, // 发送给服务器的参数
		dataType : "json", // 告诉JQUERY返回的数据格式(注意此处数据格式一定要与提交的controller返回的数据格式一致,不然不会调用回调函数complete)
		cache : false,
		complete : function(msg) {
			var result = eval("(" + msg.responseText + ")");
			if (result.success) {
				location.href = "writer";
			} else {
				alert("修改失败");
			}
		},
		error : function() {
			alert("修改失败,请检查网络连接");
		},
	})
}
function updateCorpusNameCancel() {
	$("#main_div").css("display", "inline-block");
	$("#rename-notebook-modal").css("display", "none");
}
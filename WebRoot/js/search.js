function showAllLiClass() {
	$("#choose_essay_li").css("display", "");
	$("#choose_corpus_li").css("display", "");
	$("#choose_user_li").css("display", "");
}
function showEssayButton() {
	$("#choose_button_content").html('文章 <span class="caret"></span>');
	showAllLiClass();
	$('#choose_essay_li').css("display", "none");
}
function showCorpusButton() {
	$("#choose_button_content").html('文集 <span class="caret"></span>');
	showAllLiClass();
	$('#choose_corpus_li').css("display", "none");
}
function showUserButton() {
	$("#choose_button_content").html('作者 <span class="caret"></span>');
	showAllLiClass();
	$('#choose_user_li').css("display", "none");
}
function removeAllClass() {
	$("#essay_li").removeClass("active");
	$("#corpus_li").removeClass("active");
	$("#user_li").removeClass("active");
	$("#no_find").css("display", "none");
}
function searchEssay() {
	var searchKeyword = $.trim($("#searchKeyword").val());
	var hideSearchKeyword = $.trim($("#hideSearchKeyword").val());
	if(searchKeyword == null || searchKeyword == ""){
		searchKeyword = hideSearchKeyword;
	}
	removeAllClass();
	$("#essay_li").addClass("active");
	$.ajax({
		type : "POST", // http请求方式
		url : "http://localhost:8080/learned/searchEssay.do", // 发送给服务器的url
		data : "searchKeyword=" + searchKeyword, // 发送给服务器的参数
		dataType : "json", // 告诉JQUERY返回的数据格式(注意此处数据格式一定要与提交的controller返回的数据格式一致,不然不会调用回调函数complete)
		cache : false,
		complete : function(msg) {
			var result = eval("(" + msg.responseText + ")");
			if (result.success) {
				$("#search_ul").html("");
				var count = 0;
				jQuery.each(result.essayList, function(i, item) {
					$("#search_ul").append('<li><h4 class="title"><a href="essay.html?id=' + item.id +'" target="_blank">'
						 + '<i class="fa fa-file-text"></i>' + item.essayTitle + '</a></h4>'
						 + '<p>' + item.essayContent + '</p>'
						 + '<div class="list-footer">'	
						 + '<a href="">' + item.userName + '</a>'
						 + '<span> · 阅读 ' + item.essayReadingNumber + '</span>'
						 + '<span> · 评论 ' + item.essayCommentNumber + '</span>'
						 + '<span> · 喜欢 ' + item.essayGoodNumber + '</span>'
						 + ' · <span data-timeago="" title="2015-05-17T03:57:08.000Z">大约1年之前</span></div></li>');
					count = i + 1;
				});
				if(count == 0) {
					$("#no_find").css("display", "inline-block");
				}
				$("#searchKeyword").val("");
				$("#hideSearchKeyword").val(searchKeyword);
			} else {
				$("#no_find").css("display", "inline-block");
			}
		},
		error : function() {
			alert("查询失败,请检查网络连接");
		},
	})
}
function searchCorpus() {
	var searchKeyword = $.trim($("#searchKeyword").val());
	var hideSearchKeyword = $.trim($("#hideSearchKeyword").val());
	if(searchKeyword == null || searchKeyword == ""){
		searchKeyword = hideSearchKeyword;
	}
	removeAllClass();
	$("#corpus_li").addClass("active");
	$.ajax({
		type : "POST", // http请求方式
		url : "http://localhost:8080/learned/searchCorpus.do", // 发送给服务器的url
		data : "searchKeyword=" + searchKeyword, // 发送给服务器的参数
		dataType : "json", // 告诉JQUERY返回的数据格式(注意此处数据格式一定要与提交的controller返回的数据格式一致,不然不会调用回调函数complete)
		cache : false,
		complete : function(msg) {
			var result = eval("(" + msg.responseText + ")");
			if (result.success) {
				$("#search_ul").html("");
				var count = 0;
				jQuery.each(result.corpusList, function(i, item) {
					$("#search_ul").append('<li><h4 class="tltle">'
					    + '<a href="" target="_blank">'
					    + '<i class="fa fa-book"></i> ' + item.corpusName + '</a></h4>' 
					    + '<p class="footer">'   
					    + '<a href="">' + item.userName + '・著</a>,1 篇文章, 0 人关注</p></li>');
					count = i + 1;
				});
				if(count == 0) {
					$("#no_find").css("display", "inline-block");
				}
				$("#searchKeyword").val("");
				$("#hideSearchKeyword").val(searchKeyword);
			} else {
				$("#no_find").css("display", "inline-block");
			}
		},
		error : function() {
			alert("查询失败,请检查网络连接");
		},
	})
}
function searchUser() {
	var searchKeyword = $.trim($("#searchKeyword").val());
	var hideSearchKeyword = $.trim($("#hideSearchKeyword").val());
	if(searchKeyword == null || searchKeyword == ""){
		searchKeyword = hideSearchKeyword;
	}
	removeAllClass();
	$("#user_li").addClass("active");
	$.ajax({
		type : "POST", // http请求方式
		url : "http://localhost:8080/learned/searchUser.do", // 发送给服务器的url
		data : "searchKeyword=" + searchKeyword, // 发送给服务器的参数
		dataType : "json", // 告诉JQUERY返回的数据格式(注意此处数据格式一定要与提交的controller返回的数据格式一致,不然不会调用回调函数complete)
		cache : false,
		complete : function(msg) {
			var result = eval("(" + msg.responseText + ")");
			if (result.success) {
				$("#search_ul").html("");
				var count = 0;
				jQuery.each(result.userList, function(i, item) {
					$("#search_ul").append('<li><h4 class="tltle">'
					    + '<a class="avatar" href="users.html?userName=' + item.userName + '" target="_blank">'
					    + '<img style="width: 30px" src="' + item.userImagePath + '" alt="100">'
					    + item.userName + '</a></h4>'
					    + '<p class="footer">'  
					    + '写了 0 个字, 0 篇文章, 得到了 1 个赞, 被 0 人关注</p></li>'
					);
					count = i + 1;
				});
				if(count == 0) {
					$("#no_find").css("display", "inline-block");
				}
				$("#searchKeyword").val("");
				$("#hideSearchKeyword").val(searchKeyword);
			} else {
				$("#no_find").css("display", "inline-block");
			}
		},
		error : function() {
			alert("查询失败,请检查网络连接");
		},
	})
}
function search() {
	var chooseButtonContent = $("#choose_button_content").html();
	if(chooseButtonContent.indexOf("文章")) {
		searchEssay();
		return true;
	}
	if(chooseButtonContent.indexOf("文集")) {
		searchCorpus();
		return true;
	}
	if(chooseButtonContent.indexOf("作者")) {
		searchUser();
		return true;
	}
}
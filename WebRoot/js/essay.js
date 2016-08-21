Date.prototype.format = function(format) {
    var o = {
        "M+": this.getMonth() + 1,
        // month
        "d+": this.getDate(),
        // day
        "h+": this.getHours(),
        // hour
        "m+": this.getMinutes(),
        // minute
        "s+": this.getSeconds(),
        // second
        "q+": Math.floor((this.getMonth() + 3) / 3),
        // quarter
        "S": this.getMilliseconds()
        // millisecond
    };
    if (/(y+)/.test(format) || /(Y+)/.test(format)) {
        format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    }
    for (var k in o) {
        if (new RegExp("(" + k + ")").test(format)) {
            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
        }
    }
    return format;
};
function addComment() {
	var userNameInSession = $("#userNameInSession").val();
	if(userNameInSession == null) {
		location.href = "login.html";
		return true;
	}
	var commentContent = $("#commentContent").val();
	if (commentContent == null) {
		return true;
	}
	$.ajax({
		type : "POST", // http请求方式
		url : "http://localhost:8080/learned/addComment.do", // 发送给服务器的url
		data : $("#new_comment_form").serialize(), // 发送给服务器的参数
		dataType : "json", // 告诉JQUERY返回的数据格式(注意此处数据格式一定要与提交的controller返回的数据格式一致,不然不会调用回调函数complete)
		complete : function(msg) {
			var result = eval("(" + msg.responseText + ")");
			if (result.success) {
				var commentTime = new Date(result.comment.commentTime).format("yyyy-MM-dd hh:mm:ss");
				$("#comment-list").append('<div id="child_comment_' + result.comment.id + '" class="note-comment clearfix">'
					+ '<div class="content"><div class="meta-top">'
					+ '<a class="avatar" href="users.html?userName=' + result.comment.commentDiscussantName + '">'
					+ '<img src="' + result.comment.commentDiscussantImagePath + '" alt="100"></a>'
					+ '<p><a class="author-name" href="users.html?userName=' + result.comment.commentDiscussantName + '">'
					+ result.comment.commentDiscussantName + '</a></p>'
					+ '<span class="reply-time"> <small>' + result.comment.commentBuildingNumber + ' 楼 · </small>'			
					+ '<a href="">' + commentTime + '</a></span></div>'
					+ '<p>' + result.comment.commentContent + '</p>'		
					+ '<div class="comment-footer clearfix text-right">'			
					+ '<a class="like pull-left" href="javascript:void(0)">'				
					+ '<i class="fa fa-heart-o"></i>喜欢<span>(0)</span></a>'		
					+ '<a data-nickname="" class="reply" href="javascript:void(0)"' 
					+ 'onclick="showNewReplyForm(' + result.comment.id + ');">回复</a>'
					+ '<a class="delete" data-remote="true" rel="nofollow" href=""'
					+ 'onclick="deleteComment(' + result.comment.essayId + ',' + result.comment.id + ')">删除</a></div>'
					+ '<div class="child-comment-list"><div id="reply_' + result.comment.id + '"></div>'
					+ '<form id="new_reply_form_' + result.comment.id + '" style="display: none"'
					+ 'class="new_comment" accept-charset="UTF-8" method="post" action="">'
					+ '<div class="comment-text">'
					+ '<textarea id="reply_content_' + result.comment.id + '"'
					+ 'maxlength="2000" placeholder="写下你的评论…" class="mousetrap"></textarea>'
					+ '<div><input type="button" value="发 表" class="btn btn-info"'	
					+ 'onclick="addReply(' + result.comment.id + ')">'
					+ '<div class="emoji"><span><i class="fa fa-smile-o"></i></span></div>'	
					+ '<span class="hotkey">Ctrl+Enter 发表</span></div></div></form></div></div></div>'		
				);
				$("#commentContent").val("");
			} else {
				location.href = "login.html";
			}
		},
		error : function() {
			alert("发表失败,请检查网络连接");
		},
	});
}
function addReply(commentId) {
	var replyContentId = "#reply_content_" + commentId;
	var replyContent = $(replyContentId).val();
	if (replyContent == null) {
		return true;
	}
	var newReplyFormId = "#new_reply_form_" + commentId;
	var replyId = "#reply_" + commentId;
	$.ajax({
		type : "POST", // http请求方式
		url : "http://localhost:8080/learned/addReply.do", // 发送给服务器的url
		data : "commentId=" + commentId + "&replyContent=" + replyContent, // 发送给服务器的参数
		dataType : "json", // 告诉JQUERY返回的数据格式(注意此处数据格式一定要与提交的controller返回的数据格式一致,不然不会调用回调函数complete)
		complete : function(msg) {
			var result = eval("(" + msg.responseText + ")");
			if (result.success) {
				$(newReplyFormId).hide(400);
				var replyTime = new Date(result.reply.replyTime).format("yyyy-MM-dd hh:mm:ss");
				$(replyId).append('<div id="child_reply_' + result.reply.id + '" class="child-comment"><p>'
					+ '<a class="blue-link" href="users.html?userName=' + result.reply.replyUserName +'">'
					+ result.reply.replyUserName + '</a> ：' + result.reply.replyContent + '</p>'
					+ '<div class="child-comment-footer text-right clearfix">'
					+ '<a class="reply" href="javascript:void(null)" onclick="showNewReplyForm(' + commentId + ');">回复</a>'
					+ '<a class="delete" data-remote="true" rel="nofollow" href="" onclick="deleteReply(' + result.reply.id + ')">删除</a>'
					+ '<span class="reply-time pull-left"> <a href="">'
					+ replyTime + '</a></span></div></div>'
				);
				$(replyContentId).val("");
			} else {
				location.href = "login.html";
			}
		},
		error : function() {
			alert("回复失败,请检查网络连接");
		},
	});
}
function showNewReplyForm(commentId) {
	var userNameInSession = $("#userNameInSession").val();
	if(userNameInSession == null) {
		location.href = "login.html";
		return true;
	}
	var newReplyFormId = "#new_reply_form_" + commentId;
	$(newReplyFormId).toggle(300);
}
function deleteComment(essayId,commentId) {
	var del = confirm("确定要删除评论么?");
	if (del) {
		var deleteCommentId = "#child_comment_" + commentId;
		$.ajax({
			type : "POST", // http请求方式
			url : "http://localhost:8080/learned/deleteComment.do", // 发送给服务器的url
			data : "essayId=" + essayId + "&commentId=" + commentId, // 发送给服务器的参数
			dataType : "json", // 告诉JQUERY返回的数据格式(注意此处数据格式一定要与提交的controller返回的数据格式一致,不然不会调用回调函数complete)
			complete : function(msg) {
				var result = eval("(" + msg.responseText + ")");
				if (result.success) {
					$(deleteCommentId).hide(400);
				}
			},
			error : function() {
				alert("删除失败,请检查网络连接");
			},
		});
	}
}
function deleteReply(replyId) {
	var del = confirm("确定要删除回复么?");
	if (del) {
		var deleteReplyId = "#child_reply_" + replyId;
		$.ajax({
			type : "POST", // http请求方式
			url : "http://localhost:8080/learned/deleteReply.do", // 发送给服务器的url
			data : "replyId=" + replyId, // 发送给服务器的参数
			dataType : "json", // 告诉JQUERY返回的数据格式(注意此处数据格式一定要与提交的controller返回的数据格式一致,不然不会调用回调函数complete)
			complete : function(msg) {
				var result = eval("(" + msg.responseText + ")");
				if (result.success) {
					$(deleteReplyId).hide(400);
				}
			},
			error : function() {
				alert("删除失败,请检查网络连接");
			},
		});
	}
}
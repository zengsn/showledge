$(document).ready(function() {
	//阅读之后清除所有新评论未阅读数
	$("#new-comment").click(function(event) {
		$("#watch").removeClass("active");
		$("#comment").addClass("active");
		$("#new-watch-list").removeClass("in");
		$("#new-watch-list").removeClass("active");
		$("#new-comment-list").addClass("in");
		$("#new-comment-list").addClass("active");
		$.post("message/clearCommentMessage", {
	    },
	    function(result) {
	        if (result && result['success']) {
	        	$("#new-comment-number").hide();
	        	if (result['data'] == 0) {
	        		$("#message-not-read-number").hide();
	        	} else {
	        		$("#message-not-read-number").html(result['data']);
	        	}
	        } else {
	        	location.href = path + "/login";
	        }
	    })
	});

	//阅读之后清除所有新关注未阅读数
	$("#new-watch").click(function(event) {
		$("#comment").removeClass("active");
		$("#watch").addClass("active");
		$("#new-comment-list").removeClass("in");
		$("#new-comment-list").removeClass("active");
		$("#new-watch-list").addClass("in");
		$("#new-watch-list").addClass("active");
		$.post("message/clearFocusMessage", {
	    },
	    function(result) {
	        if (result && result['success']) {
	        	$("#new-watch-number").hide();
	        	if (result['data'] == 0) {
	        		$("#message-not-read-number").hide();
	        	} else {
	        		$("#message-not-read-number").html(result['data']);
	        	}
	        } else {
	        	location.href = path + "/login";
	        }
	    })
	});
});
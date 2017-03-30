$(document).ready(function() {
	//  “添加新评论”按钮
	$(".more-comment").click(function(event) {
		$(this).next(".new-comment-sub").toggle();
	});
	//  回复按钮
	$(".apply-comment").click(function(event) {
		$(this).parents(".comment").find(".new-comment-sub").toggle();
		
	});
});


//javascript 模块化
var essayJS = {
    //封装相关ajax的url
    URL: {
        addComment: function() {
            return 'addComment';
        },
        addReply: function() {
            return 'addReply';
        },
        deleteComment: function() {
            return 'deleteComment';
        },
        deleteReply: function() {
            return 'deleteReply';
        },
        addCollect: function() {
            return 'addCollect';
        },
        removeCollect: function() {
            return 'removeCollect';
        },
        addFavourite: function() {
            return 'addFavourite';
        },
        removeFavourite: function() {
            return 'removeFavourite';
        },
        addFocusUser: function(path) {
            return path + '/user/addFocusUser';
        },
        removeFocusUser: function(path) {
            return path + '/user/removeFocusUser';
        }
    },
    
    // 格式化日期
    format: Date.prototype.format = function(format) {
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
    },

    //显示回复框
    showNewReplyForm: function(commentId, path) {
        var userIdInSession = $("#userIdInSession").val();
        if (userIdInSession == '') {
            location.href = path + "login";
            return true;
        }
        var newReplyFormId = "#new_reply_form_" + commentId;
        $(newReplyFormId).toggle(300);
    },

    //添加评论
    addComment: function(essayId, path) {
        var userIdInSession = $("#userIdInSession").val();
        if (userIdInSession == '') {
            location.href = path + "login";
            return true;
        }
        var commentContent = $("#commentContent").val();
        if (commentContent == null) {
            return true;
        }
        $.post(essayJS.URL.addComment(), {
            "essayId": essayId,
            "commentContent": commentContent
        },
        function(result) {
            if (result && result['success']) {
                var comment = result['data'];
                var commentTime = new Date(comment['commentTime']).format("yyyy-MM-dd hh:mm:ss");
                $("#comment-list").append(
                		'<div class="comment" id="child_comment_' + comment['id'] + '">' +
						'<div class="origin-comment">' + '<div class="author">'
						+ '<a href="<%=path%>/users/' + comment['commentDiscussantId'] + '/latest_articles">'
						+ '<img class="avatar" src="<%=path%>/' + comment['commentDiscussantImagePath'] + '" alt="用户头像"></a>'
						+ '<div class="info">' + '<a href="<%=path%>/users/' + comment['commentDiscussantId'] + '/latest_articles"'
						+ 'target="_blank" class="name">' + comment['commentDiscussantName'] + '</a>'
						+ '<div class="meta">'
						+ '<span>' + comment['commentBuildingNumber'] + ' 楼 · ' + commentTime + '</span>'
						+ '</div></div></div>'
						+ '<div class="comment-wrap">'
						+ '<p>' + comment['commentContent'] + '</p>'
						+ '<div class="tool-group">'
						+ '<a><span class="glyphicon glyphicon-thumbs-up"></span><span>赞</span></a>'
						+ '<a><span class="glyphicon glyphicon-comment"></span><span>回复</span></a>'
						+ '</div></div></div>'
                );
                $("#commentContent").val("");
            } else {
            	alert("评论失败,请检查网络连接");
            }
        })
    },

    //添加回复
    addReply: function(essayId, commentId, path) {
    	var userIdInSession = $("#userIdInSession").val();
    	if (userIdInSession == '') {
            location.href = path + "login";
            return true;
        }
        var replyContentId = "#reply_content_" + commentId;
        var replyContent = $(replyContentId).val();
        if (replyContent == null || replyContent == "") {
            return true;
        }
        var replyId = "#reply_" + commentId;
        $.post(essayJS.URL.addReply(), {
        	"essayId": essayId,
            "commentId": commentId,
            "replyContent": replyContent
        },
        function(result) {
            if (result && result['success']) {
            	location.href = path + "/essay/" + essayId;
            } else {
            	alert("回复失败,请检查网络连接");
            }
        })
    },

    //删除评论
    deleteComment: function(essayId, commentId) {
        var del = confirm("确定要删除评论么?");
        if (del) {
            var deleteCommentId = "#child_comment_" + commentId;
            $.post(essayJS.URL.deleteComment(), {
                "essayId": essayId,
                "commentId": commentId
            },
            function(result) {
                if (result && result['success']) {
                    $(deleteCommentId).hide();
                } else {
                    alert("删除失败,请检查网络连接");
                }
            })
        }
    },

    //删除回复
    deleteReply: function(essayId, replyId, path) {
        var del = confirm("确定要删除回复么?");
        if (del) {
            var deleteReplyId = "#child_reply_" + replyId;
            $.post(essayJS.URL.deleteReply(), {
            	"essayId": essayId,
                "replyId": replyId
            },
            function(result) {
                if (result && result['success']) {
                	location.href = path + "/essay/" + essayId;
                } else {
                    alert("删除失败,请检查网络连接");
                }
            })
        }
    },

    //添加收藏
    addCollect: function(essayId) {
        $.post(essayJS.URL.addCollect(), {
            "essayId": essayId
        },
        function(result) {
            if (result && result['success']) {
                $("#top-collect-button").attr("class", "bookmarked");
                $("#top-collect-button").attr("onclick", "essayJS.removeCollect(" + essayId + ")");
                $("#top-collect-button-i").attr("class", "fa fa-bookmark");
            } else {
                alert("收藏失败,请检查网络连接");
            }
        })
    },

    //取消收藏
    removeCollect: function(essayId) {
        $.post(essayJS.URL.removeCollect(), {
            "essayId": essayId
        },
        function(result) {
            if (result && result['success']) {
            	$("#top-collect-button").attr("class","bookmark");
				$("#top-collect-button").attr("onclick","essayJS.addCollect(" + essayId + ")");
				$("#top-collect-button-i").attr("class","fa fa-bookmark-o");
            } else {
                alert("取消失败,请检查网络连接");
            }
        })
    },
    
    //添加用户关注
    addFocusAtUsers: function(focusUserId, path) {
        $.post(essayJS.URL.addFocusUser(path), {
            "focusUserId": focusUserId
        },
        function(result) {
            if (result && result['success']) {
            	$("#focus").prev('span').removeClass("glyphicon glyphicon-plus").addClass('glyphicon glyphicon-ok');
    			$("#focus").html("我的榜样");
    			$("#focus").attr("onclick", "essayJS.removeFocusAtUsers(" + focusUserId + "," + '\'' + path + '\'' + ");");
    			$(".follow").removeClass("btn-success");
    			$(".follow").addClass("btn-default");
            } else {
                location.href = path + "/login";
            }
        })
    },

    //取消用户关注
    removeFocusAtUsers: function(focusUserId, path) {
        $.post(essayJS.URL.removeFocusUser(path), {
            "focusUserId": focusUserId
        },
        function(result) {
            if (result && result['success']) {
            	$("#focus").prev('span').removeClass("glyphicon glyphicon-ok").addClass('glyphicon glyphicon-plus');
    			$("#focus").html("设为榜样");
    			$("#focus").attr("onclick", "essayJS.addFocusAtUsers(" + focusUserId + "," + '\'' + path + '\'' + ");");
    			$(".follow").removeClass("btn-default");
    			$(".follow").addClass("btn-success");	
            } else {
                location.href = path + "/login";
            }
        })
    },

    //添加喜欢
    addFavourite: function(essayUserId, essayId, path) {
    	var userIdInSession = $("#userIdInSession").val();
        if (userIdInSession == '') {
            location.href = path + "login";
            return true;
        }
        $.post(essayJS.URL.addFavourite(), {
            "essayId": essayId,
            "essayUserId": essayUserId
        },
        function(result) {
            if (result && result['success']) {
            	$(".like").css({
        			"background-color": "#00CC33",
        			"color": "white"
        		});
            	$("#favourite-icon").removeClass("glyphicon glyphicon-heart-empty").addClass('glyphicon glyphicon-heart');
                $("#favourite-btn").attr("onclick", "essayJS.removeFavourite(" + essayUserId + "," + essayId + ",'" + path + "')");
                var likesCount = Number($("#likes-count").html()) + 1;
                $("#likes-count").html(likesCount);
            } else {
                alert("点赞失败,请检查网络连接");
            }
        })
    },

    //取消喜欢
    removeFavourite: function(essayUserId, essayId, path) {
    	var userIdInSession = $("#userIdInSession").val();
    	if (userIdInSession == '') {
            location.href = path + "login";
            return true;
        }
        $.post(essayJS.URL.removeFavourite(), {
            "essayId": essayId,
            "essayUserId": essayUserId
        },
        function(result) {
            if (result && result['success']) {
            	$(".like").css({
        			"background-color": "white",
        			"color": "#00CC33"
        		});
            	$("#favourite-icon").removeClass("glyphicon glyphicon-heart").addClass('glyphicon glyphicon-heart-empty');
                $("#favourite-btn").attr("onclick", "essayJS.addFavourite(" + essayUserId + "," + essayId + ",'" + path + "')");
                var likesCount = Number($("#likes-count").html()) - 1;
                $("#likes-count").html(likesCount);
            } else {
                alert("取消点赞失败,请检查网络连接");
            }
        })
    }
}
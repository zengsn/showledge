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
                $("#comment-list").append('<div id="child_comment_' + comment['id'] + '" class="note-comment clearfix">' + '<div class="content"><div class="meta-top">' + '<a class="avatar" href="' + path + 'users/' + comment['commentDiscussantId'] + '/latest_articles">' + '<img src="' + path + comment['commentDiscussantImagePath'] + '" alt="100"></a>' + '<p><a class="author-name" href="' + path + 'users/' + comment['commentDiscussantId'] + '/latest_articles">' + comment['commentDiscussantName'] + '</a></p>' + '<span class="reply-time"> <small>' + comment['commentBuildingNumber'] + ' 楼 · </small>' + '<a href="">' + commentTime + '</a></span></div>' + '<p>' + comment['commentContent'] + '</p>' + '<div class="comment-footer clearfix text-right">' + '<a class="like pull-left" href="javascript:void(0)">' + '<i class="fa fa-heart-o"></i>喜欢<span>(0)</span></a>' + '<a data-nickname="" class="reply" hidefocus="true" onFocus="this.blur()" href="javascript:void(0)"' + 'onclick="essayJS.showNewReplyForm(' + comment['id'] + ',' + path + ');">回复</a>' + '<a class="delete" data-remote="true" rel="nofollow" hidefocus="true" onFocus="this.blur()" href=""' + 'onclick="essayJS.deleteComment(' + comment['essayId'] + ',' + comment['id'] + ')">删除</a></div>' + '<div class="child-comment-list"><div id="reply_' + comment['id'] + '"></div>' + '<form id="new_reply_form_' + comment['id'] + '" style="display: none"' + 'class="new_comment" accept-charset="UTF-8" method="post" action="">' + '<div class="comment-text">' + '<textarea id="reply_content_' + comment['id'] + '"' + 'maxlength="2000" placeholder="写下你的评论…" class="mousetrap"></textarea>' + '<div><input type="button" value="发 表" class="btn btn-info" hidefocus="true" onFocus="this.blur()"' + 'onclick="essayJS.addReply(' + essayId + ',' + comment['id'] + ')">' + '<div class="emoji"><span><i class="fa fa-smile-o"></i></span></div>' + '<span class="hotkey">Ctrl+Enter 发表</span></div></div></form></div></div></div>');
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
        if (replyContent == null) {
            return true;
        }
        var newReplyFormId = "#new_reply_form_" + commentId;
        var replyId = "#reply_" + commentId;
        $.post(essayJS.URL.addReply(), {
        	"essayId": essayId,
            "commentId": commentId,
            "replyContent": replyContent
        },
        function(result) {
            if (result && result['success']) {
                $(newReplyFormId).hide();
                var reply = result['data'];
                var replyTime = new Date(reply['replyTime']).format("yyyy-MM-dd hh:mm:ss");
                $(replyId).append('<div id="child_reply_' + reply['id'] + '" class="child-comment"><p>' + '<a class="blue-link" href="' + path + 'users/' + reply['replyUserId'] + '/latest_articles">' + reply['replyUserName'] + '</a> ：' + reply['replyContent'] + '</p>' + '<div class="child-comment-footer text-right clearfix">' + '<a class="reply" hidefocus="true" onFocus="this.blur()" href="javascript:void(null)" onclick="essayJS.showNewReplyForm(' + commentId + ',' + path +');">回复</a>' + '<a class="delete" data-remote="true" rel="nofollow" hidefocus="true" onFocus="this.blur()" href="" onclick="essayJS.deleteReply(' + essayId + ',' + reply['id'] + ')">删除</a>' + '<span class="reply-time pull-left"> <a href="">' + replyTime + '</a></span></div></div>');
                $(replyContentId).val("");
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
    deleteReply: function(essayId, replyId) {
        var del = confirm("确定要删除回复么?");
        if (del) {
            var deleteReplyId = "#child_reply_" + replyId;
            $.post(essayJS.URL.deleteReply(), {
            	"essayId": essayId,
                "replyId": replyId
            },
            function(result) {
                if (result && result['success']) {
                    $(deleteReplyId).hide();
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
                $("#mid-favourite-button").attr("class", "like note-liked");
                $("#mid-favourite-button-a").attr("onclick", "essayJS.removeFavourite(" + essayUserId + "," + essayId + "," + path + ")");
                $("#mid-favourite-button-i").attr("class", "fa fa-heart");
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
                $("#mid-favourite-button").attr("class", "like");
                $("#mid-favourite-button-a").attr("onclick", "essayJS.addFavourite(" + essayUserId + "," + essayId + "," + path + ")");
                $("#mid-favourite-button-i").attr("class", "fa fa-heart-o");
                var likesCount = Number($("#likes-count").html()) - 1;
                $("#likes-count").html(likesCount);
            } else {
                alert("取消点赞失败,请检查网络连接");
            }
        })
    }
}
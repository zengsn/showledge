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
            return '/essay/addComment.do';
        },
        addReply: function() {
            return 'addReply.do';
        },
        deleteComment: function() {
            return 'deleteComment.do';
        },
        deleteReply: function() {
            return 'deleteReply.do';
        },
        addCollect: function() {
            return 'addCollect.do';
        },
        removeCollect: function() {
            return 'removeCollect.do';
        },
        addFavourite: function() {
            return 'addFavourite.do';
        },
        removeFavourite: function() {
            return 'removeFavourite.do';
        },
        addFocusUser: function(path) {
            return path + '/user/addFocusUser.do';
        },
        removeFocusUser: function(path) {
            return path + '/user/removeFocusUser.do';
        },
        changeFocusUser:'/user/changeFocusUser.do',
        changeFavourite:'/essay/changeFavourite.do',
        changeCollection:'/essay/changeCollection.do'
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
       /* var userIdInSession = $("#userIdInSession").val();
        
        if (userIdInSession == '') {
            location.href = path + "login";
            return true;
        }*/
    	
    	//alert("行间样式的评论")
        
    	//获取评论内容
        var commentContent = $("#commentContent").val();
        if (commentContent == null) {
        	alert("评论不能为空")
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
                		"<li id='comment-001'>"
                        +"<div class='comment-user'>"
                        +"<a href='/user.do?userId='" + comment['commentDiscussantId'] + "' target='_blank'><img src='/" + comment['commentDiscussantImagePath'] + "' alt='用户头像-ssm' class='avatar-ssm'></a>" 
                         +' <a href="/user.do?userId='+ comment['commentDiscussantId'] +'" target="_blank" class="user-name">' +  comment['commentDiscussantName'] + '</a>'
                          +'<div>'
                            +'<span>' + comment['commentBuildingNumber'] + '楼</span>'
                            +'<span> · </span>'
                            + '<span>'+ commentTime +'</span>'
                          +'</div>'
                        +'</div>'
                        +'<div class="comment-content">'
                          +'<p> '+ comment['commentContent'] + '</p>'
                        +'</div></li>'
                );
                
                /*'<div class="comment" id="child_comment_' + comment['id'] + '">' +
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
				+ '</div></div></div>'*/
                
                $("#commentContent").val("");
            } else {
            	alert("评论失败,请检查网络连接");
            }
        })
        
        //return true;
    },

    //添加回复
    addReply: function(commentDiscussantId, essayId, essayTitle, commentId, path) {
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
        	"commentDiscussantId": commentDiscussantId,
        	"essayId": essayId,
        	"essayTitle": essayTitle,
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
    addFocusUser: function(focusUserId, path) {
        $.post(essayJS.URL.addFocusUser(path), {
            "focusUserId": focusUserId
        },
        function(result) {
            if (result && result['success']) {
            	$("#focus").prev('span').removeClass("glyphicon glyphicon-plus").addClass('glyphicon glyphicon-ok');
    			$("#focus").html("我的榜样");
    			$("#focus").attr("onclick", "essayJS.removeFocusUser(" + focusUserId + "," + '\'' + path + '\'' + ");");
    			$(".follow").removeClass("btn-success");
    			$(".follow").addClass("btn-default");
            } else {
                location.href = path + "/login";
            }
        })
    },

    //取消用户关注
    removeFocusUser: function(focusUserId, path) {
        $.post(essayJS.URL.removeFocusUser(path), {
            "focusUserId": focusUserId
        },
        function(result) {
            if (result && result['success']) {
            	$("#focus").prev('span').removeClass("glyphicon glyphicon-ok").addClass('glyphicon glyphicon-plus');
    			$("#focus").html("设为榜样");
    			$("#focus").attr("onclick", "essayJS.addFocusUser(" + focusUserId + "," + '\'' + path + '\'' + ");");
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
            location.href = path + "/login";
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
            location.href = path + "/login";
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
    },
    
    //改变用户关注
    changeFocusUser:function changeFocusUser(userId,obj){
    	$.post(essayJS.URL.changeFocusUser, {
            "userId": userId
        },
        function(result) {
            if (result && result['success']) {
            	
            	//改变关注 状态
            	$(obj).toggleClass("not-follow");
        		if ($(obj).attr("class") == "follow-btn") 
        			$(obj).html("<span class='fa fa-plus-circle'></span>关注");		
        		else $(obj).html("已关注");		
        		
            } else {
                location.href = path + "/index.do";
            }
        })
    },
    
    changeFavourite:function changeFavourite(essayId,obj){
    	//alert("点赞");
    	
    	$.post(essayJS.URL.changeFavourite, {
            "essayId": essayId
        },
        function(result) {
            if (result && result['success']) {
            	//改变关注 状态
            	
            	 if ($(obj).attr("class") == "btn btn-lg btn-green like-btn") {
            	      $(obj).addClass("note-like-and-collect-btn-active");
            	      $(obj).html("<span class='fa fa-heart fa-fw'></span>已点赞");
            	    }
            	    else {
            	      $(obj).removeClass("note-like-and-collect-btn-active");
            	      $(obj).html("<span class='fa fa-heart fa-fw'></span>点赞");
            	    }
            	
            } else {
                location.href = path + "/index.do";
            }
        })
    },
    
    changeCollection:function changeCollection(essayId,obj){
    	$.post(essayJS.URL.changeCollection, {
            "essayId": essayId
        },
        function(result) {
            if (result && result['success']) {
            	//改变关注 状态
            	
            	if ($(obj).attr("class") == "btn btn-lg btn-green collect-btn") {
            	      $(obj).addClass("note-like-and-collect-btn-active");
            	      $(obj).html("<span class='fa fa-bookmark fa-fw'></span>已收藏");
            	    }
            	    else {
            	      $(obj).removeClass("note-like-and-collect-btn-active");
            	      $(obj).html("<span class='fa fa-bookmark fa-fw'></span>收藏");
            	    }
            } else {
                location.href = path + "/index.do";
            }
        })
    }
    
}




















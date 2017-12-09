$(document).ready(function() {
	//按钮active的切换
	$('.one-li').click(function (e) {  
		e.preventDefault();  
		$('.one-li').removeClass('active');  
		$(this).addClass('active');    
	});

	//点击【编辑】按钮编辑个人资料
	$(".function-btn").click(function(event) {
		var userIntroduce = $("#userIntroduce").val();
		var user_introduce = $("#user_introduce").html();
		if (user_introduce != '') {
			$("#user_introduce").html('');
			$("#userIntroduce").val(user_introduce);
			$(".profile-edit").css("display","block");
		} else {
			$("#userIntroduce").val(userIntroduce);
		}
	});
	
	//点击编辑个人资料中的【取消】
	$(".btn-cancel").click(function(event) {
		var userIntroduce = $("#userIntroduce").val();
		$("#userIntroduce").val('');
		$("#user_introduce").html(userIntroduce);
		$(".profile-edit").css("display","none");
	});
});

//javascript 模块化
var userJS = {
    //封装相关ajax的url
    URL: {
    	updateUser: function() {
            return 'user/updateUser.do';
        },
        addFocusUser: function(path) {
            return path + '/user/addFocusUser.do';
        },
        removeFocusUser: function(path) {
            return path + '/user/removeFocusUser.do';
        },
        getComment:"/user/getComment.do",
        addComent:"/essay/addComment.do",
        deleteEssay:"/writer/deleteEssay.do",
        changeFocusUser:'/user/changeFocusUser.do',
        changeFavourite:'/essay/changeFavourite.do',
        changeCollection:'/essay/changeCollection.do'
    },
    
    //更新用户个人信息
    updateUser: function(userName) {
    	var userIntroduce = $.trim($("#userIntroduce").val());
        $.post(userJS.URL.updateUser(), {"userName":userName, "userIntroduce":userIntroduce},
        function(result) {
            if (result && result['success']) {
                var user = result['data'];
                $(".profile-edit").css("display","none");
                $("#user_introduce").html(user['userIntroduce']);
            } else {
            	alert("编辑失败,请刷新重试！");
            }
        })
    },
    
    //添加用户关注
    addFocusUser: function(focusUserId, path) {
    	$.post(userJS.URL.addFocusUser(path), {
	        "focusUserId": focusUserId
	    },
	    function(result) {
	        if (result && result['success']) {
	          	$("#follow-btn").html("");
	           	$("#follow-btn").html("<span id='focus-mess'> 已关注</span>");
	           	$("#follow-btn").removeAttr("class");
	   			$("#follow-btn").attr("class","focus");
	   			$("#follow-btn").removeAttr("onclick");
	   			$("#follow-btn").attr("onclick","userJS.removeFocusUser('" + focusUserId + "','" + path + "')");
	        } else {
	        	location.href = path + "/login";
	        }
	    })
    },

    //取消用户关注
    removeFocusUser: function(focusUserId, path) {
    	$.post(userJS.URL.removeFocusUser(path), {
	        "focusUserId": focusUserId
	    },
	    function(result) {
	        if (result && result['success']) {
	        	$("#follow-btn").html("");
	           	$("#follow-btn").html("<span class='glyphicon glyphicon-plus'></span> <span id='focus-mess'>关注</span>");
	    		$("#follow-btn").removeAttr("class");
	    		$("#follow-btn").attr("class","no-focus");
	    		$("#follow-btn").removeAttr("onclick");
	    		$("#follow-btn").attr("onclick","userJS.addFocusUser('" + focusUserId + "','" + path + "')");
	        } else {
	            location.href = path + "/login";
	        }
	    })
    },
    
    getComment:function(essayId){
    	$("#comList").html("");
    	
    	//alert("响应");
    	$("#essayId").val(essayId);
    	
    	$.post(userJS.URL.getComment, {
	        "essayId": essayId
	    },
	    function(result) {
	        if (result) {
	        	
	        	var c = 0;
	        	for(i in result){
	        		c++;
	        		var comment = result[i];
	        		
	        		$("#comList").append(
	        		'<li id="comment-"'+i+'">' + 
	                '<div class="user-info">' + 
	                  '<a href="/user.do?userId='+ comment.commentDiscussantId +'"><img src="/'+comment.commentDiscussantImagePath+'" alt="用户头像-sm" class="avatar-ssm"></a>'+
	                  '<a href="/user.do?userId='+ comment.commentDiscussantId +'" class="user-name">'+comment.commentDiscussantName+'</a>'+
	                  '<span> - </span>'+
	                  '<span class="user-act-time">'+comment.formatCommentTime+'</span>'+
	                '</div>'+
	                '<p class="comment-content">'+
	                comment.commentContent+
	                '</p>'+
	                '</li>'
	              );
	        	}
	        	
	        	//alert(c);
	        	$("#ccount").html(c);
	        } else {
	            location.href = "/index";
	        }
	    })
    },
    
    addComment:function(){
    	var content = $("#comment-box").val();
    	var essayId = $("#essayId").val();
    	
    	if ($("#comment-box").val() == "") alert("评论不能为空");
        else {
          // alert("评论提交成功");
        	
        	$.post(userJS.URL.addComent, {
                "essayId": essayId,
                "commentContent": content
            },
            function(result) {
            	$("#comment-box").val("");
            	userJS.getComment(essayId);
            })
        }
    },
    
    
    deleteEssay:function(essayId,btn){
    	var isDelete = window.confirm("你确定要删除吗？");
        if (isDelete) {
        	$.post(userJS.URL.deleteEssay, {
                "essayId": essayId,
            },
            function(result) {
            	if (result.success == true) {
            		$(btn).parent().remove();
				}else{
					alert("删除失败,请刷新重试");
				}
            })
        }
    },
    
    //改变用户关注
    changeFocusUser:function changeFocusUser(userId,obj){
    	$.post(userJS.URL.changeFocusUser, {
            "userId": userId
        },
        function(result) {
            if (result && result['success']) {
            	
            	$(obj).toggleClass("not-follow");
                if ($(obj).attr("class") == "follow-btn") 
                  $(obj).html("<span class='fa fa-plus-circle'></span>关注");    
                else $(obj).html("已关注");   		
        		
            } else {
                location.href = path + "/index.do";
            }
        })
    },
    
    changeFavourite:function changeFavourite(essayId,obj,num){
    	//alert("点赞");
    	
    	$.post(userJS.URL.changeFavourite, {
            "essayId": essayId
        },
        function(result) {
            if (result && result['success']) {
            	//改变关注 状态
            	
            	 if ($(obj).attr("class") == "like-count green-count") {
            		 $(obj).removeClass("green-count");
            	      $(obj).find(".num").html(num - 1);
            	    }
            	    else {
            	    	$(obj).addClass("green-count");
            	      $(obj).find(".num").html(num);
            	    }
            	
            } else {
                location.href = path + "/index.do";
            }
        })
    },
    
    changeCollection:function changeCollection(essayId,obj,num){
    	$.post(userJS.URL.changeCollection, {
            "essayId": essayId
        },
        function(result) {
            if (result && result['success']) {
            	//改变关注 状态
            	
            	if ($(obj).attr("class") == "collection-count green-count") {
            	      $(obj).removeClass("green-count");
            	      $(obj).find(".num").html(num - 1);
            	    }
            	    else {
            	      $(obj).addClass("green-count");
            	      $(obj).find(".num").html(num);
            	    }
            } else {
                location.href = path + "/index.do";
            }
        })
    }
    
    
}






























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
            return 'user/updateUser';
        },
        addFocusUser: function(path) {
            return path + '/user/addFocusUser';
        },
        removeFocusUser: function(path) {
            return path + '/user/removeFocusUser';
        }
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
}
//javascript 模块化
var userJS = {
    //封装相关ajax的url
    URL: {
    	updateUser: function() {
            return 'user/updateUser';
        }
    },
    
    //显示个人信息修改框
    showUserForm: function() {
    	$("#user_name").hide();
    	$("#user_introduce").hide();
    	$("#user_introduce_click").hide();
    	$("#error_message").hide();
    	$("#user_form").show(400);
    },
    
    //隐藏个人信息修改框
    hideUserForm: function() {
    	$("#user_form").hide();
    	$("#user_name").show();
    	$("#user_introduce").show();
    	$("#user_introduce_click").show();
    },
    
    //更新用户个人信息
    updateUser: function() {
    	var userName = $.trim($("#userName").val());
    	var userIntroduce = $.trim($("#userIntroduce").val());
		if (!userName) {
			$("#error_message").html("请输入昵称");
			$("#error_message").show(300);
			return true;
		}
		if (userName.length < 3) {
			$("#error_message").html("昵称长度应在3-8之间");
			$("#error_message").show(300);
			return true;
		}
		if (userName.length > 8) {
			$("#error_message").html("昵称长度应在3-8之间");
			$("#error_message").show(300);
			return true;
		}
        $.post(userJS.URL.updateUser(), {"userName":userName, "userIntroduce":userIntroduce},
        function(result) {
            if (result && result['success']) {
                var user = result['data'];
                $("#user_name").html(user['userName']);
				$("#user_introduce").html(user['userIntroduce']);
				userJS.hideUserForm();
            } else {
            	$("#error_message").html(result['error']);
				$("#error_message").show(300);
            }
        })
    }
}
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
    }
}
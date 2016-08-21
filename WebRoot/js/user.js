$(function() {
	$("#user_form_button").click(function() {
		var userName = $.trim($("#userName").val());
		if (!userName) {
			$("#error_message").html("请输入昵称");
			$("#error_message").show();
			return true;
		}
		if (userName.length < 3) {
			$("#error_message").html("昵称长度应在3-8之间");
			$("#error_message").show();
			return true;
		}
		if (userName.length > 8) {
			$("#error_message").html("昵称长度应在3-8之间");
			$("#error_message").show();
			return true;
		}
		$.ajax({
			type : "POST", // http请求方式
			url : "http://localhost:8080/learned/updateUser.do", // 发送给服务器的url
			data : $("#user_form").serialize(), // 发送给服务器的参数
			dataType : "json", // 告诉JQUERY返回的数据格式(注意此处数据格式一定要与提交的controller返回的数据格式一致,不然不会调用回调函数complete)
			complete : function(msg) {
				var result = eval("(" + msg.responseText + ")");
				if (result.success) {
					$("#user_name").val(result.user.userName);
					$("#user_introduce").html(result.user.userIntroduce);
					hideUserForm();
				} else {
					$("#error_message").html(result.message);
					$("#error_message").show();
				}
			},
		});
	})
});
function showUserForm() {
	$("#user_name").hide();
	$("#user_introduce").hide();
	$("#user_introduce_click").hide();
	$("#error_message").hide();
	$("#user_form").show(400);
}
function hideUserForm() {
	$("#user_form").hide();
	$("#user_name").show();
	$("#user_introduce").show();
	$("#user_introduce_click").show();
}
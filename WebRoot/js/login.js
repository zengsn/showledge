$(function() {
	$('#kaptchaImage').click(
			function() {// 生成验证码
				$(this).hide()
						.attr(
								'src',
								'getKaptchaImage.do?'
										+ Math.floor(Math.random() * 100))
						.fadeIn();
				event.cancelBubble = true;
			});
});
window.onbeforeunload = function() {
	// 关闭窗口时自动退出
	if (event.clientX > 360 && event.clientY < 0 || event.altKey) {
		alert(parent.document.location);
	}
};
function changeCode() {
	$('#kaptchaImage').hide().attr('src',
			'getKaptchaImage.do?' + Math.floor(Math.random() * 100)).fadeIn();
	event.cancelBubble = true;
}
function clearPasswordCss() {
	$("#noPasswordMessage").css("display", "none");
}
function clearVerifyCodeCss() {
	$("#noVerifyCodeMessage").css("display", "none");
}
$(function() {
	$("#login-button").click(
			function() {
				var userPassword = $.trim($("#userPassword").val());
				var kaptcha = $.trim($("#kaptcha").val());
				/*if($('#isRememberLogin').is(':checked')) {
					alert("选中了");
				} else {
					alert("没选中");
				}*/
				if (!userPassword) {
					$("#noPasswordMessage").css("display", "inline-block");
					return true;
				}
				if (!kaptcha) {
					$("#noVerifyCodeMessage").css("display", "inline-block");
					return true;
				}
				$.ajax({
					type : "POST", // http请求方式
					url : "http://localhost:8080/learned/checkLogin.do", // 发送给服务器的url
					data : $("#login-form").serialize(), // 发送给服务器的参数
					dataType : "json", // 告诉JQUERY返回的数据格式(注意此处数据格式一定要与提交的controller返回的数据格式一致,不然不会调用回调函数complete)
					complete : function(msg) {
						var result = eval("(" + msg.responseText + ")");
						if (result.success) {
							location.href = "index.html"; // location.href实现客户端页面的跳转
						} else {
							if ((result.message).indexOf("code") >= 0) {
								$("#noVerifyCodeMessage").css("display",
										"inline-block");
								return true;
							} else {
								$("#noPasswordMessage").css("display",
										"inline-block");
								return true;
							}
						}
					},
				});
			})
});
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
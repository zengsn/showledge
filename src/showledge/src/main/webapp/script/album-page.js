$(document).ready(function() {
	//  关注按钮的切换
	$("#follow-btn").click(function(event) {
		if ($("#follow-btn").text() == " 关注") {
			
			$("#follow-btn").text(" 已关注");

			$("#follow-btn").css({
				"color": '#969696',
				"background-color": 'white',
				"border": '1px solid #969696'
			});
		} else if ($("#follow-btn").text() == " 已关注") {
			$("#follow-btn").html("<span class='glyphicon glyphicon-plus'></span> <span>关注</span>");

			$("#follow-btn").css({
				"color": 'white',
				"background-color": '#00cc66',
				"border": '1px solid #00cc66'
			});
		}
	});
		
});
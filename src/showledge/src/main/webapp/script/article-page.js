$(document).ready(function() {
	$(".follow").click(function(event) {
		if ($(".follow").attr("class") == "btn btn-xs follow btn-success") {
			$("#guanzhu").prev('span').removeClass("glyphicon glyphicon-plus").addClass('glyphicon glyphicon-ok');
			$("#guanzhu").html("我的榜样");
			$(".follow").removeClass("btn-success");
			$(".follow").addClass("btn-default");			
		}
		else if ($(".follow").attr("class") == "btn btn-xs follow btn-default") {
			$("#guanzhu").prev('span').removeClass("glyphicon glyphicon-ok").addClass('glyphicon glyphicon-plus');
			$("#guanzhu").html("设为榜样");
			$(".follow").removeClass("btn-default");
			$(".follow").addClass("btn-success");			
		}
	});


	//  “喜欢”按钮
	$(".like").click(function(event) {
		$(".like").css({
			"background-color": "#00CC33",
			"color": "white"
		});
	});
	//  “添加新评论”按钮
	$(".more-comment").click(function(event) {
		$(this).next(".new-comment-sub").toggle();
	});
	//  删除主评论
	$(".delete-comment").click(function(event) {
		$(this).parents(".comment").remove();
	});
	//  删除自评论
	$(".delete-comment-sub").click(function(event) {
		$(this).parents(".sub-comment").remove();
	});
	//  回复按钮
	$(".apply-comment").click(function(event) {
		$(this).parents(".comment").find(".new-comment-sub").toggle();
		
	});
});

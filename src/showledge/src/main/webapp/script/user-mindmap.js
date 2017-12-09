$(document).ready(function($) {
	//  “喜欢”按钮
	$(".like").click(function(event) {
		if ($(".like").css("color")=="rgb(0, 204, 102)")
		{
			$(".like").css({
				"background-color": "#00CC33",
				"color": "white"
			});
			$("#heart-icon").attr('class', 'glyphicon glyphicon-heart');
		} else {
			$(".like").css({
				"background-color": "#3f3f3f",
				"color": "#00cc66"
			});
			$("#heart-icon").attr('class', 'glyphicon glyphicon-heart-empty');
		}

	});		
});

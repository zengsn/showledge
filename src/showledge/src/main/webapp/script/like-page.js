$(document).ready(function($) {
	$(".not-watch").click(function(event) {
		if ($(this).attr("class") == "btn not-watch not-watch-album btn-danger" 
			|| $(this).attr("class") == "btn not-watch not-watch-idol btn-danger") {
			$(this).html("<span class='glyphicon glyphicon-plus'></span> 关注");
			$(this).removeClass("btn-danger");
			$(this).addClass("btn-success");
		} else if ($(this).attr("class") == "btn not-watch not-watch-album btn-success" 
			       || $(this).attr("class") == "btn not-watch not-watch-idol btn-success") {
			$(this).html("取消关注");
			$(this).removeClass("btn-success");
			$(this).addClass("btn-danger");			
		}
	});
});
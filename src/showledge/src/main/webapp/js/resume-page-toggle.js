//这个js文件内容主要是标题的toggle效果
jQuery(document).ready(function($) {
	jQuery(".title-btn").click(function(event) {
		jQuery(this).next(".note-list").slideToggle();
	});
});
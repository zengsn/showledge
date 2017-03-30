$(document).ready(function() {
	//侧栏编辑按钮的滑动效果
	$(".list-title").click(function(event) {
		$(this).next('ul').slideToggle();  
		$(".sub").click(function(event) {
			event.preventDefault();
		});
	});

	//保存按钮事件，触发提示框
	$("#finally-save").click(function(event) {
		$('.alert').slideDown();
		var Timer = setTimeout(function(){
		    $('.alert').slideUp();
		}, 2000);
	});
});
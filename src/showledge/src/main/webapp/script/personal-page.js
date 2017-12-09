$(document).ready(function() {
	//按钮active的切换
	$('.one-li').click(function (e) {  
		e.preventDefault();  
		$('.one-li').removeClass('active');  
		$(this).addClass('active');    
	});

	//点击【编辑】按钮编辑个人资料
	$(".function-btn").click(function(event) {
		$(".profile-edit").css("display","block");
	});
	//点击编辑个人资料中的【取消】
	$(".btn-cancel").click(function(event) {
		$(".profile-edit").css("display","none");
	});
});
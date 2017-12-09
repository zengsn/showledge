$(document).ready(function() {
	$("#login-btn").click(function(event) {
		var password = $("#inputPassword3").val(); //用户输入的密码
		var checkNum = $("#inputCheckNum").val(); //用户输入的验证码
		if (password!=123) {
			$('.alert').removeClass('alert-success');
			$('.alert').addClass('alert-danger');
			$('.alert').text('密码错误');
		}
		else if (checkNum!=1234) {
			$('.alert').removeClass('alert-success');
			$('.alert').addClass('alert-danger');
			$('.alert').text('验证码错误');			
		}
		else {
			$('.alert').removeClass('alert-danger');
			$('.alert').addClass('alert-success');
			$('.alert').text('登录成功');
		}
		$('.alert').slideDown();
		var Timer = setTimeout(function(){
		    $('.alert').slideUp();
		}, 2000);
	});

	$("#register-btn").click(function(event) {
		var name = $("#inputUserName").val(); //用户注册的用户名
		var checkNum2 = $("#inputCheckNum2").val(); //用户输入的验证码
		var email = $("#inputEmail").val();  //用户注册的邮箱
		var password2 = $("#inputPassword2").val();  //用户注册的密码
		if (email=="moo@126.com") {
			$('.alert').removeClass('alert-success');
			$('.alert').addClass('alert-danger');
			$('.alert').text('邮箱已被注册');	
		}	
		else if (name==123) {
			$('.alert').removeClass('alert-success');
			$('.alert').addClass('alert-danger');
			$('.alert').text('用户名已被注册');			
		}
		else if (name=="") {
			$('.alert').removeClass('alert-success');
			$('.alert').addClass('alert-danger');
			$('.alert').text('用户名不能为空');			
		}
		else if (password2=="") {
			$('.alert').removeClass('alert-success');
			$('.alert').addClass('alert-danger');
			$('.alert').text('密码不能为空');			
		}			
		else if (checkNum2!=1234) {
			$('.alert').removeClass('alert-success');
			$('.alert').addClass('alert-danger');
			$('.alert').text('验证码错误');			
		}
		else {
			$('.alert').removeClass('alert-danger');
			$('.alert').addClass('alert-success');
			$('.alert').text('注册成功');
		}
		$('.alert').slideDown();
		var Timer = setTimeout(function(){
		    $('.alert').slideUp();
		}, 2000);
	});	
});
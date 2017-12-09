$(document).ready(function() {
	//提交表单，验证表单，显示警告框
	$('#password-enter').click(function(event) {
		var oldPassword = $('#old-password').val();
		var newPassword = $('#new-password').val();
		var enterNewPassword = $('#enter-new-password').val();
		if (oldPassword!='123') {
			$('.alert').removeClass('alert-success');
			$('.alert').addClass('alert-danger');
			$('.alert').text('原始密码错误');
			$('#old-password').val("");
			$('#new-password').val("");
			$('#enter-new-password').val("");			
		}
		else if (newPassword=="" || enterNewPassword=="") {
			$('.alert').removeClass('alert-success');
			$('.alert').addClass('alert-danger');
			$('.alert').text('输入不能为空');
			$('#old-password').val("");
			$('#new-password').val("");
			$('#enter-new-password').val("");				
		}
		else if (newPassword!=enterNewPassword) {
			$('.alert').removeClass('alert-success');
			$('.alert').addClass('alert-danger');
			$('.alert').text('新密码输入不一致');
			$('#new-password').val("");
			$('#enter-new-password').val("");				
		}
		else {
			$('.alert').removeClass('alert-danger');
			$('.alert').addClass('alert-success');
			$('.alert').text('修改密码成功');
			$('#old-password').val("");
			$('#new-password').val("");
			$('#enter-new-password').val("");				
		}
		$('.alert').slideDown();
		var Timer = setTimeout(function(){
		    $('.alert').slideUp();
		}, 2000);
		//clearTimeout(Timer);   //清除定时器
	});

	$('.save').click(function(event) {
		$('.alert').removeClass('alert-danger');
		$('.alert').addClass('alert-success');
		$('.alert').text('保存成功');		
		$('.alert').slideDown();
		var Timer = setTimeout(function(){
		    $('.alert').slideUp();
		}, 2000);		
	});
});
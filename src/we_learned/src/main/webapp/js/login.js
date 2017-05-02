window.onbeforeunload = function() {
    // 关闭窗口时自动退出
    if (event.clientX > 360 && event.clientY < 0 || event.altKey) {
        alert(parent.document.location);
    }
};

//javascript 模块化
var loginJS = {
    //封装相关ajax的url
    URL: {
        getKaptchaImage: function() {
            return 'login/getKaptchaImage';
        },
        checkLogin: function() {
            return 'login/checkLogin';
        },
        loginSuccess: function() {
            return 'index';
        }
    },
    
    //更换页面验证码
    changeCode: function() {
        $('#kaptchaImage').hide().attr('src', loginJS.URL.getKaptchaImage() + '?' + Math.floor(Math.random() * 100)).fadeIn();
        event.cancelBubble = true;
    },
    
    //提示出错信息
    alert: function(message) {
    	$('.alert').removeClass('alert-success');
		$('.alert').addClass('alert-danger');
		$('.alert').text(message);
		$('.alert').slideDown();
		var Timer = setTimeout(function(){
		    $('.alert').slideUp();
		}, 2000);
    },
    
    //验证用户登录
    checkLogin: function() {
        var userEmail = $.trim($("#userEmail").val());
        var userPassword = $.trim($("#userPassword").val());
        var kaptcha = $.trim($("#kaptcha").val());
        var isRemember = $('#rememberFlag').is(':checked');
        if (!userEmail) {
        	loginJS.alert('请填写您的邮箱');
            return true;
        }
        if (!userPassword) {
        	loginJS.alert('请输入密码');
            return true;
        }
        if (!kaptcha) {
        	loginJS.alert('验证码不能为空');
            return true;
        }
        $.get(loginJS.URL.checkLogin(), {"userEmail":userEmail, "userPassword":userPassword, "kaptcha":kaptcha, "isRemember":isRemember},
        function(result) {
            if (result && result['success']) {
            	$('.alert').removeClass('alert-danger');
        		$('.alert').addClass('alert-success');
        		$('.alert').text("登录成功");
            	$('.alert').slideDown();
        		var Timer = setTimeout(function(){
        		    $('.alert').slideUp();
        		}, 2000);
                location.href = loginJS.URL.loginSuccess();
            } else {
                if ((result['error']).indexOf("code") >= 0) {
                	$('#kaptcha').val("");
                	loginJS.alert('验证码错误');
                	loginJS.changeCode();
                    return true;
                } else {
                	$('#userPassword').val("");
                	$('#kaptcha').val("");
                	loginJS.alert('邮箱或密码不正确');
                    return true;
                }
            }
        })
    }
}
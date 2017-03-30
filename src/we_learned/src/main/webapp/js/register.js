//javascript 模块化
var registerJS = {
    //封装相关ajax的url
    URL: {
        isEmailExist: function() {
            return 'register/isEmailExist';
        },
        isNameExist: function() {
            return 'register/isNameExist';
        },
        newUser: function() {
            return 'register/newUser';
        },
        registerSuccess: function() {
            return 'login';
        }
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

    //验证用户全部注册信息是否合法
    checkRegister: function() {
        var userEmail = $.trim($("#userEmail").val());
        var reg = /^([.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
        var userName = $.trim($("#userName").val());
        var userPassword = $.trim($("#userPassword").val());
        if (!userEmail) {
        	registerJS.alert('请填写您的邮箱');
            return false;
        }
        if (!reg.test(userEmail)) {
        	registerJS.alert('邮箱格式不正确');
            return false;
        }
        if (!userName) {
        	registerJS.alert('请输入昵称');
            return false;
        }
        if (userName.length < 3) {
        	registerJS.alert('昵称长度应在3-8之间');
            return false;
        }
        if (userName.length > 8) {
        	registerJS.alert('昵称长度应在3-8之间');
            return false;
        }
        if (!userPassword) {
        	registerJS.alert('请输入密码');
            return false;
        } else if (userPassword.length < 6) {
        	registerJS.alert('密码长度应在6-15之间');
            return false;
        } else if (userPassword.length > 15) {
        	registerJS.alert('密码长度应在6-15之间');
            return false;
        }
        $.post(registerJS.URL.newUser(), {"userEmail":userEmail, "userName":userName, "userPassword":userPassword},
        function(result) {
            if (result && result['success']) {
            	$('.alert').removeClass('alert-danger');
        		$('.alert').addClass('alert-success');
        		$('.alert').text("注册成功");
            	$('.alert').slideDown();
        		var Timer = setTimeout(function(){
        		    $('.alert').slideUp();
        		}, 2000);
                location.href = registerJS.URL.registerSuccess();
            } else {
                if ((result['error']).indexOf("邮箱") >= 0) {
                	registerJS.alert('邮箱已经注册');
                    return false;
                } else {
                	registerJS.alert('昵称已经存在');
                    return false;
                }
            }
        })
    }
}
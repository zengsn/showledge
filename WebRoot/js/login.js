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
    
    //隐藏登陆错误信息
    hidePasswordCss: function() {
        $("#errorPasswordMessage").hide();
    },
    //隐藏验证码出错信息
    hideVerifyCodeCss: function() {
        $("#errorVerifyCodeMessage").hide();
    },
    
    //更换页面验证码
    changeCode: function() {
        $('#kaptchaImage').hide().attr('src', loginJS.URL.getKaptchaImage() + '?' + Math.floor(Math.random() * 100)).fadeIn();
        event.cancelBubble = true;
    },
    //验证用户登录
    checkLogin: function() {
        var userEmail = $.trim($("#userEmail").val());
        var userPassword = $.trim($("#userPassword").val());
        var kaptcha = $.trim($("#kaptcha").val());
        if (!userPassword) {
            $("#errorPasswordMessage").show(300);
            return true;
        }
        if (!kaptcha) {
            $("#errorVerifyCodeMessage").show(300);
            return true;
        }
        $.get(loginJS.URL.checkLogin(), {"userEmail":userEmail, "userPassword":userPassword, "kaptcha":kaptcha},
        function(result) {
            if (result && result['success']) {
                location.href = loginJS.URL.loginSuccess();
            } else {
                if ((result['error']).indexOf("code") >= 0) {
                    $("#errorVerifyCodeMessage").show(300);
                    return true;
                } else {
                    $("#errorPasswordMessage").show(300);
                    return true;
                }
            }
        })
    }
}
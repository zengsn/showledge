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

    //隐藏显示在邮箱栏旁边的提示信息
    hideEmailCss: function() {
        $("#noEmailMessage").hide();
        $("#yesEmailMessage").hide();
    },
    //隐藏显示在用户昵称栏旁边的提示信息
    hideNameCss: function() {
        $("#noNameMessage").hide();
        $("#yesNameMessage").hide();
    },
    //隐藏显示在用户密码栏旁边的提示信息
    hidePasswordCss: function() {
        $("#noPasswordMessage").hide();
        $("#yesPasswordMessage").hide();
    },

    //验证用户邮箱是否可用
    checkEmailIsValid: function() {
        var userEmail = $.trim($("#userEmail").val());
        var reg = /^([.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
        if (!userEmail) {
            $("#noEmailMessage").html("请输入邮箱").show(300);
            return true;
        }
        if (!reg.test(userEmail)) {
            $("#noEmailMessage").html("邮箱格式不正确").show(300);
            return true;
        }
        $.get(registerJS.URL.isEmailExist(), {"userEmail":userEmail},
        function(result) {
            if (result && result['success']) {
                $("#noEmailMessage").html("邮箱已经注册").show(300);
            } else {
                $("#yesEmailMessage").html("邮箱可以使用").show(300);
            }
        });
    },

    //验证用户昵称是否可用
    checkNameIsValid: function() {
        var userName = $.trim($("#userName").val());
        if (!userName) {
            $("#noNameMessage").html("请输入昵称").show(300);
            return true;
        }
        if (userName.length < 3) {
            $("#noNameMessage").html("昵称长度应在3-8之间").show(300);
            return true;
        }
        if (userName.length > 8) {
            $("#noNameMessage").html("昵称长度应在3-8之间").show(300);
            return true;
        }
        $.get(registerJS.URL.isNameExist(), {"userName":userName},
        function(result) {
            if (result && result['success']) {
                $("#noNameMessage").html("昵称已经存在").show(300);
            } else {
                $("#yesNameMessage").html("昵称可以使用").show(300);
            }
        });
    },

    //验证用户密码是否合法
    checkPasswordIsValid: function() {
        var userPassword = $.trim($("#userPassword").val());
        if (!userPassword) {
            $("#noPasswordMessage").html("请输入密码").show(300);
        } else if (userPassword.length < 6) {
            $("#noPasswordMessage").html("密码长度应在6-15之间").show(300);
        } else if (userPassword.length > 15) {
            $("#noPasswordMessage").html("密码长度应在6-15之间").show(300);
        } else {
            $("#yesPasswordMessage").html("密码可以使用").show(300);
        }
    },

    //验证用户全部注册信息是否合法
    checkRegister: function() {
        var userEmail = $.trim($("#userEmail").val());
        var reg = /^([.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
        var userName = $.trim($("#userName").val());
        var userPassword = $.trim($("#userPassword").val());
        if (!userEmail) {
            $("#noEmailMessage").html("请输入邮箱").show(300);
            return true;
        }
        if (!reg.test(userEmail)) {
            $("#noEmailMessage").html("邮箱格式不正确").show(300);
            return true;
        }
        if (!userName) {
            $("#noNameMessage").html("请输入昵称").show(300);
            return true;
        }
        if (userName.length < 3) {
            $("#noNameMessage").html("昵称长度应在3-8之间").show(300);
            return true;
        }
        if (userName.length > 8) {
            $("#noNameMessage").html("昵称长度应在3-8之间").show(300);
            return true;
        }
        if (!userPassword) {
            $("#noPasswordMessage").html("请输入密码").show(300);
            return true;
        } else if (userPassword.length < 6) {
            $("#noPasswordMessage").html("密码长度应在6-15之间").show(300);
            return true;
        } else if (userPassword.length > 15) {
            $("#noPasswordMessage").html("密码长度应在6-15之间").show(300);
            return true;
        } else {
            $("#yesPasswordMessage").html("密码可以使用").show(300);
        }
        $.post(registerJS.URL.newUser(), {"userEmail":userEmail, "userName":userName, "userPassword":userPassword},
        function(result) {
            if (result && result['success']) {
                location.href = registerJS.URL.registerSuccess();
            } else {
                if ((result['error']).indexOf("邮箱") >= 0) {
                    $("#noEmailMessage").html(result['error']).show(300);
                    return true;
                } else {
                    $("#noNameMessage").html(result['error']).show(300);
                    return true;
                }
            }
        })
    }
}
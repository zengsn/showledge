window.onload = function() {
	$("#basic-setting").addClass("active");
	$("#account-management").removeClass("active");
};

//javascript 模块化
var settingJS = {
    // 封装相关ajax的url
    URL: {
        updateBasicSetting: function(path) {
            return path + '/settings/updateBasicSetting';
        },
        uploadHeadImage: function(path) {
            return path + '/settings/uploadHeadImage';
        },
        updateIntroduce: function(path) {
            return path + '/settings/updateIntroduce';
        },
        updatePassword: function(path) {
            return path + '/settings/updatePassword';
        }
    },

    // 预览上传的头像
    preview: function(file) {
        var prevDiv = document.getElementById('preview');
        if (file.files && file.files[0]) {
            var reader = new FileReader();
            reader.onload = function(evt) {
                prevDiv.innerHTML = '<img src="' + evt.target.result + '" />';
            }
            reader.readAsDataURL(file.files[0]);
        } else {
            prevDiv.innerHTML = '<div class="img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';
        }
    },

    // 去除所有标签的活动标记
    removeclass: function() {
        $("#basic").removeClass("active");
        $("#profile").removeClass("active");
        $("#sns").removeClass("active");
        $("#pass").removeClass("active");
        $("#blacklist").removeClass("active");
        $("#reward").removeClass("active");
        $("#destroy").removeClass("active");
    },

    // 显示基础设置页面
    onclick_div1: function() {
        settingJS.removeclass();
        $("#basic").addClass("active");
        $("#settings-basic-button").removeAttr("data-loading");
    },
    // 显示个人资料页面
    onclick_div2: function() {
        settingJS.removeclass();
        $("#profile").addClass("active");
        $("#settings-basic-button").removeAttr("data-loading");
    },
    // 显示修改密码页面
    onclick_div3: function() {
        settingJS.removeclass();
        $("#pass").addClass("active");
        $("#settings-basic-button").removeAttr("data-loading");
    },
    // 显示打赏设置页面
    onclick_div4: function() {
        settingJS.removeclass();
        $("#reward").addClass("active");
        $("#settings-basic-button").removeAttr("data-loading");
    },
    // 显示账号管理页面
    onclick_div5: function() {
        settingJS.removeclass();
        $("#destroy").addClass("active");
        $("#settings-basic-button").removeAttr("data-loading");
    },

    // 去除名字修改错误提示
    clearNameCss: function() {
        $("#noNameMessage").hide();
    },
    // 去除邮箱修改错误提示
    clearEmailCss: function() {
        $("#noEmailMessage").hide();
    },
    // 去除旧密码输入错误提示
    clearOldPasswordCss: function() {
        $("#noOldPasswordMessage").hide();
    },
    // 去除新密码输入错误提示
    clearNewPasswordCss: function() {
        $("#noNewPasswordMessage").hide();
        $("#yesNewPasswordMessage").hide();
    },
    // 去除确认密码输入错误提示
    clearConfirmPasswordCss: function() {
        $("#noConfirmPasswordMessage").hide();
    },

    // 保存用户昵称和用户邮箱
    updateBasicSetting: function(path) {
        var userName = $.trim($("#userName").val());
        var userEmail = $.trim($("#userEmail").val());
        var reg = /^([.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
        $("#noNameMessage").hide();
        $("#noEmailMessage").hide();
        if (!userName || userName == '') {
            $("#noNameMessage").html("昵称不能为空").show(300);
            return false;
        }
        if (!userEmail || userEmail == '') {
            $("#noEmailMessage").html("请输入邮箱").show(300);
            return false;
        }
        if (userName.length < 3) {
            $("#noNameMessage").html("昵称长度应在3-8之间").show(300);
            return false;
        }
        if (userName.length > 8) {
            $("#noNameMessage").html("昵称长度应在3-8之间").show(300);
            return false;
        }
        if (!reg.test(userEmail)) {
            $("#noEmailMessage").html("邮箱格式不正确").show(300);
            return false;
        }
        $.post(settingJS.URL.updateBasicSetting(path), {
            "userName": userName,
            "userEmail": userEmail
        },
        function(result) {
            if (result && result['success']) {
                alert("保存成功");
            } else {
                if (result['error'].indexOf("昵称") >= 0) {
                    $("#noNameMessage").html(result['error']).show(300);
                }
                if (result['error'].indexOf("邮箱") >= 0) {
                    $("#noEmailMessage").html(result['error']).show(300);
                }
            }
            $("#settings-basic-button").removeAttr("data-loading");
        })
    },

    //保存头像和个人介绍
    updateProfile: function(path) {
        var personalForm = new FormData($("#personal-form")[0]);
        var userIntroduce = $.trim($("#userIntroduce").val());
        $.ajax({
			type : "POST", // http请求方式
			url : settingJS.URL.uploadHeadImage(path), // 发送给服务器的url
			data : personalForm, // 发送给服务器的参数
			async : false,
			cache : false,
			contentType : false,
			processData : false,
			success : function() {
				$.post(settingJS.URL.updateIntroduce(path), {
		            "userIntroduce": userIntroduce
		        },
		        function(result) {
		            if (result && result['success']) {
		                alert("保存成功");
		            } else {
		                alert("保存失败,请刷新页面后重试！");
		            }
		        })
			},
			error : function() {
	            alert("上传头像失败,请刷新页面后重试！");
			},
		});
        $("#settings-basic-button").removeAttr("data-loading");
    },

    //保存用户密码
    updatePassword: function(path) {
        var oldPassword = $.trim($("#oldPassword").val());
        var newPassword = $.trim($("#newPassword").val());
        var confirmPassword = $.trim($("#confirmPassword").val());
        $("#noOldPasswordMessage").hide();
        $("#noNewPasswordMessage").hide();
        $("#yesNewPasswordMessage").hide();
        $("#noConfirmPasswordMessage").hide();
        if (!oldPassword || oldPassword == '') {
            $("#noOldPasswordMessage").html("请输入旧密码").show(300);
            return true;
        }
        if (!newPassword || newPassword == '') {
            $("#noNewPasswordMessage").html("请输入新密码").show(300);
            return true;
        }
        if (newPassword.length < 6) {
            $("#noNewPasswordMessage").html("新密码长度应在6-15之间").show(300);
            return true;
        }
        if (newPassword.length > 15) {
            $("#noNewPasswordMessage").html("新密码长度应在6-15之间").show(300);
            return true;
        }
        if (newPassword !== confirmPassword) {
            $("#noConfirmPasswordMessage").html("两次输入的密码不一致").show(300);
            return true;
        }
        $.post(settingJS.URL.updatePassword(path), {
            "oldPassword": oldPassword,
            "newPassword": newPassword
        },
        function(result) {
            if (result && result['success']) {
                $("#yesNewPasswordMessage").html("密码修改成功").show(300);
                $("input").val('');
            } else {
                $("#noOldPasswordMessage").html("旧密码错误").show(300);
            }
            $("#settings-basic-button").removeAttr("data-loading");
        })
    }
}
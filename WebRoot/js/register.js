var isNameValid = false;
var isEmailValid = false;
var isPasswordValid = false;
function checkNameIsValid() {
	var userName = $.trim($("#userName").val());
	$("#register-btn").attr("disabled", true);
	if (!userName) {
		$("#noNameMessage").css("display", "inline-block");
		$("#noNameMessage").html("请输入昵称");
		return true;
	}
	if (userName.length < 3) {
		$("#noNameMessage").css("display", "inline-block");
		$("#noNameMessage").html("昵称长度应在3-8之间");
		return true;
	}
	if (userName.length > 8) {
		$("#noNameMessage").css("display", "inline-block");
		$("#noNameMessage").html("昵称长度应在3-8之间");
		return true;
	}
	$.ajax({
		type : "POST", // http请求方式
		url : "http://localhost:8080/learned/isNameExist.do", // 发送给服务器的url
		data : "userName=" + userName, // 发送给服务器的参数
		dataType : "json", // 告诉JQUERY返回的数据格式(注意此处数据格式一定要与提交的controller返回的数据格式一致,不然不会调用回调函数complete)
		complete : function(msg) {
			var result = eval("(" + msg.responseText + ")");
			if (result.success) {
				$("#noNameMessage").css("display", "inline-block");
				$("#noNameMessage").html("昵称已经存在");
			} else {
				$("#yesNameMessage").css("display", "inline-block");
				$("#yesNameMessage").html("昵称可以使用");
				isNameValid = true;
				if (isNameValid && isEmailValid && isPasswordValid) {
					$("#register-btn").attr("disabled", false);
				}
			}
		},
	});
}
function clearNameCss() {
	$("#register-btn").attr("disabled", true);
	$("#noNameMessage").css("display", "none");
	$("#yesNameMessage").css("display", "none");
}
function checkEmailIsValid() {
	var userEmail = $.trim($("#userEmail").val());
	var reg = /^([.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
	$("#register-btn").attr("disabled", true);
	if (!userEmail) {
		$("#noEmailMessage").css("display", "inline-block");
		$("#noEmailMessage").html("请输入邮箱");
		return true;
	}
	if (!reg.test(userEmail)) {
		$("#noEmailMessage").css("display", "inline-block");
		$("#noEmailMessage").html("邮箱格式不正确");
		return true;
	}
	$.ajax({
		type : "POST", // http请求方式
		url : "http://localhost:8080/learned/isEmailExist.do", // 发送给服务器的url
		data : "userEmail=" + userEmail, // 发送给服务器的参数
		dataType : "json", // 告诉JQUERY返回的数据格式(注意此处数据格式一定要与提交的controller返回的数据格式一致,不然不会调用回调函数complete)
		complete : function(msg) {
			var result = eval("(" + msg.responseText + ")");
			if (result.success) {
				$("#noEmailMessage").css("display", "inline-block");
				$("#noEmailMessage").html("邮箱已经注册");
			} else {
				$("#yesEmailMessage").css("display", "inline-block");
				$("#yesEmailMessage").html("邮箱可以使用");
				isEmailValid = true;
				if (isNameValid && isEmailValid && isPasswordValid) {
					$("#register-btn").attr("disabled", false);
				}
			}
		},
	});
}
function clearEmailCss() {
	$("#register-btn").attr("disabled", true);
	$("#noEmailMessage").css("display", "none");
	$("#yesEmailMessage").css("display", "none");
}
function checkPasswordIsValid() {
	var userPassword = $.trim($("#userPassword").val());
	$("#register-btn").attr("disabled", true);
	if (!userPassword) {
		$("#noPasswordMessage").css("display", "inline-block");
		$("#noPasswordMessage").html("请输入密码");
	} else if (userPassword.length < 6) {
		$("#noPasswordMessage").css("display", "inline-block");
		$("#noPasswordMessage").html("密码长度应在6-15之间");
	} else if (userPassword.length > 15) {
		$("#noPasswordMessage").css("display", "inline-block");
		$("#noPasswordMessage").html("密码长度应在6-15之间");
	} else {
		$("#yesPasswordMessage").css("display", "inline-block");
		$("#yesPasswordMessage").html("密码可以使用");
		isPasswordValid = true;
		if (isNameValid && isEmailValid && isPasswordValid) {
			$("#register-btn").attr("disabled", false);
		}
	}
}
function clearPasswordCss() {
	$("#register-btn").attr("disabled", true);
	$("#noPasswordMessage").css("display", "none");
	$("#yesPasswordMessage").css("display", "none");
}
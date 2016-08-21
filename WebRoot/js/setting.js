function preview(file) {
	var prevDiv = document.getElementById('preview');
	if (file.files && file.files[0]) {
		var reader = new FileReader();
		reader.onload = function(evt) {
			prevDiv.innerHTML = '<img src="' + evt.target.result + '" />';
		}
		reader.readAsDataURL(file.files[0]);
	} else {
		prevDiv.innerHTML = '<div class="img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\''
				+ file.value + '\'"></div>';
	}
}
function removeclass() {
	$("#basic").removeClass("active");
	$("#profile").removeClass("active");
	$("#sns").removeClass("active");
	$("#pass").removeClass("active");
	$("#blacklist").removeClass("active");
	$("#reward").removeClass("active");
	$("#destroy").removeClass("active");
}
function onclick_div1() {
	removeclass();
	$("#basic").addClass("active");
}
function onclick_div2() {
	removeclass();
	$("#profile").addClass("active");
}
function onclick_div3() {
	removeclass();
	$("#sns").addClass("active");
}
function onclick_div4() {
	removeclass();
	$("#pass").addClass("active");
}
function onclick_div5() {
	removeclass();
	$("#blacklist").addClass("active");
}
function onclick_div6() {
	removeclass();
	$("#reward").addClass("active");
}
function onclick_div7() {
	removeclass();
	$("#destroy").addClass("active");
}
function clearNameCss() {
	$("#noNameMessage").css("display", "none");
}
function clearEmailCss() {
	$("#noEmailMessage").css("display", "none");
}
function clearOldPasswordCss() {
	$("#noOldPasswordMessage").css("display", "none");
}
function clearNewPasswordCss() {
	$("#noNewPasswordMessage").css("display", "none");
	$("#yesNewPasswordMessage").css("display", "none");
}
function clearConfirmPasswordCss() {
	$("#noConfirmPasswordMessage").css("display", "none");
}
$(function() {
	$("#personal-button").click(function() {
		var personalForm = new FormData($("#personal-form")[0]);
		$.ajax({
			type : "POST", // http请求方式
			url : "http://localhost:8080/learned/uploadHeadImage.do", // 发送给服务器的url
			data : personalForm, // 发送给服务器的参数
			async : false,
			cache : false,
			contentType : false,
			processData : false,
		});
		updateIntroduce();
		alert("保存成功");
	})
});
function updateIntroduce() {
	var userIntroduce = $.trim($("#userIntroduce").val());
	$.ajax({
		type : "POST", // http请求方式
		url : "http://localhost:8080/learned/updateIntroduce.do", // 发送给服务器的url
		data : "userIntroduce=" + userIntroduce, // 发送给服务器的参数
	});
}
$(function() {
	$("#settings-basic-button").click(function() {
		var userName = $.trim($("#userName").val());
		var userEmail = $.trim($("#userEmail").val());
		var reg = /^([.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
		$("#noNameMessage").css("display", "none");
		$("#noEmailMessage").css("display", "none");
		if (!userName) {
			$("#noNameMessage").css("display", "inline-block");
			$("#noNameMessage").html("昵称不能为空");
			return true;
		}
		if (!userEmail) {
			$("#noEmailMessage").css("display", "inline-block");
			$("#noEmailMessage").html("请输入邮箱");
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
		if (!reg.test(userEmail)) {
			$("#noEmailMessage").css("display", "inline-block");
			$("#noEmailMessage").html("邮箱格式不正确");
			return true;
		}
		$.ajax({
			type : "POST", // http请求方式
			url : "http://localhost:8080/learned/updateBasicSetting.do", // 发送给服务器的url
			data : $("#settings-basic").serialize(), // 发送给服务器的参数
			dataType : "json", // 告诉JQUERY返回的数据格式(注意此处数据格式一定要与提交的controller返回的数据格式一致,不然不会调用回调函数complete)
			complete : function(msg) {
				var result = eval("(" + msg.responseText + ")");
				if (result.success) {
					alert("保存成功");
					return true;
				} else {
					if (result.message.indexOf("昵称") >= 0) {
						$("#noNameMessage").css("display", "inline-block");
						$("#noNameMessage").html(result.message);
						return true;
					}
					if (result.message.indexOf("邮箱") >= 0) {
						$("#noEmailMessage").css("display", "inline-block");
						$("#noEmailMessage").html(result.message);
						return true;
					}
				}
			},
		});
	})
});
$(function() {
	$("#settings-pass-button").click(function() {
		var oldPassword = $.trim($("#oldPassword").val());
		var newPassword = $.trim($("#newPassword").val());
		var confirmPassword = $.trim($("#confirmPassword").val());
		$("#noOldPasswordMessage").css("display", "none");
		$("#noNewPasswordMessage").css("display", "none");
		$("#yesNewPasswordMessage").css("display", "none");
		$("#noConfirmPasswordMessage").css("display", "none");
		if (!oldPassword) {
			$("#noOldPasswordMessage").css("display", "inline-block");
			$("#noOldPasswordMessage").html("请输入旧密码");
			return true;
		}
		if (!newPassword) {
			$("#noNewPasswordMessage").css("display", "inline-block");
			$("#noNewPasswordMessage").html("请输入新密码");
			return true;
		}
		if (newPassword.length < 6) {
			$("#noNewPasswordMessage").css("display", "inline-block");
			$("#noNewPasswordMessage").html("新密码长度应在6-15之间");
			return true;
		}
		if (newPassword.length > 15) {
			$("#noNewPasswordMessage").css("display", "inline-block");
			$("#noNewPasswordMessage").html("新密码长度应在6-15之间");
			return true;
		}
		if (newPassword !== confirmPassword) {
			$("#noConfirmPasswordMessage").css("display", "inline-block");
			$("#noConfirmPasswordMessage").html("两次输入的密码不一致");
			return true;
		}
		$.ajax({
			type : "POST", // http请求方式
			url : "http://localhost:8080/learned/updatePassword.do", // 发送给服务器的url
			data : $("#settings-pass").serialize(), // 发送给服务器的参数
			dataType : "json", // 告诉JQUERY返回的数据格式(注意此处数据格式一定要与提交的controller返回的数据格式一致,不然不会调用回调函数complete)
			complete : function(msg) {
				var result = eval("(" + msg.responseText + ")");
				if (result.success) {
					$("#yesNewPasswordMessage").css("display", "inline-block");
					$("#yesNewPasswordMessage").html("密码修改成功");
					$("input").val('');
					return true;
				} else {
					$("#noOldPasswordMessage").css("display", "inline-block");
					$("#noOldPasswordMessage").html("旧密码错误");
					return true;
				}
			},
		});
	})
});
window.onload = function() {
	$("#basic-setting").addClass("active");
	$("#account-management").removeClass("active");
};

//javascript 模块化
var settingJS = {
    // 封装相关ajax的url
    URL: {
        updateBasicSetting: function(path) {
            return path + '/settings/updateBasicSetting.do';
        },
        uploadHeadImage: function(path) {
            return path + '/settings/uploadHeadImage.do';
        },
        updateIntroduce: function(path) {
            return path + '/settings/updateIntroduce.do';
        },
        updatePassword: function(path) {
            return path + '/settings/updatePassword.do';
        }
    },

    // 预览上传的头像
    preview: function(file, userImagePath) {
        var prevDiv = document.getElementById('preview');
        if (file.files && file.files[0]) {
            var reader = new FileReader();
            reader.onload = function(evt) {
                prevDiv.innerHTML = '<img id="current-avatar" src="' + evt.target.result + '" />';
            }
            reader.readAsDataURL(file.files[0]);
        } else {
            prevDiv.innerHTML = '<img id="current-avatar" src=" ' + userImagePath + ' " alt="您还没有上传头像~" />';
        }
    },
    
    updateBSetting:function(){
    	
    },
    
    // 保存头像和用户昵称
    updateBasicSetting: function(path) {
        var personalForm = new FormData($("#personal-form")[0]);
        var userName = $.trim($("#userName").text());
        var userPhone = $.trim($("#userPhone").val());
        /*if (!userName || userName == '') {
        	$('.alert').removeClass('alert-success');
			$('.alert').addClass('alert-danger');
			$('.alert').text('昵称不能为空');
			$('.alert').slideDown();
			var Timer = setTimeout(function(){
			    $('.alert').slideUp();
			}, 2000);
            return false;
        }
        if (userName.length < 3) {
        	$('.alert').removeClass('alert-success');
			$('.alert').addClass('alert-danger');
			$('.alert').text('昵称长度应在3-8之间');
			$('.alert').slideDown();
			var Timer = setTimeout(function(){
			    $('.alert').slideUp();
			}, 2000);
            return false;
        }
        if (userName.length > 8) {
        	$('.alert').removeClass('alert-success');
			$('.alert').addClass('alert-danger');
			$('.alert').text('昵称长度应在3-8之间');
			$('.alert').slideDown();
			var Timer = setTimeout(function(){
			    $('.alert').slideUp();
			}, 2000);
            return false;
        }*/
        if (userPhone.length != 11) {
        	$('.alert').removeClass('alert-success');
			$('.alert').addClass('alert-danger');
			$('.alert').text('手机号长度有误');
			$('.alert').slideDown();
			var Timer = setTimeout(function(){
			    $('.alert').slideUp();
			}, 2000);
            return false;
        }
        $.ajax({
			type : "POST", // http请求方式
			url : settingJS.URL.uploadHeadImage(path), // 发送给服务器的url
			data : personalForm, // 发送给服务器的参数
			async : false,
			cache : false,
			contentType : false,
			processData : false,
			success : function() {
				$.post(settingJS.URL.updateBasicSetting(path), {
					"userName": userName,
					"userPhone": userPhone
		        },
		        function(result) {
		            if (result && result['success']) {
		            	$('.alert').removeClass('alert-danger');
		    			$('.alert').addClass('alert-success');
		    			$('.alert').text('保存成功');
		            } else {
		            	$('.alert').removeClass('alert-success');
		    			$('.alert').addClass('alert-danger');
		    			$('.alert').text('保存失败,请刷新页面后重试！');
		            }
		            
		            $('.alert').slideDown();
		    		var Timer = setTimeout(function(){
		    		    $('.alert').slideUp();
		    		    window.location.reload();		    		    
		    		}, 2000);
		        })
			},
			error : function() {
				$('.alert').removeClass('alert-success');
    			$('.alert').addClass('alert-danger');
    			$('.alert').text('上传头像失败,请刷新页面后重试！');
			},
		});
    },
    
    // 保存个人简介和个人网站
    updatePersonalData: function(path) {
    	//
        var userIntroduce = $.trim($("#userIntroduce").val());
        var userWeb = $.trim($("#userWeb").val());
        var userSex = $.trim($("#radio2").find("input:checked").eq(0).val());
        var userLocation = $.trim($("#location").val());
        var userYuanXiao = $.trim($("#yuanxiao").val());
        
        $.post(settingJS.URL.updateIntroduce(path), {
        	introduction: userIntroduce,
            site: userWeb,
            sex:userSex,
            location:userLocation,
            academy:userYuanXiao
        },
        function(result) {
            if (result && result['success']) {
            	$('.alert').removeClass('alert-danger');
    			$('.alert').addClass('alert-success');
    			$('.alert').text('保存成功');
            } else {
            	$('.alert').removeClass('alert-success');
    			$('.alert').addClass('alert-danger');
    			$('.alert').text('保存失败,请刷新页面后重试！');
            }
        });
        $('.alert').slideDown();
		var Timer = setTimeout(function(){
		    $('.alert').slideUp();
		}, 2000);
    },

    //保存用户密码
    updatePassword: function(path) {
        var oldPassword = $.trim($("#oldPassword").val());
        var newPassword = $.trim($("#newPassword").val());
        var confirmPassword = $.trim($("#confirmPassword").val());
        if (!oldPassword || oldPassword == '') {
            $('.alert').removeClass('alert-success');
			$('.alert').addClass('alert-danger');
			$('.alert').text('请输入原密码');
			$('.alert').slideDown();
			var Timer = setTimeout(function(){
			    $('.alert').slideUp();
			}, 2000);
            return true;
        }
        if (!newPassword || newPassword == '') {
        	$('.alert').removeClass('alert-success');
			$('.alert').addClass('alert-danger');
			$('.alert').text('请输入新密码');
			$('.alert').slideDown();
			var Timer = setTimeout(function(){
			    $('.alert').slideUp();
			}, 2000);
            return true;
        }
        if (newPassword.length < 6) {
        	$('.alert').removeClass('alert-success');
			$('.alert').addClass('alert-danger');
			$('.alert').text('新密码长度应在6-15之间');
			$('.alert').slideDown();
			var Timer = setTimeout(function(){
			    $('.alert').slideUp();
			}, 2000);
            return true;
        }
        if (newPassword.length > 15) {
        	$('.alert').removeClass('alert-success');
			$('.alert').addClass('alert-danger');
			$('.alert').text('新密码长度应在6-15之间');
			$('.alert').slideDown();
			var Timer = setTimeout(function(){
			    $('.alert').slideUp();
			}, 2000);
            return true;
        }
        if (newPassword !== confirmPassword) {
        	$('.alert').removeClass('alert-success');
			$('.alert').addClass('alert-danger');
			$('.alert').text('两次输入的密码不一致');
			$('.alert').slideDown();
			var Timer = setTimeout(function(){
			    $('.alert').slideUp();
			}, 2000);
            return true;
        }
        $.post(settingJS.URL.updatePassword(path), {
            "oldPassword": oldPassword,
            "newPassword": newPassword
        },
        function(result) {
            if (result && result['success']) {
            	$('.alert').removeClass('alert-danger');
    			$('.alert').addClass('alert-success');
    			$('.alert').text('密码修改成功');
                $("input").val('');
            } else {
            	$('.alert').removeClass('alert-success');
    			$('.alert').addClass('alert-danger');
    			$('.alert').text('原密码错误');
            }
            $('.alert').slideDown();
    		var Timer = setTimeout(function(){
    		    $('.alert').slideUp();
    		}, 2000);
        });
    }
}
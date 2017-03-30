//javascript 模块化
var corpusSettingJS = {
	URL: {
		uploadHeadImage: function(path,corpusId) {
            return path + '/corpus/uploadHeadImage/' + corpusId;
        },
        updateCorpusSetting: function(path) {
            return path + '/corpus/updateCorpusSetting';
        }
	},
	
	// 预览上传的头像
    preview: function(file, corpusImagePath) {
        var prevDiv = document.getElementById('preview');
        if (file.files && file.files[0]) {
            var reader = new FileReader();
            reader.onload = function(evt) {
                prevDiv.innerHTML = '<img id="current-avatar" src="' + evt.target.result + '" />';
            }
            reader.readAsDataURL(file.files[0]);
        } else {
            prevDiv.innerHTML = '<img id="current-avatar" src=" ' + corpusImagePath + ' " alt="您还没有上传封面图片~" />';
        }
    },
    
    // 保存文集设置
    updateCorpusSetting: function(corpusId,path) {
        var personalForm = new FormData($("#personal-form")[0]);
        var corpusName = $.trim($("#corpus-name").val());
        var corpusDiscribe = $.trim($("#corpus-discribe").val());
        if (!corpusName || corpusName == '') {
        	$('.alert').removeClass('alert-success');
			$('.alert').addClass('alert-danger');
			$('.alert').text('名称不能为空');
			$('.alert').slideDown();
			var Timer = setTimeout(function(){
			    $('.alert').slideUp();
			}, 2000);
            return false;
        }
        if (corpusName.length > 20) {
        	$('.alert').removeClass('alert-success');
			$('.alert').addClass('alert-danger');
			$('.alert').text('名称长度应小于20');
			$('.alert').slideDown();
			var Timer = setTimeout(function(){
			    $('.alert').slideUp();
			}, 2000);
            return false;
        }
        $.ajax({
			type : "POST", // http请求方式
			url : corpusSettingJS.URL.uploadHeadImage(path,corpusId), // 发送给服务器的url
			data : personalForm, // 发送给服务器的参数
			async : false,
			cache : false,
			contentType : false,
			processData : false,
			success : function() {
				$.post(corpusSettingJS.URL.updateCorpusSetting(path), {
					"corpusId": corpusId,
					"corpusName": corpusName,
					"corpusDiscribe": corpusDiscribe
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
		        })
			},
			error : function() {
				$('.alert').removeClass('alert-success');
    			$('.alert').addClass('alert-danger');
    			$('.alert').text('上传封面图片失败,请刷新页面后重试！');
			},
		});
        $('.alert').slideDown();
		var Timer = setTimeout(function(){
		    $('.alert').slideUp();
		}, 2000);
    },
}
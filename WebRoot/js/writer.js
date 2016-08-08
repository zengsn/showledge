$(function() {
	$("#note-button").click(function() {
		$.ajax({
			type : "POST", // http请求方式
			url : "http://localhost:8080/learned/createEssay.do", // 发送给服务器的url
			data : $("#note-form").serialize(), // 发送给服务器的参数
			dataType : "json", // 告诉JQUERY返回的数据格式(注意此处数据格式一定要与提交的controller返回的数据格式一致,不然不会调用回调函数complete)
			complete : function(msg) {
				var result = eval("(" + msg.responseText + ")");
				if (result.success) {
					location.href = "index.html"; // location.href实现客户端页面的跳转
				} else {
					alert("发布失败");
				}
			},
			error : function() {
				alert("发布失败,请检查网络连接");
			},
		});
	})
});
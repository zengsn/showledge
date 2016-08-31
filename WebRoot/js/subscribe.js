function addFocusAtUsers(focusUserId, path) {
	$.ajax({
		type : "POST", // http请求方式
		url : "http://localhost:8080/learned/addFocus.do", // 发送给服务器的url
		data : "focusUserId=" + focusUserId, // 发送给服务器的参数
		dataType : "json", // 告诉JQUERY返回的数据格式(注意此处数据格式一定要与提交的controller返回的数据格式一致,不然不会调用回调函数complete)
		complete : function(msg) {
			var result = eval("(" + msg.responseText + ")");
			if (result.success) {
				$("#focus_at_users").attr("class","btn btn-small follow following");
				$("#focus_at_users_a").attr("onclick","removeFocusAtUsers(" + focusUserId + ");");
				$("#focus_at_users_i").attr("class","fa fa-check");
				$("#focus_at_users_ul").attr("class","btn btn-small btn-list");
			} else {
				location.href = path + "/login";
			}
		},
	});
}
function removeFocusAtUsers(focusUserId) {
	$.ajax({
		type : "POST", // http请求方式
		url : "http://localhost:8080/learned/removeFocus.do", // 发送给服务器的url
		data : "focusUserId=" + focusUserId, // 发送给服务器的参数
		dataType : "json", // 告诉JQUERY返回的数据格式(注意此处数据格式一定要与提交的controller返回的数据格式一致,不然不会调用回调函数complete)
		complete : function(msg) {
			var result = eval("(" + msg.responseText + ")");
			if (result.success) {
				$("#focus_at_users").attr("class","btn btn-small btn-success follow");
				$("#focus_at_users_a").attr("onclick","addFocusAtUsers(" + focusUserId + ");");
				$("#focus_at_users_i").attr("class","fa fa-plus");
				$("#focus_at_users_ul").attr("class","btn btn-small btn-list btn-success");
			}
		},
	});
}
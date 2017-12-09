//javascript 模块化
var adminJS = {
	URL: {
		getUserDetail: function(path) {
            return path + '/admin/getUserDetail';
        },
	},
	
	getUserDetail: function(userId, path) {
		$.get(adminJS.URL.getUserDetail(path), {
	        "userId": userId
	    },
	    function(result) {
	        if (result && result['success']) {
	          	var user = result['data'];
	          	$("#user-name").val(user.userName);
	          	$("#user-password").val(user.userPassword);
	          	$("#user-email").val(user.userEmail);
	          	$("#user-phone").val(user.userPhone);
	        } else {
	        	location.href = path + "/login";
	        }
	    })
	},
}
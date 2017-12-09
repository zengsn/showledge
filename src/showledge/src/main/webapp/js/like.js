//javascript 模块化
var likeJS = {
	URL: {
		addFocusUser: function(path) {
            return path + '/user/addFocusUser';
        },
        removeFocusUser: function(path) {
            return path + '/user/removeFocusUser';
        },
        addFocusCorpus: function(path) {
            return path + '/corpus/addFocusCorpus';
        },
        removeFocusCorpus: function(path) {
            return path + '/corpus/removeFocusCorpus';
        }
	},
	
	focusUser: function(focusUserId,path) {
		var focusButtonId = "#focus-user-button-" + focusUserId;
		if ($(focusButtonId).attr("class") == "btn not-watch not-watch-idol btn-danger") {
			$.post(likeJS.URL.removeFocusUser(path), {
	            "focusUserId": focusUserId
	        },
	        function(result) {
	            if (result && result['success']) {
	            	$(focusButtonId).html("<span class='glyphicon glyphicon-plus'></span> 关注");
	    			$(focusButtonId).removeClass("btn-danger");
	    			$(focusButtonId).addClass("btn-success");
	            } else {
	                location.href = path + "/login";
	            }
	        })
		} else if ($(focusButtonId).attr("class") == "btn not-watch not-watch-idol btn-success") {
			$.post(likeJS.URL.addFocusUser(path), {
	            "focusUserId": focusUserId
	        },
	        function(result) {
	            if (result && result['success']) {
	            	$(focusButtonId).html("取消关注");
	    			$(focusButtonId).removeClass("btn-success");
	    			$(focusButtonId).addClass("btn-danger");		
	            } else {
	                location.href = path + "/login";
	            }
	        })
		}
	},
	
	focusCorpus: function(focusCorpusId,path) {
		var focusButtonId = "#focus-corpus-button-" + focusCorpusId;
		if ($(focusButtonId).attr("class") == "btn not-watch not-watch-album btn-danger") {
			$.post(likeJS.URL.removeFocusCorpus(path), {
	            "focusCorpusId": focusCorpusId
	        },
	        function(result) {
	            if (result && result['success']) {
	            	$(focusButtonId).html("<span class='glyphicon glyphicon-plus'></span> 关注");
	    			$(focusButtonId).removeClass("btn-danger");
	    			$(focusButtonId).addClass("btn-success");
	            } else {
	                location.href = path + "/login";
	            }
	        })
		} else if ($(focusButtonId).attr("class") == "btn not-watch not-watch-album btn-success") {
			$.post(likeJS.URL.addFocusCorpus(path), {
	            "focusCorpusId": focusCorpusId
	        },
	        function(result) {
	            if (result && result['success']) {
	            	$(focusButtonId).html("取消关注");
	    			$(focusButtonId).removeClass("btn-success");
	    			$(focusButtonId).addClass("btn-danger");		
	            } else {
	                location.href = path + "/login";
	            }
	        })
		}
	}
}
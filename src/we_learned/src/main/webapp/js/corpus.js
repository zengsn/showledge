//javascript 模块化
var corpusJS = {
	URL: {
		addFocusCorpus: function(path) {
            return path + '/corpus/addFocusCorpus';
        },
        removeFocusCorpus: function(path) {
            return path + '/corpus/removeFocusCorpus';
        }
	},
	
	toEditCorpus: function(corpusId,path) {
		location.href = path + "/corpus/" + corpusId + "/settings";
	},
	
	addFocusCorpus: function(corpusId,path) {
		$.post(corpusJS.URL.addFocusCorpus(path), {
	        "corpusId": corpusId
	    },
	    function(result) {
	        if (result && result['success']) {
	          	$("#follow-btn").html("");
	           	$("#follow-btn").html("<span id='focus-mess'> 已关注</span>");
	           	$("#follow-btn").removeAttr("class");
	   			$("#follow-btn").attr("class","focus");
	   			$("#follow-btn").removeAttr("onclick");
	   			$("#follow-btn").attr("onclick","corpusJS.removeFocusCorpus('" + corpusId + "','" + path + "')");
	        } else {
	        	location.href = path + "/login";
	        }
	    })
	},
	
	removeFocusCorpus: function(corpusId,path) {
		$.post(corpusJS.URL.removeFocusCorpus(path), {
	        "corpusId": corpusId
	    },
	    function(result) {
	        if (result && result['success']) {
	        	$("#follow-btn").html("");
	           	$("#follow-btn").html("<span class='glyphicon glyphicon-plus'></span> <span id='focus-mess'>关注</span>");
	    		$("#follow-btn").removeAttr("class");
	    		$("#follow-btn").attr("class","no-focus");
	    		$("#follow-btn").removeAttr("onclick");
	    		$("#follow-btn").attr("onclick","corpusJS.addfocusCorpus('" + corpusId + "','" + path + "')");
	        } else {
	            location.href = path + "/login";
	        }
	    })
	}
}
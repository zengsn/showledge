$(document).ready(function($) {
	//  “喜欢”按钮
	$("#like-btn").click(function(event) {
		var kmapId = $("#kmap-id").val();
		var path = $("#path").val();
		if ($("#like-btn").attr('class') == "not-like")
		{
			var addFocusKmapPath = path + "/mindmap/addFocusKmap";
			$.post(addFocusKmapPath, {
	            "kmapId": kmapId
	        },
	        function(result) {
	            if (result && result['success']) {
	            	$("#like-btn").attr('class', 'like');
	    			$("#heart-icon").attr('class', 'glyphicon glyphicon-heart');
	    			var likeCount = $(".like-count").html();
	    			likeCount = parseInt(likeCount) + 1;
	    			$(".like-count").html(likeCount);
	            } else {
	                location.href = path + "/login";
	            }
	        })
		} else {
			var removeFocusKmapPath = path + "/mindmap/removeFocusKmap";
			$.post(removeFocusKmapPath, {
	            "kmapId": kmapId
	        },
	        function(result) {
	            if (result && result['success']) {
	            	$("#like-btn").attr('class', 'not-like');
	    			$("#heart-icon").attr('class', 'glyphicon glyphicon-heart-empty');
	    			var likeCount = $(".like-count").html();
	    			likeCount = parseInt(likeCount) - 1;
	    			$(".like-count").html(likeCount);
	            } else {
	                location.href = path + "/login";
	            }
	        })
		}

	});		
});

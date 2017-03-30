//javascript 模块化
var indexJS = {
    //封装相关ajax的url
    URL: {
        lookMoreEssay: function() {
            return 'lookMoreEssay';
        }
    },

    //查看更多文章
    lookMoreEssay: function() {
        var currentPage = $("#hideCurrentPage").val();
        var currentNumber = $("#hideCurrentNumber").val();
        var newCurrentEssayId = "essay_" + currentNumber;
        $.get(indexJS.URL.lookMoreEssay(), {"currentPage": currentPage},
        function(result) {
            if (result && result['success']) {
            	var pageParam = result['data'];
            	var essayList = pageParam.data;
            	var count = 1;
                jQuery.each(essayList,
                function(i, item) {
                	currentNumber = parseInt(currentNumber) + 1;
                	newCurrentEssayId = "essay_" + currentNumber;
                	$("#essay_list").append(
                		'<li id="' + newCurrentEssayId + '" class="note-li have-img">' + 
                		'<c:if test="${essay.essayImagePath != null}">' + 
						'<a href="essay/' + item.id + '" target="_blank">' + 
						'<img class="wrap-img" src="' + item.essayImagePath + '" alt="缩略图"></a></c:if>' +
						'<div class="content">' + '<div class="author">' +
						'<a href="users/' + item.userId + '/latest_articles" target="_blank">' +
						'<img class="avatar" src="' + item.userImagePath + '" alt="用户头像"></a>' +
						'<div class="name">' + 
						'<a href="users/' + item.userId + '/latest_articles" class="user-name" target="_blank">' + item.userName + '</a></div>' +
						'<div class="time">' + item.subEssayTime + '</div></div>' +
						'<a href="essay/' + item.id + '" class="title" target="_blank">' + item.essayTitle + '</a>' +
						'<p class="abstact">' + item.essayContent + '</p>' +
						'<div class="meta">' +
						'<a href="essay/' + item.id + '" target="_blank">' +
						'<span class="glyphicon glyphicon-eye-open"></span>' +
						'<span class="watch-num">${essay.essayReadingNumber}</span></a>' +
						'<a href="essay/' + item.id + '" target="_blank">' +
						'<span class="glyphicon glyphicon-comment"></span>' +
						'<span class="watch-num">${essay.essayReadingNumber}</span></a>' +	
						'<a href="essay/' + item.id + '" target="_blank">' +
						'<span class="glyphicon glyphicon-heart"></span>' +
						'<span class="watch-num">${essay.essayReadingNumber}</span></a></div></div></li>'
                	);
                	count = count + 1;
                });
                if (count < 6) {
                	$("#lookmore-btn").hide();
                }
                $("#hideCurrentNumber").val(currentNumber);
                $("#hideCurrentPage").val(parseInt(currentPage) + 1);
            } else {
            	$("#lookmore-btn").hide();
            }
        })
    }
}
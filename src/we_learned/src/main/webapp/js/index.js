//javascript 模块化
var indexJS = {
    //封装相关ajax的url
    URL: {
        search: function(searchKeyword) {
            return 'search?word=' + searchKeyword + "&type=notes";
        },
        lookMoreEssay: function() {
            return 'index/lookMoreEssay';
        }
    },

    //搜索
    search: function() {
        var searchKeyword = $.trim($("#searchKeyword").val());
        window.open(indexJS.URL.search(searchKeyword));
        $("#searchKeyword").val("");
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
                	$("#essay_list").append('<li id="' + newCurrentEssayId + '" class="have-img">'
    						+ '<A class="wrap-img" href="essay/' + item.id +'">'
    						+ '<img alt="300" src="images/index/1480410-dc9d2be35d880969.png"></A>'
    						+ '<div><P class="list-top">'
    						+ '<A class="author-name blue-link" href="users/' + item.userId + '/latest_articles" target="_blank">' + item.userName + '&nbsp;</A>'
    						+ '<EM>·</EM> <span class="time" data-shared-at="">' + item.subEssayTime + '</span></P>'
    					    + '<H4 class="title"><A href="essay/' + item.id +'" target="_blank">'+ item.essayTitle + '</A></H4>'
    						+ '<div class="list-footer">'		
    						+ '<span> 阅读 ' + item.essayReadingNumber + '</span>'	 
    						+ '<span> · 评论 ' + item.essayCommentNumber + '</span>'
    						+ '<span> · 喜欢 ' + item.essayGoodNumber + '</span></div></div></li>');
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
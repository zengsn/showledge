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
        var limitNumber = $("#hideLimitNumber").val();
        $.get(indexJS.URL.lookMoreEssay(), {"limitNumber": limitNumber},
        function(result) {
            if (result && result['success']) {
                $("#essay_list").html("");
                var count = 0;
                jQuery.each(result['data'],
                function(i, item) {
                	$("#essay_list").append('<li class="have-img">'
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
                    count = i;
                });
                $("#hideLimitNumber").val(count + 1);
            } else {
                alert("获取失败,请检查网络连接");
            }
        })
    }
}
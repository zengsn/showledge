//javascript 模块化
var searchJS = {
    //封装相关ajax的url
    URL: {
        searchEssay: function(path) {
            return path + '/search/searchEssay';
        },
        searchCorpus: function(path) {
            return path + '/search/searchCorpus';
        },
        searchUser: function(path) {
            return path + '/search/searchUser';
        }
    },

    //显示所有搜索项
    showAllLiClass: function() {
        $("#choose_essay_li").show();
        $("#choose_corpus_li").show();
        $("#choose_user_li").show();
    },

    //显示搜索文章按钮
    showEssayButton: function() {
        $("#choose_button_content").html('文章 <span class="caret"></span>');
        searchJS.showAllLiClass();
        $('#choose_essay_li').hide();
    },
    //显示搜索文集按钮
    showCorpusButton: function() {
        $("#choose_button_content").html('文集 <span class="caret"></span>');
        searchJS.showAllLiClass();
        $('#choose_corpus_li').hide();
    },
    //显示搜索用户按钮
    showUserButton: function() {
        $("#choose_button_content").html('作者 <span class="caret"></span>');
        searchJS.showAllLiClass();
        $('#choose_user_li').hide();
    },

    //根据搜索选项框所选项进行搜索
    search: function(path) {
        var chooseButtonContent = $("#choose_button_content").html();
        if (chooseButtonContent.indexOf("文章") >= 0) {
        	searchJS.searchEssay(path);
            return true;
        }
        if (chooseButtonContent.indexOf("文集") >= 0) {
        	searchJS.searchCorpus(path);
            return true;
        }
        if (chooseButtonContent.indexOf("作者") >= 0) {
        	searchJS.searchUser(path);
            return true;
        }
    },
    
    //无刷新改变地址栏url
    changeUrl: function(searchKeyword) {
    	var stateObject = {};
        var title = "简随记";
        var newUrl = "search?word=" + searchKeyword + "&type=notes";
        history.pushState(stateObject,title,newUrl);
    },

    //移除左侧菜单栏所有活动属性
    removeAllClass: function() {
        $("#essay_li").removeClass("active");
        $("#corpus_li").removeClass("active");
        $("#user_li").removeClass("active");
        $("#no_find").hide();
    },

    //根据关键字搜索相应文章
    searchEssay: function(path) {
        var searchKeyword = $.trim($("#searchKeyword").val());
        var hideSearchKeyword = $.trim($("#hideSearchKeyword").val());
        if (searchKeyword == null || searchKeyword == "") {
            searchKeyword = hideSearchKeyword;
        }
        searchJS.removeAllClass();
        $("#essay_li").addClass("active");
        searchJS.changeUrl(searchKeyword);
        $.get(searchJS.URL.searchEssay(path), {
            "searchKeyword": searchKeyword
        },
        function(result) {
            if (result && result['success']) {
                $("#search_ul").html("");
                var count = 0;
                jQuery.each(result['data'],
                function(i, item) {
                    $("#search_ul").append('<li><h4 class="title"><a href="' + path + 'essay/' + item.id + '" target="_blank">' + '<i class="fa fa-file-text"></i>' + item.essayTitle + '</a></h4>' + '<p>' + item.essayContent + '</p>' + '<div class="list-footer">' + '<a href="">' + item.userName + '</a>' + '<span> · 阅读 ' + item.essayReadingNumber + '</span>' + '<span> · 评论 ' + item.essayCommentNumber + '</span>' + '<span> · 喜欢 ' + item.essayGoodNumber + '</span>' + ' · <span data-timeago="" title="2015-05-17T03:57:08.000Z">大约1年之前</span></div></li>');
                    count = i + 1;
                });
                if (count == 0) {
                    $("#no_find").show();
                }
                $("#searchKeyword").val("");
                $("#hideSearchKeyword").val(searchKeyword);
            } else {
                $("#no_find").show();
            }
        })
    },

    //根据关键字搜索相应文集
    searchCorpus: function(path) {
        var searchKeyword = $.trim($("#searchKeyword").val());
        var hideSearchKeyword = $.trim($("#hideSearchKeyword").val());
        if (searchKeyword == null || searchKeyword == "") {
            searchKeyword = hideSearchKeyword;
        }
        searchJS.removeAllClass();
        $("#corpus_li").addClass("active");
        searchJS.changeUrl(searchKeyword);
        $.get(searchJS.URL.searchCorpus(path), {
            "searchKeyword": searchKeyword
        },
        function(result) {
            if (result && result['success']) {
                $("#search_ul").html("");
                var count = 0;
                jQuery.each(result['data'],
                function(i, item) {
                    $("#search_ul").append('<li><h4 class="tltle">' + '<a href="' + path + 'notebooks/' + item.id + '/latest" target="_blank">' + '<i class="fa fa-book"></i> ' + item.corpusName + '</a></h4>' + '<p class="footer">' + '<a href="">' + item.userName + '・著</a>,1 篇文章, 0 人关注</p></li>');
                    count = i + 1;
                });
                if (count == 0) {
                    $("#no_find").show();
                }
                $("#searchKeyword").val("");
                $("#hideSearchKeyword").val(searchKeyword);
            } else {
                $("#no_find").show();
            }
        })
    },

    //根据关键字搜索相应用户
    searchUser: function(path) {
        var searchKeyword = $.trim($("#searchKeyword").val());
        var hideSearchKeyword = $.trim($("#hideSearchKeyword").val());
        if (searchKeyword == null || searchKeyword == "") {
            searchKeyword = hideSearchKeyword;
        }
        searchJS.removeAllClass();
        $("#user_li").addClass("active");
        searchJS.changeUrl(searchKeyword);
        $.get(searchJS.URL.searchUser(path), {
            "searchKeyword": searchKeyword
        },
        function(result) {
            if (result && result['success']) {
                $("#search_ul").html("");
                var count = 0;
                jQuery.each(result['data'],
                function(i, item) {
                    $("#search_ul").append('<li><h4 class="tltle">' + '<a class="avatar" href="' + path + 'users/' + item.id + '/latest_articles" target="_blank">' + '<img style="width: 30px" src="' + path + item.userImagePath + '" alt="100">' + " " + item.userName + '</a></h4>' + '<p class="footer">' + '写了 0 个字, 0 篇文章, 得到了 1 个赞, 被 0 人关注</p></li>');
                    count = i + 1;
                });
                if (count == 0) {
                    $("#no_find").show();
                }
                $("#searchKeyword").val("");
                $("#hideSearchKeyword").val(searchKeyword);
            } else {
                $("#no_find").show();
            }
        })
    }
}
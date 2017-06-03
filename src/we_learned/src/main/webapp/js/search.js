//javascript 模块化
var searchJS = {
    //封装相关ajax的url
    URL: {
        search: function(path, searchKeyword) {
            return path + '/search?word=' + searchKeyword + "&type=notes";
        }
    },

    //无刷新改变地址栏url
    changeUrl: function(searchKeyword) {
    	var stateObject = {};
        var title = "简随记";
        var newUrl = "search?word=" + searchKeyword + "&type=notes";
        history.pushState(stateObject,title,newUrl);
    },
    
    //搜索
    search: function(path) {
    	var pathFrom = $("#path").val();
    	var searchKeyword = $.trim($("#searchKeyword").val());
    	if (pathFrom != "search"){
            window.open(searchJS.URL.search(path, searchKeyword));
    	} else {
    		location.href = searchJS.URL.search(path, searchKeyword);
    		$("#searchKeyword").val("");
    	}
    },
    
    //显示当前查询记录总页数
    showPage: function(currentPage, count, size, pageParam, path, method) {
    	if (count == 0) {
            $("#no_find").show();
        } else if (count > size || pageParam.totalPage > 1) {
        	if (pageParam.totalPage <= 10) {
        		if (currentPage != 1) {
        			var perPage = currentPage - 1;
        			$("#page-btn").append('<li><a href="javascript:void(0)" onclick="searchJS.' + method + '(' + path + ',' + perPage + ')">上一页</a></li>');
        		}
        		for (var i = 1; i < pageParam.totalPage + 1; i++) {
        			if (i != currentPage) {
        				$("#page-btn").append('<li><a href="javascript:void(0)" onclick="searchJS.' + method + '(' + path + ',' + i + ')">' + i + '</a></li>');
        			} else {
        				$("#page-btn").append('<li class="active"><a href="javascript:void(0)" onclick="searchJS.' + method + '(' + path + ',' + i + ')">' + i + '</a></li>');
        			}
        		}
        		if (currentPage != pageParam.totalPage) {
        			var nextPage = currentPage + 1;
        			$("#page-btn").append('<li><a href="javascript:void(0)" onclick="searchJS.' + method + '(' + path + ',' + nextPage + ')">下一页</a></li>');
        		}
        	} else {
        		if (currentPage != 1) {
        			var perPage = currentPage - 1;
        			$("#page-btn").append('<li><a href="javascript:void(0)" onclick="searchJS.' + method + '(' + path + ',' + perPage + ')">上一页</a></li>');
        		}
        		if (currentPage < 5) {
        			for (var i = 1; i < 11; i++) {
            			if (i != currentPage) {
            				$("#page-btn").append('<li><a href="javascript:void(0)" onclick="searchJS.' + method + '(' + path + ',' + i + ')">' + i + '</a></li>');
            			} else {
            				$("#page-btn").append('<li class="active"><a href="javascript:void(0)" onclick="searchJS.' + method + '(' + path + ',' + i + ')">' + i + '</a></li>');
            			}
            		}
        		} else {
        			var endPage;
        			if (currentPage + 5 > pageParam.totalPage) {
        				endPage = pageParam.totalPage;
        			} else {
        				endPage = currentPage + 5;
        			}
        			for (var i = currentPage - 4; i < endPage + 1; i++) {
            			if (i != currentPage) {
            				$("#page-btn").append('<li><a href="javascript:void(0)" onclick="searchJS.' + method + '(' + path + ',' + i + ')">' + i + '</a></li>');
            			} else {
            				$("#page-btn").append('<li class="active"><a href="javascript:void(0)" onclick="searchJS.' + method + '(' + path + ',' + i + ')">' + i + '</a></li>');
            			}
            		}
        		}
        		if (currentPage != pageParam.totalPage) {
        			var nextPage = currentPage + 1;
        			$("#page-btn").append('<li><a href="javascript:void(0)" onclick="searchJS.' + method + '(' + path + ',' + nextPage + ')">下一页</a></li>');
        		}
        	}
        }
    },
}
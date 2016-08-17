function searchEssay() {
	var searchKeyword = $.trim($("#searchKeyword").val());
	location.href = "searchInIndex.do?searchKeyword=" + searchKeyword;
}
function lookMoreEssay() {
	var limitNumber = $("#hideLimitNumber").val();
	$.ajax({
		type : "POST", // http请求方式
		url : "http://localhost:8080/learned/lookMoreEssay.do", // 发送给服务器的url
		data : "limitNumber=" + limitNumber, // 发送给服务器的参数
		dataType : "json", // 告诉JQUERY返回的数据格式(注意此处数据格式一定要与提交的controller返回的数据格式一致,不然不会调用回调函数complete)
		cache : false,
		complete : function(msg) {
			var result = eval("(" + msg.responseText + ")");
			if (result.success) {
				$("#essay_list").html("");
				var count = 0;
				jQuery.each(result.essayList, function(i, item) {
					$("#essay_list").append('<li class="have-img">'
						+ '<A class="wrap-img" href="http://www.jianshu.com/p/cb254b7647d7">'
						+ '<img alt="300" src="images/index/1480410-dc9d2be35d880969.png" style="width:99px;height:99px;"></A>'
						+ '<div><P class="list-top">'
						+ '<A class="author-name blue-link" href="" target="_blank">' + item.userName +'</A>'
						+ '<EM>·</EM> <span class="time" data-shared-at="">' + item.subEssayTime + '</span></P>'
					    + '<H4 class="title"><A href="essay.html?id=' + item.id +'" target="_blank">'+ item.essayTitle + '</A></H4>'
						+ '<div class="list-footer">'		
						+ '<span> 阅读 ' + item.essayReadingNumber + '</span>'	 
						+ '<span> · 评论 ' + item.essayCommentNumber + '</span>'
						+ '<span> · 喜欢 ' + item.essayGoodNumber + '</span></div></div></li>');
					count = i;
				});
				$("#hideLimitNumber").val(count + 1);
			}
		},
		error : function() {
			alert("获取失败,请检查网络连接");
		},
	})
}
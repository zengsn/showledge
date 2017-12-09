$(document).ready(function() {

	var moreBtn = document.getElementById("more-btn");
	//模拟后台传来的json
	//id、缩略图、用户头像、用户名字、发布时间、文章标题、文章类容、阅读量、评论、喜欢
	var dataInt = {
		"data" : [
			{
				"id" : "001",
				"wrapImg" : "image/wrap-img1.jpg",
				"avatar" : "image/touxiang.jpg",
				"userName" : "张三",
				"time" : "前天 13:50",
				"title" : "张三今天踩大便了",
				"abstract" : "这里放文章简介，张三今天踩大便了张三今天踩大便了张三今天踩大便了张三今天踩大便了张三今天踩大便了张三今天踩大便了张三今天踩大便了张三今天踩大便了",
				"watch" : "1000",
				"comment" : "9999",
				"like" : "999"
			},
			{
				"id" : "001",
				"wrapImg" : "image/wrap-img1.jpg",
				"avatar" : "image/touxiang.jpg",
				"userName" : "张三",
				"time" : "前天 13:50",
				"title" : "张三今天踩大便了",
				"abstract" : "这里放文章简介，张三今天踩大便了张三今天踩大便了张三今天踩大便了张三今天踩大便了张三今天踩大便了张三今天踩大便了张三今天踩大便了张三今天踩大便了",
				"watch" : "1000",
				"comment" : "9999",
				"like" : "999"
			},
			{
				"id" : "001",
				"wrapImg" : "image/wrap-img1.jpg",
				"avatar" : "image/touxiang.jpg",
				"userName" : "张三",
				"time" : "前天 13:50",
				"title" : "张三今天踩大便了",
				"abstract" : "这里放文章简介，张三今天踩大便了张三今天踩大便了张三今天踩大便了张三今天踩大便了张三今天踩大便了张三今天踩大便了张三今天踩大便了张三今天踩大便了",
				"watch" : "1000",
				"comment" : "9999",
				"like" : "999"
			}
		]
	};
	moreBtn.onclick = function(){
		var oParent = document.getElementById("article-list"); //获取ul
		//将数据块渲染到尾部
		for (var i=0;i<dataInt.data.length;i++)
		{
			//创建一个新的li
			var newLi = document.createElement("li");
			newLi.className = "note-li have-img";
			newLi.id = dataInt.data[i].id;
			oParent.appendChild(newLi);

			//li中的a
			var newA = document.createElement("a");
			newA.href = "#";
			newA.target = "_blank";
			newLi.appendChild(newA);
				var newWrapImg = document.createElement("img");
				newWrapImg.className = "wrap-img";
				newWrapImg.src = dataInt.data[i].wrapImg;
				newWrapImg.alt = "缩略图";
				newA.appendChild(newWrapImg);

			//li中的div.content
			var newContent = document.createElement("div");
			newContent.className = "content";
			newLi.appendChild(newContent);
				var newAuther = document.createElement("div");
				newAuther.className = "author";
				newContent.appendChild(newAuther);
					var newAvatarA = document.createElement("a");
					newAvatarA.href = "#"
					newAvatarA.target = "_blank";
					newAuther.appendChild(newAvatarA);
						//avatar
						var newAvatar =  document.createElement("img");
						newAvatar.className = "avatar";
						newAvatar.src = dataInt.data[i].avatar;
						newAvatar.alt = "用户头像";
						newAvatarA.appendChild(newAvatar);
						//name
						var newName = document.createElement("div");
						newName.className = "name";
						newAuther.appendChild(newName);
							var newNameA = document.createElement("a");
							newNameA.href = "#";
							newNameA.className = "user-name";
							newNameA.target = "_blank";
							newNameA.innerHTML = dataInt.data[i].userName;
							newName.appendChild(newNameA);
						//time
						var newTime =  document.createElement("div");
						newTime.className = "time";
						newTime.innerHTML = dataInt.data[i].time;
						newAuther.appendChild(newTime);


				var newTitle = document.createElement("a");
				newTitle.href = "article-page.html";
				newTitle.className = "title";
				newTitle.target = "_blank";
				newTitle.innerHTML = dataInt.data[i].title;  //????
				newContent.appendChild(newTitle);

				var newAbstract = document.createElement("p");
				newAbstract.className = "abstract";
				newAbstract.innerHTML = dataInt.data[i].abstract;  //????
				newContent.appendChild(newAbstract);

				var newMeta = document.createElement("div");
				newMeta.className = "meta";
				newContent.appendChild(newMeta);
					//watch
					var newWatchA = document.createElement("a");
					newWatchA.href = "#";
					newWatchA.target = "_blank";
					newMeta.appendChild(newWatchA);
						var newWatchSpan = document.createElement("span");
						newWatchSpan.className = "glyphicon glyphicon-eye-open";
						newWatchA.appendChild(newWatchSpan);
						
						var newWatchNum = document.createElement("span");
						newWatchNum.className = "watch-num";
						newWatchNum.innerHTML = dataInt.data[i].watch;
						newWatchA.appendChild(newWatchNum);
					//comment
					var newCommentA = document.createElement("a");
					newCommentA.href = "#";
					newCommentA.target = "_blank";
					newMeta.appendChild(newCommentA);
						var newCommentSpan = document.createElement("span");
						newCommentSpan.className = "glyphicon glyphicon-comment";
						newCommentA.appendChild(newCommentSpan);

						var newCommentNum = document.createElement("span");
						newCommentNum.className = "comment-num";
						newCommentNum.innerHTML = dataInt.data[i].comment;
						newCommentA.appendChild(newCommentNum);
					//like
					var newLikeA = document.createElement("a");
					newLikeA.href = "#";
					newLikeA.target = "_blank";
					newMeta.appendChild(newLikeA);
						var newLikeSpan = document.createElement("span");
						newLikeSpan.className = "glyphicon glyphicon-heart";
						newLikeA.appendChild(newLikeSpan);

						var newLikeNum = document.createElement("span");
						newLikeNum.className = "like-num";
						newLikeNum.innerHTML = dataInt.data[i].like;
						newLikeA.appendChild(newLikeNum);

		}
	};

	//  关注按钮的切换
	$(".follow-btn").click(function(event) {
		if ($(this).text() == "关注") {
			$(this).text("已关注");

			$(this).css({
				"color": '#969696',
			});
		} else if ($(this).text() == "已关注") {
			$(this).html("<span class='glyphicon glyphicon-plus'></span><span>关注</span>");

			$(this).css({
				"color": '#42c02e',
			});
		}
	});

});

/*
//  检测是否具备了滾条加载数据块的条件
function checkScrollSlice() {
	var oli = document.getElementsByClassName("note-li");
	var lastLiHeight = oli[oli.length-1].offsetTop + Math.floor(oli[oli.length-1].offsetHeight/2); //最后一个li高度的一半位置到盒顶距离
	var scrollTop = document.body.scrollTop || document.documentElement.scrollTop;  //获取页面滚走的长度
	var winHeight = document.body.clientHeight || document.documentElement.clientHeight;  //获取浏览器窗口的高度
	console.log(oli[oli.length-1]);
	console.log(lastLiHeight);
	console.log(scrollTop);
	console.log(winHeight);
	return (lastLiHeight<scrollTop+winHeight)?true:false;
}
*/


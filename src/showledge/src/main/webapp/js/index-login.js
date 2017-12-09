/*index-login.js*/
$(document).ready(function() {
	/*----------------------发布学习动态框js----------------------*/
	/*点击“心情”按钮事件*/
	$("#input-emotion").click(function(event) {
		$(".input-emotion-form").slideToggle();
	});

	/*点击“学习资料”按钮事件*/
	$("#input-xxzl").click(function(event) {
		$(".input-xxzl-form").slideToggle();
	});
	
	/*添加学习资料按钮*/
	$("#add-xxzl").click(function(event) {
		var newDiv = $("<div></div>");
		newDiv.addClass("input-xxzl-form input-xxzl-form-extra");
		newDiv.css({
			"display": "block",
			"margin-left": "95px"
		});
		var newInput1 = $("<input>");
		newInput1.attr({
			"type": "text",
			"class": "form-control-green-border",
			"placeholder": "http://"
		});
		newDiv.append(newInput1);
		var newSpan = $("<span></span>");
		newSpan.addClass("fa fa-external-link");
		newDiv.append(newSpan);
		var newInput2 = $("<input>");
		newInput2.attr({
			"type": "text",
			"class": "form-control-green-border",
			"placeholder": "资料标题"
		});
		newDiv.append(newInput2);
		$(".input-xxbj-form").before(newDiv);
	});

	/*点击“学习笔记”按钮事件*/
	$("#input-xxbj").click(function(event) {
		$(".input-xxbj-form").slideToggle();
	});	

	/*笔记选择窗口模态框 的选择按钮切换*/
	$(".pick-btn").click(function(event) {
		$(this).toggleClass("btn-warning");
		if ($(this).attr("class") == "btn btn-info btn-sm pick-btn")
			$(this).text("已选择");
		else $(this).text("选择");
	});

	/*笔记选择窗口模态框 的点击“选好了”按钮*/
	$(".enter-pick").click(function(event) {
		var $addNoteList = $(".picked-note");
		$addNoteList.html("");
		var $pickedNote = $(".pick-btn:not(.btn-warning)");
		//console.log($pickedNote.prev().text());
		//console.log($pickedNote.prev().attr("href"));
		var addNote = "";
		for (var i = 0; i <  $pickedNote.length; i++) {
			addNote += '<a href="' + $pickedNote.eq(i).prev().attr("href") + '" target="_blank" value="' + $pickedNote.eq(i).prev().attr("value") + '">《'+ $pickedNote.eq(i).prev().text() +'》</a> ';
		}
		$addNoteList.append(addNote);
		$pickedNote.children('selector').remove();
	});


	/*点击发布按钮*/
	$("#send-act-btn").on('click', function(event) {
		event.preventDefault();
		/* Act on the event */
		if ($("#input-act").val() == "" || $("#emotion-form").val() == "") alert("请至少填写动态内容和心情");
		else {
			//发布
			var notesId = ""; 
			var noteList = $(".picked-note").find("a"); 
			for (var i = 0; i <  noteList.length; i++) {
				notesId += noteList.eq(i).attr("value") + "|";
			}
			//alert(notesId);
			
			var content = $("#input-act").val();
			var emotion = $("#emotion-form").val();
			
			var xx = "";
			var xxzlList = $(".input-xxzl-form");
			for (var i = 0; i <  xxzlList.length; i++) {
				xx += xxzlList.eq(i).find("input").eq(0).val() + "#";
				xx += xxzlList.eq(i).find("input").eq(1).val() + "|";
			}
			//alert(xx);
			
			$.post("/publishDyn.do",{
				content : content,
				emotion : emotion,
				xx : xx,
				notesId : notesId
			},function(result){
				if (result &&result.success) {
					/* 发布完动态后初始化各个表单 */
					$("#input-act").val("");
					$("#emotion-form").val("");
					$(".input-xxzl-form > input").val("");
					$(".picked-note").html("");
					$(".input-xxzl-form-extra").remove();
					$(".input-emotion-form").hide();
					$(".input-xxzl-form").hide();
					$(".input-xxbj-form").hide();
					alert("发布成功");		
				}else{
					alert("发布失败,请重试");
				}
			});
			
		} 			
	});

	/*----------------------发布学习动态框js end----------------------*/

	/*----------------------点击加载按钮 ajax----------------------*/
  function countActiveBind() {
    /*.like-count*/
    /*$(".like-count").click(function(event) {
      var count = parseInt($(this).children("span").eq(1).text());  //获取数字
      if ($(this).attr("class") == "like-count") {
        $(this).addClass("green-count");
        $(this).children("span").eq(1).text(count+1+"");
      }
      else {
        $(this).removeClass("green-count");
        $(this).children("span").eq(1).text(count-1+"");
      }
    });

    collection-count
    $(".collection-count").click(function(event) {
      var count = parseInt($(this).children("span").eq(1).text());  //获取数字
      if ($(this).attr("class") == "collection-count") {
        $(this).addClass("green-count");
        $(this).children("span").eq(1).text(count+1+"");
      }
      else {
        $(this).removeClass("green-count");
        $(this).children("span").eq(1).text(count-1+"");
      }
    });    */
  }

  /* 学习动态 - 加载更多按钮 */
  $(".load-more-act").on('click', function(event) {
    event.preventDefault();
    var $actList = $("#by-act > ul");
    console.log($actList);
    $.ajax({
      url: 'http://www.easy-mock.com/mock/598723caa1d30433d856d66f/test-data/study-act',
      type: 'get',
      datatype: 'json',
      success: function (data) {
        console.log(data);
        var dataLength = data.length; /*后台返回来的数据长度*/
        console.log(dataLength);

        var result = "";
        for (var i = 0; i < dataLength; i++) {
          result += '<li class="box" id="' + data[i].actId + '">' + 
          '<div class="user-info">' +
          '<div class="user-avatar">' +
          '<a href="personal-page.html" target="_blank"><img src="' + data[i].userAvatar + '" alt="用户头像-sm" class="avatar-sm"></a>' + 
          ' <a href="personal-page.html" class="user-name" target="_blank">' + data[i].userName + '</a>' +
          '<span> - </span>' + 
          '<span class="user-act-time">' + data[i].sendTime + '</span>' + 
          '</div>' + 
          '<div class="user-mood">' + 
          '<span>心情</span>' + 
          ' <span>' + data[i].mood + '</span>' +
          '</div>' +
          '</div>' +
          '<div class="user-act">' + data[i].actContent + 
          '</div>' + 
          '<div class="user-library">' +
          '<div class="xxzl">' + 
          '<span>学习资料</span>';
          for (var j = 0; j < data[i].xxzl.length; j++)
            result += '<a href="' + data[i].xxzl[j].xxzlLink + '" target="_blank">' + data[i].xxzl[j].xxzlName + '</a>';
          result += '</div> ' + 
          '<div class="xxbj">' +
          '<span>学习笔记</span>';
          for (var j = 0; j < data[i].xxbj.length; j++)
            result += '<a href="' + data[i].xxbj[j].xxbjLink + '" class="user-note-entrance" target="_blank">' + data[i].xxbj[j].xxbjLink +'</a>';
          result += '</div> ' +
          '</div>' +
          '<div class="act-info">' +
          '<div class="comments-count" data-toggle="modal" data-target="#comment-modal">' +
          '<span class="glyphicon glyphicon-comment"></span>' +
          ' <span>'+ data[i].commentNum + '</span>'+
          '</div>' +
          '<div class="like-count">' +
          '<span class="glyphicon glyphicon-heart"></span>' +
          ' <span>'+ data[i].likeNum + '</span>' +
          '</div>' + 
          '<div class="share-count">' +
          '<span class="glyphicon glyphicon-share"></span>' +
          ' <span>'+ data[i].shareNum + '</span>' +
          '</div>' +
          '</div>' +
          '</li>';
        }
        
        $actList.append(result);

        /*评论按钮、喜欢按钮、收藏按钮激活状态*/
        countActiveBind()      

        /*隐藏load-more按钮
        if ( (offset + size) >= listLength){
          $(".load-more").html('没有更多');
        }else{
          $(".load-more").show();
        }*/
      },
      error: function(xhr, type){
        alert('Ajax error!');
      }
    });
    /*评论按钮、喜欢按钮、收藏按钮激活状态*/
    countActiveBind()     
  });


  /* 学习笔记 - 加载更多按钮 */
  $(".load-more-note").on('click', function(event) {
    event.preventDefault();
    var $noteList = $("#by-note > ul");
    console.log($noteList);
    $.ajax({
      url: 'http://www.easy-mock.com/mock/598723caa1d30433d856d66f/test-data/study-note',
      type: 'get',
      datatype: 'json',
      success: function (data) {
        console.log(data);
        var dataLength = data.length; /*后台返回来的数据长度*/
        console.log(dataLength);

        var result = "";
        for (var i = 0; i < dataLength; i++) {
          result += '<li class="box" id="' + data[i].noteId + '">' +
          '<div class="user-info">' +
          '<div class="user-avatar">' +
          '<a href="personal-page.html" target="_blank"><img src="' + data[i].userAvatar + '" alt="用户头像-sm" class="avatar-sm"></a>' +
          ' <a href="personal-page.html" class="user-name" target="_blank">' + data[i].userName + '</a>' +
          '<span> - </span>' + 
          '<span class="user-act-time">' + data[i].sendTime + '</span>' + 
          '</div>' +
          '</div>' +
          '<a href="note-page.html" target="_blank" class="note-title-sm">' + data[i].noteTitle + '</a>' +
          '<p class="note-content">' + data[i].noteAbstract +
          ' ...</p>' +
          '<a href="note-page.html" target="_blank" class="more-detail-btn">详细内容 > </a>' +
          '<div class="act-info">' +
          '<div class="comments-count" data-toggle="modal" data-target="#comment-modal">' +
          '<span class="glyphicon glyphicon-comment"></span>' +
          ' <span>' + data[i].commentNum + '</span>' +
          '</div>' +
          '<div class="like-count">' +
          '<span class="glyphicon glyphicon-heart"></span>' +
          ' <span>' + data[i].likeNum + '</span>' +
          '</div>' + 
          '<div class="collection-count">' +
          '<span class="fa fa-bookmark"></span>' +
          ' <span>' + data[i].collectNum + '</span>' +
          '</div>' +
          '<div class="share-count">' +
          '<span class="glyphicon glyphicon-share"></span>' +
          ' <span>' + data[i].shareNum + '</span>' +
          '</div>' +
          '</div>' +
          '</li>';
        }
        
        $noteList.append(result);

        /*评论按钮、喜欢按钮、收藏按钮激活状态*/
        countActiveBind()         

        /*隐藏load-more按钮
        if ( (offset + size) >= listLength){
          $(".load-more").html('没有更多');
        }else{
          $(".load-more").show();
        }*/
      },
      error: function(xhr, type){
        alert('Ajax error!');
      }
    });
    /*评论按钮、喜欢按钮、收藏按钮激活状态*/
    countActiveBind()     
  });

  /* 知识地图 - 加载更多按钮 */
  $(".load-more-map").on('click', function(event) {
    event.preventDefault();
    var $mapList = $("#by-map > ul");
    console.log($mapList);
    $.ajax({
      url: 'http://www.easy-mock.com/mock/598723caa1d30433d856d66f/test-data/study-map',
      type: 'get',
      datatype: 'json',
      success: function (data) {
        console.log(data);
        var dataLength = data.length; /*后台返回来的数据长度*/
        console.log(dataLength);

        var result = "";
        for (var i = 0; i < dataLength; i++) {
          result += '<li class="box" id="' + data[i].mapId + '">' +
          '<div class="user-info">' + 
          '<div class="user-avatar">' +
          '<a href="personal-page.html" target="_blank"><img src="' + data[i].userAvatar + '" alt="用户头像-sm" class="avatar-sm"></a>' +
          ' <a href="personal-page.html" class="user-name" target="_blank">' + data[i].userName + '</a>' + 
          '<span> - </span>' + 
          '<span class="user-act-time">' + data[i].sendTime + '</span>' +
          '</div>' +
          '</div>' +
          '<a href="user-mindmap.html" target="_blank" class="map-title-sm">' + data[i].mapTitle + '</a>' +
          '<div class="map-keyword">' + 
          '<span><span class="fa fa-tags fa-fw"></span>关键词</span>';
          for (var j = 0; j < data[i].mapKeyword.length; j++)
            result += ' <a href="' + data[i].mapKeyword[j].link + '" class="keyword" target="_blank">' + data[i].mapKeyword[j].keyword + '</a>';
          result += ' <span>...</span>' + 
          '</div>' + 
          '<div class="act-info">' +
          '<div class="comments-count" data-toggle="modal" data-target="#comment-modal">' + 
          '<span class="glyphicon glyphicon-comment"></span>' +
          ' <span>' + data[i].commentNum + '</span>' +
          '</div>' +
          '<div class="like-count">' +
          '<span class="glyphicon glyphicon-heart"></span>' +
          ' <span>' + data[i].likeNum + '</span>' +
          '</div>' + 
          '<div class="collection-count">' +
          '<span class="fa fa-bookmark"></span>' +
          ' <span>' + data[i].collectNum + '</span>' +
          '</div>' +
          '</div>' +
          '</li>';
        }
        
        $mapList.append(result);

        /*评论按钮、喜欢按钮、收藏按钮激活状态*/
        countActiveBind()   

        /*隐藏load-more按钮
        if ( (offset + size) >= listLength){
          $(".load-more").html('没有更多');
        }else{
          $(".load-more").show();
        }*/
      },
      error: function(xhr, type){
        alert('Ajax error!');
      }
    });
    /*评论按钮、喜欢按钮、收藏按钮激活状态*/
    countActiveBind()     
  });
});

/*----------------------点击加载按钮 ajax end----------------------*/
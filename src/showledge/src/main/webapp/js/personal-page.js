$(document).ready(function() {
  /* --------------.collection-btn 收藏按钮切换js-------------- */
  $(".collection-btn").click(function(event) {
   /* $(this).toggleClass("btn-danger");
    if ($(this).attr("class") == "btn collection-btn btn-success btn-danger") 
      $(this).text("取消收藏");   
    else $(this).text("收藏");*/
  });
  /* --------------收藏按钮切换js end-------------- */  
  
  /* --------------点击加载按钮 ajax-------------- */
  function countActiveBind() {
    /*.like-count*/
    $(".like-count").click(function(event) {
     /* var count = parseInt($(this).children("span").eq(1).text());  //获取数字
      if ($(this).attr("class") == "like-count") {
        $(this).addClass("green-count");
        $(this).children("span").eq(1).text(count+1+"");
      }
      else {
        $(this).removeClass("green-count");
        $(this).children("span").eq(1).text(count-1+"");
      }*/
    });

    /*collection-count*/
    $(".collection-count").click(function(event) {
      /*var count = parseInt($(this).children("span").eq(1).text());  //获取数字
      if ($(this).attr("class") == "collection-count") {
        $(this).addClass("green-count");
        $(this).children("span").eq(1).text(count+1+"");
      }
      else {
        $(this).removeClass("green-count");
        $(this).children("span").eq(1).text(count-1+"");
      }*/
    });
    /* .follow-btn 关注 */
    $(".follow-btn").click(function(event) {
    	//alert("关注");
    	
      /*$(this).toggleClass("not-follow");
      if ($(this).attr("class") == "follow-btn") 
        $(this).html("<span class='fa fa-plus-circle'></span>关注");    
      else $(this).html("已关注");   */
    }); 

    /* --------------.collection-btn 收藏按钮切换js-------------- */
    $(".collection-btn").click(function(event) {
     /* $(this).toggleClass("btn-danger");
      if ($(this).attr("class") == "btn collection-btn btn-success btn-danger") 
        $(this).text("取消收藏");   
      else $(this).text("收藏");*/
    });
    /* --------------收藏按钮切换js end-------------- */             
    
    /* --------------学习动态、笔记、地图的删除按钮-------------- */  
    $(".delete-btn").unbind('click').click(function(event) {
      /*var isDelete = window.confirm("你确定要删除吗？");
      if (isDelete) 
        $(this).parent().remove();*/
    });
    /* --------------学习动态、笔记、地图的删除按钮 end-------------- */ 
    
    /* --------------学习动态、笔记、地图的删除按钮-------------- */  
    $(".delete-btn").unbind('click').click(function(event) {
/*      var isDelete = window.confirm("你确定要删除吗？");
      if (isDelete) 
        $(this).parent().remove();*/
    });
/* --------------学习动态、笔记、地图的删除按钮 end-------------- */ 

    
  }
  countActiveBind();

  /* 学习动态 - 加载更多按钮 */
  $(".load-more-act").on('click', function(event) {
    event.preventDefault();
    var $actList = $("#study-act > ul");
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
          '<button class="btn btn-danger delete-btn" style="float:right;">删除</button>' +
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

        /*评论按钮、喜欢按钮、收藏按钮、关注按钮激活状态*/
        countActiveBind();      

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
    /*评论按钮、喜欢按钮、收藏按钮、关注按钮激活状态*/
    countActiveBind();     
  });

  
  /* 学习笔记 - 加载更多按钮 */
  $(".load-more-note").on('click', function(event) {
    event.preventDefault();
    var $noteList = $("#study-note > ul");
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
          '<button class="btn btn-danger delete-btn" style="float:right; margin-left:10px;">删除</button>' + 
          '<button class="btn btn-info edit-note-btn" style="float:right;" onclick="window.open("updatenode.do?essayId=1' +','+ '_blank")"><a style="display:inline;color: white;text-decoration: none;">编辑笔记</a></button>'+
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

        /*评论按钮、喜欢按钮、收藏按钮、关注按钮激活状态*/
        countActiveBind();         

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
    /*评论按钮、喜欢按钮、收藏按钮、关注按钮激活状态*/
    countActiveBind();     
  });

  /* 知识地图 - 加载更多按钮 */
  $(".load-more-map").on('click', function(event) {
    event.preventDefault();
    var $mapList = $("#study-map > ul");
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

        /*评论按钮、喜欢按钮、收藏按钮、关注按钮激活状态*/
        countActiveBind();   

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
    /*评论按钮、喜欢按钮、收藏按钮、关注按钮激活状态*/
    countActiveBind();     
  }); 

  /* 学习榜样 - 加载更多按钮 */ 
  $(".load-more-idol").on('click', function(event) {
    event.preventDefault();
    var $userList = $("#study-idol > ul");
    console.log($userList);
    $.ajax({
      url: 'http://www.easy-mock.com/mock/598723caa1d30433d856d66f/test-data/user',
      type: 'get',
      datatype: 'json',
      success: function (data) {
        console.log(data);
        var dataLength = data.length; /*后台返回来的数据长度*/
        console.log(dataLength);

        var result = "";
        for (var i = 0; i < dataLength; i++) {
          result += '<li class="box" id="' + data[i].userId + '">' +
          '<a href="personal-page.html"><img src="' + data[i].userAvatar + '" alt="用户头像-sm" class="avatar-sm"></a>' +
          '<a href="personal-page.html" class="user-name">' + data[i].userName + '</a>' +
          '<p class="user-summary">' + data[i].userAbstract + '</p>';
          if (data[i].watch == '1') result += '<a class="follow-btn not-follow">已关注</a>';
          else result += '<a class="follow-btn"><span class="fa fa-plus-circle"></span>关注</a>';
          result += "</li>";
        }
        
        $userList.append(result); 

        /*评论按钮、喜欢按钮、收藏按钮、关注按钮激活状态*/
        countActiveBind();  

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
    /*评论按钮、喜欢按钮、收藏按钮、关注按钮激活状态*/
    countActiveBind();  
  }); 

  /* 关注者 - 加载更多按钮 */ 
  $(".load-more-watcher").on('click', function(event) {
    event.preventDefault();
    var $userList = $("#study-watcher > ul");
    console.log($userList);
    $.ajax({
      url: 'http://www.easy-mock.com/mock/598723caa1d30433d856d66f/test-data/user',
      type: 'get',
      datatype: 'json',
      success: function (data) {
        console.log(data);
        var dataLength = data.length; /*后台返回来的数据长度*/
        console.log(dataLength);

        var result = "";
        for (var i = 0; i < dataLength; i++) {
          result += '<li class="box" id="' + data[i].userId + '">' +
          '<a href="personal-page.html"><img src="' + data[i].userAvatar + '" alt="用户头像-sm" class="avatar-sm"></a>' +
          '<a href="personal-page.html" class="user-name">' + data[i].userName + '</a>' +
          '<p class="user-summary">' + data[i].userAbstract + '</p>';
          if (data[i].watch == '1') result += '<a class="follow-btn not-follow">已关注</a>';
          else result += '<a class="follow-btn"><span class="fa fa-plus-circle"></span>关注</a>';
          result += "</li>";
        }
        
        $userList.append(result); 

        /*评论按钮、喜欢按钮、收藏按钮、关注按钮激活状态*/
        countActiveBind();  

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
    /*评论按钮、喜欢按钮、收藏按钮、关注按钮激活状态*/
    countActiveBind();  
  });  

  /* 关注者 - 加载更多按钮 */ 
  $(".load-more-collection").on('click', function(event) {
    event.preventDefault();
    
    if ($(this).parent().attr("id") == "note-collection") {
        var $collectionList = $("#note-collection > ul");
        var addressFolder = "collection-note";
      } else {
        var $collectionList = $("#map-collection > ul");
        var addressFolder = "collection-map";
      }

    //var $collectionList = $("#collection > ul");
    console.log($collectionList);
    $.ajax({
      url: 'http://www.easy-mock.com/mock/598723caa1d30433d856d66f/test-data/' + addressFolder,
      type: 'get',
      datatype: 'json',
      success: function (data) {
        console.log(data);
        var dataLength = data.length; /*后台返回来的数据长度*/
        console.log(dataLength);

        var result = "";
        for (var i = 0; i < dataLength; i++) {
          if (data[i].cat == "note") {
            result += '<li class="box" id="' + data[i].noteId + '">' +
            '<button class="btn collection-btn btn-success btn-danger">取消收藏</button>' + 
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
          } else if (data[i].cat == "map") {
            result += '<li class="box" id="' + data[i].mapId + '">' +
            '<button class="btn collection-btn btn-success btn-danger">取消收藏</button>' + 
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
        }
        
        $collectionList.append(result); 

        /*评论按钮、喜欢按钮、收藏按钮、关注按钮激活状态*/
        countActiveBind();  

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
    /*评论按钮、喜欢按钮、收藏按钮、关注按钮激活状态*/
    countActiveBind();  
  });       
  /* --------------点击加载按钮 ajax end-------------- */  
});
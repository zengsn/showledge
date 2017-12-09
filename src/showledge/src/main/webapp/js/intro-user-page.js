$(document).ready(function($) {
  /* 推荐用户 - 加载更多按钮 */
  $(".want-more-btn").on('click', function(event) {
    event.preventDefault();
    var $userList = $(".intro-user-list");
    console.log($userList);
    $.ajax({
      url: 'http://www.easy-mock.com/mock/598723caa1d30433d856d66f/test-data/intro-user',
      type: 'get',
      datatype: 'json',
      success: function (data) {
        console.log(data);
        var dataLength = data.length; /*后台返回来的数据长度*/
        console.log(dataLength);

        var result = "";
        for (var i = 0; i < dataLength; i++) {
          result += '<li id="' + data[i].actId + '">' + 
          '<a href="personal-page.html" target="_blank"><img src="' + data[i].userAvatar + '" alt="用户头像-md" class="avatar-md"></a>' + 
          '<a href="personal-page.html" target="_blank" class="user-name">' + data[i].userName + '</a>' +
          '<div class="intro-user-info">' +
          '<p>收获<span>' + data[i].likeNum + '</span>个赞</p>' +
          '<p>共发布<span>' + data[i].actNum + '</span>条学习动态</p>' + 
          '<p>是<span>' + data[i].watcherNum + '</span>个用户的学习榜样</p>' +
          '</div>' + 
          '<div class="recent-act">' +
          '<span>最近笔记</span>';
          for (var j = 0; j < data[i].latestNotes.length; j++)
            result += '<a href="' + data[i].latestNotes[j].link + '" target="_blank">' + data[i].latestNotes[j].title + '</a>';
          result += '</div>' +
          '</li>';
        }
        
        $userList.append(result);
    
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
  });  

});
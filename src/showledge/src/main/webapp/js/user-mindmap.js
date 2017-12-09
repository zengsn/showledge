$(document).ready(function($) {
  /* --------------点赞（收藏）笔记事件-------------- */
  $(".like-btn").click(function(event) {
    if ($(this).attr("class") == "btn btn-lg btn-green like-btn") {
      $(this).addClass("note-like-and-collect-btn-active");
      $(this).html("<span class='fa fa-heart fa-fw'></span>已点赞");
    }
    else {
      $(this).removeClass("note-like-and-collect-btn-active");
      $(this).html("<span class='fa fa-heart fa-fw'></span>点赞");
    }
  });

  $(".collect-btn").click(function(event) {
    if ($(this).attr("class") == "btn btn-lg btn-green collect-btn") {
      $(this).addClass("note-like-and-collect-btn-active");
      $(this).html("<span class='fa fa-bookmark fa-fw'></span>已收藏");
    }
    else {
      $(this).removeClass("note-like-and-collect-btn-active");
      $(this).html("<span class='fa fa-bookmark fa-fw'></span>收藏");
    }
  });	
});

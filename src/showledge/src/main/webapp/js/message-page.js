/* message-page.html专用js文件
这个js主要解决message-page.html回复 */
$(document).ready(function() {
  /*点击回复按钮*/
  $(".reply-btn").click(function(event) {
    $(this).parent().children(".reply-block").slideToggle();
  });
  /*点击取消按钮*/
  $(".cancel-reply-btn").click(function(event) {
    $(this).parents("li").children(".reply-block").slideToggle();
  });
  /*点击提交回复按钮*/
  $(".send-reply-btn").click(function(event) {
    if ($("#reply-comment-area").val() == "") alert("回复内容不能为空");
    else {
      $(this).parents("li").children(".reply-block").css('display', 'none');
      alert("回复提交成功"); 
      $("#reply-comment-area").val("");     
    }
  });
});

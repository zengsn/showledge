<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common/tag.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="common/head.jsp"%>
<title>消息 - 简随记</title>

<link href="<%=path%>/css/nav.css" rel="stylesheet">
<%-- <link href="<%=path%>/css/message.css" rel="stylesheet">
 --%>

   <link rel="stylesheet" href="css/message-page.css">


<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
	<%@ include file="common/nav.jsp"%>

<div class="container-fluid main-content">
      <div class="row">
        <div class="col-md-3 blank"></div>
        <div class="col-md-6">
          <div class="row">
            <div class="col-md-3 aside">
              <div>
                <!-- Nav tabs -->
                <ul class="nav nav-stack nav-pills" role="tablist">
                  <li role="presentation" class="active">
                    <a href="#letter-list" aria-controls="letter-list" role="tab" data-toggle="tab"><span class="fa fa-envelope-o fa-fw"></span>私信 <span class="badge">10</span></a>
                  </li>
                  <li role="presentation">
                    <a href="#notify-list" aria-controls="notify-list" role="tab" data-toggle="tab"><span class="fa fa-bell-o fa-fw"></span>通知 <span class="badge">2</span></a>
                  </li>
                </ul>
              </div>               
            </div>

            <div class="col-md-9 main">
              <!-- Tab panes fade-->
              <div class="tab-content">
                <div role="tabpanel" class="tab-pane fade in active" id="letter-list">
                  <ul>
                    <li class="box talk-to-you">
                      <a href="personal-page.html" target="_blank"><img src="image/user-avatar1.jpg" alt="用户头像-sm" class="avatar-sm"></a>
                      <span class="to-you"><a href="personal-page.html" target="_blank" class="user-name">飞翔的糖果</a> 对你说：</span>
                      <button class="btn btn-green reply-btn">回复</button>
                      <p>你说的都对，但是我就是不认同你的说法!比如说，我们的业务之一是“二元期权交易”，所谓的二元期权，就是指判断商品未来价格的走势，并据此来获利。如果有人抛出硬币，让你对抛出的结果进行判断，你会觉得这是赌博，因为硬币的正反完全随机。但如果换一种形式，让人们对于黄金、白银、沥青等等期货价格未来的走向作出判断，并以此来下注，人们会产生一种幻觉，以为他们在做期货。对于公司来说，这种生意稳赚不赔，因为每一笔客户的“投资”，无论输赢，公司都会抽成。如果遇上客户手机好，一直赢的话，公司还可以用各种各样的手段作弊。总之，只要能一直骗取客户加入赌局，公司就可以一直赚钱。</p>
                      <p class="comment-time">2017年5月1日 11:35:54</p>
                      <div class="reply-block">
                        <textarea name='reply-comment-area' id='reply-comment-area' class='form-control' rows='4' placeholder='请写下你的回复~'></textarea>
                        <div>
                            <button class='btn btn-green send-reply-btn'>提交回复</button>
                            <button class='btn cancel-reply-btn'>取消</button>
                          </div>
                      </div>
                    </li>
                    <li class="box talk-to-you">
                      <a href="personal-page.html" target="_blank"><img src="image/user-avatar1.jpg" alt="用户头像-sm" class="avatar-sm"></a>
                      <span class="to-you"><a href="personal-page.html" target="_blank" class="user-name">飞翔的粑粑</a> 对你说：</span>
                      <button class="btn btn-green reply-btn">回复</button>
                      <p>因而公司雇了不少人，到网上各处发布一些所谓的分析师文章，这些分析文章可以反复利用，因为鬼才知道黄金白银下一分钟或是第二天的价格走势。员工们需要做的就是，每天到网上各处注册账号，上传西装革履的头像，或者假冒成美女分析师，从文章库中随便找出一篇文章来，标题加上当前最新的热点，比如“王宝强婚变，黄金价格走向何方”之类，到处发布。在文章中，留下联系方式，坐等赌徒们上钩。 </p>
                      <p class="comment-time">2017年5月1日 11:35:54</p>
                      <div class="reply-block">
                        <textarea name='reply-comment-area' id='reply-comment-area' class='form-control' rows='4' placeholder='请写下你的回复~'></textarea>
                        <div>
                            <button class='btn btn-green send-reply-btn'>提交回复</button>
                            <button class='btn cancel-reply-btn'>取消</button>
                          </div>
                      </div>
                    </li>
                  </ul>
                </div><!-- letter-list end -->

                <div role="tabpanel" class="tab-pane fade" id="notify-list">
                  <ul>
                    <li class="box talk-to-you">
                      <a href="personal-page.html" target="_blank"><img src="image/user-avatar1.jpg" alt="用户头像-sm" class="avatar-sm"></a>
                      <span class="to-you">
                        <a href="personal-page.html" target="_blank">用户1</a> 在 《 <a href="note-page.html" target="_blank">笔记名字</a> 》评论道：
                      </span> 
                      <button class="btn btn-green reply-btn">回复</button> 
                      <p>因而公司雇了不少人，到网上各处发布一些所谓的分析师文章，这些分析文章可以反复利用，因为鬼才知道黄金白银下一分钟或是第二天的价格走势。 </p>
                      <p class="comment-time">2017年5月1日 11:35:54</p>
                      <div class="reply-block">
                        <textarea name='reply-comment-area' id='reply-comment-area' class='form-control' rows='4' placeholder='请写下你的回复~'></textarea>
                        <div>
                            <button class='btn btn-green send-reply-btn'>提交回复</button>
                            <button class='btn cancel-reply-btn'>取消</button>
                          </div>
                      </div>
                    </li>
                    <li class="box">
                      <p class="to-you">系统通知 : xxx功能今天上线啦~</p>
                      <p class="comment-time">2017年5月1日 11:35:54</p>
                    </li>
                    <li class="box">
                      <p class="to-you">
                        <a href="personal-page.html" target="_blank">用户1</a> 赞了你的 《 <a href="note-page.html" target="_blank">笔记名字</a> 》
                      </p>  
                      <p class="comment-time">2017年5月1日 11:35:54</p>
                    </li>
                  </ul>
                </div><!-- notify-list -->

              </div> 
            </div>
          </div>         
        </div>
        <div class="col-md-3 blank"></div>
      </div>
    </div>

	<%@ include file="common/common-js.jsp"%>
    <script src="js/message-page.js"></script>
	
</body>
</html>











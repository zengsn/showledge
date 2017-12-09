<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common/tag.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="common/head.jsp"%>
<title>写文章 - 秀知识</title>

<%-- <link href="<%=path%>/css/writer.css" rel="stylesheet">
 --%>
<link href="<%=path%>/css/nav.css" rel="stylesheet">

 <link rel="stylesheet" href="bootstrap-select-1.12.3/dist/css/bootstrap-select.css">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body id="edit-note-page">
	
	<%@ include file="common/nav.jsp"%>	
	
	<!-- 编辑笔记页 #edit-note-page -->
    <div class="container main-content">
      <div class="row">
        <div class="col-md-2 blank"></div>
        <div class="col-md-8 main">
          <div class="row">
            <div class="col-md-1 blank"></div>
            <div class="col-md-10">
             <!-- 警告框 -->   
              <div class="alert alert-success" role="alert">
                保存成功
              </div><!-- 警告框 end --
              <!-- 笔记标题 -->
              <div class="editor-note-title">
                <input id="title" type="text" class="form-control" placeholder="请输入标题">
              </div> 
              <!-- 笔记编辑区域 -->               
              <div id="div1" class="toolbar"></div>
              <div style="padding: 0; color: #ccc"></div>
              <div id="div2" class="note-text"><!--可使用 min-height 实现编辑区域自动增加高度-->                  
              </div>              
            </div>
            <div class="col-md-1 blank"></div>
          </div>
        </div>
        <div class="col-md-2 send-back-btn">
          <a href="follow"><button class="btn btn-green"><span class="fa fa-arrow-left fa-fw"></span>返回</button></a>
          <a href="javascript:;"><button id="send-note-btn" class="btn btn-green">发布<span class="fa fa-caret-down fa-fw"></span></button></a>
          <div id="category-select">
            <form class="form-inline">
              <div class="form-group">
                <label for="category-pick">笔记分类</label>
              </div>
              <div class="form-group">
                 <select id="category-pick" class="selectpicker" data-live-search="true" data-live-search-style="begins" title="笔记分类">
                  <c:forEach items="${essaytype}" var="corpus" varStatus="status">
                  	<option name="${corpus.id }">${corpus.name }</option>
                  </c:forEach>
                </select>
              </div>
            </form>
            <button id="submit" class="btn btn-info">确认发布</button> 
          </div>
        </div>
      </div>
    </div>

	<%@ include file="common/common-js.jsp"%>
	<!-- bootsrtap-select -->
    <script src="bootstrap-select-1.12.3/dist/js/bootstrap-select.js"></script>

    <!-- wangEidtor文本插件（注意， 只需要引用 JS，无需引用任何 CSS） -->
    <script type="text/javascript" src="wangEditor-3.0.3/release/wangEditor.min.js"></script>
    <script type="text/javascript">
        var E = window.wangEditor;
        var editor1 = new E('#div1','#div2');  // 两个参数也可以传入 elem 对象，class 选择器   
        editor1.customConfig.zIndex = 100;
        // 修改菜单栏fixed的上边距（单位 px）
        //editor1.config.menuFixed = true;
        editor1.create();
        
    </script>    

    <!-- 发布按钮js -->
    <script>
      jQuery(document).ready(function($) {
        $("#send-note-btn").click(function(event) {
          $("#category-select").slideToggle();
        });
      });
      $("#category-select").slideToggle();
    </script>

    <script>
      $(function () { $("[data-toggle='tooltip']").tooltip(); });
    </script>
	
	<!-- 警告框js -->
    <script src="js/alert.js"></script>
    
	
</body>
</html>







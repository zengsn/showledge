<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="common/tag.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@include file="common/head.jsp"%>
<title>制作知识地图 - 秀知识</title>

<link href="<%=path%>/css/mindmap.css" rel="stylesheet" />
<link href="<%=path%>/jsmind-master/style/jsmind.css" type="text/css" rel="stylesheet" />

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-10 b">
				<div id="jsmind_container"></div>
				<div style="display:none">
					<input class="file" type="file" id="image-chooser" accept="image/*" />
				</div>
			</div>
		</div>
	</div>

	<%@ include file="common/common-js.jsp"%>
	<script src="<%=path%>/js/mindmap.js"></script>

	<!-- jsmind plugins -->
	<script src="<%=path%>/jsmind-master/js/jsmind.js" type="text/javascript"></script>
	<script src="<%=path%>/jsmind-master/js/jsmind.draggable.js" type="text/javascript"></script>
	<script src="<%=path%>/jsmind-master/js/jsmind.screenshot.js" type="text/javascript"></script>

	<script>
		var _jm = null;
		function open_empty() {
			var mind = {
				/* 元数据，定义思维导图的名称、作者、版本等信息 */
				"meta":{
				    	"name":"",
				        "author":"",
				        "version":"1.0"
				},
				/* 数据格式声明 */
				"format":"node_tree",
				/* 数据内容 */
				"data" : ${kMap.kmapData}
			};

			var options = {
				container : 'jsmind_container',
				theme : 'greensea',
				editable : true
			}

			_jm = new jsMind(options);
			// 让 jm 显示这个 mind 即可
			_jm.show(mind);
		}

		open_empty();
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common/tag.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="common/head.jsp"%>
<title>${kMap.kmapName}-简随记</title>

<link href="<%=path%>/css/user-mindmap.css" rel="stylesheet" />
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
			<div class="col-md-2 a">
				<input id="kmap-id" type="hidden" value="${kMap.id}">
				<input id="path" type="hidden" value="<%=path%>">
				<div id="jsmind_nav">
					<!-- 返回他人主页 -->
					<button type="button" id="back">
						<a href="<%=path%>/users/${kMap.userId}/latest_articles">
							<span class="glyphicon glyphicon-chevron-left"> </span>
							返回
						</a>
					</button>

					<!-- 喜欢按钮 -->
					<c:if test="${kMap.isLike}">
						<div id="like-btn" class="like">
							<span id="heart-icon" class="glyphicon glyphicon-heart"></span>
							<span>喜欢</span>
							<span>|</span>
							<span class="like-count">${kMap.kmapLikeNumber}</span>
					</c:if>
					<c:if test="${!kMap.isLike}">
						<div id="like-btn" class="not-like">
							<span id="heart-icon" class="glyphicon glyphicon-heart-empty"></span>
							<span>喜欢</span>
							<span>|</span>
							<span class="like-count">${kMap.kmapLikeNumber}</span>
					</c:if>
				</div>
				<!-- like end -->

				<!-- mindmap简介 -->
				<div class="intro">
					<h4>地图简介：</h4>
					<p>${kMap.kmapDescribe}</p>
				</div>
				<!-- intro end -->
			</div>
		</div>

		<div class="col-md-10 b">
			<div id="jsmind_container"></div>
			<div style="display:none">
				<input class="file" type="file" id="image-chooser" accept="image/*" />
			</div>
		</div>
	</div>
	</div>

	<%@ include file="common/common-js.jsp"%>
	<script src="<%=path%>/js/user-mindmap.js"></script>

	<!-- jsmind plugins -->
	<script src="<%=path%>/jsmind-master/js/jsmind.js" type="text/javascript"></script>
	<script src="<%=path%>/jsmind-master/js/jsmind.draggable.js" type="text/javascript"></script>
	<script src="<%=path%>/jsmind-master/js/jsmind.screenshot.js" type="text/javascript"></script>

	<script>
		var _jm = null;
		function open_empty() {
			var mind = {
				/* 元数据，定义思维导图的名称、作者、版本等信息 */
				"meta" : {
					"name" : "",
					"author" : "",
					"version" : "1.0"
				},
				/* 数据格式声明 */
				"format" : "node_tree",
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
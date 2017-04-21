<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common/tag.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="common/head.jsp"%>
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
			<div class="col-md-2 a">
				<div id="jsmind_nav">
					<input id="kmap-path" type="hidden" value="<%=path%>">
					
					<!-- 保存按钮 -->
					<button type="button" id="save" data-toggle="modal" data-target="#myModal">保存</button>

					<!-- #myModal模态框 -->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
						<div class="modal-dialog" role="document">
							<!-- 警告框 -->
							<div class="alert alert-success" role="alert">保存成功</div>
							<!-- 警告框 end -->
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="myModalLabel">保存</h4>
								</div>
								<div class="modal-body">
									<form>
										<div class="form-group">
											<label for="recipient-name" class="control-label">地图名称</label>
											<input type="text" class="form-control" id="kmap-name">
										</div>
										<div class="form-group">
											<label for="message-text" class="control-label">说明</label>
											<textarea class="form-control" id="kmap-describe"></textarea>
										</div>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
									<button type="button" class="btn btn-primary" id="finally-save">保存</button>
								</div>
							</div>
						</div>
					</div>

					<div class="edit-list">
						<div class="list-title">打开</div>
						<ul class="edit-btn-list">
							<li>
								<button onclick="open_ajax('<%=path%>');">新建地图</button>
							</li>
							<li>
								<button onclick="screen_shot();">下载截图</button>
							</li>
							<li>
								<button onclick="open_json();">查看例子</button>
							</li>
						</ul>
					</div>
					
					<div class="edit-list">
						<div class="list-title">编辑</div>
						<ul class="edit-btn-list">
							<li>
								<button onclick="toggle_editable(this);">关闭编辑模式</button>
							</li>
							<li>
								<button onclick="add_node();">添加文字节点</button>
							</li>
							<li>
								<button onclick="add_image_node();">添加图片节点</button>
							</li>
							<li>
								<button onclick="move_to_first();">移动节点到最前</button>
							</li>
							<li>
								<button onclick="move_to_last();">移动节点到最后</button>
							</li>
							<li>
								<button onclick="modify_node();">初始化节点</button>
							</li>
							<li>
								<button onclick="remove_node();">删除节点</button>
							</li>
						</ul>
					</div>

					<div class="edit-list">
						<div class="list-title">样式</div>
						<ul class="edit-btn-list">
							<li>
								<button data-toggle="modal" data-target="#fontSize">字体大小</button>
							</li>
							<li>
								<button onclick="change_text_color();">字体颜色</button>
							</li>
							<li>
								<button onclick="change_background_color();">背景颜色</button>
							</li>
							<li>
								<button onclick="change_background_image();">背景图片</button>
							</li>
						</ul>
					</div>
					
					<!-- #fontSize模态框 -->
					<div class="modal fade" id="fontSize" tabindex="-1" role="dialog" aria-labelledby="myFontSize">
						<div class="modal-dialog modal-sm" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="myModalLabel">字体大小</h4>
								</div>
								<div class="modal-body">
									<form>
										<div class="form-group">
											<input type="text" class="form-control" id="font-size-num" placeholder="最小值为12">
										</div>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
									<button type="button" class="btn btn-primary" onclick="change_text_font();">保存</button>
								</div>
							</div>
						</div>
					</div>

					<div class="edit-list">
						<div class="list-title">主题</div>
						<ul class="edit-btn-list">
							<li>
								<select onchange="set_theme(this.value);" style="color:black;margin-left:40px;">
									<option value="">default</option>
									<option value="primary">primary</option>
									<option value="warning">warning</option>
									<option value="danger">danger</option>
									<option value="success">success</option>
									<option value="info">info</option>
									<option value="greensea" selected="selected">greensea</option>
									<option value="nephrite">nephrite</option>
									<option value="belizehole">belizehole</option>
									<option value="wisteria">wisteria</option>
									<option value="asphalt">asphalt</option>
									<option value="orange">orange</option>
									<option value="pumpkin">pumpkin</option>
									<option value="pomegranate">pomegranate</option>
									<option value="clouds">clouds</option>
									<option value="asbestos">asbestos</option>
								</select>
							</li>
						</ul>
					</div>

					<div class="edit-list">
						<div class="list-title">调整</div>
						<ul class="edit-btn-list">
							<li style="margin-left:40px;">节点伸展</li>
							<li>
								<button class="sub" onclick="toggle();">伸展当前节点</button>
							</li>
							<li>
								<button class="sub" onclick="expand_to_level2();">展开到第二层</button>
							</li>
							<li>
								<button class="sub" onclick="expand_to_level3();">展开到第三层</button>
							</li>
							<li>
								<button class="sub" onclick="expand_all();">伸展全部节点</button>
							</li>
							<li>
								<button class="sub" onclick="collapse_all();">闭合所有节点</button>
							</li>
							<li style="margin-left:40px;">放大/缩小</li>
							<button id="zoom-in-button" style="margin-left:40px;width:50px" onclick="zoomIn();">
								In</button>
							<button id="zoom-out-button" style="width:50px" onclick="zoomOut();">Out</button>
						</ul>
					</div>
					
					<button id="info" type="button" class="btn btn-primary" data-toggle="modal"
						data-target=".bs-example-modal-sm">
						<span class="glyphicon glyphicon-question-sign" style="padding-right:5px;"></span>
						操作说明
					</button>
					<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog"
						aria-labelledby="mySmallModalLabel">
						<div class="modal-dialog modal-sm" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title">操作说明</h4>
								</div>
								<div class="modal-body">
									<p>键盘快捷键：</p>
									<p>增加字节点 : Insert</p>
									<p>增加邻节点 : Enter</p>
									<p>更改节点内容 : F2</p>
									<p>删除节点 : Delete</p>
									<p>伸展节点 : Space</p>
									<p>左 : Left</p>
									<p>上 : Up</p>
									<p>右 : Right</p>
									<p>下 : Down</p>
									<hr>
									<p>其他：</p>
									<p>修改节点名称 ：双击鼠标左键</p>
									<p>移动节点 ：按住鼠标左键</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-10 b">
				<div id="jsmind_container"></div>
				<div style="display:none">
					<input class="file" type="file" id="image-chooser" accept="image/*" />
				</div>
				<!-- -->

			</div>
		</div>
	</div>

	<%@ include file="common/common-js.jsp"%>

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
				    "data":${kMap.kmapData}
			};
			
			var options = {
				container : 'jsmind_container',
				theme : 'greensea',
				editable : true
			};
			
			_jm = new jsMind(options);
		    // 让 jm 显示这个 mind 即可
		    _jm.show(mind); 
		}

		function open_json() {
			var mind = {
				"meta" : {
					"name" : "jsMind remote",
					"author" : "hizzgdev@163.com",
					"version" : "0.2"
				},
				"format" : "node_tree",
				"data" : {
					"id" : "root",
					"topic" : "jsMind",
					"children" : [
							{
								"id" : "easy",
								"topic" : "Easy",
								"direction" : "left",
								"children" : [
										{
											"id" : "easy1",
											"topic" : "Easy to show"
										},
										{
											"id" : "easy2",
											"topic" : "Easy to edit"
										},
										{
											"id" : "easy3",
											"topic" : "Easy to store"
										},
										{
											"id" : "easy4",
											"topic" : "Easy to embed"
										},
										{
											"id" : "other3",
											"background-image" : "jsmind-master/example/ant.png",
											"width" : "100",
											"height" : "100"
										} ]
							}, {
								"id" : "open",
								"topic" : "Open Source",
								"direction" : "right",
								"children" : [ {
									"id" : "open1",
									"topic" : "on GitHub",
									"background-color" : "#eee",
									"foreground-color" : "blue"
								}, {
									"id" : "open2",
									"topic" : "BSD License"
								} ]
							}, {
								"id" : "powerful",
								"topic" : "Powerful",
								"direction" : "right",
								"children" : [ {
									"id" : "powerful1",
									"topic" : "Base on Javascript"
								}, {
									"id" : "powerful2",
									"topic" : "Base on HTML5"
								}, {
									"id" : "powerful3",
									"topic" : "Depends on you"
								} ]
							}, {
								"id" : "other",
								"topic" : "test node",
								"direction" : "left",
								"children" : [ {
									"id" : "other1",
									"topic" : "I'm from local variable"
								}, {
									"id" : "other2",
									"topic" : "I can do everything"
								} ]
							} ]
				}
			};
			
			_jm.show(mind);
		}

		function open_ajax(path) {
			window.open(path + "/newmindmap");
		}

		function screen_shot() {
			_jm.screenshot.shootDownload();
		}

		function show_data() {
			var mind_data = _jm.get_data();
			var mind_string = jsMind.util.json.json2string(mind_data);
			prompt_info(mind_string);
		}

		function save_file() {
			var mind_data = _jm.get_data();
			var mind_name = mind_data.meta.name;
			var mind_str = jsMind.util.json.json2string(mind_data);
			jsMind.util.file.save(mind_str, 'text/jsmind', mind_name + '.jm');
		}

		function open_file() {
			var file_input = document.getElementById('file_input');
			var files = file_input.files;
			if (files.length > 0) {
				var file_data = files[0];
				jsMind.util.file.read(file_data, function(jsmind_data,
						jsmind_name) {
					var mind = jsMind.util.json.string2json(jsmind_data);
					if (!!mind) {
						_jm.show(mind);
					} else {
						prompt_info('can not open this file as mindmap');
					}
				});
			} else {
				prompt_info('please choose a file first')
			}
		}

		function select_node() {
			var nodeid = 'other';
			_jm.select_node(nodeid);
		}

		function show_selected() {
			var selected_node = _jm.get_selected_node();
			if (!!selected_node) {
				prompt_info(selected_node.topic);
			} else {
				prompt_info('nothing');
			}
		}

		function get_selected_nodeid() {
			var selected_node = _jm.get_selected_node();
			if (!!selected_node) {
				return selected_node.id;
			} else {
				return null;
			}
		}

		function add_node() {
			var selected_node = _jm.get_selected_node(); // as parent of new node
			if (!selected_node) {
				prompt_info('请首先选择一个节点');
				return;
			}

			var nodeid = jsMind.util.uuid.newid();
			var topic = '* Node_' + nodeid.substr(0, 5) + ' *';
			var node = _jm.add_node(selected_node, nodeid, topic);
		}

		var imageChooser = document.getElementById('image-chooser');

		imageChooser.addEventListener('change', function(event) {
			// Read file here.
			var reader = new FileReader();
			reader.onloadend = (function() {
				var selected_node = _jm.get_selected_node();
				var nodeid = jsMind.util.uuid.newid();
				var topic = undefined;
				var data = {
					"background-image" : reader.result,
					"width" : "100",
					"height" : "100"
				};
				var node = _jm.add_node(selected_node, nodeid, topic, data);
				//var node = _jm.add_image_node(selected_node, nodeid, reader.result, 100, 100);
				//add_image_node:function(parent_node, nodeid, image, width, height, data, idx, direction, expanded){
			});

			var file = imageChooser.files[0];
			if (file) {
				reader.readAsDataURL(file);
			}
			;

		}, false);

		function add_image_node() {
			var selected_node = _jm.get_selected_node(); // as parent of new node
			if (!selected_node) {
				prompt_info('请首先选择一个节点');
				return;
			}

			imageChooser.focus();
			imageChooser.click();
		}

		function modify_node() {
			var selected_id = get_selected_nodeid();
			if (!selected_id) {
				prompt_info('请首先选择一个节点');
				return;
			}

			// modify the topic
			_jm.update_node(selected_id, '--- modified ---');
		}

		function move_to_first() {
			var selected_id = get_selected_nodeid();
			if (!selected_id) {
				prompt_info('请首先选择一个节点');
				return;
			}

			_jm.move_node(selected_id, '_first_');
		}

		function move_to_last() {
			var selected_id = get_selected_nodeid();
			if (!selected_id) {
				prompt_info('请首先选择一个节点');
				return;
			}

			_jm.move_node(selected_id, '_last_');
		}

		function move_node() {
			// move a node before another
			_jm.move_node('other', 'open');
		}

		function remove_node() {
			var selected_id = get_selected_nodeid();
			if (!selected_id) {
				prompt_info('请首先选择一个节点');
				return;
			}

			_jm.remove_node(selected_id);
		}

		function change_text_font() {
			var selected_id = get_selected_nodeid();
			var fontSize = document.getElementById("font-size-num").value;
			console.log(typeof fontSize);
			if (!selected_id) {
				prompt_info('请首先选择一个节点');
				return;
			}

			_jm.set_node_font_style(selected_id, parseInt(fontSize));
		}

		var fontColor;
		function change_text_color() {
			var selected_id = get_selected_nodeid();
			if (!selected_id) {
				prompt_info('请首先选择一个节点');
				return;
			}
			if (fontColor != "#000")
				fontColor = "#000";
			else
				fontColor = "#FFF";
			_jm.set_node_color(selected_id, null, fontColor);
		}

		var backgroundColor;
		function change_background_color() {
			var selected_id = get_selected_nodeid();
			if (!selected_id) {
				prompt_info('请首先选择一个节点');
				return;
			}

			_jm.set_node_color(selected_id, '#eee', null);
		}

		function change_background_image() {
			var selected_id = get_selected_nodeid();
			if (!selected_id) {
				prompt_info('请首先选择一个节点');
				return;
			}

			_jm.set_node_background_image(selected_id,
					'jsmind-master/example/ant.png', 100, 100);
		}

		function set_theme(theme_name) {
			_jm.set_theme(theme_name);
		}

		var zoomInButton = document.getElementById("zoom-in-button");
		var zoomOutButton = document.getElementById("zoom-out-button");

		function zoomIn() {
			if (_jm.view.zoomIn()) {
				zoomOutButton.disabled = false;
			} else {
				zoomInButton.disabled = true;
			}
			;
		};

		function zoomOut() {
			if (_jm.view.zoomOut()) {
				zoomInButton.disabled = false;
			} else {
				zoomOutButton.disabled = true;
			}
			;
		};

		function toggle_editable(btn) {
			var editable = _jm.get_editable();
			if (editable) {
				_jm.disable_edit();
				btn.innerHTML = '开启编辑模式';
			} else {
				_jm.enable_edit();
				btn.innerHTML = '关闭编辑模式';
			}
		}

		// this method change size of container, perpare for adjusting jsmind
		function change_container() {
			var c = document.getElementById('jsmind_container');
			c.style.width = '800px';
			c.style.height = '500px';
		}

		function resize_jsmind() {
			_jm.resize();
		}

		function expand() {
			var selected_id = get_selected_nodeid();
			if (!selected_id) {
				prompt_info('请首先选择一个节点');
				return;
			}

			_jm.expand_node(selected_id);
		}

		function collapse() {
			var selected_id = get_selected_nodeid();
			if (!selected_id) {
				prompt_info('请首先选择一个节点');
				return;
			}

			_jm.collapse_node(selected_id);
		}

		function toggle() {
			var selected_id = get_selected_nodeid();
			if (!selected_id) {
				prompt_info('请首先选择一个节点');
				return;
			}

			_jm.toggle_node(selected_id);
		}

		function expand_all() {
			_jm.expand_all();
		}

		function expand_to_level2() {
			_jm.expand_to_depth(2);
		}

		function expand_to_level3() {
			_jm.expand_to_depth(3);
		}

		function collapse_all() {
			_jm.collapse_all();
		}

		function get_nodearray_data() {
			var mind_data = _jm.get_data('node_array');
			var mind_string = jsMind.util.json.json2string(mind_data);
			prompt_info(mind_string);
		}

		function save_nodearray_file() {
			var mind_data = _jm.get_data('node_array');
			var mind_name = mind_data.meta.name;
			var mind_str = jsMind.util.json.json2string(mind_data);
			jsMind.util.file.save(mind_str, 'text/jsmind', mind_name + '.jm');
		}

		function open_nodearray() {
			var file_input = document.getElementById('file_input_nodearray');
			var files = file_input.files;
			if (files.length > 0) {
				var file_data = files[0];
				jsMind.util.file.read(file_data, function(jsmind_data,
						jsmind_name) {
					var mind = jsMind.util.json.string2json(jsmind_data);
					if (!!mind) {
						_jm.show(mind);
					} else {
						prompt_info('can not open this file as mindmap');
					}
				});
			} else {
				prompt_info('please choose a file first')
			}
		}

		function get_freemind_data() {
			var mind_data = _jm.get_data('freemind');
			var mind_string = jsMind.util.json.json2string(mind_data);
			alert(mind_string);
		}

		function save_freemind_file() {
			var mind_data = _jm.get_data('freemind');
			var mind_name = mind_data.meta.name || 'freemind';
			var mind_str = mind_data.data;
			jsMind.util.file.save(mind_str, 'text/xml', mind_name + '.mm');
		}

		function open_freemind() {
			var file_input = document.getElementById('file_input_freemind');
			var files = file_input.files;
			if (files.length > 0) {
				var file_data = files[0];
				jsMind.util.file.read(file_data, function(freemind_data,
						freemind_name) {
					if (freemind_data) {
						var mind_name = freemind_name;
						if (/.*\.mm$/.test(mind_name)) {
							mind_name = freemind_name.substring(0,
									freemind_name.length - 3);
						}
						var mind = {
							"meta" : {
								"name" : mind_name,
								"author" : "hizzgdev@163.com",
								"version" : "1.0.1"
							},
							"format" : "freemind",
							"data" : freemind_data
						};
						_jm.show(mind);
					} else {
						prompt_info('can not open this file as mindmap');
					}
				});
			} else {
				prompt_info('please choose a file first')
			}
		}

		function prompt_info(msg) {
			alert(msg);
		}

		open_empty();
		
		$(document).ready(function() {
			//侧栏编辑按钮的滑动效果
			$(".list-title").click(function(event) {
				$(this).next('ul').slideToggle();  
				$(".sub").click(function(event) {
					event.preventDefault();
				});
			});

			//保存按钮事件，触发提示框
			$("#finally-save").click(function(event) {
				var mind_data = _jm.get_data();
				var mind_str = jsMind.util.json.json2string(mind_data);
				var kmapPath = $("#kmap-path").val();
				var kmapName = $("#kmap-name").val();
				var kmapDescribe = $("#kmap-describe").val();
				var insertKMapDataPath = kmapPath + "/mindmap/insertKMapData";
				$.post(insertKMapDataPath, {
		            "kmapName": kmapName,
		            "kmapDescribe": kmapDescribe,
		            "data": mind_str
		        },
		        function(result) {
		            if (result && result['success']) {
		            	$('.alert').slideDown();
						var Timer = setTimeout(function(){
						    $('.alert').slideUp();
						}, 2000);
						location.href = kmapPath + "/mindmap/" + result['data'];
		            } else {
		            	$('.alert').removeClass('alert-success');
		        		$('.alert').addClass('alert-danger');
		        		$('.alert').text("保存失败,请刷新页面后重试~");
		            	$('.alert').slideDown();
						var Timer = setTimeout(function(){
						    $('.alert').slideUp();
						}, 2000);
		            }
		        })
				
			});
		});
	</script>
</body>
</html>
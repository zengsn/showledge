$(document).ready(function () {  
///////////////////////////////////////////////////变量定义///////////////////////////////////////////////
	var newNotebookName = "";  //新建文集的名称
	var tempName = "";  //原来文集的名称
	var current_article = $(".active");
	var current_edit_tag_btn = $(".active").find(".edit-article-tag");  //存当前选中的文章的【文章标签按钮】的jq对象

///////////////////////////////////////////////////默认///////////////////////////////////////////////////
	//新建文集的按钮动画
	$('.new-notebook-btn').click(function(event) {
		$('.new-notebook-panel').slideToggle("slow");
	});

	//按 “×” 关闭新建面板
	$('.cancel-btn').click(function(event) {
		$('.new-notebook-panel').css("display","none");
	});


	//按钮active的切换
	$('.one-notebook').click(function (e) {  
		e.preventDefault();  
		$('.one-notebook').removeClass('active');  
		$(this).addClass('active');    
	});
	//按钮active的切换
	$('.one-article').click(function (e) {  
		e.preventDefault();  
		$('.one-article').removeClass('active');  
		$(this).addClass('active');
		current_article = $(this);
		current_edit_tag_btn = $(this).find(".edit-article-tag");  //存当前选中的文章的【文章标签按钮】的jq对象
	});
	//删除文集按钮
	$('.edit-notebook-delete').click(function(event) {
		$(this).parents('li')[1].remove();
	});
	//删除文章按钮
	$('.edit-article-delete').click(function(event) {
		$(this).parents('li')[1].remove();
	});

	//获取文集名称
	$('.edit-notebook').click(function(event) {
		tempName = $(this).prev();  //获取文集名称
	});
	//修改名称的【保存】按钮
	$("#enter-edit-name").click(function(event) {
		//console.log(typeof $(".edit-name").val());
		var newName = $(".edit-name").val();
		tempName.text(newName);
		$(".edit-name").val("");  //input清空
	});

	////////////////////////////修改标签事件/////////////////////////////////
	/*按了模态框的保存按钮以后，根据获取select中的值，来更改这个文章的标签*/
	var current;
	$(".edit-article-tag").unbind('click').click(function(event) {
		//这里的返回值是div.tag-bar。迟点用来获取当前文章的对象，方便之后修改当前文章的标签
		current = $(this).parents(".dropdown").prev().children(".tag-bar");		
	});
	$("#save-tag-btn").unbind('click').click(function(event) {
		current.children("span").eq(1).text($("#select1").val());
		current.children("span").eq(2).text($("#select2").val());
		current.children("span").eq(3).text($("#select3").val());
		$("#select1").val("0");
		$("#select2").val("0");
		$("#select3").val("0");
	});



	////////////////////////////3个select的级联/////////////////////////////////////////////
	$("select[name='level-one']").change(function() {   //*****第一层*****
		var selected_value = $(this).val();
		if (selected_value == "计算机") {

			var font_end = ["HTML", "CSS", "Javascript", "HTML5", "CSS3", "Typescript", "前端安全", "项目实战", "jQuery", "ExtJS", "AngularJS", "ReactJS", "Bootstrap", "React Native", "Backbone", "Three.js", "MooTools", "Compass", "Canvas", "SVG", "WebGL", "Cocos2d-js", "CreateJS", "Flash", "Unreal", "Egret", "Phaser"];     
		    var back_end = ["Python基础", "web2py", "Django", "Flask", "GUI", "数据挖掘与分析", "PHP基础", "YII", "ThinkPHP", "Laravel", "WordPress", "Phalcon", "Apache", "Facebook Hack", "Node.js基础", "express", "Meteor", "Hexo", "C#", "ASP.Net MVC", "Entity Framework", "WPF", "JSP", "Maven", "Spring", "SpringMVC", "Struts2", "MyBatis", "Hibernate", "Lucene", "常用框架", "Ruby基础", "Ruby on Rails", "Grape", "Ruby进阶", "RubyMine", "Go基础", "Revel", "beego", "Erlang"];
		    var mobile = ["Android", "iOS", "Unity3D", "Cocos", "SpriteKit 2D", "Unreal", "Cordova", "React Native"];
		    var data_base = ["MySQL", "MongoDB", "Oracle", "SQL Server", "SQLite", "PostgreSQL", "DB2", "Cassandra", "Redis"];
		    var basic_knowledge = ["C", "C++", "Objective-C", "Swift", "C#", "Java", "Perl", "Shell", "Qt", "Scala", "计算机组成原理", "网络工程", "Word", "Excel", "PowerPoint", "算法基础", "数据结构", "设计模式", "软件工程", "Git/Github", "SVN", "VI", "OpenCL", "Open XML", "OpenGL/GLES"];
		    var big_data = ["OpenStack", "Docker", "CloudStack", "WindowsAzure", "IaaS", "Hadoop", "Storm", "Hive", "Flume", "Kafka", "Zookeeper", "Hbase", "Spark", "信息检索", "数据分析", "VMware", "云平台"];
		    var smart_divice = ["C51", "ARM", "Keil", "Cortex-M", "Cortex-A", "AVR", "RTOS", "Android Wear", "Apple Watchkit", "Arduino", "树莓派", "mbed", "Gokit", "LeMaker Guitar", "无线wife", "移动通信", "蓝牙", "NFC", "传感器", "语音识别", "人脸识别", "手势识别"];		    

		    $("select[name='level-two']").change(function() {  //*****第二层*****

				//被选中的option
		     	var selected_value = $(this).val();
		     	if(selected_value == "select"){
			        $("select[name='level-three']").empty();

			    } else if(selected_value == "前端开发") { //前端
			        $("select[name='level-three']").empty();
			        //循环添加
			        for(var i = 0; i < font_end.length; i++) {
			          var option = $("<option>").val(font_end[i]).text(font_end[i]);
			              $("select[name='level-three']").append(option);
			        }

			    } else if(selected_value == "后端开发") { //后端
			        $("select[name='level-three']").empty();
			        //循环添加
			        for(var i = 0; i < back_end.length; i++) {
			          var option = $("<option>").val(back_end[i]).text(back_end[i]);
			              $("select[name='level-three']").append(option);
			        }

			    } else if(selected_value == "移动开发") { //移动
			        $("select[name='level-three']").empty();
			        //循环添加
			        for(var i = 0; i < mobile.length; i++) {
			          var option = $("<option>").val(mobile[i]).text(mobile[i]);
			              $("select[name='level-three']").append(option);
			        }
			    } else if(selected_value == "数据库") {
			        $("select[name='level-three']").empty();
			        //循环添加
			        for(var i = 0; i < data_base.length; i++) {
			          var option = $("<option>").val(data_base[i]).text(data_base[i]);
			              $("select[name='level-three']").append(option);
			        }
			    } else if(selected_value == "基础知识") {
			        $("select[name='level-three']").empty();
			        //循环添加
			        for(var i = 0; i < basic_knowledge.length; i++) {
			          var option = $("<option>").val(basic_knowledge[i]).text(basic_knowledge[i]);
			              $("select[name='level-three']").append(option);
			        }
			    }  else if(selected_value == "云计算/大数据") {
			        $("select[name='level-three']").empty();
			        //循环添加
			        for(var i = 0; i < big_data.length; i++) {
			          var option = $("<option>").val(big_data[i]).text(big_data[i]);
			              $("select[name='level-three']").append(option);
			        }
			    }  else if(selected_value == "智能硬件/物联网") {
			        $("select[name='level-three']").empty();
			        //循环添加
			        for(var i = 0; i < smart_divice.length; i++) {
			          var option = $("<option>").val(smart_divice[i]).text(smart_divice[i]);
			              $("select[name='level-three']").append(option);
			        }
			    }	    			    
		 	});
		}
	});
	/////////////////////////////////////////////////////////////////////////////////////////////

	//  判断用户是否有填写标签，如果有则保存成功，如果没有则弹出模态框让其选择
	$("#test-btn").unbind('click').click(function(event) {
		if(current_article.find(".tag-bar").children("span").eq(1).text() == ""
			|| current_article.find(".tag-bar").children("span").eq(1).text() == "0" 
			|| current_article.find(".tag-bar").children("span").eq(2).text() == "" 
			|| current_article.find(".tag-bar").children("span").eq(3).text() == "")

			current_edit_tag_btn.trigger('click');  //自动执行点击事件：点击【文章标签按钮】
		else {
			$('.alert').slideDown();
			var Timer = setTimeout(function(){
				$('.alert').slideUp();
			}, 2000);
		}
	});
	


//////////////////////////////////////////////////新建文集按钮///////////////////////////////////////////////////////
/*记得把上面默认功能在拷贝一次添加到新建文集这个部分，新建的文集才有这些功能*/
	//按 “勾” 新建新文集 并关闭新建面板
	$('.enter-btn').click(function(event) {
		$('.new-notebook-panel').css("display","none");
		var newLi = $("<li></li>");
		$('.notebook-list').prepend(newLi);  //新建li
		newLi.addClass('one-notebook');  

		var newDiv = $("<div></div>");
		newLi.append(newDiv);  //新建div.notebook-name
		newDiv.addClass('notebook-name');  

		//获取输入的文集名称
		newNotebookName = $(".new-notebook-name").val();
		$(".new-notebook-name").val("");  //input清空

		var newSpan = $("<span></span>").text(newNotebookName);
		newDiv.append(newSpan);
		var newDiv_EditNotebook = $("<div></div>");
		newSpan.after(newDiv_EditNotebook);
		newDiv_EditNotebook.addClass("dropdown edit-notebook");
		var newSpan_dropdownBtn = $("<span></span>");
		newDiv_EditNotebook.append(newSpan_dropdownBtn);
		newSpan_dropdownBtn.addClass('glyphicon glyphicon-cog');
		newSpan_dropdownBtn.attr({
			"id": "dropdownMenu1",
			"data-toggle": "dropdown",
			"aria-haspopup": "true",
			"aria-expanded": "true"
		});
		var newUl_dropdownMenu = $("<ul></ul>");
		newSpan_dropdownBtn.after(newUl_dropdownMenu);
		newUl_dropdownMenu.attr({
			"class": "dropdown-menu dropdown-menu-right",
			"aria-labelledby": "dropdownMenu1",
		});
		var newLi_editNotebookName = $("<li></li>");
		newLi_editNotebookName.attr({
			'data-toggle': 'modal',
			'data-target': '.bs-example-modal-sm'
		});
		newUl_dropdownMenu.append(newLi_editNotebookName);
		var newA_editNotebookName = $("<a></a>").text("修改名称");
		newLi_editNotebookName.append(newA_editNotebookName);
		newA_editNotebookName.addClass('edit-notebook-name');
		var newSpan_icon_pencil = $("<span></span>");
		newA_editNotebookName.prepend(newSpan_icon_pencil);
		newSpan_icon_pencil.attr({
			"class": "glyphicon glyphicon-pencil",
			"style": "margin-right:10px;"
		});
		var newLi_divider = $("<li></li>");
		newUl_dropdownMenu.append(newLi_divider);
		newLi_divider.attr({
			"class": 'divider',
			"role": 'separator'
		});
		var newLi_editNotebookDelete = $("<li></li>");
		newUl_dropdownMenu.append(newLi_editNotebookDelete);
		var newA_editNotebookDelete = $("<a></a>").text("删除文集");
		newLi_editNotebookDelete.append(newA_editNotebookDelete);
		newA_editNotebookDelete.addClass('edit-notebook-delete');
		var newSpan_icon_trash = $("<span></span>");
		newA_editNotebookDelete.prepend(newSpan_icon_trash);
		newSpan_icon_trash.attr({
			"class": 'glyphicon glyphicon-trashglyphicon glyphicon-trash',
			"style": "margin-right:10px;"
		});

		//按钮active的切换
		$('.one-notebook').click(function (e) {  
			e.preventDefault();  
			$('.one-notebook').removeClass('active');  
			$(this).addClass('active');    
		});
		//按钮active的切换
		$('.one-article').click(function (e) {  
			e.preventDefault();  
			$('.one-article').removeClass('active');  
			$(this).addClass('active');    
		});
		//删除文集按钮
		$('.edit-notebook-delete').click(function(event) {
			$(this).parents('li')[1].remove();
		});

		//获取文集名称
		$('.edit-notebook').click(function(event) {
			tempName = $(this).prev();  //获取文集名称

		});
	});

////////////////////////////////////新建新文章////////////////////////////////////
	$('.new-article-btn').click(function(event) {
		var newLi_oneArticle = $("<li></li>");
		newLi_oneArticle.addClass('one-article');
		$('.article-list').prepend(newLi_oneArticle);
		var newDiv_row = $("<div></div>")
		newDiv_row.addClass('row');
		newLi_oneArticle.append(newDiv_row);

		//left
		var newDiv_left = $("<div></div>");
		newDiv_row.append(newDiv_left);
		newDiv_left.addClass('col-md-3 left');
		var newImg_icon_file = $("<img>");
		newDiv_left.append(newImg_icon_file);
		newImg_icon_file.attr({
			'class': 'icon-file',
			'src': 'icon/file-48px.png',
			'alt': '"icon"'
		});
		var newP_charCount = $('<p></p>').text('字数：0');
		newDiv_left.append(newP_charCount);
		newP_charCount.addClass('char-count');

		//middle
		var newDiv_middle = $("<div></div>").text("无标题文章");
		newDiv_row.append(newDiv_middle);
		newDiv_middle.addClass('col-md-7 article-title');

		//right
		var  newDiv_right = $("<div></div>");
		newDiv_row.append(newDiv_right);
		newDiv_right.attr({
			'class': 'dropdown col-md-2 edit-article right',
			'style': 'height:53px;'
		});
		var newSpan_dropdownBtn2 = $("<span></span>");
		newDiv_right.append(newSpan_dropdownBtn2);
		newSpan_dropdownBtn2.attr({
			'class': 'glyphicon glyphicon-cog',
			'id': 'dropdownMenu2',
			'data-toggle': 'dropdown',
			'aria-haspopup': 'true',
			'aria-expanded': 'true'
		});
		var newUl_dropdownMenu2 = $("<ul></ul>");
		newDiv_right.append(newUl_dropdownMenu2);
		newUl_dropdownMenu2.attr({
			'class': 'dropdown-menu dropdown-menu-right',
			'aria-labelledby': 'dropdownMenu2'
		});
		var newLi_editArticleName = $("<li></li>");
		newUl_dropdownMenu2.append(newLi_editArticleName);
		var newA_editArticleName = $("<a></a>").text("直接发布");
		newLi_editArticleName.append(newA_editArticleName);
		newA_editArticleName.attr({
			'href': '#',
			'class': 'edit-article-name'
		});
		var newSpan_icon_shareAlt = $("<span></span>");
		newA_editArticleName.prepend(newSpan_icon_shareAlt);
		newSpan_icon_shareAlt.attr({
			'class': 'glyphicon glyphicon-share-alt',
			'style': 'margin-right:20px'
		});
		var newLi_divider2 = $("<li></li>");
		newUl_dropdownMenu2.append(newLi_divider2);
		newLi_divider2.attr({
			'role': 'separator',
			'class': 'divider'
		});	
		var newLi_moveArticle = $("<li></li>");
		newUl_dropdownMenu2.append(newLi_moveArticle);
		var newA_moveArticle = $("<a></a>").text("移动文章");
		newLi_moveArticle.append(newA_moveArticle);
		newA_moveArticle.attr({
			'href': '#',
			'class': 'move-article'
		});
		var newSpan_icon_folderOpen = $("<span></span>");
		newA_moveArticle.prepend(newSpan_icon_folderOpen);
		newSpan_icon_folderOpen.attr({
			'class': 'glyphicon glyphicon-folder-open',
			'style': 'margin-right:20px'
		});
		var newLi_divider3 = $("<li></li>");
		newUl_dropdownMenu2.append(newLi_divider3);
		newLi_divider3.attr({
			'role': 'separator',
			'class': 'divider'
		});
		var newLi_edit_article_tag = $("<li></li>");
		newUl_dropdownMenu2.append(newLi_edit_article_tag);
		var newA_edit_article_tag = $("<a></a>").text("文章标签");
		newLi_edit_article_tag.append(newA_edit_article_tag);
		newA_edit_article_tag.attr({
		  'href': '#',
		  'class': 'edit-article-tag',
		  'data-toggle': 'modal',
		  'data-target': '#myModal'
		});
		var newSpan_icon_tag = $("<span></span>");
		newA_edit_article_tag.prepend(newSpan_icon_tag);
		newSpan_icon_tag.attr({
		  'class': 'glyphicon glyphicon-tag',
		  'style': 'margin-right:20px'
		});		
		var newLi_divider4 = $("<li></li>");
		newUl_dropdownMenu2.append(newLi_divider4);
		newLi_divider4.attr({
			'role': 'separator',
			'class': 'divider'
		});	
		var newLi_deleteArticle = $("<li></li>");
		newUl_dropdownMenu2.append(newLi_deleteArticle);
		var newA_deleteArticle = $("<a></a>").text("删除文章");
		newLi_deleteArticle.append(newA_deleteArticle);
		newA_deleteArticle.attr({
			'href': '#',
			'class': 'edit-article-delete'
		});
		var newSpan_icon_Trash2 = $("<span></span>");
		newA_deleteArticle.prepend(newSpan_icon_Trash2);
		newSpan_icon_Trash2.attr({
			'class': 'glyphicon glyphicon-trashglyphicon glyphicon-trash',
			'style': 'margin-right:20px'
		});

		//文章的标签
		var article_tag = $("<div class='tag-bar'><span class='glyphicon glyphicon-tag'></span><span></span><span></span><span></span></div>");
		newDiv_middle.append(article_tag);

		//按钮active的切换
		$('.one-notebook').click(function (e) {  
			e.preventDefault();  
			$('.one-notebook').removeClass('active');  
			$(this).addClass('active');    
		});

		var current_article_1 = $(".active");
		var current_edit_tag_btn_1 = $(".active").find(".edit-article-tag");  //存当前选中的文章的【文章标签按钮】的jq对象		
		//按钮active的切换
		$('.one-article').click(function (e) {  
			e.preventDefault();  
			$('.one-article').removeClass('active');  
			$(this).addClass('active');
			current_article_1 = $(this);
			current_edit_tag_btn_1 = $(this).find(".edit-article-tag");  //存当前选中的文章的【文章标签按钮】的jq对象    
		});

		//删除文章按钮
		$('.edit-article-delete').click(function(event) {
			$(this).parents('li')[1].remove();
		});

		/*按了模态框的保存按钮以后，根据获取select中的值，来更改这个文章的标签*/
		var current1;
		$(".edit-article-tag").unbind('click').click(function(event) {
			//这里的返回值是div.tag-bar。迟点用来获取当前文章的对象，方便之后修改当前文章的标签		
			current1 = $(this).parents(".dropdown").prev().children(".tag-bar");		
		});
		$("#save-tag-btn").unbind('click').click(function(event) {
			current1.children("span").eq(1).text($("#select1").val());
			current1.children("span").eq(2).text($("#select2").val());
			current1.children("span").eq(3).text($("#select3").val());
			$("#select1").val("0");
			$("#select2").val("0");
			$("#select3").val("0");
		});

		//  判断用户是否有填写标签，如果有则保存成功，如果没有则弹出模态框让其选择
		$("#test-btn").unbind('click').click(function(event) {
			if(current_article_1.find(".tag-bar").children("span").eq(1).text() == ""
				|| current_article_1.find(".tag-bar").children("span").eq(1).text() == "0"  
				|| current_article_1.find(".tag-bar").children("span").eq(2).text() == "" 
				|| current_article_1.find(".tag-bar").children("span").eq(3).text() == "")

				current_edit_tag_btn_1.trigger('click');  //自动执行点击事件：点击【文章标签按钮】
			else {
				$('.alert').slideDown();
				var Timer = setTimeout(function(){
					$('.alert').slideUp();
				}, 2000);
			}
		});

	});/*新建文章事件 end*/

});	




















/*
    function changeProvince() {
      var slecctS = document.querySelectorAll(".select");
      var countrys = new Array();
      countrys["0"] = ["--请选择所在省份和地区--"];
      countrys["北京市"] = ["朝阳区", "东城区", "西城区", "海淀区", "宣武区", "丰台区"];
      countrys["上海市"] = ["宝山区", "长宁区", "闵行区", "杨浦区","黄浦区","虹口区","静安区"];
      countrys["广州省"] = ["广州市", "珠海市", "汕头市", "揭阳市", "潮州市", "湛江市"];
      countrys["深圳市"] = ["福田区", "南山区", "宝安区", "龙岗区", "盐田区", "罗湖区"];
      countrys["重庆市"] = ["万州区", "渝中区", "大渡口区", "江北区", "沙坪坝区", "渝北区"];
      countrys["天津市"] = ["和平区", "河东区", "河西区", "南开区", "红桥区", "武清区"];
      var value = slecctS[0].value;
      //option 集合可返回包含 <select> 元素中所有 <option> 的一个数组。
      //注意： 数组中的每个元素对应一个 <option> 标签 - 由 0 起始。 
      slecctS[1].options.length = 0;
      var option;
      for(i = 0; i < countrys[value].length; i++) {
        //new Option("文本","值",true,true)
        //后面两个true分别表示默认被选中和有效!

        option = new Option(countrys[value][i], countrys[value][i]);
        slecctS[1].options.add(option);
        slecctS[1].options.selected=countrys[value][0];
      }
      if(slecctS[0].value == "0") {
        slecctS[1].disabled = true;
      }
      else {
        slecctS[1].disabled = false;
      } 
    }
*/
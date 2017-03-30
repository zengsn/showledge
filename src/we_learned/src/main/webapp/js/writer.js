var corpusId = 0;
var essayId = 0;
var nowEssayId = 0;
var editor = new UE.ui.Editor();
var currentCorpusId = 0;
var currentEssayId = 0;
var currentEssayTagId = 0;
editor.render("container");

//javascript 模块化
var writerJS = {
    //封装相关ajax的url
    URL: {
        createCorpus: function() {
            return 'writer/createCorpus';
        },
        createEssay: function() {
            return 'writer/createEssay';
        },
        updateCorpusName: function() {
            return 'writer/updateCorpusName';
        },
        updateEssay: function() {
            return 'writer/updateEssay';
        },
        getEssayByCorpusId: function() {
            return 'writer/getEssayByCorpusId';
        },
        getEssayContentByEssayId: function() {
            return 'writer/getEssayContentByEssayId';
        },
        deleteCorpusById: function() {
            return 'writer/deleteCorpusById';
        },
        deleteEssayById: function() {
            return 'writer/deleteEssayById';
        },
        selectLabel: function() {
            return 'writer/selectLabel';
        },
    },
    
    //numberMillis 毫秒
    sleep: function (numberMillis) {
       var now = new Date();
       var exitTime = now.getTime() + numberMillis;
       while (true) {
          now = new Date();
          if (now.getTime() > exitTime) {return;}
       }
    },
    
    updateCorpusName: function(corpusId) {
    	currentCorpusId = corpusId;
    },

    //根据文集id获取其下文章列表
    getEssayByCorpusId: function(id, index) {
        $("#corpusListSize_hidden").val(id);
        corpusId = id;
        $("#main_essay_form").hide();
        $("#main_essay_tip").show();
        $.get(writerJS.URL.getEssayByCorpusId(), {
            "corpusId": id
        },
        function(result) {
        	if (result && result['success']) {
            	$("#notes_list_div").html("");
                var count = 0;
                jQuery.each(result['data'],
                function(i, item) {
                	count = i;
                	if (i == 0) {
                        $("#notes_list_div").append(
                        	"<li id=\"essay_li_" + i + "\" class=\"one-article active\">" +
                        	"<div class=\"row\">" + "<div class=\"col-md-4 left\">" + "<img class=\"icon-file\" src=\"icon/file-48px.png\" alt=\"icon\">" + "<p class=\"char-count\">字数：" + item.essayWordNumber + "</p>" + "</div>" +
                        	"<div class=\"col-md-6 article-title\" onclick=\"writerJS.getEssayContentByEssayId('" + item.id + "','" + i + "')\">" + item.essayTitle + "<div id=\"essay-tag-" + item.id +"\" class=\"tag-bar\">" +
                        	"<span class=\"glyphicon glyphicon-tag\"></span><span>&nbsp;" + item.label.firstLabel + "</span><span>&nbsp;" + item.label.secondLabel + "</span><span>&nbsp;" + item.label.thirdLabel + "</span></div></div>" +
							"<div class=\"dropdown col-md-2 edit-article right\" style=\"height:53px;\">" + "<span class=\"glyphicon glyphicon-cog\" id=\"dropdownMenu2\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"true\"></span>" +
							"<ul class=\"dropdown-menu dropdown-menu-right\" aria-labelledby=\"dropdownMenu2\">" + 
							"<li><a href=\"#\" class=\"edit-article-name\">" + "<span class=\"glyphicon glyphicon-share-alt\" style=\"margin-right:20px;\"></span>直接发布</a></li>" +
							"<li role=\"separator\" class=\"divider\"></li>" +
							"<li><a href=\"#\" class=\"move-article\"><span class=\"glyphicon glyphicon-folder-open\" style=\"margin-right:20px;\"></span>移动文章</a></li>" +
							"<li role=\"separator\" class=\"divider\"></li>" +
							"<li><a href=\"#\" class=\"edit-article-tag\" data-toggle=\"modal\" data-target=\"#myModal\" onclick='writerJS.getTag(" + item.id + ");'><span class=\"glyphicon glyphicon-tag\" style=\"margin-right:20px;\"></span>文章标签</a></li>" +
							"<li role=\"separator\" class=\"divider\"></li>" +
							"<li><a href=\"#\" class=\"edit-article-delete\" onclick=\"writerJS.deleteEssayConfirm(" + item.id + ");\"> <span class=\"glyphicon glyphicon-trashglyphicon glyphicon-trash\" style=\"margin-right:20px;\"></span>删除文章</a></li></ul></div></div></li>"
                        );
                    } else {
                    	$("#notes_list_div").append(
                    		"<li id=\"essay_li_" + i + "\" class=\"one-article\">" +
                            "<div class=\"row\">" + "<div class=\"col-md-4 left\">" + "<img class=\"icon-file\" src=\"icon/file-48px.png\" alt=\"icon\">" + "<p class=\"char-count\">字数：" + item.essayWordNumber + "</p>" + "</div>" +
                            "<div class=\"col-md-6 article-title\" onclick=\"writerJS.getEssayContentByEssayId('" + item.id + "','" + i +"')\">" + item.essayTitle + "<div id=\"essay-tag-" + item.id +"\" class=\"tag-bar\">" +
                            "<span class=\"glyphicon glyphicon-tag\"></span><span>&nbsp;" + item.label.firstLabel + "</span><span>&nbsp;" + item.label.secondLabel + "</span><span>&nbsp;" + item.label.thirdLabel + "</span></div></div>" +
    						"<div class=\"dropdown col-md-2 edit-article right\" style=\"height:53px;\">" + "<span class=\"glyphicon glyphicon-cog\" id=\"dropdownMenu2\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"true\"></span>" +
    						"<ul class=\"dropdown-menu dropdown-menu-right\" aria-labelledby=\"dropdownMenu2\">" + 
    						"<li><a href=\"#\" class=\"edit-article-name\">" + "<span class=\"glyphicon glyphicon-share-alt\" style=\"margin-right:20px;\"></span>直接发布</a></li>" +
    						"<li role=\"separator\" class=\"divider\"></li>" +
    						"<li><a href=\"#\" class=\"move-article\"><span class=\"glyphicon glyphicon-folder-open\" style=\"margin-right:20px;\"></span>移动文章</a></li>" + 
    						"<li role=\"separator\" class=\"divider\"></li>" +
    						"<li><a href=\"#\" class=\"edit-article-tag\" data-toggle=\"modal\" data-target=\"#myModal\" onclick='writerJS.getTag(" + item.id + ");'><span class=\"glyphicon glyphicon-tag\" style=\"margin-right:20px;\"></span>文章标签</a></li>" +
    						"<li role=\"separator\" class=\"divider\"></li>" +
    						"<li><a href=\"#\" class=\"edit-article-delete\" onclick=\"writerJS.deleteEssayConfirm(" + item.id + ");\"> <span class=\"glyphicon glyphicon-trashglyphicon glyphicon-trash\" style=\"margin-right:20px;\"></span>删除文章</a></li></ul></div></div></li>"
                       );
                    }
                    $("#essayListSize_hidden").val(count);
                });
            } else {
                alert("获取文章失败,请在刷新页面后重试！");
            }
        })
    },

    //根据文章id获取文章具体内容
    getEssayContentByEssayId: function(id, index) {
        essayId = id;
        var liId = "#essay_li_" + index;
        $.get(writerJS.URL.getEssayContentByEssayId(), {
            "essayId": essayId
        },
        function(result) {
            if (result && result['success']) {
                var essay = result['data'];
                $("#essayIdHidden").val(essay['id']);
                $("#essayTitle").val(essay['essayTitle']);
                if (essay['essayContent'] == null) {
                    editor.setContent("");
                } else {
                    editor.setContent(essay['essayContent']);
                }
                $(".one-article").removeClass("active");
                $(liId).addClass("active");
                $("#main_essay").css("background", "#ffffff");
                $("#main_essay_tip").css("display", "none");
                $("#main_essay_form").css("display", "inline-block");
            } else {
                alert("获取文章内容,请在刷新页面后重试！");
            }
        })
    },

    //删除文集
    deleteCorpusConfirm: function(corpusId) {
    	$.post(writerJS.URL.deleteCorpusById(), {
            "corpusId": corpusId
        },
        function(result) {
            if (result && result['success']) {
                location.href = "writer";
            } else {
                alert("删除失败,请在刷新页面后重试！");
            }
        });
    },

    //删除文章
    deleteEssayConfirm: function(essayId) {
        corpusId = $("#corpusListSize_hidden").val();
        $.post(writerJS.URL.deleteEssayById(), {
            "corpusId": corpusId,
            "essayId": essayId
        },
        function(result) {
        	location.href = "writer";
        });
    },
    
    // 设置修改标签时需要的文章id以及文章列div id
    getTag: function(essayId) {
    	currentEssayId = essayId;
    	currentEssayTagId = "#essay-tag-" + essayId;
    },
}

$(document).ready(function () {  
///////////////////////////////////////////////////变量定义///////////////////////////////////////////////
	var newNotebookName = "";  //新建文集的名称
	var tempName = "";  //原来文集的名称

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
	});
	
	//删除文章按钮
	$('.edit-article-delete').click(function(event) {
		$(this).parents('li')[1].remove();
	});

	//修改名称的【保存】按钮
	$("#enter-edit-name").click(function(event) {
		var newName = $(".edit-name").val();
		$.post(writerJS.URL.updateCorpusName(), {
	           "corpusId": currentCorpusId,
	           "newCorpusName": newName
	       },
	       function(result) {
               if (result && result['success']) {
                   location.href = "writer";
               } else {
	               alert("修改文集名失败,请在刷新页面后重试！");
	               writerJS.updateCorpusNameCancel();
	           }
	       })
	});
	
	//////////////////////////////////////////////////新建文集按钮///////////////////////////////////////////////////////
	/*记得把上面默认功能在拷贝一次添加到新建文集这个部分，新建的文集才有这些功能*/
	//按 “勾” 新建新文集 并关闭新建面板
	$('.enter-btn').click(function(event) {
		//获取输入的文集名称
		var newNoteBookName = $(".new-notebook-name").val();
		if (newNoteBookName != "") {
			$.ajax({
	            type: "POST",
	            // http请求方式
	            url: writerJS.URL.createCorpus(),
	            // 发送给服务器的url
	            data: $("#corpus_form").serialize(),
	            // 发送给服务器的参数
	            dataType: "json",
	            // 告诉JQUERY返回的数据格式(注意此处数据格式一定要与提交的controller返回的数据格式一致,不然不会调用回调函数complete)
	            success: function(result) {
	                if (result && result['success']) {
	                    alert("新建文集成功！");
	                    location.href = "writer";
	                } else {
	                    alert("新建文集失败,请在刷新页面后重试！");
	                }
	            },
	            error: function() {
	                alert("新建文集失败,请检查网络连接");
	            },
	        });
        } else {
        	alert("文集名不能为空！");
        	location.href = "writer";
        };
	});
	
	////////////////////////////////////新建新文章////////////////////////////////////
	$('.new-article-btn').click(function(event) {
		corpusId = $("#corpusListSize_hidden").val();
        $.post(writerJS.URL.createEssay(), {
            "corpusId": corpusId
        },
        function(result) {
            if (result && result['success']) {
            	location.href = "writer";
            } else {
                alert("新建文章失败,请在刷新页面后重试！");
            }
        })
	});
	
	////////////////////////////修改标签事件/////////////////////////////////
	/*按了模态框的保存按钮以后，根据获取select中的值，来更改这个文章的标签*/
	$("#save-tag-btn").unbind('click').click(function(event) {
		var firstLabel = $('#select1').val();
		var secondLabel = $('#select2').val();
		var thirdLabel = $('#select3').val();
		if(firstLabel == 0){
			alert("请选择一级分类~");
			return false;
		}
		if(secondLabel == 0){
			alert("请选择二级分类~");
			return false;
		}
		if(thirdLabel == 0){
			alert("请选择三级分类~");
			return false;
		}
		$.post(writerJS.URL.selectLabel(), {
	           "essayId": currentEssayId,
	           "firstLabel": firstLabel,
	           "secondLabel": secondLabel,
	           "thirdLabel": thirdLabel
	       },
	       function(result) {
            if (result && result['success']) {
            	$(currentEssayTagId).children("span").eq(1).text($("#select1").val());
        		$(currentEssayTagId).children("span").eq(2).text($("#select2").val());
        		$(currentEssayTagId).children("span").eq(3).text($("#select3").val());
        		$("#select1").empty();
        		$("#select2").empty();
        		$("#select3").empty();
        		$("#select1").append("<option value='0'>--&nbsp;一级分类&nbsp;--</option>");
        		$("#select1").append("<option value='计算机'>计算机</option>");
        		$("#select2").append("<option value='0'>--&nbsp;二级分类&nbsp;--</option>"); 
        		$("#select3").append("<option value='0'>--&nbsp;三级分类&nbsp;--</option>");
            } else {
            	alert("登录超时,请重新登录！");
            	location.href = "login";
	           }
	       })
	});

	////////////////////////////3个select的级联/////////////////////////////////////////////
	$("select[name='level-one']").change(function() {   //*****第一层*****
		var selected_value = $(this).val();
		if (selected_value == "计算机") {
			var second_selected = ["前端开发", "后端开发", "移动开发", "数据库", "基础知识", "云计算/大数据", "智能硬件/物联网"];
			
			var font_end = ["HTML", "CSS", "Javascript", "HTML5", "CSS3", "Typescript", "前端安全", "项目实战", "jQuery", "ExtJS", "AngularJS", "ReactJS", "Bootstrap", "React Native", "Backbone", "Three.js", "MooTools", "Compass", "Canvas", "SVG", "WebGL", "Cocos2d-js", "CreateJS", "Flash", "Unreal", "Egret", "Phaser"];     
		    var back_end = ["Python基础", "web2py", "Django", "Flask", "GUI", "数据挖掘与分析", "PHP基础", "YII", "ThinkPHP", "Laravel", "WordPress", "Phalcon", "Apache", "Facebook Hack", "Node.js基础", "express", "Meteor", "Hexo", "C#", "ASP.Net MVC", "Entity Framework", "WPF", "JSP", "Maven", "Spring", "SpringMVC", "Struts2", "MyBatis", "Hibernate", "Lucene", "常用框架", "Ruby基础", "Ruby on Rails", "Grape", "Ruby进阶", "RubyMine", "Go基础", "Revel", "beego", "Erlang"];
		    var mobile = ["Android", "iOS", "Unity3D", "Cocos", "SpriteKit 2D", "Unreal", "Cordova", "React Native"];
		    var data_base = ["MySQL", "MongoDB", "Oracle", "SQL Server", "SQLite", "PostgreSQL", "DB2", "Cassandra", "Redis"];
		    var basic_knowledge = ["C", "C++", "Objective-C", "Swift", "C#", "Java", "Perl", "Shell", "Qt", "Scala", "计算机组成原理", "网络工程", "Word", "Excel", "PowerPoint", "算法基础", "数据结构", "设计模式", "软件工程", "Git/Github", "SVN", "VI", "OpenCL", "Open XML", "OpenGL/GLES"];
		    var big_data = ["OpenStack", "Docker", "CloudStack", "WindowsAzure", "IaaS", "Hadoop", "Storm", "Hive", "Flume", "Kafka", "Zookeeper", "Hbase", "Spark", "信息检索", "数据分析", "VMware", "云平台"];
		    var smart_divice = ["C51", "ARM", "Keil", "Cortex-M", "Cortex-A", "AVR", "RTOS", "Android Wear", "Apple Watchkit", "Arduino", "树莓派", "mbed", "Gokit", "LeMaker Guitar", "无线wife", "移动通信", "蓝牙", "NFC", "传感器", "语音识别", "人脸识别", "手势识别"];		    
		    
		    for(var i = 0; i < second_selected.length; i++) {
		          var option = $("<option>").val(second_selected[i]).text(second_selected[i]);
		              $("select[name='level-two']").append(option);
		        }
		    
		    $("select[name='level-two']").change(function() {  //*****第二层*****
				//被选中的option
		     	var selected_value = $(this).val();
		     	if(selected_value == "select"){
			        $("select[name='level-three']").empty();

			    } else if(selected_value == "前端开发") { //前端
			        $("select[name='level-three']").empty();
			        $("select[name='level-three']").append("<option value='0'>--&nbsp;三级分类&nbsp;--</option>");
			        //循环添加
			        for(var i = 0; i < font_end.length; i++) {
			          var option = $("<option>").val(font_end[i]).text(font_end[i]);
			              $("select[name='level-three']").append(option);
			        }

			    } else if(selected_value == "后端开发") { //后端
			        $("select[name='level-three']").empty();
			        $("select[name='level-three']").append("<option value='0'>--&nbsp;三级分类&nbsp;--</option>");
			        //循环添加
			        for(var i = 0; i < back_end.length; i++) {
			          var option = $("<option>").val(back_end[i]).text(back_end[i]);
			              $("select[name='level-three']").append(option);
			        }

			    } else if(selected_value == "移动开发") { //移动
			        $("select[name='level-three']").empty();
			        $("select[name='level-three']").append("<option value='0'>--&nbsp;三级分类&nbsp;--</option>");
			        //循环添加
			        for(var i = 0; i < mobile.length; i++) {
			          var option = $("<option>").val(mobile[i]).text(mobile[i]);
			              $("select[name='level-three']").append(option);
			        }
			    } else if(selected_value == "数据库") {
			        $("select[name='level-three']").empty();
			        $("select[name='level-three']").append("<option value='0'>--&nbsp;三级分类&nbsp;--</option>");
			        //循环添加
			        for(var i = 0; i < data_base.length; i++) {
			          var option = $("<option>").val(data_base[i]).text(data_base[i]);
			              $("select[name='level-three']").append(option);
			        }
			    } else if(selected_value == "基础知识") {
			        $("select[name='level-three']").empty();
			        $("select[name='level-three']").append("<option value='0'>--&nbsp;三级分类&nbsp;--</option>");
			        //循环添加
			        for(var i = 0; i < basic_knowledge.length; i++) {
			          var option = $("<option>").val(basic_knowledge[i]).text(basic_knowledge[i]);
			              $("select[name='level-three']").append(option);
			        }
			    }  else if(selected_value == "云计算/大数据") {
			        $("select[name='level-three']").empty();
			        $("select[name='level-three']").append("<option value='0'>--&nbsp;三级分类&nbsp;--</option>");
			        //循环添加
			        for(var i = 0; i < big_data.length; i++) {
			          var option = $("<option>").val(big_data[i]).text(big_data[i]);
			              $("select[name='level-three']").append(option);
			        }
			    }  else if(selected_value == "智能硬件/物联网") {
			        $("select[name='level-three']").empty();
			        $("select[name='level-three']").append("<option value='0'>--&nbsp;三级分类&nbsp;--</option>");
			        //循环添加
			        for(var i = 0; i < smart_divice.length; i++) {
			          var option = $("<option>").val(smart_divice[i]).text(smart_divice[i]);
			              $("select[name='level-three']").append(option);
			        }
			    }	    			    
		 	});
		} else {
			$("#select1").empty();
			$("#select2").empty();
			$("#select3").empty();
			$("#select1").append("<option value='0'>--&nbsp;一级分类&nbsp;--</option>");
			$("#select1").append("<option value='计算机'>计算机</option>");
			$("#select2").append("<option value='0'>--&nbsp;二级分类&nbsp;--</option>"); 
			$("#select3").append("<option value='0'>--&nbsp;三级分类&nbsp;--</option>"); 
			$("#select1").val("0");
			$("#select2").val("0");
			$("#select3").val("0");
		}
	});
	
	// 更新文章
	$("#note-button").on({click:function(){
    	$.ajax({
            type: "POST",
            // http请求方式
            url: writerJS.URL.updateEssay(),
            // 发送给服务器的url
            data: $("#note-form").serialize(),
            // 发送给服务器的参数
            dataType: "json",
            // 告诉JQUERY返回的数据格式(注意此处数据格式一定要与提交的controller返回的数据格式一致,不然不会调用回调函数complete)
            success: function(result) {
                if (result && result['success']) {
                	alert("文章发布成功！");
                	location.href = "writer";
                } else {
                	if (result['error'] == "0") {
                		alert("登录超时,请重新登录！");
                    	location.href = "login";
                	} else {
                		var tagBtnId = "#tag-btn-" + result['error'];
                		currentEssayId = result['error'];
                    	currentEssayTagId = "#essay-tag-" + result['error'];
                		$(tagBtnId).trigger("click");
                	}
                }
            },
            error: function() {
                alert("文章发布失败,请检查网络连接");
            },
        }); 
	}})
});	
var corpusId = 0;
var essayId = 0;
var nowEssayId = 0;
var editor = new UE.ui.Editor();
var currentCorpusId = 0;
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
        }
    },

    //显示文集信息框
    showCorpusDefined: function() {
        $("#corpus_defined").slideToggle(); // 垂直方向的显示和隐藏切换
    },
    //隐藏文集信息框
    hideCorpusDefined: function() {
        $("#corpus_defined").slideUp();
    },

    //去除文集显示列所有活动标签
    removeAllCorpusLiCss: function() {
        for (i = 0; i < $("#corpusListSize_hidden").val(); i++) {
            var liId = "#corpus_li_" + i;
            $(liId).removeClass("active");
        };
    },
    //去除文章显示列所有活动标签
    removeAllEssayLiCss: function() {
        for (i = 0; i < $("#essayListSize_hidden").val() + 1; i++) {
            var liId = "#essay_li_" + i;
            $(liId).removeClass("active");
        };
    },

    //新建文章
    createEssay: function() {
        corpusId = $("#corpusListSize_hidden").val();
        $.post(writerJS.URL.createEssay(), {
            "corpusId": corpusId
        },
        function(result) {
            if (result && result['success']) {
                $("#notes_list_div").html("");
                $("#main_essay_form").css("display", "none");
                $("#main_essay").css("background", "#f1f1f1");
                $("#main_essay_tip").css("display", "inline-block");
                var count = 0;
                jQuery.each(result['data'],
                function(i, item) {
                    count = i;
                    if (i == 0) {
                        $("#notes_list_div").append('<ul class="nav nav-list notes ui-sortable">' + '<li id="essay_li_' + i + '" class="one-note active" data-model="note" data-cid="c-2">' + '<i class="icon icon-note note-icon stop-share"></i>' + '<p class="abbreviate"></p>' + '<p class="wordage win-text">字数: ' + item.essayWordNumber + '</p>' + '<a href="javascript:void(0)" data-type="edit" class="note-link title" onclick="writerJS.getEssayContentByEssayId(' + item.id + ',' + i + ')">' + item.essayTitle + '</a>' + '<a href="javascript:void(0)" data-type="share" class="share-note dropdown-toggle" data-toggle="dropdown">' + '<i class="fa fa-gear"></i></a>' + '<ul class="dropdown-menu arrow-top">' + '<li><a href="javascript:void(0)" class="share-link" data-action="open-share-note">' + '<i class="fa fa-share"></i>直接发布</a></li>' + '<li class="divider"></li>' + '<li><a href="javascript:void(0)" data-action="open-move-note"> <i class="fa fa-folder-open"></i>移动文章</a></li>' + '<li><a href="javascript:void(0)" data-action="trigger-history-mode"> <i class="fa fa-clock-o"></i>历史版本</a></li>' + '<li class="divider"></li>' + '<li><a href="javascript:void(0)" data-action="delete-note" onclick="writerJS.deleteEssayConfirm(' + item.id + ',' + item.corpusId + ');"> <i class="fa fa-trash-o"></i>删除文章</a></li></ul></li></ul>');
                    } else {
                        $("#notes_list_div").append('<ul class="nav nav-list notes ui-sortable">' + '<li id="essay_li_' + i + '" class="one-note" data-model="note" data-cid="c-2">' + '<i class="icon icon-note note-icon stop-share"></i>' + '<p class="abbreviate"></p>' + '<p class="wordage win-text">字数: ' + item.essayWordNumber + '</p>' + '<a href="javascript:void(0)" data-type="edit" class="note-link title" onclick="writerJS.getEssayContentByEssayId(' + item.id + ',' + i + ')">' + item.essayTitle + '</a>' + '<a href="javascript:void(0)" data-type="share" class="share-note dropdown-toggle" data-toggle="dropdown">' + '<i class="fa fa-gear"></i></a>' + '<ul class="dropdown-menu arrow-top">' + '<li><a href="javascript:void(0)" class="share-link" data-action="open-share-note">' + '<i class="fa fa-share"></i>直接发布</a></li>' + '<li class="divider"></li>' + '<li><a href="javascript:void(0)" data-action="open-move-note"> <i class="fa fa-folder-open"></i>移动文章</a></li>' + '<li><a href="javascript:void(0)" data-action="trigger-history-mode"> <i class="fa fa-clock-o"></i>历史版本</a></li>' + '<li class="divider"></li>' + '<li><a href="javascript:void(0)" data-action="delete-note" onclick="writerJS.deleteEssayConfirm(' + item.id + ',' + item.corpusId + ');"> <i class="fa fa-trash-o"></i>删除文章</a></li></ul></li></ul>');
                    }
                });
                $("#essayListSize_hidden").val(count);
            } else {
                alert("新建文章失败,请在刷新页面后重试！");
            }
        })
    },

    //显示更改文集名输入框
    updateCorpusName: function(corpusId, corpusName) {
        $("#new_corpus_name").val(corpusName);
        $("#main_div").css("display", "none");
        $("#rename-notebook-modal").css("display", "inline-block");
        currentCorpusId = corpusId;
    },
    //更改文集名确认框,确认后提交更改文集名
    updateCorpusNameConfirm: function() {
        var newCorpusName = $.trim($("#new_corpus_name").val());
        $.post(writerJS.URL.updateCorpusName(), {
            "corpusId": currentCorpusId,
            "newCorpusName": newCorpusName
        },
        function(result) {
            if (result && result['success']) {
                location.href = "writer";
            } else {
                alert("修改文集名失败,请在刷新页面后重试！");
                writerJS.updateCorpusNameCancel();
            }
        })
    },
    //取消后恢复页面
    updateCorpusNameCancel: function() {
        $("#main_div").css("display", "inline-block");
        $("#rename-notebook-modal").css("display", "none");
    },

    //根据文集id获取其下文章列表
    getEssayByCorpusId: function(id, index) {
        $("#corpusListSize_hidden").val(id);
        corpusId = id;
        var liId = "#corpus_li_" + index;
        writerJS.removeAllCorpusLiCss();
        $(liId).addClass("active");
        $.get(writerJS.URL.getEssayByCorpusId(), {
            "corpusId": id
        },
        function(result) {
            if (result && result['success']) {
                $("#notes_list_div").html("");
                $("#main_essay_form").css("display", "none");
                $("#main_essay").css("background", "#f1f1f1");
                $("#main_essay_tip").css("display", "inline-block");
                var count = 0;
                jQuery.each(result['data'],
                function(i, item) {
                    count = i;
                    if (i == 0) {
                        $("#notes_list_div").append('<ul class="nav nav-list notes ui-sortable">' + '<li id="essay_li_' + i + '" class="one-note active" data-model="note" data-cid="c-2">' + '<i class="icon icon-note note-icon stop-share"></i>' + '<p class="abbreviate"></p>' + '<p class="wordage win-text">字数: ' + item.essayWordNumber + '</p>' + '<a href="javascript:void(0)" data-type="edit" class="note-link title" onclick="writerJS.getEssayContentByEssayId(' + item.id + ',' + i + ')">' + item.essayTitle + '</a>' + '<a href="javascript:void(0)" data-type="share" class="share-note dropdown-toggle" data-toggle="dropdown">' + '<i class="fa fa-gear"></i></a>' + '<ul class="dropdown-menu arrow-top">' + '<li><a href="javascript:void(0)" class="share-link" data-action="open-share-note">' + '<i class="fa fa-share"></i>直接发布</a></li>' + '<li class="divider"></li>' + '<li><a href="javascript:void(0)" data-action="open-move-note"> <i class="fa fa-folder-open"></i>移动文章</a></li>' + '<li><a href="javascript:void(0)" data-action="trigger-history-mode"> <i class="fa fa-clock-o"></i>历史版本</a></li>' + '<li class="divider"></li>' + '<li><a href="javascript:void(0)" data-action="delete-note" onclick="writerJS.deleteEssayConfirm(' + item.id + ',' + item.corpusId + ');"> <i class="fa fa-trash-o"></i>删除文章</a></li></ul></li></ul>');
                    } else {
                        $("#notes_list_div").append('<ul class="nav nav-list notes ui-sortable">' + '<li id="essay_li_' + i + '" class="one-note" data-model="note" data-cid="c-2">' + '<i class="icon icon-note note-icon stop-share"></i>' + '<p class="abbreviate"></p>' + '<p class="wordage win-text">字数: ' + item.essayWordNumber + '</p>' + '<a href="javascript:void(0)" data-type="edit" class="note-link title" onclick="writerJS.getEssayContentByEssayId(' + item.id + ',' + i + ')">' + item.essayTitle + '</a>' + '<a href="javascript:void(0)" data-type="share" class="share-note dropdown-toggle" data-toggle="dropdown">' + '<i class="fa fa-gear"></i></a>' + '<ul class="dropdown-menu arrow-top">' + '<li><a href="javascript:void(0)" class="share-link" data-action="open-share-note">' + '<i class="fa fa-share"></i>直接发布</a></li>' + '<li class="divider"></li>' + '<li><a href="javascript:void(0)" data-action="open-move-note"> <i class="fa fa-folder-open"></i>移动文章</a></li>' + '<li><a href="javascript:void(0)" data-action="trigger-history-mode"> <i class="fa fa-clock-o"></i>历史版本</a></li>' + '<li class="divider"></li>' + '<li><a href="javascript:void(0)" data-action="delete-note" onclick="writerJS.deleteEssayConfirm(' + item.id + ',' + item.corpusId + ');"> <i class="fa fa-trash-o"></i>删除文章</a></li></ul></li></ul>');
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
        writerJS.removeAllEssayLiCss();
        $(liId).addClass("active");
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
                $("#main_essay").css("background", "#ffffff");
                $("#main_essay_tip").css("display", "none");
                $("#main_essay_form").css("display", "inline-block");
            } else {
                alert("获取文章内容,请在刷新页面后重试！");
            }
        })
    },

    //删除文集确认框
    deleteCorpusConfirm: function(corpusId) {
        var dialog = jDialog.confirm('此操作将删除此文集及其下的所有文章,确定要删除吗？', {
            handler: function(button, dialog) {
                $.post(writerJS.URL.deleteCorpusById(), {
                    "corpusId": corpusId
                },
                function(result) {
                    if (result && result['success']) {
                        location.href = "writer";
                    } else {
                        alert("删除失败,请在刷新页面后重试！");
                    }
                    dialog.close();
                }) 
            }
        },
        {
            handler: function(button, dialog) {
                dialog.close();
            }
        });
    },

    //删除文章确认框
    deleteEssayConfirm: function(essayId) {
        var dialog = jDialog.confirm('确定要删除此文章吗？', {
            handler: function(button, dialog) {
                corpusId = $("#corpusListSize_hidden").val();
                $.post(writerJS.URL.deleteEssayById(), {
                    "corpusId": corpusId,
                    "essayId": essayId
                },
                function(result) {
                    if (result && result['success']) {
                        $("#notes_list_div").html("");
                        $("#main_essay_form").css("display", "none");
                        $("#main_essay").css("background", "#f1f1f1");
                        $("#main_essay_tip").css("display", "inline-block");
                        var count = 0;
                        jQuery.each(result['data'],
                        function(i, item) {
                            count = i;
                            if (i == 0) {
                                $("#notes_list_div").append('<ul class="nav nav-list notes ui-sortable">' + '<li id="essay_li_' + i + '" class="one-note active" data-model="note" data-cid="c-2">' + '<i class="icon icon-note note-icon stop-share"></i>' + '<p class="abbreviate"></p>' + '<p class="wordage win-text">字数: ' + item.essayWordNumber + '</p>' + '<a href="javascript:void(0)" data-type="edit" class="note-link title" onclick="writerJS.getEssayContentByEssayId(' + item.id + ',' + i + ')">' + item.essayTitle + '</a>' + '<a href="javascript:void(0)" data-type="share" class="share-note dropdown-toggle" data-toggle="dropdown">' + '<i class="fa fa-gear"></i></a>' + '<ul class="dropdown-menu arrow-top">' + '<li><a href="javascript:void(0)" class="share-link" data-action="open-share-note">' + '<i class="fa fa-share"></i>直接发布</a></li>' + '<li class="divider"></li>' + '<li><a href="javascript:void(0)" data-action="open-move-note"> <i class="fa fa-folder-open"></i>移动文章</a></li>' + '<li><a href="javascript:void(0)" data-action="trigger-history-mode"> <i class="fa fa-clock-o"></i>历史版本</a></li>' + '<li class="divider"></li>' + '<li><a href="javascript:void(0)" data-action="delete-note" onclick="writerJS.deleteEssayConfirm(' + item.id + ',' + item.corpusId + ');"> <i class="fa fa-trash-o"></i>删除文章</a></li></ul></li></ul>');
                            } else {
                                $("#notes_list_div").append('<ul class="nav nav-list notes ui-sortable">' + '<li id="essay_li_' + i + '" class="one-note" data-model="note" data-cid="c-2">' + '<i class="icon icon-note note-icon stop-share"></i>' + '<p class="abbreviate"></p>' + '<p class="wordage win-text">字数: ' + item.essayWordNumber + '</p>' + '<a href="javascript:void(0)" data-type="edit" class="note-link title" onclick="writerJS.getEssayContentByEssayId(' + item.id + ',' + i + ')">' + item.essayTitle + '</a>' + '<a href="javascript:void(0)" data-type="share" class="share-note dropdown-toggle" data-toggle="dropdown">' + '<i class="fa fa-gear"></i></a>' + '<ul class="dropdown-menu arrow-top">' + '<li><a href="javascript:void(0)" class="share-link" data-action="open-share-note">' + '<i class="fa fa-share"></i>直接发布</a></li>' + '<li class="divider"></li>' + '<li><a href="javascript:void(0)" data-action="open-move-note"> <i class="fa fa-folder-open"></i>移动文章</a></li>' + '<li><a href="javascript:void(0)" data-action="trigger-history-mode"> <i class="fa fa-clock-o"></i>历史版本</a></li>' + '<li class="divider"></li>' + '<li><a href="javascript:void(0)" data-action="delete-note" onclick="writerJS.deleteEssayConfirm(' + item.id + ',' + item.corpusId + ');"> <i class="fa fa-trash-o"></i>删除文章</a></li></ul></li></ul>');
                            }
                            $("#essayListSize_hidden").val(count);
                        });
                    } else {
                        alert("删除失败,请在刷新页面后重试！");
                    }
                    dialog.close();
                }) 
            }
        },
        {
            handler: function(button, dialog) {
                alert('你点击了取消！');
                dialog.close();
            }
        });
    }
}

//新建文集
$(function() {
    $("#corpus_submit").click(function() {
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
                    alert("新建文集成功");
                    location.href = "writer";
                } else {
                    alert("新建文集失败,请在刷新页面后重试！");
                }
            },
            error: function() {
                alert("新建文集失败,请检查网络连接");
            },
        });
    })
});

//更新文章
$(function() {
    $("#note-button").click(function() {
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
                    var essayIdHidden = $("#essayIdHidden").val();
                    var essayTitle = $("#essayTitle").val();
                    location.href = "success?title=" + essayTitle + "/" + essayIdHidden; // location.href实现客户端页面的跳转
                } else {
                    alert("文章发布失败,请在刷新页面后重试！");
                }
            },
            error: function() {
                alert("文章发布失败,请检查网络连接");
            },
        });
    })
});
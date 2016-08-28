var GLOBAL = {};
GLOBAL.fn = {}; (function($) {
  $(function() {
    var AutoEmail = {
      setting: {},
      createNew: function(param) {
        var _this = this;
        _setting = _this.setting,
        detailsParam = {
          emailList: ["qq.com", "163.com", "126.com", "sina.com", "vip.sina.com", "sina.cn", "hotmail.com", "gmail.com", "sohu.com", "yahoo.com", "139.com", "wo.com.cn", "189.com", "21cn.com"],
          emailAttr: "hz",
          templateId: "login_autoComplete",
          mailKey: "@",
          rule: /\@+.*/
        };
        if (typeof param === "string") {
          param = {
            selector: param
          };
        } else if (typeof param !== "object") return false;
        if (!param.selector) return false;
        _this.setting = $.extend(detailsParam, param);
        var elt = _this.setting.elt = $(detailsParam.selector);

        _this.createTemplate();
        _this.initTemplate();
        _this.initKeyboard();
      },
      createTemplate: function() {
        var _this = this;
        _setting = _this.setting,
        emailList = _setting.emailList,
        promptMessage = _setting.promptMessage,
        emailAttr = _setting.emailAttr,
        templateId = _setting.templateId,
        mailKey = _setting.mailKey;
        var html = '<div class="login_autoComplete" id="' + templateId + '"><ul class="login_auto_ul">';
        if (promptMessage) html += '<li class="login_auto_title">' + promptMessage + '</li>';
        var len = emailList.length;
        for (var i = 0; (i < 1 && i < len); i++) {
          html += '<li class="hover" ' + emailAttr + '="' + mailKey + emailList[i] + '"></li>';
        }
        for (var i = 1; i < len; i++) {
          html += '<li ' + emailAttr + '="' + mailKey + emailList[i] + '"></li>';
        }
        html += '</ul></div>';
        _setting.Template = html;
        return html;
      },
      initTemplate: function() {
        var _this = this;
        _setting = _this.setting,
        elt = _setting.elt,
        strHtml = _setting.Template,
        templateId = _setting.templateId,
        autoLi = "",
        autoComplete = _this.setting.autoComplete = $("#" + templateId);

        if (autoComplete.length == 0) {
          $("body").append(strHtml);
          // set autoComplete
          autoComplete = _this.setting.autoComplete = $("#" + templateId);
          autoComplete.data("elt", elt);
          autoLi = autoComplete.find("li:not(.login_auto_title)");
          autoLi.mouseover(function() {
            var jDom = $(this);
            jDom.siblings().filter(".hover").removeClass("hover");
            jDom.addClass("hover");
          }).mouseout(function() {
            $(this).removeClass("hover");
          }).mousedown(function() {
            var jDom = $(this);
            autoComplete.data("elt").val(jDom.text()).change();
            jDom.parent().parent().hide();
          });
        } else {
          autoComplete.data("elt", elt);
          autoLi = autoComplete.find("li:not(.login_auto_title)");
        }

        var outerWidth = elt.outerWidth();

        autoComplete.css("width", outerWidth - 1);
        // set autoLi
        _this.setting.autoLi = autoLi;
      },
      initKeyboard: function() {
        var _this = this;
        _setting = _this.setting,
        elt = _setting.elt,
        emailAttr = "[" + _setting.emailAttr + "]",
        autoComplete = _setting.autoComplete,
        autoLi = _setting.autoLi,
        mailKey = _setting.mailKey,
        rule = _setting.rule;

        elt.keyup(function(e) {
          if (/13|38|40|116/.test(e.keyCode) || this.value == '') {
            return false;
          }
          var username = this.value;
          if (username.indexOf(mailKey) == -1) {
            autoComplete.hide();
            return false;
          }
          autoLi.each(function() {
            this.innerHTML = username.replace(rule, "") + $(this).attr("hz");
            if (this.innerHTML.indexOf(username) >= 0) {
              $(this).show();
            } else {
              $(this).hide();
            }
          }).filter(".hover").removeClass("hover");
          autoComplete.show().css({
            left: $(this).offset().left,
            top: $(this).offset().top + $(this).outerHeight(true) - 1
          });
          if (autoLi.filter(":visible").length == 0) {
            autoComplete.hide();
          } else {
            autoLi.filter(":visible").eq(0).addClass("hover");
          }
        }).change(function() {
          autoComplete.hide();
        }).keydown(function(e) {
          if (e.keyCode == 38 || e.keyCode == 40 || e.keyCode == 13) {
            var newList = autoLi.filter(":visible"),
            filterHover = newList.filter(".hover");

            if (newList.length <= 0) {
              return false;
            } else if (newList.length == 1) {
              newList.eq(0).addClass("hover");
              if (e.keyCode == 13) { // Enter
                newList.filter(".hover").mousedown();
              }
            } else {
              if (filterHover.length > 0) {
                var len = newList.length - 1;
                if (e.keyCode == 38) { // up
                  newList.each(function(index, dom) {
                    var jDom = $(this);
                    flag = jDom.hasClass("hover");
                    if (flag) {
                      jDom.removeClass("hover");
                      if (index == 0) {
                        newList.eq(len).addClass("hover");
                      } else {
                        newList.eq(index - 1).addClass("hover");
                      }
                      return false;
                    }
                  });
                } else if (e.keyCode == 40) { // down
                  newList.each(function(index, dom) {
                    var jDom = $(this);
                    flag = jDom.hasClass("hover");
                    if (flag) {
                      jDom.removeClass("hover");
                      if (index == len) {
                        newList.eq(0).addClass("hover");
                      } else {
                        newList.eq(index + 1).addClass("hover");
                      }
                      return false;
                    }
                  });
                } else if (e.keyCode == 13) { // Enter
                  newList.filter(".hover").mousedown();
                }
              } else {
                newList.eq(0).addClass("hover");
              }
            }
          }
        }).focus(function() {
          autoComplete.data("elt", $(this));
        });

        if (($.browser.msie) && ($.browser.version == "6.0")) {
          elt.keypress(function(e) {
            if (e.keyCode == 13) {
              var newList = autoLi.filter(":visible"),
              filterHover = newList.filter(".hover");

              if (newList.length <= 0) {
                return false;
              } else if (newList.length == 1) {
                newList.eq(0).addClass("hover");
                if (e.keyCode == 13) { // Enter
                  newList.filter(".hover").mousedown();
                }
              } else {
                if (filterHover.length > 0) {
                  var len = newList.length - 1;
                  if (e.keyCode == 13) { // Enter
                    newList.filter(".hover").mousedown();
                  }
                } else {
                  newList.eq(0).addClass("hover");
                }
              }
            }
          });
        }
      }
    };
    GLOBAL.fn.AutoEmail = AutoEmail;
  });
})(jQuery);

(function($) {
  $(function() {
    GLOBAL.fn.AutoEmail.createNew("#userEmail");
  });
})(jQuery);
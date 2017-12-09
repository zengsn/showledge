<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common/tag.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="common/head.jsp"%>
<title>设置 - 秀知识</title>

<link href="<%=path%>/css/nav.css" rel="stylesheet">

    <link rel="stylesheet" href="css/setting-page.css">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>



<body id="setting-page">
	<%@ include file="common/nav.jsp"%>
	
	 <div class="container-fluid main-content">
      <div class="row">
        <div class="col-md-2 blank"></div>
        <div class="col-md-8">
          <div class="row">
            <div class="col-md-3 aside">
              <div>
                <!-- Nav tabs -->
                <ul class="nav nav-stack nav-pills" role="tablist">
                  <li role="presentation" class="active">
                    <a href="#basic-setting" aria-controls="basic-setting" role="tab" data-toggle="tab"><span class="fa fa-id-badge fa-fw"></span>基础设置</a>
                  </li>
                  <li role="presentation">
                    <a href="#user-profile" aria-controls="user-profile" role="tab" data-toggle="tab"><span class="fa fa-drivers-license-o fa-fw"></span>个人资料</a>
                  </li>
                  <li role="presentation">
                    <a href="#change-password" aria-controls="change-password" role="tab" data-toggle="tab"><span class="fa fa-key fa-fw"></span>修改密码</a>
                  </li>
<!--                   <li role="presentation">
                    <a href="#account-manage" aria-controls="account-manage" role="tab" data-toggle="tab"><span class="fa fa-cog fa-fw"></span>帐号管理</a>
                  </li>
 -->                  <li role="presentation">
                    <a href="#help" aria-controls="help" role="tab" data-toggle="tab"><span class="fa fa-question-circle fa-fw"></span>帮助与反馈</a>
                  </li>
                </ul>
              </div>               
            </div>

            <div class="col-md-9 main">
              <!-- Tab panes fade-->
              <div class="tab-content">
                <div role="tabpanel" class="tab-pane fade in active" id="basic-setting">
                  <form id="personal-form" class="form-horizontal box">
                    <!-- 警告框 -->   
                    <div class="alert alert-success" role="alert">
                      保存成功
                    </div><!-- 警告框 end -->                       
                    <div class="form-group">
	                    <div id="preview">
	                      <img src="${user.userImagePath }" id="current-avatar" alt="用户当前头像">
	                    </div>
                      <div id="current-avatar-input">
                        <label for="input-avatar">更换头像</label>
                        <input id="imgFile" name="imgFile" type="file" id="input-avatar" onchange="settingJS.preview(this, '${user.userImagePath}');">
                      </div>
                    </div>
                    <hr>
                    <div class="form-group">
                      <label for="input-name" class="col-sm-2 control-label">昵称</label>
                      <div id="userName" class="col-sm-10" style="padding-top:5px;">
                        ${user.userName }
                      </div>
                    </div>
                    <hr>
                    <div class="form-group">
                      <label for="input-email" class="col-sm-2 control-label">电子邮箱</label>
                      <div class="col-sm-10" style="padding-top:5px;">
                        ${user.userEmail }
                      </div>
                    </div>
                    <hr>
                    <div class="form-group">
                      <label for="input-tel" class="col-sm-2 control-label">手机</label>
                      <div class="col-sm-10">
                        <input id="userPhone" name="userPhone" type="text" class="form-control" id="input-tel" placeholder="电话号码" value="${user.userPhone }">
                      </div>
                    </div>
                    <hr>
                    <!-- <div class="form-group">
                      <label for="radio1" style="padding-bottom:5px" class="col-sm-2 control-label">语言设置</label>
                      <div id="radio1" class="col-sm-10">
                        <label class="radio-inline">
                          <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1"> 简体中文
                        </label>
                        <label class="radio-inline">
                          <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> 繁体中文
                        </label>
                      </div>
                    </div> -->
                    <hr>                                                     
                    <button type="button" class="btn btn-success btn-lg save" style="margin-left:240px;" onclick="settingJS.updateBasicSetting('<%=path%>');">保存</button>
                  </form>
                </div><!-- basic-setting end -->

                <div role="tabpanel" class="tab-pane fade" id="user-profile">
                  <form class="form-horizontal  box">
                    <!-- 警告框 -->   
                    <div class="alert alert-success" role="alert">
                      保存成功
                    </div><!-- 警告框 end -->   
                    <div class="form-group">
                      <label for="radio2" style="padding-bottom:5px" class="col-sm-2 control-label">性别</label>
                      <div id="radio2" class="col-sm-10">
                        <label class="radio-inline">
                        	<c:if test="${user.userInfo != null && user.userInfo.sex == 1}">
                          	<input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="1" checked="checked"> 男
                          </c:if>
                          <c:if test="${user.userInfo == null || user.userInfo.sex != 1}">
                          	<input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="1"> 男
                          </c:if>
                        </label>
                        <label class="radio-inline">
	                        <c:if test="${user.userInfo != null && user.userInfo.sex == 0}">
	                          <input type="radio" name="inlineRadioOptions" id="inlineRadio4" value="0" checked="checked"> 女
                          </c:if>
                          <c:if test="${user.userInfo == null || user.userInfo.sex != 0}">
                          	<input type="radio" name="inlineRadioOptions" id="inlineRadio4" value="0"> 女
                          </c:if>
                        </label>
                        <label class="radio-inline">
	                        <c:if test="${user.userInfo != null && user.userInfo.sex == 2}">
	                          <input type="radio" name="inlineRadioOptions" id="inlineRadio5" value="2" checked="checked"> 保密
                          </c:if>
                          <c:if test="${user.userInfo == null || user.userInfo.sex != 2}">
	                          <input type="radio" name="inlineRadioOptions" id="inlineRadio5" value="2"> 保密
                          </c:if>
                        </label>
                      </div>
                    </div>
                    <hr>       
                    <div class="form-group">
                      <label for="input-name" class="col-sm-2 control-label">个人简介</label>
                      <div class="col-sm-10">
                        <textarea id="userIntroduce" class="form-control" rows="5" placeholder="填写你的个人简介" >${user.userInfo.introduction }</textarea>
                      </div>
                    </div>
                    <hr>
                    <div class="form-group">
                      <label for="input-address" class="col-sm-2 control-label">居住地</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control" id="location" placeholder="" value="${user.userInfo.location }">
                      </div>
                    </div>
                    <hr>
                    <div class="form-group">
                      <label for="input-graduation" class="col-sm-2 control-label">所在院校</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control" id="yuanxiao" placeholder="" value="${user.userInfo.academy }">
                      </div>
                    </div>
                    <hr>
                    <div class="form-group">
                      <label for="input-website" class="col-sm-2 control-label">个人网站</label>
                      <div class="col-sm-10">
                        <input id="userWeb" type="text" class="form-control" placeholder="http://" value="${user.userInfo.site}">
                      </div>
                    </div>
                    <hr>
                    <button onclick="settingJS.updatePersonalData('<%=path%>');" type="button" class="btn btn-success btn-lg save" style="margin-left:240px;">保存</button>
                  </form>
                </div><!-- user-profile -->

                <div role="tabpanel" class="tab-pane fade" id="change-password">
                  <form class="form-horizontal  box">
                    <!-- 警告框 -->   
                    <div class="alert alert-success" role="alert">
                      修改密码成功
                    </div><!-- 警告框 end -->                    
                    <div class="form-group">
                      <label for="old-password" class="col-sm-2 control-label">原密码</label>
                      <div class="col-sm-10">
                        <input type="password" class="form-control" id="oldPassword">
                      </div>
                    </div>
                    <hr>
                    <div class="form-group">
                      <label for="new-password" class="col-sm-2 control-label">新密码</label>
                      <div class="col-sm-10">
                        <input type="password" class="form-control" id="newPassword">
                      </div>
                    </div>
                    <hr>
                    <div class="form-group">
                      <label for="enter-new-password" class="col-sm-2 control-label">确认新密码</label>
                      <div class="col-sm-10">
                        <input type="password" class="form-control" id="confirmPassword">
                      </div>
                    </div>
                    <hr>       
                    <button type="button" class="btn btn-success btn-lg" onclick="settingJS.updatePassword('<%=path%>');" id="password-enter" style="margin-left:240px;">确定</button>                                                 
                  </form>
                </div><!-- change-password end -->

    <!--             <div role="tabpanel" class="tab-pane fade" id="account-manage">
                  <form class="form-horizontal  box">
                    警告框   
                    <div class="alert alert-success" role="alert">
                      保存成功
                    </div>警告框 end    
                    <div class="form-group">
                      <label for="logout-account" class="col-sm-2 control-label">注销帐号</label>
                      <div class="col-sm-10">
                        <button type="submit" class="btn btn-default " id="logout-account">注销帐号</button>
                      </div>
                    </div>
                    <hr>
                    <div class="form-group">
                      <label for="delete-account" class="col-sm-2 control-label">删除帐号</label>
                      <div class="col-sm-10">
                        <button type="submit" class="btn btn-danger " id="delete-account">删除帐号</button>
                      </div>
                    </div>
                    <hr>                
                  </form>
                </div>accuont-manage
 -->
                <div role="tabpanel" class="tab-pane fade" id="help">
                  <div class="box">
                    <p>
                      联系邮箱17727217027@163.com
                    </p>
                  </div>                 
                </div><!-- help end -->
              </div> 
            </div>
          </div>         
        </div>
        <div class="col-md-2 blank"></div>
      </div>
    </div>`


	<%@ include file="common/common-js.jsp"%>
	    <!-- 警告框js -->
    <script src="js/alert.js"></script>
    <script src="js/setting-page.js"></script>
	<script src="<%=path%>/js/setting.js"></script>
</body>
</html>
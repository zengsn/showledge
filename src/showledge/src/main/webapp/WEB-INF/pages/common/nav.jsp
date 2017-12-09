<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:if test="${userIdInSession == null}">
	<!--顶部导航条 -->
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container-fluid">
        <!-- 响应式 当窗口很小时，会缩小成一个“汉堡”按钮 -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="index">秀知识</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav">
            <li><a href="<%=path%>/index.do"><span class="fa fa-home fa-fw"></span>主页</a></li>
            <li><a href="/show-wechat-app.html" target="_blank"><span class="fa fa-wechat fa-fw"></span>小程序</a></li>
          </ul>
          <form class="navbar-form navbar-left">
            <div class="form-group">
            	<input id="searchKeyword" name="searchKeyword" type="search" class="form-control"
							placeholder="Search"
							onkeypress="if(event.keyCode==13) {searchJS.search('<%=path%>');return false;}">
            </div>
            <button type="submit" class="btn btn-default" onclick="searchJS.search('<%=path%>');">搜索</button>
          </form>
          <ul class="nav navbar-nav navbar-right">
            <!-- 登录注册按钮 -->
            <li>
              <form class="navbar-form">
                <button type="button" id="sign-inup-btn" class="btn btn-primary" data-toggle="modal" data-target="#sign-inup-modal">登录 / 注册</button>
              </form>
            </li>
            <!--
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="#">Action</a></li>
                <li><a href="#">Another action</a></li>
                <li><a href="#">Something else here</a></li>
                <li role="separator" class="divider"></li>
                <li><a href="#">Separated link</a></li>
              </ul>
            </li>
            -->
          </ul>
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container-fluid -->
    </nav>
    
    <!-- 登录 / 注册 模态框 -->
    <div class="modal fade" id="sign-inup-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <!-- 右上角关闭按钮 -->
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h1>秀知识</h1>
            <h4>Show your knowledge</h4>
          </div>
          <div class="modal-body">  
            <!-- 登录/注册标签页按钮 -->
            <ul id="myNav" class="nav nav-pills" role="tablist">
              <li role="presentation" class="active"><a class="wLi" href="#signin"  aria-controls="home" role="tab" data-toggle="tab">登录</a></li>
              <li role="presentation" ><a href="#signup" class="wLi" aria-controls="profile" role="tab" data-toggle="tab">注册</a></li>
            </ul>

            <!-- 警告框 -->   
            <div class="alert alert-success" role="alert">
              保存成功
            </div><!-- 警告框 end -->   
                             
            <!-- 登录/注册 标签页 -->
            <div class="tab-content">
              <!-- 登录标签页 -->
              <div role="tabpanel" class="tab-pane fade in active" id="signin">
                <!-- 登录表单 -->
                <form class="form-horizontal" id="signin-form">
                  <div class="form-group">
                    <label for="inputEmail1" class="col-sm-2 control-label">邮箱</label>
                    <div class="col-sm-9">
                      <input  id="userEmail" type="email"  name="userEmail" value="${userEmail}" class="form-control" id="inputEmail1" placeholder="邮箱">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputPassword1" class="col-sm-2 control-label">密码</label>
                    <div class="col-sm-9">
                      <input  id="userPassword" value="${userPassword}"  name="userPassword"  type="password" class="form-control"  placeholder="密码">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputCheckNum" class="col-sm-2 control-label">验证码</label>
                    <div class="col-sm-6">
                      <input type="text" class="form-control" placeholder="验证码"  id="kaptcha" name="kaptcha" >      
                    </div>
                    <div class="col-sm-3"><img id="kaptchaImage" src="<%=path%>/login/getKaptchaImage.do"
											style="margin-bottom: -3px;padding-left:14px;width: 100px;height: 34px"
											onclick="loginJS.changeCode(1);" /></div>
                  </div>
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                      <div class="forget-password">
                        <!-- <a href="javascript:;" >忘记密码</a> -->
                       </div>
                        <button type="button"  id="login-btn" class="btn btn-default btn-lg" style="font-size:16px;float:right;margin-right:50px;" onclick="loginJS.checkLogin();">登录</button>
                    </div>
                  </div>
                </form>
                <!-- 登录表单结束 -->
              </div>
              <!-- 注册标签页 -->
              <div role="tabpanel" class="tab-pane fade" id="signup">
                <!-- 注册表单 -->
                <form class="form-horizontal" id="signup-form">
                  <div class="form-group">
                    <label for="inputEmail2" class="col-sm-2 control-label">注册邮箱</label>
                    <div class="col-sm-9">
                      <input class="form-control"  id="userEmail2" name="userEmail" type="email" placeholder="邮箱">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputEmail2" class="col-sm-2 control-label">昵称</label>
                    <div class="col-sm-9">
                      <input class="form-control"   id="userName" name="userName" type="text"  placeholder="昵称">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputPassword2" class="col-sm-2 control-label">登录密码</label>
                    <div class="col-sm-9">
                      <input class="form-control"  id="userPassword2" name="userPassword" type="password"  placeholder="Password">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">确认密码</label>
                    <div class="col-sm-9">
                      <input type="password" class="form-control" id="userPassword3" placeholder="Password">
                    </div>
                  </div>                  
                  <div class="form-group">
                    <label for="inputCheckNum2" class="col-sm-2 control-label">验证码</label>
                    <div class="col-sm-6">
                      <input type="text" class="form-control" id="uCode" placeholder="验证码">      
                    </div>
                    <div class="col-sm-3">
	                    <img id="kaptchaImage2" src="<%=path%>/login/getKaptchaImage.do"
												style="margin-bottom: -3px;padding-left:14px;width: 100px;height: 34px"
												onclick="loginJS.changeCode(2);" />
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                      <label>点击「注册」按钮，即代表你同意<a href="javascript:;" >《秀知识协议》</a></label>
                      <button type="button" id="signup-btn" class="btn btn-default btn-lg" style="font-size:16px;float:right;margin-right:50px;"  onclick="registerJS.checkRegister()">注册</button>
                    </div>
                  </div>
                </form>
                <!-- 注册表单结束 -->                                
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script src="js/login.js" type="text/javascript"></script>
    <script src="js/register.js" type="text/javascript"></script>
</c:if>

<c:if test="${userIdInSession != null}">
	<!--顶部导航条 -->
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container-fluid">
        <!-- 响应式 当窗口很小时，会缩小成一个“汉堡”按钮 -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="index">秀知识</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav">
            <li><a href="<%=path%>/index.do"><span class="fa fa-home fa-fw"></span>主页</a></li>
             <li><a href="/follow.do"><span class="fa fa-user-circle fa-fw"></span>榜样动态</a></li>
            <li><a href="/show-wechat-app.html" target="_blank"><span class="fa fa-wechat fa-fw"></span>小程序</a></li>
          </ul>
          <form class="navbar-form navbar-left">
            <div class="form-group">
            <input id="searchKeyword" name="searchKeyword" type="search" class="form-control"
							placeholder="用户、笔记"
							onkeypress="if(event.keyCode==13) {searchJS.search('<%=path%>');return false;}">
            </div>
            <button type="submit" class="btn btn-default"  onclick="searchJS.search('<%=path%>');">搜索</button>
          </form>
          <ul class="nav navbar-nav navbar-right">
            <!-- 登录注册按钮 -->
            <li>
              <a style="padding:8px 18px 7px 18px" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"><img src="<%=path%>/${sessionScope.user.userImagePath}" alt="用户头像-sm" class="avatar-ssm"></a>
              <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                <li><a href="<%=path%>/user.do" target="_blank"><img src="/icon/user.png" alt="icon" style="margin-left:5px;">我的主页</a></li>
                <li><a href="/help.html" target="_blank"><img src="<%=path%>/icon/message.png" alt="icon">帮助</a></li>
                <li><a href="<%=path%>/settings.do" target="_blank"><img src="<%=path%>/icon/setting.png" alt="icon">设置</a></li>
                <li role="<%=path%>/separator.do" class="divider"></li>
                <li><a href="<%=path%>/logout.do"><img src="/icon/power.png" alt="icon">退出帐号</a></li>
              </ul>              
            </li>
            <li>
				<span class="write-article-btn">
					<a href="<%=path%>/writer.do" class="btn btn-success write-article-btn-a">写笔记</a>
				</span>
			</li>
          </ul>
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container-fluid -->
  </nav>
</c:if>








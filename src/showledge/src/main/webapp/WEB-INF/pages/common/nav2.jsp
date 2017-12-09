<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:if test="${userIdInSession == null}">
	<!--顶部导航栏-->
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="<%=path%>/index" style="color:#00cc66">Showledge</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav" style="margin-left:68px">
					<li class="active">
						<a href="<%=path%>/index">首页</a>
					</li>
					<li>
						<a href="#">下载APP</a>
					</li>
				</ul>
				<form class="navbar-form navbar-left" role="search">
					<div class="form-group">
						<input id="searchKeyword" name="searchKeyword" type="search" class="form-control"
							placeholder="Search"
							onkeypress="if(event.keyCode==13) {searchJS.search('<%=path%>');return false;}">
					</div>
					<button type="submit" class="btn btn-default" onclick="searchJS.search('<%=path%>');">搜索</button>
				</form>
				<ul class="nav navbar-nav navbar-right">
					<li>
						<a href="<%=path%>/login">登录</a>
					</li>
					<li>
						<a href="<%=path%>/register">注册</a>
					</li>
					<li>
						<span class="write-article-btn">
							<a href="<%=path%>/writer" class="btn btn-success write-article-btn-a">写文章</a>
						</span>
					</li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
</c:if>

<c:if test="${userIdInSession != null}">
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="<%=path%>/index" style="color:#00cc66">Showledge</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav" style="margin-left:68px">
					<li>
						<a href="<%=path%>/index">发现</a>
					</li>
					<li>
						<a href="message">
							消息
							<c:if test="${messageNotReadNumber != 0}">
								<span id="message-not-read-number" class="badge" style="margin-left: 0px;">${messageNotReadNumber}</span>
							</c:if>
						</a>
					</li>
					<li>
						<a href="#">下载APP</a>
					</li>
				</ul>
				<form class="navbar-form navbar-left" role="search">
					<div class="form-group">
						<input id="searchKeyword" name="searchKeyword" type="search" class="form-control"
							placeholder="Search"
							onkeypress="if(event.keyCode==13) {searchJS.search('<%=path%>');return false;}">
					</div>
					<button type="submit" class="btn btn-default" onclick="searchJS.search('<%=path%>');">搜索</button>
				</form>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="<%=path%>/user" class="dropdown-toggle" data-toggle="dropdown">
							<img class="user-avatar" src="<%=path%>/${userImagePathInSession}" alt="用户头像">
							<span class="caret"></span>
						</a>
						<ul class="dropdown-menu" role="menu">
							<li>
								<a href="<%=path%>/user">
									<img class="navbar-icon" src="<%=path%>/icon/navbar-icon/user.png" alt="icon">
									&nbsp;&nbsp;我的主页
								</a>
							</li>
							<li>
								<a href="#">
									<img class="navbar-icon" src="<%=path%>/icon/navbar-icon/message.png" alt="icon">
									&nbsp;消息
								</a>
							</li>
							<li>
								<a href="<%=path%>/settings">
									<img class="navbar-icon" src="<%=path%>/icon/navbar-icon/setting.png" alt="icon">
									&nbsp;设置
								</a>
							</li>
							<li class="divider"></li>
							<li>
								<a href="<%=path%>/logout">
									<img class="navbar-icon" src="<%=path%>/icon/navbar-icon/power.png" alt="icon">
									&nbsp;退出
								</a>
							</li>
						</ul>
					</li>
					<li>
						<span class="write-article-btn">
							<a href="<%=path%>/writer" class="btn btn-success write-article-btn-a">写文章</a>
						</span>
					</li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
</c:if>






<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- aside -->
<div class="user-aside span3">
	<div class="people">
		<div class="basic-info">
			<div class="avatar">
				<img src="<%=path%>/${user.userImagePath}" alt="100">
			</div>
			<h3>
				<a href="<%=path%>/users/${user.id}/latest_articles">${user.userName}</a>
			</h3>
			<c:if test="${user.userName != userNameInSession}">
				<div class="btn-group">
					<c:if test="${!user.isFocused}">
						<div id="focus_at_users" class="btn btn-small btn-success follow">
							<a id="focus_at_users_a" href="javascript:void(0)" hidefocus="true" onFocus="this.blur()"
								onclick="subscribeJS.addFocusAtUsers(${user.id}, '<%=path%>');">
								<i id="focus_at_users_i" class="fa fa-plus"></i>
								<span> 添加关注</span>
							</a>
						</div>
						<a id="focus_at_users_ul" class="btn btn-small btn-list btn-success" data-toggle="dropdown"
							href="javascript:void(0)" hidefocus="true" onFocus="this.blur()">
							<i class="fa fa-bars"></i>
						</a>
						<ul class="dropdown-menu arrow-top" role="menu" aria-labelledby="dLabel">
							<li>
								<a href="javascript:void(0)" hidefocus="true" onFocus="this.blur()">
									<i class="fa fa-fw fa-envelope"></i>
									写简信
								</a>
							</li>
							<li class="divider"></li>
							<li>
								<a id="" data-remote="true" rel="nofollow" data-method="post" href="javascript:void(0)"
									hidefocus="true" onFocus="this.blur()">
									<i class="fa fa-fw fa-lock"></i>
									加入黑名单
								</a>
							</li>
							<li class="dropdown-submenu" data-js-module="report">
								<a href="javascript:void(0)" hidefocus="true" onFocus="this.blur()">
									<i class="fa fa-fw fa-flag-o"></i>
									举报用户
								</a>
								<ul class="dropdown-menu">
									<li>
										<a data-type="json" data-remote="true" rel="nofollow" data-method="post" href="">广告或垃圾信息</a>
									</li>
									<li>
										<a data-type="json" data-remote="true" rel="nofollow" data-method="post" href="">抄袭或未授权转载</a>
									</li>
									<li>
										<a data-toggle="modal" href="">其他</a>
									</li>
								</ul>
							</li>
						</ul>
					</c:if>
					<c:if test="${user.isFocused}">
						<div id="focus_at_users" class="btn btn-small follow following">
							<a id="focus_at_users_a" href="javascript:void(0)" hidefocus="true" onFocus="this.blur()"
								onclick="subscribeJS.removeFocusAtUsers(${user.id}, '<%=path%>');">
								<i id="focus_at_users_i" class="fa fa-check"></i>
								正在关注
							</a>
						</div>
						<a id="focus_at_users_ul" class="btn btn-small btn-list" data-toggle="dropdown"
							href="javascript:void(0)" hidefocus="true" onFocus="this.blur()">
							<i class="fa fa-bars"></i>
						</a>
						<ul class="dropdown-menu arrow-top" role="menu" aria-labelledby="dLabel">
							<li>
								<a href="javascript:void(0)" hidefocus="true" onFocus="this.blur()">
									<i class="fa fa-fw fa-envelope"></i>
									写简信
								</a>
							</li>
							<li class="divider"></li>
							<li>
								<a id="" data-remote="true" rel="nofollow" data-method="post" href="javascript:void(0)"
									hidefocus="true" onFocus="this.blur()">
									<i class="fa fa-fw fa-lock"></i>
									加入黑名单
								</a>
							</li>
							<li class="dropdown-submenu" data-js-module="report">
								<a href="javascript:void(0)" hidefocus="true" onFocus="this.blur()">
									<i class="fa fa-fw fa-flag-o"></i>
									举报用户
								</a>
								<ul class="dropdown-menu">
									<li>
										<a data-type="json" data-remote="true" rel="nofollow" data-method="post" href="">广告或垃圾信息</a>
									</li>
									<li>
										<a data-type="json" data-remote="true" rel="nofollow" data-method="post" href="">抄袭或未授权转载</a>
									</li>
									<li>
										<a data-toggle="modal" href="">其他</a>
									</li>
								</ul>
							</li>
						</ul>
					</c:if>
				</div>
			</c:if>
			<div class="about">
				<p class="intro">${user.userIntroduce}</p>
				<c:if test="${user.userName == userNameInSession}">
					<a id="user_introduce_click" class="edit-intro blue-link" href="javascript:void(0)"
						onclick="userJS.showUserForm();">编辑个人介绍</a>
					<form id="user_form" class="intro-form" data-type="json" action="" accept-charset="UTF-8"
						method="post">
						<input id="userName" name="userName" placeholder="" type="text" value="${user.userName}">
						<p id="error_message" class="form-error-message hide"></p>
						<textarea id="userIntroduce" name="userIntroduce">${user.userIntroduce}</textarea>
						<input id="user_form_button" type="button" value="保存" class="btn btn-info"
							onclick="userJS.updateUser();">
						<a class="btn cancel" href="javascript:void(0)" onclick="userJS.hideUserForm();">取消</a>
					</form>
				</c:if>
			</div>
			<div class="sns"></div>
		</div>
		<div class="user-stats">
			<ul class="clearfix">
				<li>
					<a href="<%=path%>/users/${user.id}/subscriptions">
						<b>${user.userFocusNumber}</b> <span>关注</span>
					</a>
				</li>
				<li>
					<a href="<%=path%>/users/${user.id}/followers">
						<b>${user.userFansNumber}</b> <span>粉丝</span>
					</a>
				</li>
				<br>
				<li>
					<a href="<%=path%>/users/${user.id}/latest_articles">
						<b>${user.userEssayNumber}</b> <span>文章</span>
					</a>
				</li>
				<li>
					<a href="javascript:void(0)">
						<b>${user.userWordsNumber}</b> <span>字数</span>
					</a>
				</li>
				<li>
					<a href="javascript:void(0)">
						<b>${user.userLikesNumber}</b> <span>收获喜欢</span>
					</a>
				</li>
			</ul>
		</div>
	</div>
	<div class="my-books">
		<h5 class="title">我的文集：</h5>
		<ul class="unstyled">
			<c:forEach items="${corpusList}" var="corpus">
				<li>
					<a class="fa fa-book" href="<%=path%>/notebooks/${corpus.id}/latest" hidefocus="true"
						onFocus="this.blur()"> ${corpus.corpusName}</a>
				</li>
			</c:forEach>
		</ul>
	</div>
</div>
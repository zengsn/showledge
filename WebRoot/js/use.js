Vue
		.component(
				'my-min-sidebar-switch',
				{
					props : [ 'my-href' ],
					template : '<div class="navbar-user">'
							+ '<a class="login" data-signup-link="true" data-toggle="modal" href="register.html">'
							+ '<i class="fa fa-user"></i> 注册 </a>'
							+ '<a class="login" data-signin-link="true" data-toggle="modal" href="login.html">'
							+ '<i class="fa fa-sign-in"></i> 登录 </a>'
							+ '<a class="daytime set-view-mode pull-right" href="javascript:void(0)">'
							+ '<i class="fa fa-moon-o"></i></a></div>'

				})
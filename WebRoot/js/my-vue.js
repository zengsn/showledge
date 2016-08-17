window.onload = function() {
	// 在这里面写Vue.js代码
	// 定义
	// 登录、注册页面侧边栏
	Vue.component('my-min-sidebar', {
		template : '<div class="navbar navbar-jianshu expanded">'
			+ '<div class="dropdown">'
			+ '<a class="active logo" role="button" href="index.html"'
			+ 'data-original-title="个人主页" data-container="div.expanded"><b>简</b>'
			+ '<I class="fa fa-home"></I><span class="title">首页</span> </a>'
			+ '<a href="" data-original-title="专题"'
			+ 'data-toggle="tooltip" data-container="div.expanded"'
			+ 'data-placement="right"><I class="fa fa-th"></I>'
			+ '<span class="title">专题</span> </a>'
			+ '<a class="ad-selector" href=""><i class="fa fa-mobile"></i>'
			+ '<span class="title">下载手机应用</span> </a></div>'
			+ '<div class="nav-user">' 
			+ '<a href="" data-toggle="modal">'
			+ '<i class="fa fa-font"></i><span class="title">显示模式</span></a></div></div>'	
	})
	// 登录、注册页面上部的切换选项
	Vue.component('my-switch-bar', {
		template : '<div class="navbar-user">'
			+ '<a class="login" href="register.html" data-toggle="modal"'
		    + 'data-signup-link="true"><I class="fa fa-user"></I> 注册 </a>'
		    + '<a class="login" href="login.html" data-toggle="modal"'
		    + 'data-signin-link="true"><I class="fa fa-sign-in"></I> 登录 </a> </div>'
	})
	// 登录、注册页面选择登录方式
	Vue.component('my-switch-login-bar', {
		template : '<div class="login-sns"><p>您还可以通过以下方式直接登录</p><ul class="login-sns">'
			+ '<li class="weibo"><a href="http://www.jianshu.com/users/auth/weibo"><i class="fa fa-weibo"></i></a></li>'
			+ '<li class="qq"><a href="http://www.jianshu.com/users/auth/qq_connect"><i class="fa fa-qq"></i></a></li>'
			+ '<li class="google"><a href="http://www.jianshu.com/users/auth/google_oauth2"><i class="fa fa-google-plus"></i></a></li>'
			+ '<li class="wechat"><a href="http://www.jianshu.com/users/auth/wechat"><i class="fa fa-wechat"></i></a></li></ul></div>'
	})
	// 未登录页面侧边栏
	Vue.component('my-nologin-sidebar', {
		template : '<div class="navbar navbar-jianshu expanded">'
			+ '<div class="dropdown">'
			+ '<a class="active logo" role="button" href="index.html"'
			+ 'data-original-title="个人主页" data-container="div.expanded"><b>简</b>'
			+ '<I class="fa fa-home"></I><span class="title">首页</span> </a>'
			+ '<a href="" data-original-title="专题"'
			+ 'data-toggle="tooltip" data-container="div.expanded"'
			+ 'data-placement="right"><I class="fa fa-th"></I>'
			+ '<span class="title">专题</span> </a>'
			+ '<a class="ad-selector" href=""><i class="fa fa-mobile"></i>'
			+ '<span class="title">下载手机应用</span> </a></div>'
			+ '<div class="nav-user"><a href="#view-mode-modal" data-toggle="modal">'
			+ '<i class="fa fa-font"></i><span class="title">显示模式</span></a>'
			+ '<a class="signin" href="login.jsp" data-original-title="登录" data-toggle="modal" data-signin-link="true"'
			+ 'data-container="div.expanded" data-placement="right">'
			+ '<i class="fa fa-sign-in"></i><span class="title">登录</span> </a></div></div>'
	})
	// 登录后页面侧边栏
	Vue.component('my-login-sidebar', {
		template : '<div class="navbar navbar-jianshu expanded">'
			+ '<div class="dropdown">'
			+ '<a class="active logo" role="button" data-original-title="个人主页"'
			+ 'data-container="div.expanded" href="index.html"> <b>简</b>'
			+ '<i class="fa fa-home"></i><span class="title">首页</span></a>'
			+ '<a data-toggle="tooltip" data-placement="right"'
			+ 'data-original-title="专题" data-container="div.expanded" href="">'
			+ '<i class="fa fa-th"></i><span class="title">专题</span></a>'
			+ '<a data-toggle="tooltip" data-placement="right"'
			+ 'data-original-title="简友圈" data-container="div.expanded" href="">'
			+ '<i class="fa fa-users"></i><span class="title">简友圈</span></a>'
			+ '<a data-toggle="tooltip" data-placement="right"'
			+ 'data-original-title="写文章" data-container="div.expanded"'
			+ 'href="writer.html"> <i class="fa fa-pencil"></i><span class="title">写文章</span></div>'
			+ '<div class="nav-user">'
			+ '<a data-toggle="tooltip" data-placement="right"'
			+ 'data-original-title="我的主页" data-container="div.expanded" href="user.html">'
			+ '<i class="fa fa-user"></i><span class="title">我的主页</span></a>'
			+ '<a data-toggle="tooltip" data-placement="right"'
			+ 'data-original-title="我的收藏" data-container="div.expanded" href="">'
			+ '<i class="fa fa-bookmark"></i><span class="title">我的收藏</span></a>'
			+ '<a data-toggle="tooltip" data-placement="right"'
			+ 'data-original-title="提醒" data-container="div.expanded" href="">'
			+ '<i id="notify-icon" class="fa fa-bell"></i><span class="title">提醒</span></a>'
			+ '<a data-toggle="tooltip" data-placement="right"'
			+ 'data-original-title="简信" data-container="div.expanded" href="">'
			+ '<i id="chat-message-icon" class="fa fa-envelope"></i><span class="title">简信</span></a>'
			+ '<a href="" data-toggle="modal"><i class="fa fa-font"></i><span class="title">显示模式</span></a>'
			+ '<a data-toggle="tooltip" data-placement="right" data-original-title="设置"'
			+ 'data-container="div.expanded" href="setting.html">'
			+ '<i class="fa fa-cogs"></i><span class="title">设置</span></a>'
			+ '<a data-toggle="tooltip" data-placement="right" data-original-title="登 出" data-container="div.expanded"'
			+ 'rel="nofollow" data-method="delete" href="logout.do">'
			+ '<i class="fa fa-sign-out"></i><span class="title">登 出</span></a></div></div>'
	})
	// 未登录页面顶部右侧侧边栏(显示登录、注册按钮)
	Vue.component('my-nologin-top-sidebar', {
		template : '<div class="navbar-user">'
			+ '<a class="login" data-signup-link="true" data-toggle="modal" href="register.html">'
			+ '<i class="fa fa-user"></i> 注册 </a>'
			+ '<a class="login" data-signin-link="true" data-toggle="modal" href="login.html">'
			+ '<i class="fa fa-sign-in"></i> 登录 </a>'
			+ '<a class="daytime set-view-mode pull-right" href="javascript:void(0)">'
			+ '<i class="fa fa-moon-o"></i></a></div>'
	})
	// 登录后页面顶部右侧侧边栏(显示用户头像及下拉菜单)
	Vue.component('my-login-top-sidebar', {
		// 声明 props
		props: ['imgSrc'],
		template : '<div class="navbar-user">'
			+ '<a class="user avatar" data-toggle="dropdown" href="javascript:void(0)">'
			+ '<img v-bind:src="imgSrc" alt="11"><b class="caret"></b></a>'
			+ '<ul class="dropdown-menu arrow-top" role="menu" aria-labelledby="dLabel">'
			+ '<li><a href="writer.html"><i class="fa fa-pencil"></i> 写文章</a></li>'
			+ '<li><a target="_blank" href="user.html"><i class="fa fa-user"></i> 我的主页</a></li>'
			+ '<li><a href=""> <i class="fa fa-heart"></i> 我喜欢的</a></li>'
			+ '<li><a href=""> <i class="fa fa-bookmark"></i> 我的收藏</a></li>'
			+ '<li><a href=""> <i class="fa fa-bell"></i> 提醒</a></li>'
			+ '<li><a href=""> <i class="fa fa-envelope"></i> 简信</a></li>'
			+ '<li><a href="setting.html"><i class="fa fa-cogs"></i> 设置</a></li>'
			+ '<li><a href=""> <i class="fa fa-credit-card"></i> 钱包</a></li>'
			+ '<li class="dropdown-submenu"><a tabindex="-1" href=""><i class="fa fa-question-circle"></i> 帮助</a>'
			+ '<ul class="dropdown-menu">'
			+ '<li><a href="" target="_blank">帮助中心</a></li>'
			+ '<li><a target="_blank" href="">联系我们</a></li></ul></li>'
			+ '<li><a rel="nofollow" data-method="DELETE" href="logout.do"><i class="fa fa-sign-out"></i> 登 出</a></li></ul></div>'
	})
	// 侧边栏功能模式选择
	Vue.component('my-min-sidebar-switch', {
		template : '<div tabindex="-1" class="modal hide read-modal" id="view-mode-modal"'
			+ 'aria-hidden="false" data-js-module="view-mode-modal">'
			+ '<div class="btn-group change-background" data-toggle="buttons-radio">'
			+ '<a class="btn btn-daytime active" href="javascript:void(null);" data-mode="day">'
			+ '<i class="fa fa-sun-o"></i></a>'
			+ '<a class="btn btn-nighttime " href="javascript:void(null);"'
			+ 'data-mode="night"><i class="fa fa-moon-o"></i></a></div>'
			+ '<div class="btn-group change-font" data-toggle="buttons-radio">'
			+ '<a class="btn font " href="javascript:void(null);" data-font="font1">宋体</a>'
			+ '<a class="btn font hei active" href="javascript:void(null);" data-font="font2">黑体</a></div>'
			+ '<div class="btn-group change-locale" data-toggle="buttons-radio">'
			+ '<a class="btn font active" href="javascript:void(null);" data-locale="zh-CN">简</a>'
			+ '<a class="btn font hei " href="javascript:void(null);" data-locale="zh-TW">繁</a></div></div>'
	})
	// 主页面中部图片栏
	Vue.component('my-min-pic-bar', {
		template : '<div class="span3 left-aside"> <div class="cover-img"'
			+ 'style='+ '\'' + 'background-image: url("http://upload.jianshu.io/daily_images/images/fR1xHpaYSpyswkdvADB8.jpg");' + '\'' + '> </div>'
			+ '<div class="bottom-block"><h1>简笔记</h1><h3>交流故事，沟通想法</h3><p>一个基于内容分享的社区</p>'
			+ '<a class="btn btn btn-large btn-success" id="write-button"'
			+ 'href="login.jsp" data-toggle="modal" data-signin-link="true">提笔写篇文章</a></div>'
			+ '<div class="img-info"><I class="fa fa-info"></I><div class="info">'
			+ 'photo by <a href="http://unsplash.com/" target="_blank">unsplash</a></div></div></div>'
	})
	// 主页面中部导航栏
	Vue.component('my-navigation-bar', {
		template : '<ul class="unstyled clearfix sort-nav">'
			+ '<li class="active"><A class="category" href="javascript:void(null);">热门</A></li>'
			+ '<li><A class="category" href="javascript:void(null);">新上榜</A></li>'
			+ '<li><A class="category" href="javascript:void(null);">日报</A></li>'
			+ '<li><A class="category" href="javascript:void(null);">七日热门</A></li>'
			+ '<li><A class="category" href="javascript:void(null);">三十日热门</A></li>'
			+ '<li><A class="category" href="javascript:void(null);">有奖活动</A></li>'
			+ '<li><A class="category" href="javascript:void(null);">简笔记出版</A></li>'
			+ '<li><A class="category" href="javascript:void(null);">简笔记播客</A></li></ul>'
	})
	// 创建根实例
	new Vue({
		el : '#my-vueJS'
	})
	// ----------------
}
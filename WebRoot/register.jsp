<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<HTML>
<HEAD>
<META content="IE=11.0000" http-equiv="X-UA-Compatible">
<META charset="utf-8">
<META http-equiv="X-UA-Compatible" content="IE=Edge">
<META name="viewport"
	content="width=device-width, initial-scale=1.0,user-scalable=no">

<META http-equiv="Cache-Control" content="no-siteapp">
<META content="294ec9de89e7fadb" property="wb:webmaster">
<META content="104102651453316562112116375" property="qc:admins">
<META content="11635613706305617" property="qc:admins">
<META content="1163561616621163056375" property="qc:admins">
<META name="google-site-verification"
	content="cV4-qkUJZR6gmFeajx_UyPe47GW9vY6cnCrYtCHYNh4">

<META name="google-site-verification"
	content="HF7lfF8YEGs1qtCE-kPml8Z469e2RHhGajy6JPVy5XI">

<META http-equiv="mobile-agent" content="format=html5; url=register.jsp">
<TITLE>简笔记</TITLE>
<META name="csrf-param" content="authenticity_token">
<META name="csrf-token"
	content="P5L4CWwIF2zX9INN+h1+33lE5qPkF+6RLrKlp94nRZfCvFYpjjV+MCbbHB4vNxl7ZGo0v7wORpUDaq5zsqvkFQ==">
<!--[if lte IE 8]>
        <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<LINK href="css/css_1.css" rel="stylesheet" media="all">
<LINK href="css/css_2.css" rel="stylesheet" media="all">
<LINK href="css/css_3.css" rel="stylesheet" media="all">
<SCRIPT src="js/js_4.js"></SCRIPT>
<!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
<!--[if IE 8]>
        <link rel="stylesheet" media="all" href="css/css_4.css"/><![endif]-->
<!--[if lt IE 9]>
        <link rel="stylesheet" media="all" href="css/css_5.css"/><![endif]-->
<LINK href="http://baijii-common.b0.upaiyun.com/icons/favicon.ico"
	rel="icon">
<LINK href="img/img_1.png" rel="apple-touch-icon-precomposed"
	sizes="57x57">
<LINK href="img/img_2.png" rel="apple-touch-icon-precomposed"
	sizes="72x72">
<LINK href="img/img_3.png" rel="apple-touch-icon-precomposed"
	sizes="76x76">
<LINK href="img/img_4.png" rel="apple-touch-icon-precomposed"
	sizes="114x114">
<LINK href="img/img_5.png" rel="apple-touch-icon-precomposed"
	sizes="120x120">
<LINK href="img/img_6.png" rel="apple-touch-icon-precomposed"
	sizes="152x152">
<!-- Baidu stats -->
<SCRIPT>
	var _hmt = _hmt || [];
	(function() {
		var hm = document.createElement("script");
		hm.src = "//hm.baidu.com/hm.js?0c0e9d9b1e7d617b3e6842e85b9fb068";
		var s = document.getElementsByTagName("script")[0];
		s.parentNode.insertBefore(hm, s);
	})();
</SCRIPT>

<META name="GENERATOR" content="MSHTML 11.00.10586.420">
</HEAD>
<BODY
	class="output no-fluid zh cn win ie ie11 reader-day-mode reader-font2"
	data-locale="zh-CN" data-js-module="">
	<DIV class="navbar navbar-jianshu shrink">
		<DIV class="dropdown">
			<A class="dropdown-toggle logo" id="dLabel" role="button"
				href="javascript:void(0)" data-toggle="dropdown" data-target="#">简
			</A>
			<UL class="dropdown-menu" role="menu" aria-labelledby="dLabel">
				<LI><A href="http://www.jianshu.com/"><I class="fa fa-home"></I>
						首页</A></LI>
				<LI><A href="http://www.jianshu.com/collections"><I
						class="fa fa-th"></I> 专题</A></LI>
				<LI><A href="http://www.jianshu.com/user_invitations"><I
						class="fa fa-money"></I> 发钱啦</A></LI>
			</UL>
		</DIV>
	</DIV>
	<DIV class="navbar-user">
		<A class="login" href="register.jsp" data-toggle="modal"><I
			class="fa fa-user"></I> 注册 </A> <A class="login" href="login.jsp"
			data-toggle="modal"><I class="fa fa-sign-in"></I> 登录 </A> <A
			class="daytime set-view-mode pull-right" href="javascript:void(0)"><I
			class="fa fa-moon-o"></I></A>
	</DIV>
	<DIV class="navbar navbar-jianshu expanded">
		<DIV class="dropdown">
			<A class="active logo" role="button" href="http://www.jianshu.com/"
				data-original-title="个人主页" data-container="div.expanded"><B>简</B><I
				class="fa fa-home"></I><SPAN class="title">首页</SPAN> </A><A
				href="http://www.jianshu.com/collections" data-original-title="专题"
				data-toggle="tooltip" data-container="div.expanded"
				data-placement="right"><I class="fa fa-th"></I><SPAN
				class="title">专题</SPAN> </A><A class="ad-selector"
				href="http://www.jianshu.com/apps"><I class="fa fa-mobile"></I><SPAN
				class="title">下载手机应用</SPAN> </A>
			<DIV class="ad-container ">
				<DIV class="ad-pop">
					<IMG class="ad-logo" alt="114"
						src="img/register/114-8dae53b3bcea3f06bb139e329d1edab3.png">

					<P class="ad-title">简笔记</P>
					<P class="ad-subtitle">交流故事，沟通想法</P>
					<IMG class="ad-qrcode" alt="Download app qrcode"
						src="img/register/download-app-qrcode-053849fa25f9b44573ef8dd3c118a20f.png">

					<DIV>
						<A class="ad-link"
							href="https://itunes.apple.com/cn/app/jian-shu/id888237539?ls=1&amp;mt=8">iOS</A>·
						<A class="ad-link"
							href="http://downloads.jianshu.io/apps/haruki/JianShu-1.11.1.apk">Android</A>
					</DIV>
				</DIV>
			</DIV>
		</DIV>
		<DIV class="nav-user">
			<A href="register.jsp#view-mode-modal" data-toggle="modal"><I
				class="fa fa-font"></I><SPAN class="title">显示模式</SPAN></A>
		</DIV>
	</DIV>
	<DIV class="container">
		<DIV class="login-page">
			<DIV class="logo">
				<IMG alt="Img logo"
					src="img/register/img_logo-25ff4bee2e56411470b83c636a7a0dad.png">
			</DIV>
			<H4 class="title">
				<SPAN><A href="login.jsp" data-pjax="true">登录</A> <B>·</B> <A
					class="active" href="register.jsp" data-pjax="true">注册</A> </SPAN>
			</H4>
			<DIV id="pjax-container">
				<DIV class="sign-up" data-js-module="sign-up-form">
					<s:form class="form-horizontal" id="sign_up" action="register"
						method="post" accept-charset="UTF-8">
						<INPUT name="utf8" type="hidden" value="✓">
						<INPUT name="authenticity_token" type="hidden"
							value="64Wei2D6vm2HiOlHo/tK4eBelLVavCqGE3s8HqVnT/MWqzCrgsfXMXandhR20S1F/XBGqQKlgoI+ozfKyevucQ==">
						<P class="signin_error hide" id="signup_errors"></P>
						<DIV class="input-prepend">
							<SPAN class="add-on"><I class="fa fa-envelope-o"></I></SPAN> <INPUT
								name="user.email" class="span2" id="sign_up_email" type="text"
								placeholder="你的邮件地址" value="">
						</DIV>
						<DIV class="input-prepend">
							<SPAN class="add-on"><I class="fa fa-user"></I></SPAN> <INPUT
								name="user.name" class="span2" id="nickname" type="text"
								placeholder="选一个昵称" value="">
						</DIV>
						<DIV class="input-prepend">
							<SPAN class="add-on"><I class="fa fa-unlock-alt"></I></SPAN> <INPUT
								name="user.password" class="span2" id="sign_up_password"
								type="password" placeholder="输入密码" value="">
						</DIV>
						<DIV class="captcha" data-captcha-type="geetest">
							<INPUT name="captcha[validation][challenge]" type="hidden"
								value="234c52e8433490c074af92c27fb2c52c" autocomplete="off">
							<INPUT name="captcha[validation][gt]" type="hidden"
								value="a10ea6a23a441db3d956598988dff3c4" autocomplete="off">
							<INPUT name="captcha[validation][validate]" type="hidden"
								autocomplete="off"> <INPUT
								name="captcha[validation][seccode]" type="hidden"
								autocomplete="off"> <INPUT name="captcha[id]"
								type="hidden" value="167b317e-375f-43c2-b072-8331eedcf1ab"
								autocomplete="off">
							<DIV class="geetest" id="geetest-area"></DIV>
						</DIV>
						<BUTTON name="button" class="ladda-button submit-button"
							type="submit" data-color="green"
							data-disable-with="<span class='ladda-label'>loading</span>">
							<SPAN class="ladda-label">注册</SPAN>
						</BUTTON>
						<P class="sign_up_msg">
							点击 “注册” 或下方社交登录按钮，即表示您同意并愿意遵守简笔记 <A
								href="http://www.jianshu.com/p/c44d171298ce">用户协议</A> 和 <A
								href="http://www.jianshu.com/p/2ov8x3">隐私政策</A> 。
						</P>
					</s:form>
				</DIV>
			</DIV>
			<DIV class="login-sns">
				<P>您还可以通过以下方式直接登录</P>
				<UL class="login-sns">
					<LI class="weibo"><A
						href="http://www.jianshu.com/users/auth/weibo"><I
							class="fa fa-weibo"></I></A></LI>
					<LI class="qq"><A
						href="http://www.jianshu.com/users/auth/qq_connect"><I
							class="fa fa-qq"></I></A></LI>
					<LI class="google"><A
						href="http://www.jianshu.com/users/auth/google_oauth2"><I
							class="fa fa-google-plus"></I></A></LI>
					<LI class="wechat"><A
						href="http://www.jianshu.com/users/auth/wechat"><I
							class="fa fa-wechat"></I></A></LI>
				</UL>
			</DIV>
		</DIV>
	</DIV>
	<DIV class="hide" id="flash"></DIV>
	<DIV tabindex="-1" class="modal hide read-modal" id="view-mode-modal"
		aria-hidden="false" data-js-module="view-mode-modal">
		<DIV class="btn-group change-background" data-toggle="buttons-radio">
			<A class="btn btn-daytime active" href="javascript:void(null);"
				data-mode="day"><I class="fa fa-sun-o"></I> </A> <A
				class="btn btn-nighttime " href="javascript:void(null);"
				data-mode="night"><I class="fa fa-moon-o"></I> </A>
		</DIV>
		<DIV class="btn-group change-font" data-toggle="buttons-radio">
			<A class="btn font " href="javascript:void(null);" data-font="font1">宋体</A>
			<A class="btn font hei active" href="javascript:void(null);"
				data-font="font2">黑体</A>
		</DIV>
		<DIV class="btn-group change-locale" data-toggle="buttons-radio">
			<A class="btn font active" href="javascript:void(null);"
				data-locale="zh-CN">简</A> <A class="btn font hei "
				href="javascript:void(null);" data-locale="zh-TW">繁</A>
		</DIV>
	</DIV>
	<!-- Javascripts
        ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<SCRIPT src="js/js_1.js"></SCRIPT>

	<SCRIPT src="js/js_2.js"></SCRIPT>

	<SCRIPT src="js/ga.js"></SCRIPT>

	<SCRIPT src="js/getphp.js"></SCRIPT>

	<SCRIPT type="text/javascript">
		var _gaq = _gaq || [];
		_gaq.push([ '_setAccount', 'UA-35169517-1' ]);
		_gaq.push([ '_setCustomVar', 2, 'User Type', 'Visitor', 1 ]);
		_gaq.push([ '_trackPageview' ]);

		(function() {
			var ga = document.createElement('script');
			ga.type = 'text/javascript';
			ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl'
					: 'http://www')
					+ '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(ga, s);
		})();
	</SCRIPT>

	<SCRIPT>
		(function() {
			var bp = document.createElement('script');
			bp.src = '//push.zhanzhang.baidu.com/push.js';
			var s = document.getElementsByTagName("script")[0];
			s.parentNode.insertBefore(bp, s);
		})();
	</SCRIPT>
</BODY>
</HTML>

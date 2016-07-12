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

<META http-equiv="mobile-agent" content="format=html5; url=login.jsp">
<TITLE>简笔记</TITLE>
<META name="csrf-param" content="authenticity_token">
<META name="csrf-token"
	content="yme6Y3H10lPuJhWOH0/zH+OeQdxVhj2KcqooBV23oQw3SRRDk8i7Dx8Jit3KZZS7/rCTwA2flY5fciPRMTsAjg==">
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
		<A class="login" href="register.jsp" data-toggle="modal"
			data-signup-link="true"><I class="fa fa-user"></I> 注册 </A> <A
			class="login" href="login.jsp" data-toggle="modal"
			data-signin-link="true"><I class="fa fa-sign-in"></I> 登录 </A> <A
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
						src="img/login/114-8dae53b3bcea3f06bb139e329d1edab3.png">

					<P class="ad-title">简笔记</P>
					<P class="ad-subtitle">交流故事，沟通想法</P>
					<IMG class="ad-qrcode" alt="Download app qrcode"
						src="img/login/download-app-qrcode-053849fa25f9b44573ef8dd3c118a20f.png">

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
			<A href="login.jsp#view-mode-modal" data-toggle="modal"><I
				class="fa fa-font"></I><SPAN class="title">显示模式</SPAN></A>
		</DIV>
	</DIV>
	<DIV class="container">
		<DIV class="login-page">
			<DIV class="logo">
				<IMG alt="Img logo"
					src="img/login/img_logo-25ff4bee2e56411470b83c636a7a0dad.png">
			</DIV>
			<H4 class="title">
				<SPAN><A class="active" href="login.jsp">登录</A> <B>·</B> <A
					href="register.jsp">注册</A> </SPAN>
			</H4>
			<DIV id="pjax-container">
				<DIV class="sign-in">
					<s:form class="form-horizontal" action="login" method="post"
						accept-charset="UTF-8" data-js-module="sign-in">
						<INPUT name="utf8" type="hidden" value="✓">
						<INPUT name="authenticity_token" type="hidden"
							value="f5e7Sq/bJcmd2FHi3Zl919hJpyx3YyQH2k2px1hwh5qCuRVqTeZMlWz3zrEIsxpzxWd1MC96jAP3laITNPwmGA==">

						<P class="signin_error hide" id="signin_errors"></P>
						<DIV class="input-prepend mobile-verify foreign hide">
							<DIV class="choose_phone clearfix">
								<A class="selector btn dropdown-toggle" data-toggle="dropdown"
									data-iso-code="CN"> +86<SPAN class="caret"></SPAN>
								</A>
								<UL class="nation_code dropdown-menu" role="menu">
									<LI data-iso-code="AU" data-calling-code="61"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+61</SPAN><SPAN class="nation_name">澳大利亚</SPAN>
									</A></LI>
									<LI data-iso-code="FR" data-calling-code="33"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+33</SPAN><SPAN class="nation_name">法国</SPAN>
									</A></LI>
									<LI data-iso-code="DE" data-calling-code="49"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+49</SPAN><SPAN class="nation_name">德国</SPAN>
									</A></LI>
									<LI data-iso-code="HK" data-calling-code="852"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+852</SPAN><SPAN class="nation_name">中国香港</SPAN>
									</A></LI>
									<LI data-iso-code="JP" data-calling-code="81"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+81</SPAN><SPAN class="nation_name">日本</SPAN>
									</A></LI>
									<LI data-iso-code="GB" data-calling-code="44"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+44</SPAN><SPAN class="nation_name">英国</SPAN>
									</A></LI>
									<LI data-iso-code="US" data-calling-code="1"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+1</SPAN><SPAN class="nation_name">美国</SPAN>
									</A></LI>
									<LI data-iso-code="TW" data-calling-code="886"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+886</SPAN><SPAN class="nation_name">中国台湾</SPAN>
									</A></LI>
									<LI class="separate_line"></LI>
									<LI data-iso-code="AF" data-calling-code="93"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+93</SPAN><SPAN class="nation_name">阿富汗</SPAN>
									</A></LI>
									<LI data-iso-code="AL" data-calling-code="355"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+355</SPAN><SPAN class="nation_name">阿尔巴尼亚</SPAN>
									</A></LI>
									<LI data-iso-code="DZ" data-calling-code="213"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+213</SPAN><SPAN class="nation_name">阿尔及利亚</SPAN>
									</A></LI>
									<LI data-iso-code="AD" data-calling-code="376"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+376</SPAN><SPAN class="nation_name">安道尔</SPAN>
									</A></LI>
									<LI data-iso-code="AO" data-calling-code="244"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+244</SPAN><SPAN class="nation_name">安哥拉</SPAN>
									</A></LI>
									<LI data-iso-code="AQ" data-calling-code="672"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+672</SPAN><SPAN class="nation_name">南极洲</SPAN>
									</A></LI>
									<LI data-iso-code="AR" data-calling-code="54"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+54</SPAN><SPAN class="nation_name">阿根廷</SPAN>
									</A></LI>
									<LI data-iso-code="AM" data-calling-code="374"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+374</SPAN><SPAN class="nation_name">亚美尼亚</SPAN>
									</A></LI>
									<LI data-iso-code="AW" data-calling-code="297"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+297</SPAN><SPAN class="nation_name">阿鲁巴</SPAN>
									</A></LI>
									<LI data-iso-code="AU" data-calling-code="61"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+61</SPAN><SPAN class="nation_name">澳大利亚</SPAN>
									</A></LI>
									<LI data-iso-code="AT" data-calling-code="43"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+43</SPAN><SPAN class="nation_name">奥地利</SPAN>
									</A></LI>
									<LI data-iso-code="AZ" data-calling-code="994"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+994</SPAN><SPAN class="nation_name">澳大拉西亚</SPAN>
									</A></LI>
									<LI data-iso-code="BH" data-calling-code="973"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+973</SPAN><SPAN class="nation_name">巴林</SPAN>
									</A></LI>
									<LI data-iso-code="BD" data-calling-code="880"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+880</SPAN><SPAN class="nation_name">孟加拉国</SPAN>
									</A></LI>
									<LI data-iso-code="BY" data-calling-code="375"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+375</SPAN><SPAN class="nation_name">白俄罗斯</SPAN>
									</A></LI>
									<LI data-iso-code="BE" data-calling-code="32"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+32</SPAN><SPAN class="nation_name">比利时</SPAN>
									</A></LI>
									<LI data-iso-code="BZ" data-calling-code="501"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+501</SPAN><SPAN class="nation_name">伯利兹</SPAN>
									</A></LI>
									<LI data-iso-code="BJ" data-calling-code="229"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+229</SPAN><SPAN class="nation_name">贝宁</SPAN>
									</A></LI>
									<LI data-iso-code="BT" data-calling-code="975"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+975</SPAN><SPAN class="nation_name">不丹</SPAN>
									</A></LI>
									<LI data-iso-code="BO" data-calling-code="591"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+591</SPAN><SPAN class="nation_name">波希米亚</SPAN>
									</A></LI>
									<LI data-iso-code="BA" data-calling-code="387"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+387</SPAN><SPAN class="nation_name">波斯尼亚和黑塞哥维那</SPAN>
									</A></LI>
									<LI data-iso-code="BW" data-calling-code="267"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+267</SPAN><SPAN class="nation_name">博茨瓦纳</SPAN>
									</A></LI>
									<LI data-iso-code="BR" data-calling-code="55"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+55</SPAN><SPAN class="nation_name">巴西</SPAN>
									</A></LI>
									<LI data-iso-code="IO" data-calling-code="246"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+246</SPAN><SPAN class="nation_name">英属印度洋领地</SPAN>
									</A></LI>
									<LI data-iso-code="BN" data-calling-code="673"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+673</SPAN><SPAN class="nation_name">文莱</SPAN>
									</A></LI>
									<LI data-iso-code="BG" data-calling-code="359"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+359</SPAN><SPAN class="nation_name">保加利亚</SPAN>
									</A></LI>
									<LI data-iso-code="BF" data-calling-code="226"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+226</SPAN><SPAN class="nation_name">布基纳法索</SPAN>
									</A></LI>
									<LI data-iso-code="BI" data-calling-code="257"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+257</SPAN><SPAN class="nation_name">布隆迪</SPAN>
									</A></LI>
									<LI data-iso-code="KH" data-calling-code="855"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+855</SPAN><SPAN class="nation_name">柬埔寨</SPAN>
									</A></LI>
									<LI data-iso-code="CM" data-calling-code="237"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+237</SPAN><SPAN class="nation_name">喀麦隆</SPAN>
									</A></LI>
									<LI data-iso-code="CA" data-calling-code="1"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+1</SPAN><SPAN class="nation_name">加拿大</SPAN>
									</A></LI>
									<LI data-iso-code="CV" data-calling-code="238"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+238</SPAN><SPAN class="nation_name">佛得角</SPAN>
									</A></LI>
									<LI data-iso-code="CF" data-calling-code="236"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+236</SPAN><SPAN class="nation_name">中非共和国</SPAN>
									</A></LI>
									<LI data-iso-code="TD" data-calling-code="235"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+235</SPAN><SPAN class="nation_name">乍得</SPAN>
									</A></LI>
									<LI data-iso-code="CL" data-calling-code="56"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+56</SPAN><SPAN class="nation_name">智利</SPAN>
									</A></LI>
									<LI data-iso-code="CN" data-calling-code="86"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+86</SPAN><SPAN class="nation_name">中华人民共和国</SPAN>
									</A></LI>
									<LI data-iso-code="CX" data-calling-code="61"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+61</SPAN><SPAN class="nation_name">圣诞岛</SPAN>
									</A></LI>
									<LI data-iso-code="CC" data-calling-code="61"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+61</SPAN><SPAN class="nation_name">科科斯（基林）群岛</SPAN>
									</A></LI>
									<LI data-iso-code="CO" data-calling-code="57"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+57</SPAN><SPAN class="nation_name">哥伦比亚</SPAN>
									</A></LI>
									<LI data-iso-code="KM" data-calling-code="269"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+269</SPAN><SPAN class="nation_name">科摩罗</SPAN>
									</A></LI>
									<LI data-iso-code="CK" data-calling-code="682"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+682</SPAN><SPAN class="nation_name">库克群岛</SPAN>
									</A></LI>
									<LI data-iso-code="CR" data-calling-code="506"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+506</SPAN><SPAN class="nation_name">哥斯达黎加</SPAN>
									</A></LI>
									<LI data-iso-code="HR" data-calling-code="385"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+385</SPAN><SPAN class="nation_name">克罗地亚</SPAN>
									</A></LI>
									<LI data-iso-code="CU" data-calling-code="53"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+53</SPAN><SPAN class="nation_name">古巴</SPAN>
									</A></LI>
									<LI data-iso-code="CW" data-calling-code="599"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+599</SPAN><SPAN class="nation_name">库拉索</SPAN>
									</A></LI>
									<LI data-iso-code="CY" data-calling-code="357"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+357</SPAN><SPAN class="nation_name">塞浦路斯</SPAN>
									</A></LI>
									<LI data-iso-code="CZ" data-calling-code="420"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+420</SPAN><SPAN class="nation_name">捷克</SPAN>
									</A></LI>
									<LI data-iso-code="CD" data-calling-code="243"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+243</SPAN><SPAN class="nation_name">民主刚果</SPAN>
									</A></LI>
									<LI data-iso-code="DK" data-calling-code="45"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+45</SPAN><SPAN class="nation_name">丹麦</SPAN>
									</A></LI>
									<LI data-iso-code="DJ" data-calling-code="253"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+253</SPAN><SPAN class="nation_name">吉布提</SPAN>
									</A></LI>
									<LI data-iso-code="TL" data-calling-code="670"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+670</SPAN><SPAN class="nation_name">东帝汶</SPAN>
									</A></LI>
									<LI data-iso-code="EC" data-calling-code="593"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+593</SPAN><SPAN class="nation_name">厄瓜多尔</SPAN>
									</A></LI>
									<LI data-iso-code="EG" data-calling-code="20"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+20</SPAN><SPAN class="nation_name">埃及</SPAN>
									</A></LI>
									<LI data-iso-code="SV" data-calling-code="503"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+503</SPAN><SPAN class="nation_name">萨尔瓦多</SPAN>
									</A></LI>
									<LI data-iso-code="GQ" data-calling-code="240"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+240</SPAN><SPAN class="nation_name">赤道几内亚</SPAN>
									</A></LI>
									<LI data-iso-code="ER" data-calling-code="291"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+291</SPAN><SPAN class="nation_name">厄立特里亚</SPAN>
									</A></LI>
									<LI data-iso-code="EE" data-calling-code="372"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+372</SPAN><SPAN class="nation_name">爱沙尼亚</SPAN>
									</A></LI>
									<LI data-iso-code="ET" data-calling-code="251"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+251</SPAN><SPAN class="nation_name">埃塞俄比亚</SPAN>
									</A></LI>
									<LI data-iso-code="FK" data-calling-code="500"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+500</SPAN><SPAN class="nation_name">福克兰群岛</SPAN>
									</A></LI>
									<LI data-iso-code="FO" data-calling-code="298"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+298</SPAN><SPAN class="nation_name">法罗群岛</SPAN>
									</A></LI>
									<LI data-iso-code="FJ" data-calling-code="679"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+679</SPAN><SPAN class="nation_name">斐济</SPAN>
									</A></LI>
									<LI data-iso-code="FI" data-calling-code="358"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+358</SPAN><SPAN class="nation_name">芬兰</SPAN>
									</A></LI>
									<LI data-iso-code="FR" data-calling-code="33"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+33</SPAN><SPAN class="nation_name">法国</SPAN>
									</A></LI>
									<LI data-iso-code="PF" data-calling-code="689"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+689</SPAN><SPAN class="nation_name">法属波利尼西亚</SPAN>
									</A></LI>
									<LI data-iso-code="GA" data-calling-code="241"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+241</SPAN><SPAN class="nation_name">加蓬</SPAN>
									</A></LI>
									<LI data-iso-code="GM" data-calling-code="220"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+220</SPAN><SPAN class="nation_name">冈比亚</SPAN>
									</A></LI>
									<LI data-iso-code="GE" data-calling-code="995"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+995</SPAN><SPAN class="nation_name">格鲁吉亚</SPAN>
									</A></LI>
									<LI data-iso-code="DE" data-calling-code="49"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+49</SPAN><SPAN class="nation_name">德国</SPAN>
									</A></LI>
									<LI data-iso-code="GH" data-calling-code="233"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+233</SPAN><SPAN class="nation_name">加纳</SPAN>
									</A></LI>
									<LI data-iso-code="GI" data-calling-code="350"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+350</SPAN><SPAN class="nation_name">直布罗陀</SPAN>
									</A></LI>
									<LI data-iso-code="GR" data-calling-code="30"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+30</SPAN><SPAN class="nation_name">希腊</SPAN>
									</A></LI>
									<LI data-iso-code="GL" data-calling-code="299"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+299</SPAN><SPAN class="nation_name">格陵兰</SPAN>
									</A></LI>
									<LI data-iso-code="GT" data-calling-code="502"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+502</SPAN><SPAN class="nation_name">危地马拉</SPAN>
									</A></LI>
									<LI data-iso-code="GN" data-calling-code="224"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+224</SPAN><SPAN class="nation_name">几内亚</SPAN>
									</A></LI>
									<LI data-iso-code="GW" data-calling-code="245"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+245</SPAN><SPAN class="nation_name">几内亚比绍</SPAN>
									</A></LI>
									<LI data-iso-code="GY" data-calling-code="592"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+592</SPAN><SPAN class="nation_name">圭亚那</SPAN>
									</A></LI>
									<LI data-iso-code="HT" data-calling-code="509"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+509</SPAN><SPAN class="nation_name">海地</SPAN>
									</A></LI>
									<LI data-iso-code="HN" data-calling-code="504"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+504</SPAN><SPAN class="nation_name">洪都拉斯</SPAN>
									</A></LI>
									<LI data-iso-code="HK" data-calling-code="852"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+852</SPAN><SPAN class="nation_name">中国香港</SPAN>
									</A></LI>
									<LI data-iso-code="HU" data-calling-code="36"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+36</SPAN><SPAN class="nation_name">匈牙利</SPAN>
									</A></LI>
									<LI data-iso-code="IS" data-calling-code="354"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+354</SPAN><SPAN class="nation_name">冰岛</SPAN>
									</A></LI>
									<LI data-iso-code="IN" data-calling-code="91"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+91</SPAN><SPAN class="nation_name">印度</SPAN>
									</A></LI>
									<LI data-iso-code="ID" data-calling-code="62"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+62</SPAN><SPAN class="nation_name">印度尼西亚</SPAN>
									</A></LI>
									<LI data-iso-code="IR" data-calling-code="98"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+98</SPAN><SPAN class="nation_name">伊朗</SPAN>
									</A></LI>
									<LI data-iso-code="IQ" data-calling-code="964"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+964</SPAN><SPAN class="nation_name">伊拉克</SPAN>
									</A></LI>
									<LI data-iso-code="IE" data-calling-code="353"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+353</SPAN><SPAN class="nation_name">爱尔兰</SPAN>
									</A></LI>
									<LI data-iso-code="IL" data-calling-code="972"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+972</SPAN><SPAN class="nation_name">以色列</SPAN>
									</A></LI>
									<LI data-iso-code="IT" data-calling-code="39"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+39</SPAN><SPAN class="nation_name">意大利</SPAN>
									</A></LI>
									<LI data-iso-code="CI" data-calling-code="225"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+225</SPAN><SPAN class="nation_name">科特迪瓦</SPAN>
									</A></LI>
									<LI data-iso-code="JP" data-calling-code="81"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+81</SPAN><SPAN class="nation_name">日本</SPAN>
									</A></LI>
									<LI data-iso-code="JO" data-calling-code="962"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+962</SPAN><SPAN class="nation_name">约旦</SPAN>
									</A></LI>
									<LI data-iso-code="KZ" data-calling-code="7"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+7</SPAN><SPAN class="nation_name">哈萨克斯坦</SPAN>
									</A></LI>
									<LI data-iso-code="KE" data-calling-code="254"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+254</SPAN><SPAN class="nation_name">肯尼亚</SPAN>
									</A></LI>
									<LI data-iso-code="KI" data-calling-code="686"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+686</SPAN><SPAN class="nation_name">基里巴斯</SPAN>
									</A></LI>
									<LI data-iso-code="XK" data-calling-code="383"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+383</SPAN><SPAN class="nation_name">科索沃</SPAN>
									</A></LI>
									<LI data-iso-code="KW" data-calling-code="965"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+965</SPAN><SPAN class="nation_name">科威特</SPAN>
									</A></LI>
									<LI data-iso-code="KG" data-calling-code="996"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+996</SPAN><SPAN class="nation_name">吉尔吉斯斯坦</SPAN>
									</A></LI>
									<LI data-iso-code="LA" data-calling-code="856"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+856</SPAN><SPAN class="nation_name">老挝</SPAN>
									</A></LI>
									<LI data-iso-code="LV" data-calling-code="371"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+371</SPAN><SPAN class="nation_name">拉脱维亚</SPAN>
									</A></LI>
									<LI data-iso-code="LB" data-calling-code="961"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+961</SPAN><SPAN class="nation_name">黎巴嫩</SPAN>
									</A></LI>
									<LI data-iso-code="LS" data-calling-code="266"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+266</SPAN><SPAN class="nation_name">莱索托</SPAN>
									</A></LI>
									<LI data-iso-code="LR" data-calling-code="231"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+231</SPAN><SPAN class="nation_name">利比里亚</SPAN>
									</A></LI>
									<LI data-iso-code="LY" data-calling-code="218"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+218</SPAN><SPAN class="nation_name">利比亚</SPAN>
									</A></LI>
									<LI data-iso-code="LI" data-calling-code="423"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+423</SPAN><SPAN class="nation_name">列支敦士登</SPAN>
									</A></LI>
									<LI data-iso-code="LT" data-calling-code="370"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+370</SPAN><SPAN class="nation_name">立陶宛</SPAN>
									</A></LI>
									<LI data-iso-code="LU" data-calling-code="352"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+352</SPAN><SPAN class="nation_name">卢森堡</SPAN>
									</A></LI>
									<LI data-iso-code="MO" data-calling-code="853"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+853</SPAN><SPAN class="nation_name">中国澳门</SPAN>
									</A></LI>
									<LI data-iso-code="MK" data-calling-code="389"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+389</SPAN><SPAN class="nation_name">马其顿</SPAN>
									</A></LI>
									<LI data-iso-code="MG" data-calling-code="261"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+261</SPAN><SPAN class="nation_name">马达加斯加</SPAN>
									</A></LI>
									<LI data-iso-code="MW" data-calling-code="265"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+265</SPAN><SPAN class="nation_name">马拉维</SPAN>
									</A></LI>
									<LI data-iso-code="MY" data-calling-code="60"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+60</SPAN><SPAN class="nation_name">马来西亚</SPAN>
									</A></LI>
									<LI data-iso-code="MV" data-calling-code="960"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+960</SPAN><SPAN class="nation_name">马尔代夫</SPAN>
									</A></LI>
									<LI data-iso-code="ML" data-calling-code="223"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+223</SPAN><SPAN class="nation_name">马里</SPAN>
									</A></LI>
									<LI data-iso-code="MT" data-calling-code="356"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+356</SPAN><SPAN class="nation_name">马耳他</SPAN>
									</A></LI>
									<LI data-iso-code="MH" data-calling-code="692"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+692</SPAN><SPAN class="nation_name">马绍尔群岛</SPAN>
									</A></LI>
									<LI data-iso-code="MR" data-calling-code="222"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+222</SPAN><SPAN class="nation_name">毛里塔尼亚</SPAN>
									</A></LI>
									<LI data-iso-code="MU" data-calling-code="230"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+230</SPAN><SPAN class="nation_name">毛里求斯</SPAN>
									</A></LI>
									<LI data-iso-code="YT" data-calling-code="262"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+262</SPAN><SPAN class="nation_name">马约特</SPAN>
									</A></LI>
									<LI data-iso-code="MX" data-calling-code="52"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+52</SPAN><SPAN class="nation_name">墨西哥</SPAN>
									</A></LI>
									<LI data-iso-code="FM" data-calling-code="691"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+691</SPAN><SPAN class="nation_name">密克罗尼西亚联邦</SPAN>
									</A></LI>
									<LI data-iso-code="MD" data-calling-code="373"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+373</SPAN><SPAN class="nation_name">摩尔多瓦</SPAN>
									</A></LI>
									<LI data-iso-code="MC" data-calling-code="377"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+377</SPAN><SPAN class="nation_name">摩纳哥</SPAN>
									</A></LI>
									<LI data-iso-code="MN" data-calling-code="976"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+976</SPAN><SPAN class="nation_name">蒙古国</SPAN>
									</A></LI>
									<LI data-iso-code="ME" data-calling-code="382"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+382</SPAN><SPAN class="nation_name">黑山</SPAN>
									</A></LI>
									<LI data-iso-code="MA" data-calling-code="212"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+212</SPAN><SPAN class="nation_name">摩洛哥</SPAN>
									</A></LI>
									<LI data-iso-code="MZ" data-calling-code="258"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+258</SPAN><SPAN class="nation_name">莫桑比克</SPAN>
									</A></LI>
									<LI data-iso-code="MM" data-calling-code="95"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+95</SPAN><SPAN class="nation_name">缅甸</SPAN>
									</A></LI>
									<LI data-iso-code="NA" data-calling-code="264"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+264</SPAN><SPAN class="nation_name">纳米比亚</SPAN>
									</A></LI>
									<LI data-iso-code="NR" data-calling-code="674"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+674</SPAN><SPAN class="nation_name">瑙鲁</SPAN>
									</A></LI>
									<LI data-iso-code="NP" data-calling-code="977"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+977</SPAN><SPAN class="nation_name">尼泊尔</SPAN>
									</A></LI>
									<LI data-iso-code="NL" data-calling-code="31"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+31</SPAN><SPAN class="nation_name">荷兰</SPAN>
									</A></LI>
									<LI data-iso-code="AN" data-calling-code="599"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+599</SPAN><SPAN class="nation_name">荷属安的列斯</SPAN>
									</A></LI>
									<LI data-iso-code="NC" data-calling-code="687"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+687</SPAN><SPAN class="nation_name">新喀里多尼亚</SPAN>
									</A></LI>
									<LI data-iso-code="NZ" data-calling-code="64"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+64</SPAN><SPAN class="nation_name">新西兰</SPAN>
									</A></LI>
									<LI data-iso-code="NI" data-calling-code="505"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+505</SPAN><SPAN class="nation_name">尼加拉瓜</SPAN>
									</A></LI>
									<LI data-iso-code="NE" data-calling-code="227"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+227</SPAN><SPAN class="nation_name">尼日尔</SPAN>
									</A></LI>
									<LI data-iso-code="NG" data-calling-code="234"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+234</SPAN><SPAN class="nation_name">尼日利亚</SPAN>
									</A></LI>
									<LI data-iso-code="NU" data-calling-code="683"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+683</SPAN><SPAN class="nation_name">纽埃</SPAN>
									</A></LI>
									<LI data-iso-code="KP" data-calling-code="850"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+850</SPAN><SPAN class="nation_name">朝鲜</SPAN>
									</A></LI>
									<LI data-iso-code="NO" data-calling-code="47"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+47</SPAN><SPAN class="nation_name">挪威</SPAN>
									</A></LI>
									<LI data-iso-code="OM" data-calling-code="968"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+968</SPAN><SPAN class="nation_name">阿曼</SPAN>
									</A></LI>
									<LI data-iso-code="PK" data-calling-code="92"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+92</SPAN><SPAN class="nation_name">巴基斯坦</SPAN>
									</A></LI>
									<LI data-iso-code="PW" data-calling-code="680"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+680</SPAN><SPAN class="nation_name">帕劳</SPAN>
									</A></LI>
									<LI data-iso-code="PS" data-calling-code="970"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+970</SPAN><SPAN class="nation_name">巴勒斯坦</SPAN>
									</A></LI>
									<LI data-iso-code="PA" data-calling-code="507"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+507</SPAN><SPAN class="nation_name">巴拿马</SPAN>
									</A></LI>
									<LI data-iso-code="PG" data-calling-code="675"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+675</SPAN><SPAN class="nation_name">巴布亚新几内亚</SPAN>
									</A></LI>
									<LI data-iso-code="PY" data-calling-code="595"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+595</SPAN><SPAN class="nation_name">巴拉圭</SPAN>
									</A></LI>
									<LI data-iso-code="PE" data-calling-code="51"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+51</SPAN><SPAN class="nation_name">秘鲁</SPAN>
									</A></LI>
									<LI data-iso-code="PH" data-calling-code="63"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+63</SPAN><SPAN class="nation_name">菲律宾</SPAN>
									</A></LI>
									<LI data-iso-code="PN" data-calling-code="64"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+64</SPAN><SPAN class="nation_name">皮特凯恩群岛</SPAN>
									</A></LI>
									<LI data-iso-code="PL" data-calling-code="48"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+48</SPAN><SPAN class="nation_name">波兰</SPAN>
									</A></LI>
									<LI data-iso-code="PT" data-calling-code="351"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+351</SPAN><SPAN class="nation_name">葡萄牙</SPAN>
									</A></LI>
									<LI data-iso-code="QA" data-calling-code="974"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+974</SPAN><SPAN class="nation_name">卡塔尔</SPAN>
									</A></LI>
									<LI data-iso-code="CG" data-calling-code="242"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+242</SPAN><SPAN class="nation_name">刚果</SPAN>
									</A></LI>
									<LI data-iso-code="RE" data-calling-code="262"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+262</SPAN><SPAN class="nation_name">留尼汪</SPAN>
									</A></LI>
									<LI data-iso-code="RO" data-calling-code="40"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+40</SPAN><SPAN class="nation_name">罗德西亚</SPAN>
									</A></LI>
									<LI data-iso-code="RU" data-calling-code="7"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+7</SPAN><SPAN class="nation_name">俄罗斯</SPAN>
									</A></LI>
									<LI data-iso-code="RW" data-calling-code="250"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+250</SPAN><SPAN class="nation_name">卢旺达</SPAN>
									</A></LI>
									<LI data-iso-code="BL" data-calling-code="590"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+590</SPAN><SPAN class="nation_name">圣巴泰勒米</SPAN>
									</A></LI>
									<LI data-iso-code="SH" data-calling-code="290"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+290</SPAN><SPAN class="nation_name">圣赫勒拿</SPAN>
									</A></LI>
									<LI data-iso-code="MF" data-calling-code="590"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+590</SPAN><SPAN class="nation_name">圣马丁行政区</SPAN>
									</A></LI>
									<LI data-iso-code="PM" data-calling-code="508"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+508</SPAN><SPAN class="nation_name">圣皮埃尔和密克隆</SPAN>
									</A></LI>
									<LI data-iso-code="WS" data-calling-code="685"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+685</SPAN><SPAN class="nation_name">萨摩亚</SPAN>
									</A></LI>
									<LI data-iso-code="SM" data-calling-code="378"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+378</SPAN><SPAN class="nation_name">圣马力诺</SPAN>
									</A></LI>
									<LI data-iso-code="ST" data-calling-code="239"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+239</SPAN><SPAN class="nation_name">圣多美和普林西比</SPAN>
									</A></LI>
									<LI data-iso-code="SA" data-calling-code="966"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+966</SPAN><SPAN class="nation_name">沙特阿拉伯</SPAN>
									</A></LI>
									<LI data-iso-code="SN" data-calling-code="221"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+221</SPAN><SPAN class="nation_name">塞内加尔</SPAN>
									</A></LI>
									<LI data-iso-code="RS" data-calling-code="381"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+381</SPAN><SPAN class="nation_name">塞尔维亚</SPAN>
									</A></LI>
									<LI data-iso-code="SC" data-calling-code="248"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+248</SPAN><SPAN class="nation_name">塞舌尔</SPAN>
									</A></LI>
									<LI data-iso-code="SL" data-calling-code="232"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+232</SPAN><SPAN class="nation_name">塞拉利昂</SPAN>
									</A></LI>
									<LI data-iso-code="SG" data-calling-code="65"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+65</SPAN><SPAN class="nation_name">新加坡</SPAN>
									</A></LI>
									<LI data-iso-code="SK" data-calling-code="421"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+421</SPAN><SPAN class="nation_name">斯洛伐克</SPAN>
									</A></LI>
									<LI data-iso-code="SI" data-calling-code="386"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+386</SPAN><SPAN class="nation_name">斯洛文尼亚</SPAN>
									</A></LI>
									<LI data-iso-code="SB" data-calling-code="677"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+677</SPAN><SPAN class="nation_name">所罗门群岛</SPAN>
									</A></LI>
									<LI data-iso-code="SO" data-calling-code="252"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+252</SPAN><SPAN class="nation_name">索马里</SPAN>
									</A></LI>
									<LI data-iso-code="ZA" data-calling-code="27"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+27</SPAN><SPAN class="nation_name">扎伊尔</SPAN>
									</A></LI>
									<LI data-iso-code="KR" data-calling-code="82"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+82</SPAN><SPAN class="nation_name">韩国</SPAN>
									</A></LI>
									<LI data-iso-code="SS" data-calling-code="211"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+211</SPAN><SPAN class="nation_name">南苏丹</SPAN>
									</A></LI>
									<LI data-iso-code="ES" data-calling-code="34"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+34</SPAN><SPAN class="nation_name">西班牙</SPAN>
									</A></LI>
									<LI data-iso-code="LK" data-calling-code="94"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+94</SPAN><SPAN class="nation_name">斯里兰卡</SPAN>
									</A></LI>
									<LI data-iso-code="SD" data-calling-code="249"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+249</SPAN><SPAN class="nation_name">苏丹</SPAN>
									</A></LI>
									<LI data-iso-code="SR" data-calling-code="597"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+597</SPAN><SPAN class="nation_name">苏里南</SPAN>
									</A></LI>
									<LI data-iso-code="SJ" data-calling-code="47"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+47</SPAN><SPAN class="nation_name">斯瓦尔巴和扬马延</SPAN>
									</A></LI>
									<LI data-iso-code="SZ" data-calling-code="268"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+268</SPAN><SPAN class="nation_name">斯威士兰</SPAN>
									</A></LI>
									<LI data-iso-code="SE" data-calling-code="46"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+46</SPAN><SPAN class="nation_name">瑞典</SPAN>
									</A></LI>
									<LI data-iso-code="CH" data-calling-code="41"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+41</SPAN><SPAN class="nation_name">瑞士</SPAN>
									</A></LI>
									<LI data-iso-code="SY" data-calling-code="963"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+963</SPAN><SPAN class="nation_name">叙利亚</SPAN>
									</A></LI>
									<LI data-iso-code="TJ" data-calling-code="992"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+992</SPAN><SPAN class="nation_name">塔吉克斯坦</SPAN>
									</A></LI>
									<LI data-iso-code="TZ" data-calling-code="255"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+255</SPAN><SPAN class="nation_name">坦桑尼亚</SPAN>
									</A></LI>
									<LI data-iso-code="TH" data-calling-code="66"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+66</SPAN><SPAN class="nation_name">泰国</SPAN>
									</A></LI>
									<LI data-iso-code="TG" data-calling-code="228"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+228</SPAN><SPAN class="nation_name">多哥</SPAN>
									</A></LI>
									<LI data-iso-code="TK" data-calling-code="690"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+690</SPAN><SPAN class="nation_name">托克劳</SPAN>
									</A></LI>
									<LI data-iso-code="TO" data-calling-code="676"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+676</SPAN><SPAN class="nation_name">汤加</SPAN>
									</A></LI>
									<LI data-iso-code="TN" data-calling-code="216"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+216</SPAN><SPAN class="nation_name">突尼斯</SPAN>
									</A></LI>
									<LI data-iso-code="TR" data-calling-code="90"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+90</SPAN><SPAN class="nation_name">土耳其</SPAN>
									</A></LI>
									<LI data-iso-code="TM" data-calling-code="993"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+993</SPAN><SPAN class="nation_name">土库曼斯坦</SPAN>
									</A></LI>
									<LI data-iso-code="TV" data-calling-code="688"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+688</SPAN><SPAN class="nation_name">图瓦卢</SPAN>
									</A></LI>
									<LI data-iso-code="UG" data-calling-code="256"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+256</SPAN><SPAN class="nation_name">乌干达</SPAN>
									</A></LI>
									<LI data-iso-code="UA" data-calling-code="380"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+380</SPAN><SPAN class="nation_name">联合阿拉伯共和国</SPAN>
									</A></LI>
									<LI data-iso-code="AE" data-calling-code="971"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+971</SPAN><SPAN class="nation_name">阿联酋</SPAN>
									</A></LI>
									<LI data-iso-code="GB" data-calling-code="44"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+44</SPAN><SPAN class="nation_name">英国</SPAN>
									</A></LI>
									<LI data-iso-code="US" data-calling-code="1"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+1</SPAN><SPAN class="nation_name">美国</SPAN>
									</A></LI>
									<LI data-iso-code="UY" data-calling-code="598"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+598</SPAN><SPAN class="nation_name">乌拉圭</SPAN>
									</A></LI>
									<LI data-iso-code="UZ" data-calling-code="998"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+998</SPAN><SPAN class="nation_name">乌兹别克斯坦</SPAN>
									</A></LI>
									<LI data-iso-code="VU" data-calling-code="678"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+678</SPAN><SPAN class="nation_name">瓦努阿图</SPAN>
									</A></LI>
									<LI data-iso-code="VA" data-calling-code="379"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+379</SPAN><SPAN class="nation_name">梵蒂冈</SPAN>
									</A></LI>
									<LI data-iso-code="VE" data-calling-code="58"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+58</SPAN><SPAN class="nation_name">委内瑞拉</SPAN>
									</A></LI>
									<LI data-iso-code="VN" data-calling-code="84"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+84</SPAN><SPAN class="nation_name">越南</SPAN>
									</A></LI>
									<LI data-iso-code="WF" data-calling-code="681"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+681</SPAN><SPAN class="nation_name">瓦利斯和富图纳</SPAN>
									</A></LI>
									<LI data-iso-code="EH" data-calling-code="212"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+212</SPAN><SPAN class="nation_name">阿拉伯撒哈拉民主共和国</SPAN>
									</A></LI>
									<LI data-iso-code="YE" data-calling-code="967"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+967</SPAN><SPAN class="nation_name">也门</SPAN>
									</A></LI>
									<LI data-iso-code="ZM" data-calling-code="260"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+260</SPAN><SPAN class="nation_name">赞比亚</SPAN>
									</A></LI>
									<LI data-iso-code="ZW" data-calling-code="263"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+263</SPAN><SPAN class="nation_name">津巴布韦</SPAN>
									</A></LI>
									<LI data-iso-code="TW" data-calling-code="886"><A
										tabindex="-1" href="javascript:void(null)"><SPAN
											class="nation_code">+886</SPAN><SPAN class="nation_name">中国台湾</SPAN>
									</A></LI>
								</UL>
								<INPUT name="sign_in[country_code]" id="sign_in_country_code"
									type="hidden" value="CN"> <INPUT
									name="sign_in[mobile_number]" class="span2"
									id="sign_in_mobile_number" type="text" placeholder="移动电话号码"
									value="">
							</DIV>
						</DIV>
						<DIV class="input-prepend domestic ">
							<SPAN class="add-on"><I class="fa fa-user"></I></SPAN> <INPUT
								name="user.name" class="span2" id="sign_in_name" type="text"
								placeholder="手机号码/电子邮件" value="">
						</DIV>
						<DIV class="input-prepend password ">
							<SPAN class="add-on"><I class="fa fa-unlock-alt"></I></SPAN> <INPUT
								name="user.password" class="span2" id="sign_in_password"
								type="password" placeholder="密码" value="">
						</DIV>
						<INPUT name="sign_in[is_foreign]" id="sign_in_is_foreign"
							type="hidden" value="false">
						<DIV class="captcha" data-captcha-type="geetest">
							<INPUT name="captcha[validation][challenge]" type="hidden"
								value="f61892acb16b861d9c512fdfa0e308c4" autocomplete="off">
							<INPUT name="captcha[validation][gt]" type="hidden"
								value="a10ea6a23a441db3d956598988dff3c4" autocomplete="off">

							<INPUT name="captcha[validation][validate]" type="hidden"
								autocomplete="off"> <INPUT
								name="captcha[validation][seccode]" type="hidden"
								autocomplete="off"> <INPUT name="captcha[id]"
								type="hidden" value="a5ec38b0-9e0c-431b-8633-a4e63e9d5728"
								autocomplete="off">

							<DIV class="geetest" id="geetest-area"></DIV>
						</DIV>
						<BUTTON class="ladda-button submit-button" data-color="blue">
							<SPAN class="ladda-label">登 录</SPAN>
						</BUTTON>
						<DIV class="control-group text-left">
							<INPUT name="sign_in[remember_me]" id="sign_in_remember_me"
								type="checkbox" checked="checked" value="true"> 记住我 <A
								href="http://www.jianshu.com/users/password/new">忘记密码</A>
						</DIV>
						<DIV>
							<A class="switch_sign_in_name" href="javascript:void(null)">海外手机登录</A>
						</DIV>
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

	<SCRIPT src="js/js_5.js"></SCRIPT>

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

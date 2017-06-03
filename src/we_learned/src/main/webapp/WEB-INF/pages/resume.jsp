<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common/tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="common/head.jsp"%>
<title>个人知识简历 - 简随记</title>

<link rel="stylesheet" href="<%=path%>/css/resume.css">

<script>
	(function(i, s, o, g, r, a, m) {
		i['GoogleAnalyticsObject'] = r;
		i[r] = i[r] || function() {
			(i[r].q = i[r].q || []).push(arguments)
		}, i[r].l = 1 * new Date();
		a = s.createElement(o), m = s.getElementsByTagName(o)[0];
		a.async = 1;
		a.src = g;
		m.parentNode.insertBefore(a, m)
	})(window, document, 'script',
			'https://www.google-analytics.com/analytics.js', 'ga');

	ga('create', 'UA-92595311-1', 'auto');
	ga('send', 'pageview');
</script>

</head>
<body>
	<div class="site">
		<div class="Container">
			<div class="sidebar">
				<div class="title">
					<svg version="1.1" id="svg" xmlns="http://www.w3.org/2000/svg"
						xmlns:xlink="http://www.w3.org/1999/xlink" x="80px" y="0px" viewBox="50 0 250 400"
						width="250px" height="400px" xml:space="preserve">
                    <!-- face -->
                    <path fill="#00bfa5" class="svg-no"
							d="
                    M150 80 H200 L250 100 L270 150 L250 300 L200 320 H150 L100 300 L80 150 L100 100 L150 80 Z
                    "
							style="stroke:#fff;stroke-width: 5;"></path>          
                    <!-- hair -->
                    <path fill="#fff"
							d="M100 100 L140 150 L140 130 L190 160 L185 135 L240 155 L220 120 L270 150 L250 100 L200 80 L150 80Z"
							style="stroke:#fff;stroke-width: 5;"></path>
                    <!-- ear-->
                    <path fill="#00bfa5" class="svg-no"
							d="
                    M85 190 H66 V240 L93 250 Z
                    "
							style="stroke:#fff;stroke-width: 5;"></path>
                    <path fill="#00bfa5" class="svg-no"
							d="
                    M265 190 H284 V240 L257 250 Z
                    "
							style="stroke:#fff;stroke-width: 5;"></path>          
                    <!-- eyebrow -->
                    <path class="svg-no left-eyebrow"
							d="
                    M120 170 H150 Z
                    "
							style="stroke:#fff;stroke-width: 5;"></path>
                    <path class="right-eyebrow" class="svg-no"
							d="
                    M200 170 H230 Z
                    "
							style="stroke:#fff;stroke-width: 5;"></path>
                    <!-- eyes -->
                    <circle class="left-eye" cx="135" cy="200" r="10" fill="#fff"></circle>
                    <circle class="right-eye" cx="215" cy="200" r="10" fill="#fff"></circle>
                    <!-- nose -->
                    <path d="M160 240 H190" style="stroke:#fff;stroke-width: 5;"></path>      
                    <!-- MOUSE -->
                    <path d="M150 290 L200 285 Z" style="stroke:#fff;stroke-width: 5;"></path>          
                    <!-- SHOULDERS -->
                    <path d="M135 330 L50 350" style="stroke:#fff;stroke-width: 5;"></path>
                    <path d="M215 330 L300 350" style="stroke:#fff;stroke-width: 5;"></path>
                    <path fill="#00bfa5" class="svg-no"
							d="M120 335 
                    C 200 390 200 390 230 335
                    "
							style="stroke:#fff;stroke-width: 5;"></path>
                    <!-- neck -->
                    <path class="svg-no" d="M130 310 L140 350" style="stroke:#fff;stroke-width: 5;"></path>
                    <path class="svg-no" d="M220 310 L210 350" style="stroke:#fff;stroke-width: 5;"></path>
                </svg>
					<h1>${user.userName}的简历</h1>
				</div>
				<ul class="side-info">
					<li class="someRight">
						<dt>
							<i class="fa fa-bookmark"></i>
							Contact. 联系方式
						</dt>

						<dd>
							<i class="fa fa-envelope"></i>
							Email:
							<a href="" target="_blank">${user.userEmail}</a>
						</dd>

						<dd>
							<i class="fa fa-phone-square"></i>
							PhoneNumber:
							<a target="_blank">${user.userPhone}</a>
						</dd>

					</li>
					<li class="skill">
						<dt>
							<i class="fa fa-bookmark"></i>
							Tech. 技能点
						</dt>

						<c:forEach items="${labelMap}" var="entry">
							<c:forEach items="${entry.value}" var="thirdLabel" varStatus="status">
								<dd>
									<div class="skill-name">${thirdLabel.key}</div>
									<div class="skill-bar-wrap">
										<div class="skill-bar" style="width: ${thirdLabel.value.labelSkillPercentage}%;"></div>
									</div>
								</dd>
							</c:forEach>
						</c:forEach>
					</li>
				</ul>
			</div>

			<div class="main">
				<ul class="main-info">
					<!-- 个人信息 -->
					<li class="someRight">
						<dt>
							<i class="fa fa-bookmark"></i>
							Basic info. 基本信息
						</dt>
						<dd>
							<span>加入网站时间:</span>
							${user.userCreateTime}
						</dd>
						<dd>
							<span>段位:</span>
							${user.userLevel}
						</dd>
						<dd>
							<span>榜样:</span>
							是
							<span>${user.userFansNumber}</span>
							个人的学习榜样
						</dd>
						<dd>
							<span>GitHub:</span>
							<a href="${user.userWeb}" target="_blank">${user.userWeb}</a>
						</dd>
					</li>

					<!-- 个人技能 -->
					</li>
					<li>
						<dt>
							<i class="fa fa-bookmark"></i>
							Skill. 技能清单
						</dt>

						<c:forEach items="${labelMap}" var="entry">
							<h3>
								<c:out value="${entry.key}" />
							</h3>
							<ul class="exp">
								<c:forEach items="${entry.value}" var="thirdLabel" varStatus="status">
									<li>
										<div class="circle"></div>
										<h4 class="title-btn">
											${thirdLabel.key}
											<span class="glyphicon glyphicon-chevron-right"></span>
											<div class="list-meta">
												<span>总赞数:${thirdLabel.value.labelGoodNumber}</span>
												&nbsp;&nbsp;
												<span>总阅读量:${thirdLabel.value.labelReadingNumber}</span>
											</div>
										</h4>
										<div class="note-list">
											<c:forEach items="${essayMap}" var="essayEntry">
												<c:if test="${essayEntry.key == thirdLabel.key}">
													<c:forEach items="${essayEntry.value}" var="essay">
														<div class="one-note">
															<a href="<%=path%>/essay/${essay.id}">${essay.essayTitle}</a>
															&nbsp;&nbsp;&nbsp;&nbsp;
															<span class="glyphicon glyphicon-heart"></span>
															${essay.essayGoodNumber} &nbsp;&nbsp;
															<span class="glyphicon glyphicon-eye-open"></span>
															${essay.essayReadingNumber}
														</div>
													</c:forEach>
												</c:if>
											</c:forEach>
										</div>
									</li>
								</c:forEach>
							</ul>
						</c:forEach>

						<h3>其他</h3>
						<ul class="exp">
							<li>
								<p>${user.userIntroduce}</p>
							</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<%@ include file="common/common-js.jsp"%>
	<script src="<%=path%>/js/resume.js"></script>
	<script src="<%=path%>/js/resume-toggle.js"></script>
</body>
</html>
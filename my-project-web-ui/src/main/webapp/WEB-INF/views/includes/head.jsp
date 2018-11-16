<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<meta charset="utf-8">
	<title>猫猫新闻</title>
	<link rel="stylesheet" type="text/css" href="/static/css/index.css">
	<link rel="stylesheet" type="text/css" href="/static/css/ziy.css">
	<link rel="stylesheet" type="text/css" href="/static/houl/jquery.fancybox-1.3.4.css">
	<link rel="stylesheet" type="text/css" href="/static/houl/style.css">

	<script type="text/javascript" src="/static/js/jquery1.42.min.js"></script>
	<script src="/static/js/include.js" ></script>
	<script src="/static/js/index.js" ></script>
	<script type="text/javascript" src="/static/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="/static/js/jquery.SuperSlide.2.1.1.source.js"></script>

</head>
<body>

<div id="header">
	<div class="header-box">
		<ul class="header-left">
			<iframe id="fancybox-frame" name="fancybox-frame1540781521475" frameborder="0" scrolling="no" hspace="0"  src="http://i.tianqi.com/index.php?c=code&a=getcode&id=34&h=25&w=280"></iframe>				
		</ul>
		
		<ul class="header-right">
		<li class="denglu"><p>欢迎光临猫猫新闻</p></li>

			<c:choose>
				<c:when test="${not empty frontUser}">
					<li class="denglu">Hi~<a class="red" href="##">欢迎你!${frontUser.userName}</a><a href="/user/getRegister">[免费注册]</a></li>
					<li class="denglu"><a href="/user/logout">注销</a></li>
					<li class="denglu"><a class="ing_ps ps1" href="/user/getUserById?id=${frontUser.id}">个人信息</a></li>
				</c:when>
				<c:otherwise>
					<li class="denglu">Hi~<a class="red" href="/user/getLogin">请登录!</a><a href="register.jsp">[免费注册]</a></li>
				</c:otherwise>
			</c:choose>

		</ul>
	</div>
</div>
<!--搜索栏-->
<div class="toub_beij">
	<div class="logo"><a href="/static/images/logo.png"><img src="/static/images/logo.png"></a></div>
	<div class="search">

		<form action="/content/search" method="post">
			<input type="text" value="" class="text" id="textt" name="title" placeholder="请输入要搜索的内容!!">
			<input class="button" type="submit" value="搜索"/>
		</form>
	</div>
</div>

<!--轮播图上方导航栏  一栏-->
<div id="navv">
	<div class="focus">
		<div class="focus-a">
			<div class="fouc-font"><a href="/homePage/getData">首页</a> </div>
		</div>



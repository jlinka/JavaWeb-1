<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="com.finalExam.bean.*" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/css-search.css">
</head>
<body class="full">
<div id="Head" class="lipstickHead">
	<div id="headerTopArea" class="headerTopAreaBox">
		<div class="headerTopArea">
			<div class="headerTop">
				<div class="headerTopLeft">
					<div id="welcome" class="topLoginArea">
						你好，
						<span class="top">欢迎光临不存在唇膏店&nbsp;</span>
						<span>
							<a href="index.jsp">登录</a>
							&nbsp;|&nbsp;
							<a href="customerReg.jsp">注册</a>
						</span>
					</div>
					<div class="recommendArea">
						<a>我的订单</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="logoArea" class="lipstickLogoSearch">
		<div class="lipstickSearch fr">
			<div class="searchTab">
				<div class="search">
					<form action="searchGoods.jsp" method="post" name="lg_form">
						<input type="text" class="searchText" name="search">
						<input type="submit" class="searchBtn" value="搜索">
					</form>
				</div>
				<div class="active" id="shoppingCar">
					<a class="carTab">
					购物车
					(<span>0</span>)
					</a>
				</div>
			</div>
		</div>
	</div>
	<div class="navList" id="mainNavBox">
		<div class="navListBox">
			<ul>
				<li class="lipstickLogo_Con" style="text-align: left;">
					<a class="logo" href="searchGoods.jsp"><img alt="Unreal" src="images/logo.png"></a>
				</li>
				<li>
					<a href="searchGoods.jsp">首页</a>
					<span class="NavLine"></span>
				</li>
				<li>
					<a>首页</a>
					<span class="NavLine"></span>
				</li>
				<li>
					<a>首页</a>
					<span class="NavLine"></span>
				</li>
				<li>
					<a>首页</a>
					<span class="NavLine"></span>
				</li>
				<li>
					<a>首页</a>
					<span class="NavLine"></span>
				</li>
				<li>
					<a>首页</a>
					<span class="NavLine"></span>
				</li>
				<li>
					<a>首页</a>
					<span class="NavLine"></span>
				</li>
				<li>
					<a>首页</a>
					<span class="NavLine"></span>
				</li>
			</ul>
		</div>
	</div>
</div>
<div class="headLine"></div>
</body>
</html>
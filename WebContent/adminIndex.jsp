<!--adminIndex.jsp-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.finalExam.bean.*" %>
    <%@ page import="java.sql.*" %>
	<%@ page import="com.mysql.jdbc.Driver" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>商品管理首页-不存在的唇膏店-Unreal Lipstick Store</title>
	<link rel="stylesheet" type="text/css" href="css/css-adminindex.css">
</head>
<%
AdminInfo admin=(AdminInfo) session.getAttribute("currentAdmin");
String strInfo=(String) session.getAttribute("info");
%>
<body>
<jsp:include page="adminHead.jsp"></jsp:include>
<canvas id="Mycanvas"></canvas>
	<script src='js/index-bg.js' type="text/javascript"></script>
<div class="box">
	<br>
	<div class="logo"><img alt="Unreal" src="images/logo.png" /></div>
	<%if(admin != null) {%>
	<h1>商品管理</h1>
		<form name="form" action="searchResult.jsp" method="post">
			<center>
	        <div id="choice">
	            <select name="select" id="select">
	                <option value="id">唇膏id</option>
	                <option value="type">唇膏类型</option>
	                <option value="name">唇膏名称</option>
	                <option value="place">唇膏产地</option>
	            </select>
	        </div>
	        </center>
	        <br>
			<div class="input_box">
			            <input type="text" value="" placeholder="请输入检索内容" id="search" name="search" />
			</div>
			<div class="button_box">
	            <center>
	                <input type="submit" value="搜索"> &nbsp;&nbsp;
	                <input type="reset" value="重置">
	            </center>
	        </div>
        </form>
        <br>
		<div class="reg_button">
		         	<center>
		         	<button type="button" onclick="javascript:window.location.href='searchResult.jsp'">
		         	商品改查
		         	</button></center>
		</div>
		<br>
		<div class="reg_button">
		         	<center>
		         	<button type="button" onclick="javascript:window.location.href='commodityAdd.jsp'">
		         	商品添加
		         	</button></center>
		</div>
		<br>
		<div class="reg_button">
		         	<center>
		         	<button type="button" onclick="javascript:window.location.href='commodityAdd.jsp'">
		         	商品推荐
		         	</button></center>
		</div>
		<%}else{ %>
		<h1>请先登录</h1>
		<div class="reg_button">
		         	<center>
		         	<button type="button" onclick="javascript:window.location.href='adminLogin.jsp'">
		         	登录
		         	</button></center>
		</div>
		<p>
		<center><font size="2" color="3f3f3f">不是管理员?</font></center>
		<p>
		<div class="reg_button">
		         	<center>
		         	<button type="button" onclick="javascript:window.location.href='homePage.jsp'">
		         	前往购物首页
		         	</button></center>
		</div>
		<p>
		<div class="reg_button">
		         	<center>
		         	<button type="button" onclick="javascript:window.location.href='customerReg.jsp'">
		         	注册普通会员
		         	</button></center>
		</div>
		<%} 
		session.removeAttribute("info"); %>
		
</div>
</body>
</html>
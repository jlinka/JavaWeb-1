<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.finalExam.bean.*" %>
    <%@ page import="java.sql.*" %>
	<%@ page import="com.mysql.jdbc.Driver" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录结果</title>
<link rel="stylesheet" type="text/css" href="css/css-style.css">
</head>
<body>
<canvas id="Mycanvas"></canvas>
	<script src='js/index-bg.js' type="text/javascript"></script>
<div class="box">
<br>
<div class="logo"><img alt="Unreal" src="images/logo.png" /></div>
<%
AdminInfo admin=(AdminInfo) session.getAttribute("currentAdmin");
String strInfo=(String) session.getAttribute("info");
if (admin!=null) {
%>
<h1>登录成功</h1>
<h2>欢迎你，<%=admin.getAid()%>！开始管理小店</h2>
<div class="reg_button">
         	<center><button type="button" onclick="javascript:window.location.href='adminIndex.jsp'">商品管理</button></center>
</div>
<br>
<div class="reg_button">
         	<center><button type="button" onclick="javascript:window.location.href='adminReg.jsp'">账号注册</button></center>
</div>
<%}
else{
%>
<h1>登录失败</h1>
<center><font size="2" color="3f3f3f">请检查账号密码！</font></center>
<br>
<div class="reg_button">
         	<center><button type="button" onclick="javascript:window.location.href='adminReg.jsp'">注册</button></center>
</div>
<br>
<div class="reg_button">
         	<center><button type="button" onclick="javascript:window.location.href='adminLogin.jsp'">登录</button></center>
</div>
<%
  session.removeAttribute("info"); 
}
%>
</div>

</body>
</html>
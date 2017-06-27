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
</head>

<link rel="stylesheet" type="text/css" href="css/css-loginresult.css">

<body>
<canvas id="Mycanvas"></canvas>
	<script src='js/index-bg.js' type="text/javascript"></script>
<div class="box">
<br>
<div class="logo"><img alt="Unreal" src="images/logo.png" /></div>
<%
UserInfo user=(UserInfo) session.getAttribute("currentUser");
String strInfo=(String) session.getAttribute("info");
if (user!=null) {
%>
<h1>登录成功</h1>
<h2>欢迎你，<%=user.getCid()%>！尽情填满购物车吧！</h2>
<div class="reg_button">
         	<center><button type="button" onclick="javascript:window.location.href='infoChange.jsp?cid=<%=user.getCid()%>'">修改信息</button></center>
</div>
<br>
<div class="reg_button">
         	<center><button type="button" onclick="javascript:window.location.href='homePage.jsp?cid=<%=user.getCid()%>'">去往首页</button></center>
</div>
<br>
<div class="reg_button">
         	<center><button type="button" onclick="javascript:window.location.href='shopCar.jsp?cid=<%= user.getCid()%>'">购物车</button></center>
</div>
<br>
<div class="reg_button">
         	<center><button type="button" onclick="javascript:window.location.href='searchGoods.jsp?cid=<%= user.getCid()%>&search=<%="" %>'">搜索商品</button></center>
</div>
<%}
else{
%>
<h1>
<%=strInfo %>请先登录！</h1>
<div class="reg_button">
         	<center><button type="button" onclick="javascript:window.location.href='customerReg.jsp'">注册</button></center>
</div>
<br>
<div class="reg_button">
         	<center><button type="button" onclick="javascript:window.location.href='index.jsp'">登录</button></center>
</div>
<%
  session.removeAttribute("info"); 
}
%>
</div>

</body>
</html>
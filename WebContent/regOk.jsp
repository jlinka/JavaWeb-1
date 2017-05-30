<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.finalExam.bean.*" %>
    <%@ page import="java.sql.*" %>
	<%@ page import="com.mysql.jdbc.Driver" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册结果</title>
<link rel="stylesheet" type="text/css" href="css/css-style.css">
</head>
<body>
<canvas id="Mycanvas"></canvas>
	<script src='js/index-bg.js' type="text/javascript"></script>
<div class="box">
<br>
<div class="logo"><img alt="Unreal" src="images/logo.png" /></div>
<%

request.setCharacterEncoding("utf-8");

String cid =request.getParameter("cid");
String password =request.getParameter("pwd");
String gender = request.getParameter("gender");
String address =request.getParameter("address");
String phone = request.getParameter("tel");
String mail = request.getParameter("email");


boolean result = false;
UserInfo user = new UserInfo();
UserManager userm = new UserManager();

user.setCid(cid);
user.setPasswd(password);
user.setGender(gender);
user.setAddr(address);
user.setTel(phone);
user.setEmail(mail);

result = userm.InsertInfo(user);

if (result == true) 
{
	System.out.println("");

%>
<h1>感谢你的注册</h1>
<h2>注册成功！</h2>
<div class="reg_button">
         	<center><button type="button" onclick="javascript:window.location.href='customerReg.jsp'">返回上一级</button></center>
</div>
<br>
<div class="reg_button">
         	<center><button type="button" onclick="javascript:window.location.href='index.jsp'">登录</button></center>
</div>

<% }
else
{
	System.out.println("");
%>
<h1>注册失败</h1>
<h2>用户名已存在或信息不规范</h2>
<div class="reg_button">
         	<center><button type="button" onclick="javascript:window.location.href='customerReg.jsp'">返回上一级</button></center>
</div>
<br>
<div class="reg_button">
         	<center><button type="button" onclick="javascript:window.location.href='index.jsp'">登录</button></center>
</div>
<% 
}%>
</div>
</body>
</html>
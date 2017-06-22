<!--changeOK.jsp-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.finalExam.bean.*" %>
    <%@ page import="java.sql.*" %>
	<%@ page import="com.mysql.jdbc.Driver" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>修改结果</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="@author 201541402216谢增光">
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
    
    	UserManager userm = new UserManager();
    	UserInfo user = new UserInfo();
	
        String cid =request.getParameter("cid");
        String password =request.getParameter("pwd");
        String gender = request.getParameter("gender");
        String address =request.getParameter("address");
        String tel = request.getParameter("tel");
        String email = request.getParameter("email");

       user.setCid(cid);
       user.setPasswd(password);
       user.setGender(gender);
       user.setAddr(address);
       user.setTel(tel);
       user.setEmail(email);
       
       boolean result = userm.UpdateUserInfo(user);
       if(result){
    %>
                <h1>修改成功!</h1>
                <h2>登录验证一下</h2>
                <div class="reg_button">
         				<center><button type="button" onclick="javascript:window.location.href='customerReg.jsp'">注册</button></center>
				</div>
				<br>
				<div class="reg_button">
				         <center><button type="button" onclick="javascript:window.location.href='index.jsp'">登录</button></center>
				</div>
    <%         
       }else{
%>	<h1>修改失败!</h1>
    <h3><a href="customerList.jsp">返回信息浏览页面</a></h3>
    <h3>现在登录</h3>
    <h1><a href="index.jsp">登录</a></h1>
    <%} %>
    </div>
    </body>
</body>
</html>
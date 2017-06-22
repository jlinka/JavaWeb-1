<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
   <%@ page import="java.util.*"%>
   <%@ page import="java.io.*"%>
   <%@ page import="com.finalExam.bean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="css/css-style.css">
<title>登录结果</title>
</head>

<body>
<div class="box">
<%
 request.setCharacterEncoding("UTF-8");
 String aid = request.getParameter("aid");
 String pwd = request.getParameter("pwd");
 AdminManager admin = new AdminManager();
 AdminInfo user = new AdminInfo();
 user = admin.adminLogin(aid, pwd);
 
 if(user!=null){
	 session.setAttribute("currentAdmin", user);
	 session.setAttribute("info", "<h2>登录成功！</h2>");
	 response.sendRedirect("adminLoginResult.jsp");
 }
 else{
	 session.setAttribute("currentAdmin", null);
	 session.setAttribute("info", "<h2>登录失败！</h2>");
	 
	 response.sendRedirect("adminLoginResult.jsp");
 }
%>
</div>	 
</body>
</html>
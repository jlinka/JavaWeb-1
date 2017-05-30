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
 String cid = request.getParameter("cid");
 String pwd = request.getParameter("pwd");
 UserManager usermanager = new UserManager();
 UserInfo user = new UserInfo();
 user = usermanager.userLogin(cid, pwd);
 
 if(user!=null){
	 session.setAttribute("currentUser", user);
	 session.setAttribute("info", "<h2>登录成功！</h2>");
	 response.sendRedirect("loginResult.jsp");
 }
 else{
	 session.setAttribute("currentUser", null);
	 session.setAttribute("info", "<h2>登录失败！</h2>");
	 
	 response.sendRedirect("loginResult.jsp");
 }
%>
</div>	 
</body>
</html>
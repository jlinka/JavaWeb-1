<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.finalExam.bean.*" %>
    <%@ page import="java.sql.*" %>
	<%@ page import="com.mysql.jdbc.Driver" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

   <form action="${pageContext.request.contextPath}/Upload" method="post" enctype="multipart/form-data">
   <table border="1">
     <tr><td>姓名：</td><td><input type="text" name="sname"></td></tr>
     <tr><td>学号：</td><td><input type="text" name="sno"></td></tr>
     <tr><td>文件选择</td><td><input type="file" name="photo"></td></tr>
     <tr><td>文件选择</td><td><input type="file" name="photo"></td></tr>

     <tr><td align="center" colspan="2"><input type="submit" value="文件上传"></td></tr>
     <tr><td colspan="1">对上传的文件下载</td><td><a href="${pageContext.request.contextPath}/ShowAllFiles">下载</a></td></tr>
     </table>
   </form>

  <h1 align="center"><a href="/index.jsp">返回管理员登陆界面</a></h1>
  </body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="com.finalExam.bean.*" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商品搜索-不存在的唇膏店-Unreal LipStick Store</title>
<link rel="stylesheet" type="text/css" href="css/css-searchgoods.css">
</head>
<body class="full">
<jsp:include page="headmodel.jsp"></jsp:include>
<%
request.setCharacterEncoding("utf-8");
String cid=request.getParameter("cid");
String lipstickid=request.getParameter("lipstickid");
String showPage=request.getParameter("showPage");
lipsticksql s=new lipsticksql();
int num=1;
String sql=null;
sql="insert into shopping_car values('" +cid+ "','" +lipstickid+ "','" +num+ "')";
s.charu(sql);
response.setHeader("refresh","0;URL=searchGoods.jsp?cid="+cid+"&showPage="+showPage+"&search=");
%>
</body>
</html>
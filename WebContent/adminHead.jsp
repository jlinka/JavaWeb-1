<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.finalExam.bean.*" %>
<%
AdminInfo admin=(AdminInfo) session.getAttribute("currentAdmin");
String strInfo=(String) session.getAttribute("info");
%>
<script type="text/javascript">
	function openWindow(url, name, width, height) {
		var left = (parent.innerWidth - width) / 2;
		var top = (parent.innerHeight - height) / 2;
		window.open(url, name, "top=" + top + ",left=" + left + ",width=" + width + ",height=" + height + ",toolbar=no,location=no,directories=no,resizable=no,status=no,menubar=no,scrollbars=yes");
	}
</script>
<link rel="stylesheet" type="text/css" href="css/css-head.css">
<div id="top">
	<div id="top_left">		
		<%if(admin != null) {%>>
			<a href="javascript:window.location.href='infoChange.jsp?cid=<%= admin.getAid()%>'"><%=admin.getAid() %></a>
			<a onclick=<%session.removeAttribute("currentAdmin"); session.removeAttribute("info"); %>
			 href="adminIndex.jsp">注销</a>
		<%}else{ %>
		<a href="adminLogin.jsp">登录</a>
		<a href="adminReg.jsp">注册</a>
		<%} %>
	</div>
	<div id="top_right">
		<a href="javascript:window.location.href='adminIndex.jsp'">首页</a> 
		<a href="searchResult.jsp">搜索</a> 
		<a href="commodityAdd.jsp">添加</a>
	</div>
</div>
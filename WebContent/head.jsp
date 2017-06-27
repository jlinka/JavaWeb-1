<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.finalExam.bean.*" %>
<%
UserInfo user=(UserInfo) session.getAttribute("currentUser");
String strInfo=(String) session.getAttribute("info");
String cid=request.getParameter("cid");
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
		<%if(user != null) {%>>
			<a href="javascript:window.location.href='infoChange.jsp?cid=<%= user.getCid()%>'"><%=user.getCid() %></a>
			<a onclick=<%session.removeAttribute("currentAdmin"); session.removeAttribute("info"); %>
			 href="adminIndex.jsp">注销</a>
		<%}
		else if(cid != null)
		{
			UserManager usermanager = new UserManager();
			user = usermanager.getUserInfo(cid);
			%>
			<a href="javascript:window.location.href='infoChange.jsp?cid=<%= cid%>'"><%=cid %></a>
			<a onclick=<%session.removeAttribute("currentUser"); session.removeAttribute("info"); %> href="index.jsp">注销</a>
			<%
		}
		else{ %>
		<a href="index.jsp">登录</a>
		<a href="customerReg.jsp">注册</a>
		<%} %>
	</div>
	<div id="top_right">
		<a href="javascript:window.location.href='homePage.jsp'">首页</a> <a
			href="shopCar.jsp">购物车</a> <a
			href="orderServlet?type=getShowOrderList&key=user_id&value=${sessionScope.user.id}">我的订单</a>
	</div>
</div>
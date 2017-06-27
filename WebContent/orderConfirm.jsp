<!--orderConfirm.jsp-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.finalExam.bean.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.util.Date" %>
    <%@ page import="java.util.Calendar" %>
	<%@ page import="com.mysql.jdbc.Driver" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>订单确认-不存在的唇膏店-Unreal Lipstick Store</title>
	<link rel="stylesheet" type="text/css" href="css/css-orderconfirm.css">
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<canvas id="Mycanvas"></canvas>
	<script src='js/index-bg.js' type="text/javascript"></script>
	<div class="box">
	<br>
	<div class="logo"><img alt="Unreal" src="images/logo.png" /></div>
	<%
	String totalPrice = request.getParameter("allprice");
	String totalAmount = request.getParameter("totalamount");
	String cid = request.getParameter("cid");
	Date now = new Date();
	Calendar c = Calendar.getInstance();
	
	int year = c.get(Calendar.YEAR); 
	int month = c.get(Calendar.MONTH); 
	int date = c.get(Calendar.DATE); 
	int hour = c.get(Calendar.HOUR_OF_DAY); 
	int minute = c.get(Calendar.MINUTE); 
	int second = c.get(Calendar.SECOND); 
	
	UserInfo userinfo = new UserInfo();
	UserManager um = new UserManager();
	userinfo = um.getUserInfo(cid);
	
	String orderId = ""+year+month+hour+minute+second+(int)((Math.random()*9+1)*100);
	String orderTime = year + "/" + month + "/" + date + " " +hour + ":" +minute + ":" + second;
	%>
	<h1><%=cid %>, 请填写并核对订单信息</h1>
	<script src='js/orderConfirm.js' type="text/javascript"></script>
	<form action="orderConfirmOk.jsp?cid=<%=cid %>&price=<%=totalPrice %>&od=<%=orderId %>&tm=<%=orderTime %>" method="post" onsubmit="return check()">
	<font size="6px" color="#3f3f3f">&nbsp; 总金额 ￥</font>
	<font size="12px" color="#ff1744"><%=totalPrice %></font>
	<br>
	<br>
	
	<font size="2" color="#c2185b">&nbsp;&nbsp;&nbsp;&nbsp;商品总数&nbsp;</font>
	<font size="3" color="#3f3f3f"><%=totalAmount %></font>
	<br>    
	<font size="2" color="#c2185b">&nbsp;&nbsp;&nbsp;&nbsp;订单号&nbsp;&nbsp;&nbsp;</font>
	<font size="3" color="#3f3f3f" id="orderId"><%=orderId %></font>
	<br>
	<font size="2px" color="#c2185b">&nbsp;&nbsp;&nbsp;&nbsp;下单日期&nbsp;</font>
	<font size="3" color="#3f3f3f"><%=orderTime %></font>
	<br>
	<br>
	
	<font size="2px" color="#c2185b">&nbsp;&nbsp;&nbsp;&nbsp;支付方式</font>
	        <div id="choice" class="choice" >
	            <select id="select" name="choice">
	                <option value="1">货到付款</option>
	                <option value="2">支付宝</option>
	                <option value="3">微信支付</option>
	                <option value="4">银行卡支付</option>
	            </select>
	        </div>
	<br>
	<font size="2px" color="#c2185b">&nbsp;&nbsp;&nbsp;&nbsp;收货地址</font>
	<div class="input_box">
          <input type="text" value="<%=userinfo.getAddr() %>" placeholder="请输入收货地址" id="address" name="address" />
    </div>
    <br>
    
    <font size="2px" color="#c2185b">&nbsp;&nbsp;&nbsp;&nbsp;联系电话</font>
	<div class="input_box">
          <input type="text" value="<%=userinfo.getTel() %>" placeholder="请输入收货地址" id="tel" name="tel" />
    </div>
    <br>
    
    <font size="2px" color="#c2185b">&nbsp;&nbsp;&nbsp;&nbsp;送货时间</font>
	        <div id="delivery" class="delivery" >
	            <select id="select" >
	            	<option value="1">任何时间</option>
	                <option value="2">周一至周五</option>
	                <option value="3">周六日</option>      
	            </select>
	        </div>
	<br>
	<div class="button_box">
	            <center>
	                <input type="submit" value="确认"> &nbsp;&nbsp;
	                <input type="reset" value="重置">
	            </center>
	</div>
	</form>
	</div>
</body>
</html>
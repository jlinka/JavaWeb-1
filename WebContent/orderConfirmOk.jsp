<!--orderConfirmOk.jsp-->
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
	
		request.setCharacterEncoding("UTF-8");
		String cid = request.getParameter("cid");
		String address = new String(request.getParameter("address").getBytes("ISO8859-1"),"UTF-8");
		String tel = request.getParameter("tel");
		String payMethod = request.getParameter("choice");
		String deliveryTime = request.getParameter("tm");
		String price = request.getParameter("price");
		String orderId = request.getParameter("od");
		
		
		OrderInfo orderinfo = new OrderInfo();
		OrderManager om = new OrderManager();
		LipstickInfo lipinfo = new LipstickInfo();
		LipstickManager lipManager = new LipstickManager();
		OrderDetails orderdetails = new OrderDetails();
		OrderDetailsManager orderDetailsManager = new OrderDetailsManager();
		ShopCar shopcar = new ShopCar();
		
		ResultSet rs;
		
		System.out.println("地址"+address);
		System.out.println("id"+orderId);
		
		orderinfo.setCid(cid);
		orderinfo.setDeleveryAddr(address);
		orderinfo.setPayMethod(payMethod);
		orderinfo.setDeliveryTime(deliveryTime);
		orderinfo.setPrice(price);
		orderinfo.setOrderID(orderId);
		orderinfo.setOrderStatus("1");
		orderinfo.setShipStatus("1");
		
	    rs = shopcar.FindCar(cid);
	    String name = "";
	    String lipstickId = "";
	    String singleprice = "";
	    String num = "";
	    
	    if(lipinfo.getLipstickId() != null)
	    	lipstickId = lipinfo.getLipstickId();
	    if(lipinfo.getPrice() != null)
	    	singleprice = lipinfo.getPrice();
	    if(lipinfo.getNum() != null)
	    	num = lipinfo.getNum();
	    if(lipinfo.getLipstickName() != null)
	    	name = lipinfo.getLipstickName();
		
		boolean result = om.insertOrderInfo(orderinfo);
		boolean insertOk = false;
		int delOk = 0;
		boolean updateOk = false;//更新库存
		
		while(rs.next())
		{
			orderdetails.setOrderId(orderId);
			orderdetails.setComodity(rs.getString("lipstickId"));
			orderdetails.setNum(rs.getString("num"));
			
			//插入订单详情
			insertOk = orderDetailsManager.insertOrderDetails(orderdetails);
			//更新库存
			updateOk = lipManager.updateLipstickNum(rs.getString("lipstickId"), rs.getString("num"));
			
			if(!updateOk)
				System.out.println("库存更新失败！");
			
			if(!insertOk)
				System.out.println("下单失败！");
		}
		
		if(result==true){
			//清空此用户购物车
			delOk = shopcar.delallCar(cid);
			if(delOk == 1)
				System.out.println("购物车清空啦！");
			else
				System.out.println("购物车清空失败！");
			
	%>
	<h1>下单成功！等候快递送达吧</h1>
	<br>
	<div class="reg_button">
         	<center><button type="button" onclick="javascript:window.location.href='myorder.jsp?cid=<%=cid%>'">查看订单</button></center>
	</div>
	<br>
	<div class="reg_button">
         	<center><button type="button" onclick="javascript:window.location.href='homePage.jsp?cid=<%=cid%>'">返回首页</button></center>
	</div>
	<%
	}
		
		else {%>
	<h1>(⊙o⊙)？下单失败！重新试试</h1>
	<br>
	<div class="reg_button">
         	<center><button type="button" onclick="javascript:window.location.href='shopCar.jsp?cid=<%=cid%>'">返回确认</button></center>
	</div>
	<%} %>
	</div>
</body>
</html>
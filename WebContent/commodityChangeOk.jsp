<!--commodityChangeOk.jsp-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.finalExam.bean.*" %>
    <%@ page import="java.sql.*" %>
	<%@ page import="com.mysql.jdbc.Driver" %>
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
	
		String aid = request.getParameter("aid");
	
		LipstickInfo lipstick = new LipstickInfo();
		LipstickManager lipstickm = new LipstickManager();
		
		String lipstickId =request.getParameter("lipstickId");
		String lipstickType =request.getParameter("lipstickType");
		String lipstickName = request.getParameter("lipstickName");
		String commodityPlace =request.getParameter("commodityPlace");
		String filePath = request.getParameter("filePath");
		String Inventory = request.getParameter("Inventory");			//库存
		String introduction = request.getParameter("introduction");
		String price = request.getParameter("price");
		
		lipstick.setLipstickId(lipstickId);
		lipstick.setLipstickName(lipstickName);
		lipstick.setLipstickType(lipstickType);
		lipstick.setCommodityPlace(commodityPlace);				  
		lipstick.setFilePath(filePath);
		lipstick.setInventory(Inventory);
		lipstick.setIntroduction(introduction);
		lipstick.setPrice(price);
		
		
		boolean result = lipstickm.UpdateLipstickInfo(lipstick);
		if(result==true)
		{
	%>
	 <h1>修改成功!</h1>
     <h2>检索验证一下</h2>
     <div class="reg_button">
         <center><button type="button" onclick="javascript:window.location.href='searchResult.jsp?aid=<%=aid%>'">现在检索商品</button></center>
	 </div>
	 <br>
	 <div class="reg_button">
		<center><button type="button" onclick="javascript:window.location.href='adminIndex.jsp'">返回商品管理</button></center>
	 </div>
	 <%}
		else{ %>
	<h1>修改失败!</h1>
    <div class="reg_button">
         <center><button type="button" onclick="javascript:window.location.href='commodityChange.jsp?id=<%=lipstickId %>'">返回重新修改</button></center>
	 </div>
	 <br>
    <div class="reg_button">
		<center><button type="button" onclick="javascript:window.location.href='window.location.href='adminIndex.jsp'">返回商品管理</button></center>
	 </div>
    <%} %>
	</div>
</body>
</html>
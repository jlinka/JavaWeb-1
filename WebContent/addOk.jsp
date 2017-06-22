<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.finalExam.bean.*" %>
    <%@ page import="java.sql.*" %>
	<%@ page import="com.mysql.jdbc.Driver" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>商品添加结果</title>
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
		
		String lipstickId =request.getParameter("lipstickId");
		String lipstickType =request.getParameter("lipstickType");
		String lipstickName = request.getParameter("lipstickName");
		String commodityPlace =request.getParameter("commodityPlace");
		String filePath = request.getParameter("filePath");
		String Inventory = request.getParameter("Inventory");			//库存
		String introduction = request.getParameter("introduction");
		String price = request.getParameter("price");
		
		
		boolean result = false;
		LipstickInfo lipstick = new LipstickInfo();
		LipstickManager lipstickm = new LipstickManager();
		
		lipstick.setLipstickId(lipstickId);
		lipstick.setLipstickType(lipstickType);
		lipstick.setLipstickName(lipstickName);
		lipstick.setCommodityPlace(commodityPlace);
		lipstick.setFilePath(filePath);
		lipstick.setInventory(Inventory);
		lipstick.setIntroduction(introduction);
		lipstick.setPrice(price);
		
		result = lipstickm.InsertLipstick(lipstick);
		
		if (result == true) 
		{
			System.out.println("");
			response.setHeader("refresh", "3;URL=commodityAdd.jsp");
		
	%><h1>唇膏添加成功</h1>
<h2>添加成功！3秒后自动返回添加页面</h2>
<div class="reg_button">
         	<center><button type="button" onclick="javascript:window.location.href='commodityAdd.jsp'">立刻返回</button></center>
</div>
<br>
<div class="reg_button">
         	<center><button type="button" onclick="javascript:window.location.href='adminIndex.jsp'">去往管理首页</button></center>
</div>

<%

}
else
{
	System.out.println("");
%>
<h1>注册失败</h1>
<h2>用户名已存在或信息不规范</h2>
<div class="reg_button">
         	<center><button type="button" onclick="javascript:window.location.href='adminReg.jsp'">返回上一级</button></center>
</div>
<br>
<div class="reg_button">
         	<center><button type="button" onclick="javascript:window.location.href='adminLogin.jsp'">登录</button></center>
</div>
<% 
}%>
	</div>
</body>
</html>
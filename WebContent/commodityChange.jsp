<!--commodityAdd.jsp-->
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="com.finalExam.bean.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.mysql.jdbc.Driver" %>
<%
	String lipstickId =request.getParameter("id");
	LipstickInfo lipstick = new LipstickInfo();
	LipstickManager lipstickm = new LipstickManager();
	lipstick = lipstickm.getLipstickInfoById(lipstickId);
	String lipstickType = "";
	String lipstickName = "";
	String commodityPlace = "";
	String filePath = "";
	String Inventory = "";			//库存
	String introduction = "";
	String price = "";
	if(lipstick.getLipstickName() != null)
		lipstickName = lipstick.getLipstickName();
	if(lipstick.getLipstickType() != null)
		lipstickType = lipstick.getLipstickType();
	if(lipstick.getCommodityPlace() != null)
		commodityPlace = lipstick.getCommodityPlace();
	if(lipstick.getInventory() != null)
		Inventory = lipstick.getInventory();
	if(lipstick.getFilePath() != null)
		filePath = lipstick.getFilePath();
	if(lipstick.getIntroduction() != null)
		introduction = lipstick.getIntroduction();
	if(lipstick.getPrice() != null)
		price = lipstick.getPrice();
%>
<html>
<head>
    <title>修改商品信息</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="@author 201541402216谢增光">
    <link rel="stylesheet" type="text/css" href="css/css-change.css">
</head>
<body>
<canvas id="Mycanvas"></canvas>
	<script src='js/index-bg.js' type="text/javascript"></script>
<script src='js/lipstickAdd.js' type="text/javascript"></script>
<div class="box">
	<br>
		<div class="logo"><img alt="Unreal" src="images/logo.png" /></div>
        <br>
        <h1>添加</h1>
        <form name="form1" id="form1" action="commodityChangeOk.jsp" method="post" onsubmit="return check()">
            <div id="tips_box" class="tips_box"></div>
            <font size="1" color="#f06292">
            <center>
            	信息依次是id,类型,名称,产地,路径,库存,简介,单价
            </font>
            </center>
            <div class="input_box">
                <input type="text" value="<%=lipstickId %>" placeholder="请输入唇膏类型" id="lipstickId" name="lipstickId"  readonly="readonly" />
            </div>
            <div class="input_box">
                <input type="text" value="<%=lipstickType %>" placeholder="请输入唇膏类型" id="lipstickType" name="lipstickType" />
            </div>
            <div class="input_box">
                <input type="text" value="<%=lipstickName %>" placeholder="请输入唇膏名称" id="lipstickName" name="lipstickName" />
            </div>
            <div class="input_box">
                <input type="text" value="<%=commodityPlace %>" placeholder="请输入唇膏产地" id="commodityPlace" name="commodityPlace" />
            </div>
            <div class="input_box">
                <input type="text" value="<%=filePath %>" placeholder="请输入图片路径" id="filePath" name="filePath" />
            </div>
            <div class="input_box">
                <input type="text" value="<%=Inventory %>" placeholder="请输入唇膏库存" id="Inventory" name="Inventory" />
            </div>
            <div class="input_box">
                <input type="text" value="<%=introduction %>" placeholder="请输入唇膏简介" id="introduction" name="introduction" />
            </div>
			<div class="input_box">
                <input type="text" value="<%=price %>" placeholder="请输入唇膏单价" id="price" name="price" />
            </div>
            <div class="button_box">
                <center>
                    <input type="submit" value="修改"> &nbsp;&nbsp;
                    <input type="reset" value="重置">
                </center>
            </div>
            <br>
            <div class="reg_button">
         	<center><button type="button" onclick="javascript:window.location.href='adminIndex.jsp'">返回管理首页</button></center>
			</div>
        </form>
    </div>
</body>
</html>
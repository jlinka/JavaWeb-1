<!--commodityAdd.jsp-->
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.net.URLDecoder"%>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>
<%
String lipstickId =request.getParameter("lipstickId");
String lipstickType =request.getParameter("lipstickType");
String lipstickName = request.getParameter("lipstickName");
String commodityPlace =request.getParameter("commodityPlace");
String filePath = request.getParameter("filePath");
String Inventory = request.getParameter("Inventory");			//库存
String introduction = request.getParameter("introduction");
String price = request.getParameter("price");

%>
<html>
<head>
    <title>添加商品信息</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="@author 201541402216谢增光">
    <link rel="stylesheet" type="text/css" href="css/css-add-lipstick.css">
</head>
<body>

<canvas id="Mycanvas"></canvas>
	<script src='js/index-bg.js' type="text/javascript"></script>
<script src='js/lipstickAdd.js' type="text/javascript"></script>
<div class="box">
	<br>
		<div class="logo"><img alt="Unreal" src="images/logo.png" /></div>
        <br>
        <%String aid=request.getParameter("aid"); %>
        <%if(aid!=null) {%>
        <h1>添加</h1>
        <form name="form1" id="form1" action="addOk.jsp" method="post" onsubmit="return check()">
            <div id="tips_box" name="tips_box"></div>

            <div class="input_box">
                <input type="text" value="" placeholder="请输入唇膏id" id="lipstickId" name="lipstickId" />
            </div>
            <div class="input_box">
                <input type="text" value="" placeholder="请输入唇膏类型" id="lipstickType" name="lipstickType" />
            </div>
            <div class="input_box">
                <input type="text" value="" placeholder="请输入唇膏名称" id="lipstickName" name="lipstickName" />
            </div>
            <div class="input_box">
                <input type="text" value="" placeholder="请输入唇膏产地" id="commodityPlace" name="commodityPlace" />
            </div>
            <div class="input_box">
                <input type="text" value="" placeholder="请输入图片路径" id="filePath" name="filePath" />
            </div>
            <div class="input_box">
                <input type="text" value="" placeholder="请输入唇膏库存" id="Inventory" name="Inventory" />
            </div>
            <div class="input_box">
                <input type="text" value="" placeholder="请输入唇膏简介" id="introduction" name="introduction" />
            </div>
			<div class="input_box">
                <input type="text" value="" placeholder="请输入唇膏单价" id="price" name="price" />
            </div>
            <div class="button_box">
                <center>
                    <input type="submit" value="添加"> &nbsp;&nbsp;
                    <input type="reset" value="重置">
                </center>
            </div>
            <br>
            <div class="reg_button">
         	<center><button type="button" onclick="javascript:window.location.href='adminIndex.jsp'">返回管理首页</button></center>
			</div>
        </form>
        <%}else{ %>
		<h1>(⊙o⊙)？走错地方?还没登录？</h1>
		<br>
		<div class="reg_button">
		         	<center>
		         	<button type="button" onclick="javascript:window.location.href='homePage.jsp'">
		         	购物首页
		         	</button></center>
		</div>
		<br>
		<div class="reg_button">
		         	<center>
		         	<button type="button" onclick="javascript:window.location.href='index.jsp'">
		         	会员登录
		         	</button></center>
		</div>
		<br>
		<div class="reg_button">
		         	<center>
		         	<button type="button" onclick="javascript:window.location.href='adminLogin.jsp'">
		         	管理员登录
		         	</button></center>
		</div>
		<%} %>
    </div>
</body>
</html>
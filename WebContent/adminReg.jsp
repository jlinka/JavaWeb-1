<!--adminReg.jsp-->
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.net.URLDecoder"%>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>
<%
String aid =request.getParameter("aid");
String pwd =request.getParameter("password");
String name = request.getParameter("gender");
String address =request.getParameter("tel");
String phone = request.getParameter("addr");
String mail = request.getParameter("email");
%>
<html>
<head>
    <title>欢迎注册管理员</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="@author 201541402216谢增光">
    <link rel="stylesheet" type="text/css" href="css/css-register.css">
</head>
<body>
<canvas id="Mycanvas"></canvas>
	<script src='js/index-bg.js' type="text/javascript"></script>
<script src='js/adminReg.js' type="text/javascript"></script>
<div class="box">
	<br>
		<div class="logo"><img alt="Unreal" src="images/logo.png" /></div>
        <br>
        <h1>注册</h1>
        <!--用户名、密码、真实姓名、地址、联系电话、电子邮件-->
        <form name="form1" id="form1" action="adminRegOk.jsp" method="post" onsubmit="return check()">
            <div id="tips_box" name="tips_box"></div>

            <div class="input_box">
                <input type="text" value="" placeholder="请输入用户名" id="aid" name="aid" />
            </div>
            <div class="input_box">
                <input type="password" value="" placeholder="请输入密码" id="pwd" name="pwd" />
            </div>
            <div class="input_box">
                <input type="password" value="" placeholder="请确认密码" id="pwdC" name="pwdC" />
            </div>
            <div class="input_box">
                <input type="text" value="" placeholder="请输入性别" id="gender" name="gender" />
            </div>
            <div class="input_box">
                <input type="text" value="" placeholder="请输入联系电话" id="tel" name="tel" />
            </div>
            <div class="input_box">
                <input type="text" value="" placeholder="请输入地址" id="address" name="address" />
            </div>
            <div class="input_box">
                <input type="text" value="" placeholder="请输入Email" id="email" name="email" />
            </div>

            <div class="button_box">
                <center>
                    <input type="submit" value="注册"> &nbsp;&nbsp;
                    <input type="reset" value="重置">
                </center>
            </div>
        </form>
    </div>
</body>
</html>
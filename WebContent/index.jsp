<!--index.jsp-->
<!-- 首页 -->
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.net.URLDecoder"%>
<!DOCTYPE>
<%
String user =request.getParameter("cid");
String password =request.getParameter("pwd");
%>

<html>
<head>
	<meta charset="UTF-8">
	<title>Unreal Lipstick Store - 不存在的唇膏店</title>
	<link rel="stylesheet" type="text/css" href="css/css-style-form.css">
</head>
<body>
	<canvas id="Mycanvas"></canvas>
	<script src='js/index-bg.js' type="text/javascript"></script>
  	<div class="box">
  	<br>
  	<div class="logo"><img alt="Unreal" src="images/logo.png" /></div>
  	<h1>欢迎登录</h1>
  	<script src='js/login.js' type="text/javascript"></script>
      <form name="form1" action="loginSave.jsp" method="post" onsubmit="return check()">
         <div id="tips_box" name="tips_box"></div>
         <div class="input_box">
            <input type="text" value="" placeholder="请输入用户名" id="cid" name="cid" />
              </div>
              <div class="input_box">
              <input type="password" value="" placeholder="请输入密码" id="pwd" name="pwd" />
              </div>

         <div class="button_box">
             <center>
               <input type="submit" value="登录"> &nbsp;&nbsp;
               <input type="reset" value="重置">
             </center>
         </div>
         <p></p>
         <div class="reg_button">
         	<center><button type="button" onclick="javascript:window.location.href='customerReg.jsp'">注册</button></center>
         </div>
      </form>
    </div>
</body>
</html>
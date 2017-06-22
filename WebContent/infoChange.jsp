<!--changeDel.jsp-->
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.net.URLDecoder"%>
<%@ page import="com.finalExam.bean.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.mysql.jdbc.Driver" %>
<html>
<head>
    <title>会员信息修改</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="@author 201541402216谢增光">
    <link rel="stylesheet" type="text/css" href="css/css-register.css">
</head>

<body>
	<canvas id="Mycanvas"></canvas>
	<script src='js/index-bg.js' type="text/javascript"></script>
	<script src='js/register.js' type="text/javascript"></script>
    <%
            request.setCharacterEncoding("utf-8");
            String cid = request.getParameter("cid");
            System.out.println("hahha"+cid);
            UserManager userm = new UserManager();
            UserInfo user = new UserInfo();
            user = userm.getUserInfo(cid);
            String name = "";
            String address = "";
            String gender = "";
            String tel = "";
            String email = "";
            if(user.getCid() != null)
            	name = user.getCid();
            if(user.getAddr() != null)
            	address = user.getAddr();
            if(user.getGender() != null)
            	gender = user.getGender();
            if(user.getTel() != null)
            	tel = user.getTel();
            if(user.getEmail() != null)
            	email = user.getEmail();
            
    %>


	<div class="box">
	<br>
		<div class="logo"><img alt="Unreal" src="images/logo.png" /></div>
        <br>
        <h1>信息修改</h1>
        <form name="form1" id="form1" action="changeOK.jsp" method="post" onsubmit="return check()">
            <div id="tips_box" name="tips_box"></div>

            <div class="input_box">
                <input type="text" value="<%=name%>" placeholder="请输入用户名" id="cid" name="cid" />
            </div>
            <div class="input_box">
                <input type="password" value="" placeholder="请输入密码" id="pwd" name="pwd" />
            </div>
            <div class="input_box">
                <input type="password" value="" placeholder="请确认密码" id="pwdC" name="pwdC" />
            </div>
            <div class="input_box">
                <input type="text" value="<%=gender%>" placeholder="请输入性别" id="gender" name="gender" />
            </div>
            <div class="input_box">
                <input type="text" value="<%=tel%>" placeholder="请输入联系电话" id="tel" name="tel" />
            </div>
            <div class="input_box">
                <input type="text" value="<%=address%>" placeholder="请输入收货地址" id="address" name="address" />
            </div>
            <div class="input_box">
                <input type="text" value="<%=email%>" placeholder="请输入Email" id="email" name="email" />
            </div>

            <div class="button_box">
                <center>
                    <input type="submit" value="修改"> &nbsp;&nbsp;
                    <input type="reset" value="清空">
                </center>
            </div>
        </form>
    </div>
</body>
</html>
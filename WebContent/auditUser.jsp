<!--searchResult.jsp-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.finalExam.bean.*" %>
    <%@ page import="java.sql.*" %>
	<%@ page import="com.mysql.jdbc.Driver" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品搜素结果-不存在的唇膏店-Unreal Lipstick Store</title>
<link rel="stylesheet" type="text/css" href="css/css-searchresult.css">
</head>
<body>
<canvas id="Mycanvas"></canvas>
	<script src='js/index-bg.js' type="text/javascript"></script>
<%
Connection conn = null;
Statement st = null;
ResultSet rs=null;
String id = request.getParameter("id");
LipstickInfo lipstick = new LipstickInfo();
LipstickManager lipstickm = new LipstickManager();
AuditUser audituser = new AuditUser();
boolean result = lipstickm.deleteLipstick(id);
String num = request.getParameter("num");
String a= new String("1");
String b = new String("0");

if(num==null)
{
	
	
		
}
else
{
	if(num.equals(a))
	{
		audituser.UpdateLipstickInfo(id);
	}
		 
	if(num.equals(b))
	{
		audituser.deleteLipstick(id);
	}
}


	
%>
<div class="box">
	<br>
	<div class="logo"><img alt="Unreal" src="images/logo.png" /></div>

	<h1>管理员审核</h1>
	
		
	<%
	request.setCharacterEncoding("utf-8");
	String lipstickId = "";
	String lipstickType = "";
	String lipstickName = "";
	String commodityPlace = "";
	String filePath = "";
	String Inventory = "";			//库存
	String introduction = "";
	String price = "";
	String search = "";
	String select = "";
	
	
	if(request.getParameter("search")!=null)
    {
        search = request.getParameter("search");
    }

    if(request.getParameter("select")!=null)
    {
        select = request.getParameter("select");
    }
	%>
	<br>
    <table id="table-1">
    <thead>
    	<th>用户id</th>
    	<th>用户密码</th>
    	<th>用户性别</th>
    	<th>用户电话</th>
    	<th>用户地址</th>
    	<th>用户邮箱</th>
    	<th>审核状态</th>
    	<th>同意通过审核</th>
    	<th>删除</th>
    </thead>
    <tbody>
    <%
    out.println(audituser.getAllInfo());
    %>
    </tbody>
    </table>
    </div>
</body>
</html>
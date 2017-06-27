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
<%String aid=request.getParameter("aid"); %>
<jsp:include page="adminHead.jsp"></jsp:include>
<canvas id="Mycanvas"></canvas>
	<script src='js/index-bg.js' type="text/javascript"></script>
	
<%
Connection conn = null;
Statement st = null;
ResultSet rs=null;
String id = request.getParameter("id");
LipstickInfo lipstick = new LipstickInfo();
LipstickManager lipstickm = new LipstickManager();

boolean result = lipstickm.deleteLipstick(id);


	if(result){
		out.print("<script>alert('删除成功!');</script>");
	}
	if(id != null && result == false)
	 out.print("<script>alert('删除失败!');</script>");
%>
<div class="box">
	<br>
	<div class="logo"><img alt="Unreal" src="images/logo.png" /></div>
	<%if(aid!=null){ %>
	<%if(id != null) {%>
	<h1>"<%=request.getParameter("search") %>"的搜索结果</h1>
	<%}else{ %>
	<h1>输入关键词检索</h1>
	<% }%>
		<form name="form" action="searchResult.jsp" method="post">
			<center>
	        <div id="choice" width="350px" height="50px">
	            <select name="select" id="select">
	                <option value="id">唇膏id</option>
	                <option value="type">唇膏类型</option>
	                <option value="name">唇膏名称</option>
	                <option value="place">唇膏产地</option>
	            </select>
	        </div>
	        </center>
	        <br>
			<div class="input_box">
			            <input type="text" value="" placeholder="请输入检索内容" id="search" name="search" />
			</div>
			<div class="button_box">
	            <center>
	                <input type="submit" value="搜索"> &nbsp;&nbsp;
	                <input type="reset" value="重置">
	            </center>
	        </div>
        </form>
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
    	<th>唇膏id</th>
    	<th>唇膏类型</th>
    	<th>唇膏名称</th>
    	<th>唇膏产地</th>
    	<th>图片路径</th>
    	<th>唇膏库存</th>
    	<th>唇膏简介</th>
    	<th>唇膏单价</th>
    	<th>修改</th>
    	<th>删除</th>
    </thead>
    <tbody>
    <%
    out.println(lipstickm.getAllInfo(search, select));
    %>
    </tbody>
    </table>
    <%}
	else{%>
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
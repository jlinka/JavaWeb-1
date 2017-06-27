<!--homePage.jsp-->
<!-- 首页 -->
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.net.URLDecoder"%>
<!DOCTYPE>
<html>
<head>
	<meta charset="UTF-8">
	<title>欢迎光临-不存在的唇膏店-Unreal Lipstick Store</title>
	<link rel="stylesheet" type="text/css" href="css/css-searchresult.css">
	<style type="text/css">
	.searchTab {
	margin-top:10px;
	margin-left:339px;
}

	.searchTab .searchText {
	    width: 249px;
	    height: 27px;
	    padding: 0px 5px;
	    line-height: 27px;
	    border: 1px solid #c9caca;
	}
	
	.searchTab .searchBtn {
	    width: 49px;
	    height: 29px;
	    border: none;
	    cursor: pointer;
	    background: #f7f7f7;
	}
	</style>
</head>
<%String cid=request.getParameter("cid"); %>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	
	<canvas id="Mycanvas"></canvas>
	<script src='js/index-bg.js' type="text/javascript"></script>
  	<div class="box">
  	<br>
  	<div class="logo"><img alt="Unreal" src="images/logo.png" /></div>
  	<h1>欢迎光临-不存在的唇膏店-Unreal Lipstick Store</h1>
  	<div class="searchTab">
		<form action="searchGoods.jsp?search=<%="" %>&cid=<%=cid %>" method="post" name="lg_form">
				<input type="text" class="searchText" name="search">
				<input type="submit" class="searchBtn" value="搜索">
		</form>
	</div>
	</div>
</body>
</html>
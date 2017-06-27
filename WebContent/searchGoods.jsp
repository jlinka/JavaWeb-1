<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="com.finalExam.bean.*" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/css-searchgoods.css">
</head>
<body class="full">
<jsp:include page="headmodel.jsp"></jsp:include>
<div class="content">
<%
request.setCharacterEncoding("utf-8");
String sea=request.getParameter("search");
int pageSize=12;
int pageCount;
int showPage;
ResultSet rs=null;
String sql=null;
lipsticksql s=new lipsticksql();
sql="select lipstickName,filePath,price,introduction from commodityinformation where lipstickName like '%"+sea+"%';"; 
rs=s.chaxun(sql);
rs.last();
int recordCount=rs.getRow();
pageCount=(recordCount%pageSize==0)?(recordCount/pageSize):(recordCount/pageSize+1);
String integer=request.getParameter("showPage");
if(integer==null){
	integer="1";
}
try{showPage=Integer.parseInt(integer);
}catch(NumberFormatException e){
 showPage=1;
}
if(showPage<=1){
 showPage=1;
}
if(showPage>=pageCount){
 showPage=pageCount;
}
if(recordCount==0){
%>
<div class="s_result">
<span >查询结果为空</span>
</div>
<%
}
else{
//如果要显示第showPage页，那么游标应该移动到的position的值是：
int position=(showPage-1)*pageSize+1;
//设置游标的位置
rs.absolute(position);
//用for循环显示本页中应显示的的记录
%>
	<ul class="ls-wrap">
<%
for(int i=1;i<=pageSize;i++){  
%>
		<li class="ls-item">
			<div class="ls-i-wrap">
				<div class="p-img">
					<a title="好看不？？">
						<img src="<%=rs.getString("filePath") %>/1.jpg">
					</a>
				</div>
				<div class="p-price">
					<strong>
						<em>￥</em>
						<i><%=rs.getInt("price") %></i>
					</strong>
				</div>
				<div class="p-name">
					<a title="">
						<font><%=rs.getString("lipstickName") %></font>
						<font><%=rs.getString("introduction") %></font>
					</a>
				</div>
				<div class="p-buy">
					<a class="p-buy-b">购买</a>
					<a class="p-buy-c">加入购物车</a>
				</div>
			</div>
		</li>
<%
if(!rs.next())break;
	}
}
s.connclose();
%>
</ul>
</div>
<div class="paging">
 	第<%=showPage %>页（共<%=pageCount %>页）
 	<a href="searchGoods.jsp?showPage=1">首页</a>
 	<a href="searchGoods.jsp?showPage=<%=showPage-1%>">上一页</a>
 	<% //根据pageCount的值显示每一页的数字并附加上相应的超链接
  	for(int i=1;i<=pageCount;i++){
 	%>
   	<a href="searchGoods.jsp?showPage=<%=i%>"><%=i%></a>
	<% }
	%> 
	<a href="searchGoods.jsp?showPage=<%=showPage+1%>">下一页</a>
	<a href="searchGoods.jsp?showPage=<%=pageCount%>">末页</a>
 	<!-- 通过表单提交用户想要显示的页数 -->
 	<form action="" method="get">
		跳转到第<input type="text" name="showPage" size="4">页
  		<input type="submit" class="tzBtn" name="submit" value="跳转">
 	</form> 
</div>
</body>
</html>
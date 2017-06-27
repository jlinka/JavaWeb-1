<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="com.finalExam.bean.*" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/css-myorder.css">
</head>
<body>
<jsp:include page="headmodel.jsp"></jsp:include>
<%
String sql=null;
String porder="1";
String horder="2";
int pageSize=2;
int pageCount;
int showPage;
lipsticksql s=new lipsticksql();
ResultSet rs=null;
ResultSet rs1=null;
request.setCharacterEncoding("utf-8");
String orderstatus=request.getParameter("orderstatus");
String ddsearch=request.getParameter("ddsearch");
if(orderstatus==null){
	orderstatus="1";
}
%>
<div class="container">
	<div class="w">
		<div class="main">
			<div class="mycomment">
				<div class="m_tab-wrap">
					<div class="m_box">
						<div class="m_tab">
							<ul class="tab-trigger">
								<li class="trig-item">
									<a class="text" href="myorder.jsp?orderstatus=<%=porder %>">当前订单</a>
									<span>|</span>
								</li>
								<li class="trig-item">
									<a class="text" href="myorder.jsp?orderstatus=<%=horder %>">历史订单</a>
								</li>
							</ul>
						</div>
						<div class="m_search">
							<form action="myorder.jsp" method="post" name="dd_form">
								<input type="text" class="ddText" name="ddsearch">
								<input type="submit" class="ddBtn" value="搜索">
							</form>
						</div>
					</div>
				</div>
				<div class="mycomment_table">
					<table class="order-tb">
						<colgroup>
							<col class="number-col">
							<col class="consignee-col">
							<col class="amount-col">
							<col class="operate-col">
						</colgroup>
						<thead>
							<tr>
								<th>订单详情</th>
								<th>收货人</th>
								<th>金额</th>
								<th>操作</th>
							</tr>
						</thead>
						<%
						if(ddsearch!=null){
							sql="select * from `order` where orderStatus='"+orderstatus+"' and orderId='"+ddsearch+"';";
							rs=s.chaxun(sql);
						}
						else{
						sql="select * from `order` where orderStatus='"+orderstatus+"';";
						rs=s.chaxun(sql);
						}
						if(rs!=null){
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
						if(recordCount!=0){
						//如果要显示第showPage页，那么游标应该移动到的position的值是：
						int position=(showPage-1)*pageSize+1;
						//设置游标的位置
						rs.absolute(position);
						//用for循环显示本页中应显示的的记录
						for(int i=1;i<=pageSize;i++){  
							String oId=rs.getString("orderId");
							String price=rs.getString("price");
							String cId=rs.getString("cid");
							sql="select filePath,introduction,num from `orderdetails` o,commodityinformation c where orderId='"+oId+"' and o.commodityId=c.lipstickId;";
							rs1=s.chaxun(sql);
						%>
						<tbody>
							<tr class="sep-row">
								<td colspan="4"></td>
							</tr>
							<tr class="tr-th">
								<td colspan="4">
									<span class="gap"></span>
									<span class="dealtime"></span>
									<span class="number">
										订单号：<%=oId %>
									</span>
								</td>
							</tr>
							<tr class="tr-bd">
								<td>
									<%
									while(rs1.next()){
									%>
									<div class="good-item">
										<div class="p-img">
											<span><img src="<%=rs1.getString("filePath") %>/1.jpg"></span>
										</div>
										<div class="p-msg">
											<span><%=rs1.getString("introduction") %></span>
										</div>
										<div class="good-number">
											<span>x<%=rs1.getString("num") %></span>
										</div>
									</div>
									<%
									}
									%>
									<div class="clr"></div>
								</td>
								<td rowspan="3">
									<div class="consignee">
										<span class="txt"><%=cId %></span>
										<b></b>
									</div>
								</td>
								<td rowspan="3">
									<div class="amount">
										<span>
											￥<%=price %>
										</span>
									</div>
								</td>
							</tr>
						</tbody>
						<%
							if(!rs.next())break;
							}
						}
						s.connclose();
						%>
					</table>
					<div class="ui_page-wrap">
						<div class="ui-page">
							<span class="text">共<%=recordCount %>个订单</span>
							<a href="myorder.jsp?showPage=<%=showPage-1%>">上一页</a>
 							<% //根据pageCount的值显示每一页的数字并附加上相应的超链接
  							for(int i=1;i<=pageCount;i++){
 							%>
   							<a href="myorder.jsp?showPage=<%=i%>"><%=i%></a>
							<%}
							%> 
							<a href="myorder.jsp?showPage=<%=showPage+1%>">下一页</a>
						</div>
					</div>
					<%} %>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
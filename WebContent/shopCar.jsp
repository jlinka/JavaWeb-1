<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="com.finalExam.bean.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.*" %>
<%@ page import="com.mysql.jdbc.Driver" %>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
String lp = request.getParameter("lp");
String c = request.getParameter("c");
String renum = request.getParameter("renum");
String adnum = request.getParameter("adnum");
ShopCar sc= new ShopCar();
if(lp!=null&&c!=null&&(renum==null&&adnum==null))
{
		int i = sc.delCar(lp,c);
		if(i==1)
			out.print("<script>alert('删除成功!重新登录后查看结果');</script>");
		else
			out.print("<script>alert('删除失败!重新登录后查看结果');</script>");
}
if(lp!=null&&c!=null&&renum!=null)
{
	sc.renum(lp,c,renum);
}
if(lp!=null&&c!=null&&adnum!=null)
{
	sc.adnum(lp,c,adnum);
}

%>

<!DOCTYPE html>
<html>
<head>
</head>
<body>
<style type="text/css">
.cart_header{
    width: 960px;
    margin: 0 auto;
}
.cart_header_box{
    border-bottom: 2px solid #e5e5e5;
    box-shadow: 0px 1px 2px rgba(0,0,0,0.1);
    padding-bottom: 15px;
}
.cart_header .logo_box{
    float: left;
}
.cart_header .order_path{
    float: right;
    width: 377px;
    height: 48px;
}
.cart_header .order_path_1{
    background: url(http://f0.jmstatic.com/static_cart/dist/20170119/images/order_path.png) no-repeat;
    background-position: -2px -2px;
}
.cart_header .order_path_2{
    background: url(http://f0.jmstatic.com/static_cart/dist/20170119/images/order_path.png) no-repeat;
    background-position: -2px -54px;
}
.cart_header .order_path_3{
    background: url(http://f0.jmstatic.com/static_cart/dist/20170119/images/order_path.png) no-repeat;
    background-position: -2px -106px;
}
.cart_header .order_path_4{
    background: url(http://f0.jmstatic.com/static_cart/dist/20170119/images/order_path.png) no-repeat;
    background-position: -2px -158px;
}
.cart_top{
    position: relative;
    height: 32px;
    line-height: 32px;
    color: #999999;
    width: 960px;
    margin: 0 auto;
}
.cart_top .user_box{
    position: absolute;
    right: 0;
    top: 0;
}
.cart_top .user_box .tips{
    font-style: normal;
    color: #dddddd;
    padding: 0 5px;
}
.cart_top .user_box .out,.cart_top .user_box .query{
    color: #999999;
}
.cart_top .user_box a:hover{text-decoration: none;color: #ed145b;}
</style>
<div id="cboxOverlay" style="display: none;"></div>
<div id="colorbox" class="" style="padding-bottom: 50px; padding-right: 50px; display: none;">
	<div id="cboxWrapper">
		<div>
			<div id="cboxTopLeft" style="float: left;"></div>
				<div id="cboxTopCenter" style="float: left;"></div>
				<div id="cboxTopRight" style="float: left;"></div>
			</div>
			<div style="clear:left">
				<div id="cboxMiddleLeft" style="float: left;"></div>
				<div id="cboxContent" style="float: left;">
					<div id="cboxLoadedContent" style="width: 0px; height: 0px; overflow: hidden;" class=""></div>
					<div id="cboxLoadingOverlay" class=""></div>
					<div id="cboxLoadingGraphic" class=""></div>
					<div id="cboxTitle" class=""></div>
					<div id="cboxCurrent" class=""></div>
					<div id="cboxNext" class=""></div>
					<div id="cboxPrevious" class=""></div>
					<div id="cboxSlideshow" class=""></div>
					<div id="cboxClose" class=""></div>
				</div>
				<div id="cboxMiddleRight" style="float: left;"></div>
			</div>
			<div style="clear:left">
				<div id="cboxBottomLeft" style="float: left;"></div>
				<div id="cboxBottomCenter" style="float: left;"></div>
				<div id="cboxBottomRight" style="float: left;"></div>
			</div>
	</div>
	<div style="position:absolute; width:9999px; visibility:hidden; display:none"></div>
</div>

<div style="background: white;">
<%
UserInfo user=(UserInfo) session.getAttribute("currentUser");
String strInfo=(String) session.getAttribute("info");
if (user!=null) {
%>
    <div class="cart_top">
        <div class="user_box" id="JS_user_box"><div>Ureal欢迎您，<a href="index.jsp"><%=user.getCid() %></a><i class="tips">|</i></div></div>
    </div>
<%}
else{
%>
	<div class="cart_top">
        <div class="user_box" id="JS_user_box"><div>Ureal欢迎您，<a href="index.jsp">登录</a><i class="tips">|</i><a href="customerReg.jsp">免费注册</a></div></div>
    </div>
<%
  session.removeAttribute("info"); 
}
%>
    <div class="cart_header_box">
        <div class="cart_header clearfix">
            <h1 class="logo_box">
                <a href="http://www.jumei.com?from=cart_add" target="_blank" id="home">
                    <img src="images/logo.png" alt="化妆品团购">
                </a>
            </h1>
            <div class="order_path order_path_1
                                    ">
            </div>
        </div>
    </div>

</div>


<div id="container" style="width: auto;">

<link rel="stylesheet" href="http://f0.jmstatic.com/static_cart/dist/20170119/css/show/show.css">


<script type="text/javascript">

    seajs.use("views/show/index", function(Index){
        var index = Index.init({
            data : GLOBAL.initData,
            container : $("#container")
        });
    });
    
</script>
<%
            request.setCharacterEncoding("utf-8");
            String cid = request.getParameter("cid");
            System.out.println("hahha"+cid);
            LipstickInfo lipinfo = new LipstickInfo();
            ShopCar shopcar = new ShopCar();
            //lipinfo = shopcar.FindCar(cid);
            ResultSet rs;
            rs = shopcar.FindCar(cid);
            String name = "";
            String lipstickId = "";
            String price = "";
            String num = "";

            int allprice=0;
            if(lipinfo.getLipstickId() != null)
            	lipstickId = lipinfo.getLipstickId();
            if(lipinfo.getPrice() != null)
            	price = lipinfo.getPrice();
            if(lipinfo.getNum() != null)
            	num = lipinfo.getNum();
            if(lipinfo.getLipstickName() != null)
            	name = lipinfo.getLipstickName();
            
 
    %>

<%
	user=(UserInfo) session.getAttribute("currentUser");
 	strInfo=(String) session.getAttribute("info");
if (user!=null) {
%>
<h1>登录成功</h1>
<h2>欢迎你，<%=user.getCid()%>！尽情填满购物车吧！</h2>
<%}
else{
%>
<h1>
<%=strInfo %>请先登录！</h1> 

<div class="reg_button">
         	<center><button type="button" onclick="javascript:window.location.href='customerReg.jsp'">注册</button></center>
</div>
<br>
<div class="reg_button">
         	<center><button type="button" onclick="javascript:window.location.href='index.jsp'">登录</button></center>
</div>
<%
  session.removeAttribute("info"); 
}
%>
<div class="content_show_wrapper"> 
	<div class="cart_notification cart_error" style=""> 
		<div class="message"> 
			<p></p>
		</div> 
	</div>
	<div id="group_show"> 
		<div class="content_header clearfix">  
			<div class="cart_timer_wrapper cart_out_of_time"> 
				<i class="icon_small png"></i> 
				<span class="cart_timer_counting"> 请在  
				[<a class="cart_timer_tip float_box" href="javascript:void(0)"> ? 
					<div class="pop_box">  
					<span class="arrow_t_1"><span class="arrow_t_2"></span></span>
					</div> 
				</a>] 
			</div>  
	   
		</div>  
		<div class="groups_wrapper"> 
			<table class="cart_group_item  cart_group_item_product"> 
				<thead> 
					<tr> 
						<th class="cart_overview"> 
							<div class="cart_group_header"> 
								<input type="checkbox" class="js_group_selector cart_group_selector" checked="checked"> 
									<h2>  Ureal发货  </h2> 
							</div> 
						</th> 
						<th class="cart_price">Ureal价（元）</th>  
						<th class="cart_num">数量</th> 
						<th class="cart_total">小计（元）</th> 
						<th class="cart_option">操作						</th> 
					</tr> 
				</thead> 
				<tbody>
				<form name="form1" id="form1" action="changeOK.jsp" method="post" onsubmit="return check()"> 
				
					 
				<%
					while(rs.next()){
			             name = rs.getString("cid");
			             lipstickId = rs.getString("lipstickId");
				%>
				
				<tr class="cart_item " hashid="d170622p3183493" id="1086361_d170622p3183493" product_id="3183493" item_price="49.00" category_v3_3="143" brand_id="1408" product_type="product" vcb="false"> 
					<td valign="top"> 
						<div class="cart_item_desc clearfix">  
							<input type="checkbox" class="js_item_selector cart_item_selector" data-item-key="1086361_d170622p3183493" data-app="all" checked="'checked'/">  
							<div class="cart_item_desc_wrapper"> <a class="cart_item_pic" href="http://bj.jumei.com/i/deal/d170622p3183493.html" target="_blank"> 
								<img src="http://p3.jmstatic.com/product/003/183/3183493_std/3183493_60_60.jpg" alt="凯筣丝汀双头珠光卧蚕眉笔"> 
								<span class="sold_out_pic png"></span> </a>  
								<a class="cart_item_link" title="" href="http://bj.jumei.com/i/deal/d170622p3183493.html" target="_blank"><%=rs.getString("lipstickName") %></a> 
								<div class="sale_info clearfix">  </div> 
							</div> 
						</div> 
					</td> 
					<td> 
						<div class="cart_item_price">  
							<p class="jumei_price"><%=rs.getString("price") %></p>  
						</div> 
					</td>  
					<td>  
						<div class="cart_item_num "> 
							<div class="item_quantity_editer clearfix" data-item-key="1086361_d170622p3183493"> 
								<span class="decrease_one disabled " onclick="javascript:window.location.href='shopCar.jsp?renum=<%=rs.getString("num") %>&lp=<%=rs.getString("lipstickId") %>&c=<%=rs.getString("cid") %>'">-</span> 
								<input class="item_quantity" type="text" value="<%=rs.getInt("num") %>"> 
								<span class="increase_one " onclick="javascript:window.location.href='shopCar.jsp?adnum=<%=rs.getString("num") %>&lp=<%=rs.getString("lipstickId") %>&c=<%=rs.getString("cid") %>'">+</span> 
							</div> 
							<div class="item_shortage_tip">   </div> 
						</div>  
					</td> 
					<td> 
						<div class="cart_item_total"> 
					
							<p class="item_total_price"><%=rs.getInt("num")*rs.getInt("price") %></p>  
							<%allprice=allprice+rs.getInt("num")*rs.getInt("price"); %>
						</div> 
					</td> 
					<td> 
						<div class="cart_item_option"> 
							<a class="icon_small delete_item png"  title="delete" onclick="javascript:window.location.href='shopCar.jsp?lp=<%=rs.getString("lipstickId") %>&c=<%=rs.getString("cid") %>'" ></a> 
							<button onclick="" value="删除"></button>
						</div> 
					</td> 
				</tr>  
				<% } %>
				
				</tbody> 
				<tfoot> 
					<tr> 
						<td colspan="5"> 商品金额： <span class="group_total_price"> ¥<%=allprice %></span> </td> 
					</tr> 
				</tfoot> 
				
			</table>
		</div> 
		<div class="common_handler_anchor"></div> <div class="common_handler"> 
		<div class="right_handler"> 共 <span class="total_amount"> 0 </span> &nbsp;件商品 &nbsp;&nbsp; 商品应付总额：<span class="total_price">¥<%=allprice%></span> 
			<a id="go_to_order" class="btn" href="javascript:;">去结算</a> 
		</div>
		</form> 
		<label for="js_all_selector" class="cart_all_selector_wrapper"> 
			<input type="checkbox" id="js_all_selector" class="js_all_selector all_selector"> 全选 
		</label> 
		<a class="go_back_shopping" href="http://hd.jumei.com/act/4-1-132607-ppt_kaiduo_170610.html">继续购物</a> 
		<span class="seperate_line">|</span> 
		<a class="clear_cart_all" href="">清空选中商品</a> 
		<form id="form_to_order" action="" method="post" style="display: none;"> 
			<input type="hidden" name="items_key"> 
		</form> 
		  
		
</body>




</html>
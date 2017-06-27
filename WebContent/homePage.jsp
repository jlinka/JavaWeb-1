<!--homePage.jsp-->
<!-- 首页 -->
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.net.URLDecoder"%>
<!DOCTYPE>
<html>
<head>
	<meta charset="UTF-8">
	<title>欢迎光临-不存在的唇膏店-Unreal Lipstick Store</title>
	<link rel="stylesheet" type="text/css" href="css/css-homepage.css">
	<style type="text/css">
	.searchTab {
	margin-top:10px;
	margin-left:489px;
	padding-bottom: 10px;
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
	
	<link rel="stylesheet" href="css/reset.css" type="text/css" media="screen" />


		<link rel="stylesheet" href="css/index.css" type="text/css" media="screen" />
		
		<script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
		<script type="text/javascript" src="js/tab.js"></script>
		<script type="text/javascript">
		$(function(){
			var $window = $(window),window_width = $window.width();
			$('#js_banner, #js_banner_img li').width(window_width);
			new $.Tab({
				target: $('#js_banner_img li'),
				effect: 'slide3d',
				animateTime: 1000,
				stay: 3500,
				autoPlay: true,
				merge: true,
				prevBtn: $('#js_banner_pre'),
				nextBtn: $('#js_banner_next')
			});
		});
		</script>
	
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
	<div id="js_banner" class="fx_banner">
			<ul id="js_banner_img" class="fx_banner_img clear">
				<li style="background:#cfd0ef">
					<div class="fx_banner_inner fx_grid_c1">
						<div class="child child0" data-z="1"><img src="images/0.jpg" alt="misfit shine"></div>
						<div class="child" data-z="2" style="left:0;top:0;"><img src="images/0_1.png" alt=""></div>
						<div class="child" data-z="3" style="left:495px;top:0;"><img src="images/0_2.png" alt=""></div>
					</div>
					<a href="searchGoods.jsp?cid=<%=cid %>" class="fx_banner_link"><span class="hide">去购买</span></a>
				</li>
				<li style="background:#fe5769">
					<div class="fx_banner_inner fx_grid_c1">
						<div class="child child0" data-z="1"><img src="images/1.jpg" alt="latin"></div>
						<div class="child" data-z="2" style="left:0;top:0;"><img src="images/1_1.png" alt=""></div>
						<div class="child" data-z="3" style="left:495px;top:0;"><img src="images/1_2.png" alt=""></div>
					</div>
					<a href="searchGoods.jsp?cid=<%=cid %>" class="fx_banner_link"><span class="hide">去购买</span></a>
				</li>
				<li style="background:#a3e3ff">
					<div class="fx_banner_inner fx_grid_c1">
						<div class="child child0" data-z="1"><img src="images/2.jpg" alt="sony"></div>
						<div class="child" data-z="2" style="left:0;top:0;"><img src="images/2_1.png" alt=""></div>
						<div class="child" data-z="3" style="left:495px;top:0;"><img src="images/2_2.png" alt=""></div>
					</div>
					<a href="searchGoods.jsp?cid=<%=cid %>" class="fx_banner_link"><span class="hide">去购买</span></a>
				</li>
				<li style="background:#a5a38c">
					<div class="fx_banner_inner fx_grid_c1">
						<div class="child child0" data-z="1"><img src="images/3.jpg" alt="洁灵卡"></div>
						<div class="child" data-z="2" style="left:0;top:0;"><img src="images/3_1.png" alt=""></div>
						<div class="child" data-z="3" style="left:495px;top:0;"><img src="images/3_2.png" alt=""></div>
					</div>
					<a href="searchGoods.jsp?cid=<%=cid %>" class="fx_banner_link"><span class="hide">去购买</span></a>
				</li>
				<li style="background:#87c2e3">
					<div class="fx_banner_inner fx_grid_c1">
						<div class="child child0" data-z="1"><img src="images/4.jpg" alt="海尔天樽"></div>
						<div class="child" data-z="2" style="left:0;top:0;"><img src="images/4_1.png" alt=""></div>
						<div class="child" data-z="3" style="left:495px;top:0;"><img src="images/4_2.png" alt=""></div>
					</div>
					<a href="searchGoods.jsp?cid=<%=cid %>" class="fx_banner_link" href=""><span class="hide">去购买</span></a>
				</li>
			</ul>
			<div class="fx_banner_common fx_grid_c1">
				<a ytag="30000" id="js_banner_pre" href="javascript:;" class="fx_banner_pre"></a>
				<a ytag="30010" id="js_banner_next" href="javascript:;" class="fx_banner_next"></a>
			</div>
		</div><!-- js_banner -->
</body>
</html>
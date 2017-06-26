<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="headmodel.jsp"></jsp:include>
<div class="container">
	<div class="w">
		<div class="main">
			<div class="mycomment">
				<div class="m_tab-wrap">
					<div class="m_tab">
						<ul class="tab-trigger">
							<li class="trig-item">
								<a class="text">当前订单</a>
							</li>
							<li class="trig-item">
								<a>历史订单</a>
							</li>
						</ul>
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
						<tbody>
							<tr class="sep-row">
								<td colspan="4"></td>
							</tr>
							<tr class="tr-th">
								<td colspan="4">
									<span class="gap"></span>
									<span class="dealtime"></span>
									<span class="number">
										订单号：
										<a></a>
									</span>
								</td>
							</tr>
							<tr class="tr-bd">
								<td>
									<div class="good-item">
										<div class="p-img">
											<a><img></a>
										</div>
										<div class="p-msg">
											<a></a>
										</div>
									</div>
									<div class="good-number"></div>
									<div class="clr"></div>
								</td>
								<td rowspan="3">
									<div class="consignee">
										<span class="txt"></span>
										<b></b>
									</div>
								</td>
								<td rowspan="3">
									<div class="amount">
										<span>
											支付金额：￥
										</span>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="ui_page-wrap">
						<div class="ui-page">
							<span class="text">共<% %>个订单</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
package com.finalExam.bean;

import java.sql.*;

public class OrderManager {
	/*
	 * Variable for database connection
	 * 用于数据库连接的变量
	 */
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement pstmt;
	private DBConnect dbConn;
	
	/*
	 * function for get a piece of Order Information by orderID
	 */
	public OrderInfo getOrderInfo(String oid)
	{
		dbConn = new DBConnect();
		OrderInfo orderInfo = null;
		try{
			  conn=dbConn.getConnection();
			  String sqlStr="select * from order where orderId='"+oid+"';";
			  pstmt=conn.prepareStatement(sqlStr);
			  rs=pstmt.executeQuery();
			  orderInfo=new OrderInfo();
			  if(rs.next()){
				  orderInfo.setOrderID(rs.getString("orderId"));
				  orderInfo.setOrderTime(rs.getString("orderTime"));
				  orderInfo.setDeliveryTime(rs.getString("deliveryTime"));				  
				  orderInfo.setDeleveryAddr(rs.getString("deleveryAddr"));
				  orderInfo.setPayMethod(rs.getString("payMethod"));
				  orderInfo.setShipStatus(rs.getString("shipStatus"));
				  orderInfo.setOrderStatus(rs.getString("orderStatus"));
				  orderInfo.setCid(rs.getString("cid"));
				  orderInfo.setPrice("price");
			  }
			  if(rs!=null){
				  rs.close();
			  }
			  if(pstmt!=null){
				  pstmt.close();
			  }
		  }catch(SQLException e){
			  e.printStackTrace();
		  }
		  finally{
			  if(conn!=null){
				  DBConnect.closeConn(conn);
			  }
		  }
		return orderInfo;
	}
	
	/*
	 * function for deleting a piece of order information by orderID
	 * 
	 */
	public boolean delOrderInfo(String oid)
	{
		dbConn = new DBConnect();
		boolean result = false;
		
		try{
			  conn=dbConn.getConnection();
			  String sqlStr="delete from order where orderId='"+oid+"';";
			  pstmt=conn.prepareStatement(sqlStr);
			  rs=pstmt.executeQuery();
			  int i=pstmt.executeUpdate();
			  if(i>0){
				  result=true;
			  }
		  }catch(SQLException e){
			  e.printStackTrace();
		  }
		  finally{
			  if(conn!=null){
				  DBConnect.closeConn(conn);
			  }
		  }
		
		return result;
	}
	
	
	/*
	 * function for insert Order information
	 */
	public boolean insertOrderInfo(OrderInfo orderinfo)
	{
		boolean result = false;
		dbConn = new  DBConnect();
		
		try{
			  conn=dbConn.getConnection();
			  String sqlStr="Insert into `order` (orderId,orderTime,deliveryTime,"
			  		+ "deliveryAddress,payMethod,shipStatus,orderStatus,cid,price) values(?,?,?,?,?,?,?,?,?);";
			  
			  pstmt=conn.prepareStatement(sqlStr);
			  pstmt.setString(1, orderinfo.getOrderID());
			  pstmt.setString(2, orderinfo.getOrderTime());
			  pstmt.setString(3, orderinfo.getDeliveryTime());
			  pstmt.setString(4, orderinfo.getDeleveryAddr());
			  pstmt.setString(5, orderinfo.getPayMethod());
			  pstmt.setString(6, orderinfo.getShipStatus());
			  pstmt.setString(7, orderinfo.getOrderStatus());
			  pstmt.setString(8, orderinfo.getCid()); 
			  pstmt.setString(9, orderinfo.getPrice());
			  
			  int i=pstmt.executeUpdate();
			  if(i > 0){
				  result = true;
			  }
			  if(pstmt!=null){
				  pstmt.close();
			  }
		  }catch(SQLException e){
			  e.printStackTrace();
		  }finally{
			  if(conn!=null){
				  DBConnect.closeConn(conn);
			  }		  
		  }
		return result;
	}
	
	/*
	 * function for update order information
	 */
	public boolean UpdateOrderInfo(OrderInfo orderinfo)
	{
		boolean result = false;
		
		dbConn = new  DBConnect();
		
		try{
			  conn=dbConn.getConnection();
			  String sqlStr="upadate into order set orderTime=?,deliveryTime=?,"
			  		+ "deliveryAddress=?,payMethod=?,shipStatus=?,orderStatus=?,cid=?,price=? "
			  		+ "where orderID=?;";
			  
			  pstmt=conn.prepareStatement(sqlStr);
			  
			  pstmt.setString(1, orderinfo.getOrderTime());
			  pstmt.setString(2, orderinfo.getDeliveryTime());
			  pstmt.setString(3, orderinfo.getPayMethod());
			  pstmt.setString(4, orderinfo.getDeleveryAddr());
			  pstmt.setString(5, orderinfo.getPayMethod());
			  pstmt.setString(6, orderinfo.getShipStatus());
			  pstmt.setString(7, orderinfo.getCid()); 
			  pstmt.setString(8, orderinfo.getPrice());
			  pstmt.setString(9, orderinfo.getOrderID());
			  
			  int i=pstmt.executeUpdate();
			  if(i > 0){
				  result = true;
			  }
			  if(pstmt!=null){
				  pstmt.close();
			  }
		  }catch(SQLException e){
			  e.printStackTrace();
		  }finally{
			  if(conn!=null){
				  DBConnect.closeConn(conn);
			  }		  
		  }
		
		return result;
	}
	
}

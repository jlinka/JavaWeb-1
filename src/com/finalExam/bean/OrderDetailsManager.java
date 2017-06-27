package com.finalExam.bean;

import java.sql.*;

public class OrderDetailsManager {
	/*
	 * Variable for database connection
	 * 用于数据库连接的变量
	 */
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement pstmt;
	private DBConnect dbConn;
	
	/*
	 * Insert order details information
	 */
	public boolean insertOrderDetails(OrderDetails orderdetails)
	{
		boolean result = false;
		dbConn = new  DBConnect();
		try{
			  conn=dbConn.getConnection();
			  String sqlStr="Insert into orderdetails (orderId,num,commodity"
			  		+ ") values(?,?,?)";
			  
			  pstmt=conn.prepareStatement(sqlStr);
			  pstmt.setString(1, orderdetails.getOrderId());
			  pstmt.setString(2, orderdetails.getComodity());
			  pstmt.setString(3, orderdetails.getNum());
			  
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
	 * Delete order details information
	 */
	@SuppressWarnings("static-access")
	public boolean deleteOrderDetails(String id){
		  boolean result=false;
		  dbConn=new DBConnect();
		  try{
			  conn=dbConn.getConnection();
			  String sqlStr="delete from orderdetails where orderId='"+id+"';";
			  pstmt=conn.prepareStatement(sqlStr);
			  int i=pstmt.executeUpdate();
			  if(i>0){
				  result=true;
			  }
			  
		  }catch(SQLException e){
			  e.printStackTrace();
		  }finally{
			  if(conn!=null)dbConn.closeConn(conn);
		  }
		  return result;
	  }
	
	/*
	 * get All Order Details by Order Id
	 */
	public ResultSet getAllOrderDetails(String id) throws SQLException{
		dbConn=new DBConnect();
		conn=dbConn.getConnection();
		String sqlStr="select * from orderdetails where orderId='"+id+"';";
		pstmt=conn.prepareStatement(sqlStr);
		rs=pstmt.executeQuery();
		return rs;
	}
	
	/*
	 * function for get a piece of Order detail by orderID
	 */
	public OrderDetails getOrderDetails(String oid)
	{
		dbConn = new DBConnect();
		OrderDetails orderInfo = null;
		try{
			  conn=dbConn.getConnection();
			  String sqlStr="select * from orderdetails where orderId='"+oid+"';";
			  pstmt=conn.prepareStatement(sqlStr);
			  rs=pstmt.executeQuery();
			  orderInfo=new OrderDetails();
			  if(rs.next()){
				  orderInfo.setOrderId(rs.getString("orderId"));
				  orderInfo.setComodity(rs.getString("commodity"));
				  orderInfo.setNum(rs.getString("num"));
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
}

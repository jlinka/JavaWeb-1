package com.finalExam.bean;

import java.sql.*;

public class LipstickManager {
	/*
	 * Variable for database connection
	 * 用于数据库连接的变量
	 */
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement pstmt;
	private DBConnect dbConn;
	
	/*
	 * Function for deleting lipstick information
	 */
	@SuppressWarnings("static-access")
	public boolean deleteLipstick(String id){
		  boolean result=false;
		  dbConn=new DBConnect();
		  try{
			  conn=dbConn.getConnection();
			  String sqlStr="delete from commodityinformation where lipstickId='"+id+"';";
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
	 * Function for updating Lipstick information
	 */
	@SuppressWarnings("static-access")
	public boolean UpdateLipstickInfo(LipstickInfo lipstick){
		  boolean result=false;
		  dbConn=new DBConnect();
		  try{
			  conn=dbConn.getConnection();
			  String sqlStr="update commodityinformation set "
					  +"lipstickType=?,lipstickName=?,commodityPlace=?,"
					  + "filePath=?,Inventory=?,introduction=?,price=?"
					  +" where lipstickId=?";
			  pstmt=conn.prepareStatement(sqlStr);
			  
			  pstmt.setString(1, lipstick.getLipstickType());
			  pstmt.setString(2, lipstick.getLipstickName());
			  pstmt.setString(3, lipstick.getCommodityPlace());
			  pstmt.setString(4, lipstick.getFilePath());
			  pstmt.setString(5, lipstick.getInventory());
			  pstmt.setString(6, lipstick.getIntroduction());
			  pstmt.setString(7, lipstick.getPrice());
			  pstmt.setString(8, lipstick.getLipstickId());
			  int i=pstmt.executeUpdate();
			  
			  if(i>0){
				  result=true;
			  }
			  if(rs!=null)rs.close();
			  if(pstmt!=null)pstmt.close();
		  }catch(SQLException e){
			  e.printStackTrace();
		  }finally{
			  if(conn!=null)dbConn.closeConn(conn);
		  }
		  return result;   
	  }
	
	/*
	 * Insert lipstick information
	 */
	public boolean InsertLipstick(LipstickInfo lipstick)
	{
		boolean result = false;
		dbConn = new  DBConnect();
		try{
			  conn=dbConn.getConnection();
			  String sqlStr="Insert into commodityinformation (lipstickId,lipstickType,lipstickName,"
			  		+ "commodityPlace,filePath,Inventory,introduction,price) values(?,?,?,?,?,?,?,?)";
			  pstmt=conn.prepareStatement(sqlStr);
			  pstmt.setString(1, lipstick.getLipstickId());
			  pstmt.setString(2, lipstick.getLipstickType());
			  pstmt.setString(3, lipstick.getLipstickName());
			  pstmt.setString(4, lipstick.getCommodityPlace());
			  pstmt.setString(5, lipstick.getFilePath());
			  pstmt.setString(6, lipstick.getInventory());
			  pstmt.setString(7, lipstick.getIntroduction());
			  pstmt.setString(8, lipstick.getPrice());  	
			  
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
	 * Get lipstick information
	 */
	public LipstickInfo getLipstickInfo(String name)
	{
		dbConn = new DBConnect();
		LipstickInfo lipstick = null;
		try{
			  conn=dbConn.getConnection();
			  String sqlStr="select * from commodityinformation where lipstickName='"+name+"';";
			  pstmt=conn.prepareStatement(sqlStr);
			  rs=pstmt.executeQuery();
			  lipstick=new LipstickInfo();
			  if(rs.next()){
				  lipstick.setLipstickId(rs.getString("lipstickId"));
				  lipstick.setLipstickType(rs.getString("lipstickType"));
				  lipstick.setCommodityPlace(rs.getString("commodityPlace"));				  
				  lipstick.setFilePath(rs.getString("filePath"));
				  lipstick.setInventory(rs.getString("Inventory"));
				  lipstick.setIntroduction(rs.getString("introduction"));
				  lipstick.setPrice(rs.getString("price"));
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
		return lipstick;
	}
}

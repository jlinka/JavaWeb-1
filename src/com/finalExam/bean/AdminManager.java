package com.finalExam.bean;

import java.sql.*;

public class AdminManager {
	/*
	 * Variable for database connection
	 * 用于数据库连接的变量
	 */
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement pstmt;
	private DBConnect dbConn;
	
	/*
	 * Login Function
	 */
	@SuppressWarnings("finally")
	public AdminInfo adminLogin(String aid, String passwd)
	{
		AdminInfo admin=null;
		dbConn=new DBConnect();
		try{
			  conn=dbConn.getConnection();
			  String sqlStr="select * from admin_info where aid=? and passwd=?";
			  pstmt=conn.prepareStatement(sqlStr);
			  pstmt.setString(1, aid);
			  pstmt.setString(2, passwd);
			  rs=pstmt.executeQuery();
			  if(rs.next()){
				  admin=new AdminInfo();
				  admin.setAid(rs.getString("aid"));
				  admin.setPasswd(rs.getString("passwd"));
				  admin.setGender(rs.getString("gender"));
				  admin.setAddr(rs.getString("addr"));
				  admin.setTel(rs.getString("tel"));
				  admin.setEmail(rs.getString("email"));			 			  
			  }
			  if(rs!=null){
				  rs.close();
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
		return admin;
		  }
	}
	
	
	/*
	 * Get current administer information
	 */
	public AdminInfo getAdminInfo(String name) {
		  AdminInfo admin=null;
		  dbConn=new  DBConnect();
		  try{
			  conn=dbConn.getConnection();
			  String sqlStr="select * from admin_info where aid='"+name+"';";
			  pstmt=conn.prepareStatement(sqlStr);
			  rs=pstmt.executeQuery();
			  admin=new AdminInfo();
			  if(rs.next()){
				  admin.setAid(rs.getString("aid"));
				  admin.setPasswd(rs.getString("passwd"));
				  admin.setGender(rs.getString("gender"));				  
				  admin.setTel(rs.getString("tel"));
				  admin.setAddr(rs.getString("addr"));
				  admin.setEmail(rs.getString("email"));		  
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
		  }return admin;
	 }
	
	/*
	 * Insert administer information
	 */
	
	public boolean InsertAdminInfo(AdminInfo admin)
	{
		boolean result = false;
		dbConn = new  DBConnect();
		try{
			  conn=dbConn.getConnection();
			  String sqlStr="Insert into admin_info (aid,passwd,gender,tel,addr,email) values(?,?,?,?,?,?)";
			  pstmt=conn.prepareStatement(sqlStr);
			  pstmt.setString(1, admin.getAid());
			  pstmt.setString(2, admin.getPasswd());
			  pstmt.setString(3, admin.getGender());
			  pstmt.setString(4, admin.getTel());
			  pstmt.setString(5, admin.getAddr());
			  pstmt.setString(6, admin.getEmail());
			  	
			  
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
	 * Function for updating administer information
	 */
	@SuppressWarnings("static-access")
	public boolean UpdateAdminInfo(AdminInfo admin){
		  boolean result=false;
		  dbConn=new DBConnect();
		  try{
			  conn=dbConn.getConnection();
			  String sqlStr="update admin_info set "
					  +"passwd=?,gender=?,tel=?,addr=?,email=?"
					  +" where aid=?";
			  pstmt=conn.prepareStatement(sqlStr);
			  pstmt.setString(1, admin.getPasswd());
			  pstmt.setString(2, admin.getGender());
			  pstmt.setString(3, admin.getTel());
			  pstmt.setString(4, admin.getAddr());
			  pstmt.setString(5, admin.getEmail());
			  pstmt.setString(6, admin.getAid());
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
}

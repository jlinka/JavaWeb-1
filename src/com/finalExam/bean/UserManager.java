package com.finalExam.bean;
import java.sql.*;

public class UserManager {
	
	/*
	 * Variable for database connection
	 * 用于数据库连接的变量
	 */
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement pstmt;
	private DBConnect dbConn;
	
	public UserManager(){
		  
	}
	
	/*
	 * Login Function
	 */
	@SuppressWarnings("finally")
	public UserInfo userLogin(String cid, String passwd)
	{
		UserInfo loginUser=null;
		dbConn=new DBConnect();
		try{
			  conn=dbConn.getConnection();
			  String sqlStr="select * from customer_info where cid=? and passwd=?";
			  pstmt=conn.prepareStatement(sqlStr);
			  pstmt.setString(1, cid);
			  pstmt.setString(2, passwd);
			  rs=pstmt.executeQuery();
			  if(rs.next()){
				  loginUser=new UserInfo();
				  loginUser.setCid(rs.getString("cid"));
				  loginUser.setPasswd(rs.getString("passwd"));
				  loginUser.setGender(rs.getString("gender"));
				  loginUser.setAddr(rs.getString("addr"));
				  loginUser.setTel(rs.getString("tel"));
				  loginUser.setEmail(rs.getString("email"));			 			  
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
		return loginUser;
		  }
	}
	
	/*
	 * Get current user information
	 */
	public UserInfo getUserInfo(String name) {
		  UserInfo the_User=null;
		  dbConn=new  DBConnect();
		  try{
			  conn=dbConn.getConnection();
			  String sqlStr="select * from customer_info where cid='"+name+"';";
			  pstmt=conn.prepareStatement(sqlStr);
			  rs=pstmt.executeQuery();
			  the_User=new UserInfo();
			  if(rs.next()){
				  the_User.setCid(rs.getString("cid"));
				  the_User.setPasswd(rs.getString("passwd"));
				  the_User.setGender(rs.getString("gender"));				  
				  the_User.setTel(rs.getString("tel"));
				  the_User.setAddr(rs.getString("addr"));
				  the_User.setEmail(rs.getString("email"));		  
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
		  }return the_User;
	 }
	
	/*
	 * Insert Customer information
	 */
	
	public boolean InsertInfo(UserInfo newUser)
	{
		boolean result = false;
		dbConn = new  DBConnect();
		try{
			  conn=dbConn.getConnection();
			  String sqlStr="Insert into customer_info (cid,passwd,gender,tel,addr,email) values(?,?,?,?,?,?)";
			  pstmt=conn.prepareStatement(sqlStr);
			  pstmt.setString(1, newUser.getCid());
			  pstmt.setString(2, newUser.getPasswd());
			  pstmt.setString(3, newUser.getGender());
			  pstmt.setString(4, newUser.getTel());
			  pstmt.setString(5, newUser.getAddr());
			  pstmt.setString(6, newUser.getEmail());
			  	
			  
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
	 * Function for updating Customer information
	 */
	public boolean UpdateUserInfo(UserInfo oldUser){
		  boolean result=false;
		  dbConn=new DBConnect();
		  try{
			  conn=dbConn.getConnection();
			  String sqlStr="update customer_info set "
					  +"passwd=?,gender=?,tel=?,addr=?,email=?"
					  +" where cid=?";
			  pstmt=conn.prepareStatement(sqlStr);
			  pstmt.setString(1, oldUser.getPasswd());
			  pstmt.setString(2, oldUser.getGender());
			  pstmt.setString(3, oldUser.getTel());
			  pstmt.setString(4, oldUser.getAddr());
			  pstmt.setString(5, oldUser.getEmail());
			  pstmt.setString(6, oldUser.getCid());
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
	 * Function for deleting the 
	 */
	public boolean deleteUser(String cid){
		  boolean result=false;
		  dbConn=new DBConnect();
		  try{
			  conn=dbConn.getConnection();
			  String sqlStr="delete from customer_info where cid='"+cid+"';";
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
	 * Get All Customer Information
	 */
	
}

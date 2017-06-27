package com.finalExam.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AuditUser {
	
	/*
	 * Variable for database connection
	 * 用于数据库连接的变量
	 */
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement pstmt;
	private DBConnect dbConn;
	
	public AuditUser(){
		
	}
	@SuppressWarnings("static-access")
	public boolean deleteLipstick(String cid){
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
	 * Function for updating Lipstick information
	 */
	public boolean UpdateLipstickInfo(String cid){
		  boolean result=false;
		  StringBuffer strInfo = new StringBuffer();
		  dbConn=new DBConnect();
		  try{
			  conn=dbConn.getConnection();
			  String sqlStr="update customer_info set confirm=? where cid=?";
			  pstmt=conn.prepareStatement(sqlStr);
			  pstmt.setString(1, "1");
			  pstmt.setString(2, cid);
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
	
	
	public String getAllInfo()
	{
		StringBuffer strInfo = new StringBuffer();
		dbConn = new DBConnect();
		try{
			String cid = "";
			String passwd = "";
			String gender = "";
			String tel = "";
			String addr = "";
			String email = "";			//库存
			String confirm = "";
			
			String sqlStr = "";
			conn=dbConn.getConnection();
			sqlStr = "select * from customer_info;";
			
			pstmt=conn.prepareStatement(sqlStr);
			rs=pstmt.executeQuery();
			while(rs.next()){
				  cid = rs.getString("cid");;
				  passwd = rs.getString("passwd");
				  gender = rs.getString("gender");
				  tel = rs.getString("tel");
				  addr = rs.getString("addr");
				  email = rs.getString("email");
				  confirm = rs.getString("confirm");
				  
				  
				  strInfo.append("<tr>");
				  strInfo.append("<td>"+cid+"</td>");
				  strInfo.append("<td>"+passwd+"</td>");
				  strInfo.append("<td>"+gender+"</td>");
				  strInfo.append("<td>"+tel+"</td>");
				  strInfo.append("<td>"+addr+"</td>");
				  strInfo.append("<td>"+email+"</td>");
				  strInfo.append("<td>"+confirm+"</td>");
				  strInfo.append("<td><div class=\"update_button\">"
				  		+ "<button type=\"button\" "
				  		+ "onclick=\"javascript:window.location.href='auditUser.jsp?id="+cid
				  		+ "&num=1'\">确认</button></div></td>");
				  strInfo.append("<td><div class=\"update_button\">"
					  		+ "<button type=\"button\" "
					  		+ "onclick=\"javascript:window.location.href='auditUser.jsp?id="+cid
					  		+ "&num=0'\">删除</button></div></td>");
				  strInfo.append("</tr>");
			  }
			  
			  if(rs!=null)rs.close();
			  if(pstmt!=null)pstmt.close();	  
			  
		  }catch(SQLException e){
			  e.printStackTrace();
		  }finally{
			  if(conn!=null)dbConn.closeConn(conn);
		  }
		return strInfo.toString();
	}
	
}

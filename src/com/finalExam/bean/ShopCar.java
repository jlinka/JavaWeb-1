package com.finalExam.bean;

import java.sql.*;

public class ShopCar {
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement pstmt;
	private DBConnect dbConn;
	private Statement stmt;
	
	public ShopCar(){
		
	}
	
	@SuppressWarnings("finally")
	public ResultSet FindCar(String cid) throws SQLException{
		/*LipstickInfo lipinfo=null;
		dbConn=new DBConnect();
		try{
			  conn=dbConn.getConnection();
			  String sqlStr="select * from shopping_car as a, commodityinformation as b where a.lipstickId=b.lipstickId and a.cid='"+cid+"';";
			  pstmt=conn.prepareStatement(sqlStr);
			 // pstmt.setString(2, passwd);
			  rs=pstmt.executeQuery();
			  while(rs.next()){
				  lipinfo=new LipstickInfo();
				  lipinfo.setLipstickId(rs.getString("LipstickId"));
				  lipinfo.setNum(rs.getString("num"));
				  lipinfo.setPrice(rs.getString("price"));
				  lipinfo.setLipstickName(rs.getString("lipstickName"));	
				  System.out.println(lipinfo.getPrice()+lipinfo.getLipstickId()+lipinfo.getLipstickName());
			  }
			  
			  if(rs!=null){
				  return rs;
				  //rs.close();
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
			  return rs;*/
			dbConn=new DBConnect();
			  conn=dbConn.getConnection();
			  String sqlStr="select * from shopping_car as a, commodityinformation as b where a.lipstickId=b.lipstickId and a.cid='"+cid+"';";
			  pstmt=conn.prepareStatement(sqlStr);
			 // pstmt.setString(2, passwd);
			  rs=pstmt.executeQuery();
			  return rs;
		
		  }
	
	
	
	public int delCar(String lipstickId, String cid){
		LipstickInfo lipinfo=null;
		dbConn=new DBConnect();
		try{
			  conn=dbConn.getConnection();
			  String sqlStr="delete from shopping_car where cid='"+cid+"' and lipstickId="+lipstickId+";";
			  stmt=conn.createStatement();
			 // pstmt.setString(2, passwd);
			  stmt.executeUpdate(sqlStr);
			  if(pstmt!=null){
				  pstmt.close();
			  }
		  }catch(SQLException e){
			  e.printStackTrace();
			  return 0;
		  }finally{
			  if(conn!=null){
				  DBConnect.closeConn(conn);
			  }
			
		
		  }
		return 1;
		

	}
	
	public void adnum(String lipstickId, String cid, String num){
		LipstickInfo lipinfo=null;
		dbConn=new DBConnect();
		int inum;
		inum=Integer.parseInt(num)+1;
		try{

			  conn=dbConn.getConnection();
			  String sqlStr="update shopping_car set num=? where lipstickId=? and cid=?;";
			  pstmt=conn.prepareStatement(sqlStr);
			  pstmt.setString(3, cid);
			  pstmt.setString(2, lipstickId);
			  pstmt.setInt(1, inum);
			  
			  pstmt.executeUpdate();
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
		

	}
	
	public void renum(String lipstickId, String cid, String num){
		LipstickInfo lipinfo=null;
		int inum;
		dbConn=new DBConnect();
		inum=Integer.parseInt(num)-1;
		try{
			  
			  conn=dbConn.getConnection();
			  String sqlStr="update shopping_car set num=? where lipstickId=? and cid=?;";
			  pstmt=conn.prepareStatement(sqlStr);
			  pstmt.setString(3, cid);
			  pstmt.setString(2, lipstickId);
			  pstmt.setInt(1, inum);
			  
			  pstmt.executeUpdate();
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

	}
	
}







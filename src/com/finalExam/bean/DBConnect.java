package com.finalExam.bean;
import java.sql.*;
/*
 * @author 谢增光
 * class for connecting database and closing the connection
 * 此类用于连接数据库
 */

public class DBConnect {
	public DBConnect(){
    	
    }
	/*
	 * Function for connecting database
	 */
    public Connection getConnection(){
    	Connection conn=null;
    	String DriverClass="com.mysql.jdbc.Driver";
    	String url="jdbc:mysql://localhost:3306/lipstick_sql";
    	String username="root";
    	String password="123456";
    	try{
    		Class.forName(DriverClass);
    		conn=DriverManager.getConnection(url,username,password);   		
    	}catch(Exception e){
    		e.printStackTrace();   		
    	}
    	return conn;
    }
    
    /*
	 * Function for closing connection
	 */
    public static void closeConn(Connection conn){
    	if(conn!=null){
    		try{
    			conn.close();
    			
    		}catch(SQLException e){
    			e.printStackTrace();
    		}
    	}
    }
}

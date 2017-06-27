package com.finalExam.bean;
import java.sql.*;
/*
 * @author л����
 * class for connecting database and closing the connection
 * ���������������ݿ�
 */

public class DBConnect {
	public DBConnect(){
    	
    }
	/*
	 * Function for connecting database
	 */
    public Connection getConnection(){
    	Connection conn=null;
    	
    	String DriverClass = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    	//String DriverClass="com.mysql.jdbc.Driver";
        //String url="jdbc:mysql://localhost:3306/lipstick";
    	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=lipstick";
    	String username="sa";
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
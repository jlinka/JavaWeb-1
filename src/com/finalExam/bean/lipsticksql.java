package com.finalExam.bean;
import java.sql.*;

public class  lipsticksql{
	private Connection conn=null;
	private Statement st=null;
	private ResultSet rs=null; 
	
	public lipsticksql(){}
	
	//��������
	public Connection getconn(){    
		try{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			String url="jdbc:mysql://localhost:3306/db_shop?useSSL=false";  //����?useSSL=false��Ϊ�˽��sslʲô�����⡣��
			String user = "root";  
			String password = "123456";    
			conn = DriverManager.getConnection(url, user, password);  
		}catch(Exception e){
			e.printStackTrace();
		}
		return conn;
	}
	
	public void connclose(){
		try{
			if(st!=null)
				st.close();
			if(conn!=null){
				conn.close();
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	
	//��ѯ
	public ResultSet chaxun(String sql) throws SQLException{      
		try{
			conn=getconn();
			st = conn.createStatement(); 
			st.executeQuery("SET NAMES UTF8");
			//sql="select * from tbl_customer where userName='"+uid+"';"; 
			rs=st.executeQuery(sql); 
			/*if(rs.next()){
				mask=true;
				String p=new String(rs.getString("passWord"));  
				if(p.equals(pwd1)) 
					mask=true;
			}*/
		}catch(SQLException e){
			e.printStackTrace();
		}
		return rs;
	}
	
	//�������
	public boolean charu(String sql) throws SQLException{
		boolean mask=false;
		try{
			conn=getconn();
			st = conn.createStatement(); 
			st.executeQuery("SET NAMES UTF8");
			//sql="insert into tbl_customer values('" + uid + "','" + pwd1 + "','" + name + "','" + address + "','" + phone + "','" + mail + "')";
			st.execute(sql);
			mask=true;
			if(st!=null)
				st.close();
			if(conn!=null)
				conn.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return mask;
	}
	
	//ɾ������
	public int shanchu(String sql) throws SQLException{              
		int flag=0;
		try{
			conn=getconn();
			st = conn.createStatement(); 
			st.executeQuery("SET NAMES UTF8");
			//sql="delete from tbl_customer where userName='"+x+"'";
			flag=st.executeUpdate(sql);
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			if(st!=null)
				st.close();
			if(conn!=null)
				conn.close();
		}
		return flag;
	}
	
	//�޸Ĳ���
	public int xiugai(String sql) throws SQLException{  
		int flag=0;
		try{
			conn=getconn();
			st = conn.createStatement(); 
			st.executeQuery("SET NAMES UTF8");
			//sql="update tbl_customer set passWord='"+pwd1+"',Name='"+name+"',"
			//		+"Address='"+address+"',Phone='"+phone+"',Mail='"+mail+"'"
			//		+"where userName='"+uid+"'";
			flag=st.executeUpdate(sql);
			if(st!=null)
				st.close();
			if(conn!=null)
				conn.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return flag;
	}
}

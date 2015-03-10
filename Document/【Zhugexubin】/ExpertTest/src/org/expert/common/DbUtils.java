package org.expert.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DbUtils {
	private static Connection conn;
	private DbUtils(){
	}
	//��ȡ���ݿ�����
	public static Connection getConnection(){
		try{
			// 1.��������
			//Class.forName("oracle.jdbc.driver.OracleDriver");---Oracle
			//Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver")---SQL Server
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}
	
		try{
			// 2.����
			//String url = "jdbc:oracle:thin:@192.168.133.116:1521:expert"; ---Oracle
			//String url = "jdbc:sqlserver://localhost:1433;databaseName=expert"; ---SQL Server
			String url = "jdbc:mysql://localhost:3306/expert";//�?据库连接子协�?
			String username = "root";
			String password = "zhuge";
			conn = DriverManager.getConnection(url, username, password);
		}catch(SQLException e){
			e.printStackTrace();
		}
		return conn;
	}
	//�ر�����
	public static void closeConnection(){
		try{
			if(conn != null)
				conn.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	//�ر�
	public static void closePreparedStatement(PreparedStatement pstmt){
		try{
			if(pstmt != null)
				pstmt.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	//�رս����
	public static void closeResultSet(ResultSet rs){
		try{
			if(rs != null)
				rs.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	
}












package common;

import java.io.FileReader;
import java.sql.*;
import java.util.*; //properties 이용

public class JDBCTemplate {
	
	//1.DB와 연동하는 메소드
	public static Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.dirver.OracleDriver");
			String url="";
			String user="";
			String pwd="";
			conn = DriverManager.getConnection(url,user,pwd);
			conn.setAutoCommit(false);	
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	//2.Connection 커밋 메소드
	public static void commit(Connection conn) {
		try {
			if(conn!=null&&!conn.isClosed()) {
				conn.commit();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//3.Connection 롤백 메소드
	public static void rollback(Connection conn) {
		try {
			if(conn!=null&&!conn.isClosed()) {
				conn.rollback();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	//4.Connection 클로즈 메소드
	public static void close(Connection conn) {
		try {
			if(conn!=null&&!conn.isClosed()) {
				conn.close();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//5.PrepareStatement 클로즈 메소드
	public static void close(PreparedStatement pstmt) {
		try {
			if(pstmt!=null&&!pstmt.isClosed()) {
				pstmt.close();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	//6.Statement 클로즈 메소드
	public static void close(Statement stmt) {
		try {
			if(stmt!=null&&!stmt.isClosed()) {
				stmt.close();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//7.ResultSet 클로즈 메소드 
	public static void close(ResultSet rset) {
		try {
			if(rset!=null&&!rset.isClosed()) {
				rset.close();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
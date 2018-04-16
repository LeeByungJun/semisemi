<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<%@ page language="java" import="java.sql.*" %>
<%
String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";


String DB_USER    = "student"; // DB USER명
String DB_PASSWORD = "student"; // 패스워드

Connection con = null;
Statement  stmt   = null;
ResultSet rs = null;
String sql=null;

try
 {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD); 
  }catch(SQLException e){out.println(e);}
%>
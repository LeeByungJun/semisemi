<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../dbconn.jsp"%>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%@ page import="java.sql.*" %>


<%

	String id = request.getParameter("id");
 
 try{

	 String query = "delete from xe_review where id = ?"; 
	 PreparedStatement pstmt = con.prepareStatement(query); 
	 pstmt.setInt(1, Integer.parseInt(id));

	 int affectedRow = pstmt.executeUpdate();
	 
	 pstmt.close(); 
	 con.close();
  
%>
<script>
	alert("정상적으로 입력되었습니다.");
	location.href="reviewRent.jsp";
</script>
<%     
 } catch(Exception e) {
  e.printStackTrace();
 }

%>
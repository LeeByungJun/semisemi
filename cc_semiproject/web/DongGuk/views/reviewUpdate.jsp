<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../dbconn.jsp"%>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%@ page import="java.sql.*" %>


<%
 request.setCharacterEncoding("UTF-8");
 String realFolder = "";
 String filename1 = "";
 int maxSize = 1024*1024*5;
 String encType = "UTF-8";
 String savefile = "/DongGuk/images";
 ServletContext scontext = getServletContext();
 realFolder = scontext.getRealPath(savefile);
 

 
 
 try{
  MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

  String subject = multi.getParameter("subject");
  String content = multi.getParameter("content");
  filename1 = multi.getFilesystemName("image");
  String id= multi.getParameter("id");
  String car = multi.getParameter("car");

  String query = "update xe_review set subject=?, content=?, image=?, carname=? where id = ?"; 
  PreparedStatement pstmt = con.prepareStatement(query); 
  pstmt.setString(1, subject); 
  pstmt.setString(2, content); 
  pstmt.setString(3, savefile+"/"+filename1);
  pstmt.setString(4, car);
  pstmt.setString(5, id); 

  int affectedRow = pstmt.executeUpdate();

  pstmt.close(); 
  con.close();
  
%>
<script>
	alert("수정 되었습니다.");
	location.href="reviewRent.jsp";
</script>
	<%     
	} catch(Exception e) {
	 e.printStackTrace();
	}

%>
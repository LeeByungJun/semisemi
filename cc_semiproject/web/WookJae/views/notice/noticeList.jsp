<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="./noticeError.jsp"%>
<%@ page import="notice.model.vo.Notice,member.model.vo.Member, java.util.*"%>

<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
	int listCount = ((Integer)request.getAttribute("listCount")).intValue();
	int startPage = ((Integer)request.getAttribute("startPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer)request.getAttribute("maxPage")).intValue();			
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
	//Member loginUser = (Member)session.getAttribute("loginUser");
%>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>공지사항</title>
	<script type="text/javascript">
		function moveAdminWrite(){ 
			/* 관리자계정 로그인시 글쓰기버튼 활성화되며 글쓰기 페이지로 이동함*/
			location.href="/cs/WookJae/views/notice/noticeAdminWrite.jsp";			
		} 	
	</script>
	<%@ include file="../../../resources/include/meta.jsp"%>
	<style></style>
	</head>
		<body>
			<!-- header -->
			<%@ include file="../../../resources/include/header.jsp"%>
			<!-- sidenav -->
			<div class="container-fluid text-center">
				<div class="row content">
					<div class="col-sm-2 sidenav">
					<!-- side2 -->
					<%@ include file="../../../resources/include/sidenav.jsp"%>
					</div>
					<!-- main contents -->
					<div class="col-sm-8 text-left"><!-- #9900ff -->					
					<div class="container" style="width:100%; height:600%">					     
					    <i class="material-icons" style="font-size:45px; float:left;">drive_eta</i><h1 style="color:black; margin-top:3px;">Notice</h1>
					    <!-- <form action="/nlist" method="post">  -->
					    <% if(loginUser!=null&&loginUser.getEmail().equals("pjlee92@naver.com")){ %>
						<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
							<tr>
								<th style="background:#eeeeee; text-align:center;">No</th>
								<th style="background:#eeeeee; text-align:center;">Title</th>
								<th style="background:#eeeeee; text-align:center;">Writer</th>
								<!-- <th style="background:#eeeeee; text-align:center;">첨부파일</th> -->
								<th style="background:#eeeeee; text-align:center;">Date</th>
								<th style="background:#eeeeee; text-align:center;">Count</th>
							</tr>

						<%for(Notice n : list){ %> <!-- 반복문을 통하여게시판의 내용을불러옴  -->
							<tr>
								<td align="center"><%=n.getN_no()%></td>
								<td align="center"> <a href="/cs/ndetail?no=<%=n.getN_no()%>&page=<%=currentPage%>"> <%=n.getN_title()%> </a> </td>							
								<td align="center"> Administrator </td>													
								<%-- <td align="center">
								<% if(n.getN_original_filename()!=null){ //첨부파일이 존재한다면(★)%>
									★
								<% }else{ %>
								 	첨부파일이 없습니다.
								 <% } %>	
								</td> --%>															
								<td align="center"><%=n.getN_sysdate()%></td>															
								<td align="center"><%=n.getReadCount()%></td>														
							</tr>
							<% } %>
						</table>
						<!-- </form> -->
						<hr style="clear:both;">


						<div align="right">
						<button onclick="moveAdminWrite();">AdminWrite</button>
						</div>
						<% }else { %>
						<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
							<tr>
								<th style="background:#eeeeee; text-align:center;">No</th>
								<th style="background:#eeeeee; text-align:center;">Title</th>
								<th style="background:#eeeeee; text-align:center;">Writer</th>
								<!-- <th style="background:#eeeeee; text-align:center;">첨부파일</th> -->
								<th style="background:#eeeeee; text-align:center;">Date</th>
								<th style="background:#eeeeee; text-align:center;">Count</th>
							</tr>

						<%for(Notice n : list){ %> <!-- 반복문을 통하여게시판의 내용을불러옴  -->
							<tr>
								<td align="center"><%=n.getN_no()%></td>
								<td align="center"> <a href="/cs/ndetail?no=<%=n.getN_no()%>&page=<%=currentPage%>"> <%=n.getN_title()%> </a> </td>												
								<td align="center"> Administrator </td>													
								<%-- <td align="center">
								<% if(n.getN_original_filename()!=null){ //첨부파일이 존재한다면(★)%>
									★
								<% }else{ %>
								 	첨부파일이 없습니다.
								 <% } %>	
								</td>	 --%>														
								<td align="center"><%=n.getN_sysdate()%></td>															
								<td align="center"><%=n.getReadCount()%></td>														
							</tr>
							<% } %>
						</table>
						<% } %>
						<hr style="clear:both;">
						<!-- 페이징 처리 -->
						<div style="text-align:center;">
						<% if(currentPage <= 1){ %>
							[First]&nbsp;
						<% }else{ %>
							<a href="/cs/nlist?page=1">[First]</a>
						<% } %>
						<% if((currentPage - 10) < startPage 
								&& (currentPage - 10) > 1){ %>
							<a href="/cs/nlist?page=<%= startPage - 10 %>">[Before]</a>	
						<% }else{ %>
							[Before]&nbsp;
						<% } %>
						<!-- 현재 페이지가 포함된 그룹의 페이지 숫자 출력 -->
						<% for(int p = startPage; p <= endPage; p++){ 
								if(p == currentPage){
						%>
							<font color="red" size="4"><b>[<%= p %>]</b></font>
						<% }else{ %>
							<a href="/cs/nlist?page=<%= p %>"><%= p %></a>
						<% }} %>
						
						<% if((currentPage + 10) > endPage 
								&& (currentPage + 10) < maxPage){ %>
							<a href="/cs/nlist?page=<%= endPage + 10 %>">[Next]</a>	
						<% }else{ %>
							[Next]&nbsp;
						<% } %>
						
						<% if(currentPage >= maxPage){ %>
							[End]&nbsp;
						<% }else{ %>
							<a href="/cs/nlist?page=<%= maxPage %>">[End]</a>
						<% } %>
						</div>
								
						
						</div>					
					</div>
					<div class="col-sm-2 sidenav" style="padding:0 0 5 0; background:white;">
						<%@ include file="../../../resources/include/add.jsp" %>
					</div>
				</div>
			</div>
			<!-- login 관련 modal -->
			<%@ include file="../../../resources/include/login.jsp"%>
		
			<!-- footer -->
			<%@ include file="../../../resources/include/footer.jsp"%>		
		</body>
</html>
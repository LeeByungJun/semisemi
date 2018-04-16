<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="./reportError.jsp"%>
 <%@ page import="report.model.vo.Report,member.model.vo.Member,java.util.*" %>
 <% 
 	//Member loginUser = (Member)session.getAttribute("loginUser");
 	Report rp = (Report)request.getAttribute("report");
 	int currentPage = ((Integer) request.getAttribute("page")).intValue(); 
 %>
<!DOCTYPE html>
	<html>
	<head>
	<meta charset=UTF-8>
	<title>불량고객 게시판 글수정</title>
	<%@ include file="../../../resources/include/meta.jsp"%>	
	<script type="text/javascript" src="/cs/resources/bootstrap/js/jquery-3.3.1.min.js"></script>
	<!-- <link href="/cs/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
	<link href="/cs/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->	
	<script type="text/javascript">
		/* 차후에 필요시 메소드 작성하여사용할것임 */
		function changeReport(){
			alert("수정이 완료되었습니다^^");
		}
	</script>
	<style type="text/css">
		table {
			text-align:center;
		}

		table tr th {
			background:skyblue;
			text-align:center;
		}
	</style>
	</head>
	<body background="../../../images/car2.jpg">
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
					<div class="col-sm-8 text-left" align="center">
					
					<div align="center">	
					
					<form action="/cs/rupdatewrite" method="post" enctype="multipart/form-data">
						<input type="hidden" name="rnum" value="<%=rp.getR_no()%>">
						<input type="hidden" name="page" value="<%=currentPage%>">
						<input type="hidden" name="ofile" value="<%=rp.getR_original_filename()%>">
						<input type="hidden" name="rfile" value="<%=rp.getR_rename_filename()%>"> 
					
						<table class="table table-striped" style="text-align:center;">
							<tr>
							 	<td colspan="2"><h2 align="center">Report 수정페이지</h2></td>
							</tr>
							<tr align="center">
								<th style="background:#464244; color:white;">제목</th>			
								<td><input type="text" name="retitle" value="<%=rp.getR_title()%>" style="width:70%;"></td>			
							</tr>
							<tr>
								<th style="background:#464244; color:white;">작성자</th>			
								<td><input type="text" name="rewriter" value="<%=loginUser.getEmail()%>" style="width:70%; border:none; text-align:center;" readonly></td>
							</tr>
							<tr><th style="background:#464244; color:white;">첨부파일</th>
								<td align="center">
								<% if(rp.getR_original_filename()!=null){ %>
								<%=rp.getR_original_filename()%> 
								<% } %> 
								<br>
								<input type="file" name="reupfile" style="margin-left:40px;"></td>
							</tr>
							<tr>
								<th style="background:#464244; color:white;">내 용</th>			
								<td><textarea rows="10" cols="64" name="recontents"><%=rp.getR_contents()%></textarea></td>			
							</tr>
							<tr align="center">
								<td colspan = "2">			
									<input type="submit" value="수정완료" onclick="changeReport();"> &nbsp;
									<input type = "button" value="이전" onclick = "history.go(-1); return false;">
								</td>
							</tr>
						</table>
						
					</form>
					</div>
				</div>	
			<div class="col-sm-2 sidenav">
			<%@ include file="../../../resources/include/add.jsp" %>		
			</div>
		</div>	
	</div>	
	<br>
	<!-- login관련 modal  -->	
	
	<!-- footer -->	
	<%@ include file="../../../include/footer.jsp"%>
	
	</body>
</html>
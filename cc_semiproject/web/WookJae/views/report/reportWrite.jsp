<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="./reportError.jsp"%>
 <%@ page import="report.model.vo.Report,member.model.vo.Member,java.util.*" %>
 <% 
 	//Member loginUser = (Member)session.getAttribute("loginUser");
 %>
<!DOCTYPE html>
	<html>
	<head>
	<meta charset=UTF-8>
	<title>불량고객 게시판 글쓰기</title>
	<%@ include file="../../../resources/include/meta.jsp"%>	
	<script type="text/javascript" src="/cs/resources/bootstrap/js/jquery-3.3.1.min.js"></script>
	<!-- <link href="/cs/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
	<link href="/cs/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">	 -->
	<script type="text/javascript">
		/* 차후에 필요시 메소드 작성하여사용할것임 */
		function writeconfirm(){
			alert("작성이 완료되었습니다^^");
		}
		function test(){
			alert("Test용 링크 입니다!~");
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
					<div class="col-sm-8 text-left" align="center">
					<div align="center">
					<form action="/cs/rwrite" method="post" enctype="multipart/form-data">
						<table class="table table-striped" style="text-align:center;">
							<tr><td colspan="2"><h2>Report Write</h2></td></tr>
							<tr>
								<th style="background:#464244; color:white;">제목</th>			
								<td><input type="text" style="width: 70%;" name="rtitle"></td>			
							</tr>
							<tr>
								<th style="background:#464244; color:white; width:100;">작성자</th>			
								<td><input type="text" style="width: 70%; border:none; text-align:center;" name="rwriter" value="<%=loginUser.getEmail()%>" readonly></td>
							</tr>
							<tr>
								<th style="background:#464244; color:white; width:100;">신고자</th>			
								<td> <input type="text" style="width: 70%;" name="addreporter"> </td>
							</tr>
							
							<tr align="center"><th style="background:#464244; color:white; width:100;">첨부파일</th>
								<td><input type="file" name="rupfile" style="margin-left:40px;"></td>
							</tr>
							<tr>
								<th style="background:#464244; color:white; width:100;">내 용</th>			
								<td><textarea rows="10" cols="64" name="rcontents"></textarea></td>			
							</tr>
							<tr align="center">
								<td colspan = "2">			<!-- width:60px; height: 40px; -->
									<input type="submit" value="완료" onclick="writeconfirm();" style="width:70px;"> &nbsp; &nbsp; &nbsp;
									<input type = "button" value="이전" onclick = "history.go(-1); return false;" style="width:70px;">
									<!-- <a href="/cs/rlist?page=1">이전으로</a> -->
								</td>
							</tr>
						</table>
						
					</form>
					</div>	
				</div>
			<div class="col-sm-2 sidenav" style="background:white;">
			<%@ include file="../../../resources/include/add.jsp" %>		
			</div>
		</div>	
	</div>	
	
	<!-- login관련 modal  -->	
	
	<!-- footer -->	
	<%@ include file="../../../include/footer.jsp"%>
	
	</body>
</html>
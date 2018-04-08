<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="./noticeError.jsp"%>
<%@ page import="notice.model.vo.Notice,member.model.vo.Member,java.util.*" %>
<!-- Notice객체/Member객체 util임포트 -->

<% 
	 //Member loginUser1 = (Member)session.getAttribute("loginUser");
	/* 로그인한 유저의 정보를 가져온다 = 관리자만 글을 쓸수 있으므로 관리자이다.
	   (관리자)전용 이메일 : pjlee9212@gmail.com */
%>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>게시글 쓰기[관리자]</title>
	<!-- <script type="text/javascript" src="/cs/bootstrap/js/jquery-3.3.1.min.js"></script>
	<link href="/cs/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
	<link href="/cs/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">	 -->
	<script type="text/javascript">
		function insertNotice(){
			location.href="/cs/adminwrite?title="+$("#title").val()+"&contents="+$("#contents").val()+"&nwriter="+$("#nwriter").val();
		}
	</script>
	<style type="text/css">
		table {
			text-align:center;
		}
		body { 
			background:darkgray;
		}
		table tr th {
			background:skyblue;
			text-align:center;
		}
	</style>	
	<%@ include file="../../../resources/include/meta.jsp"%>
	</head>
		<body>
			<!-- header -->
			<%@ include file="../../../resources/include/header.jsp" %>
			<!-- sidenav -->
			<div class="container-fluid text-center">
				<div class="row content">
					<div class="col-sm-2 sidenav">
					<!-- side2 -->
					<%@ include file="../../../resources/include/sidenav.jsp"%>
					</div>
					<!-- main contents -->
					<div class="col-sm-8 text-left" align="center">
					<h2 align="center">NoticeWrite Page</h2>
					<!-- enctype="multipart/form-data" -->
					<form action="/cs/adminwrite" method="post">
						<table width="600" height="400" align="center" border="1">
							<tr align="center">
								<th>제목</th>			
								<td><input type="text" id="title" name="title" size="60"></td>			
							</tr>
							<tr>
								<th>작성자</th>			
								<td><input type="text" readonly id="nwriter" name="nwriter" value="Administrator" readonly></td>
							</tr>
							<!--<tr><th>첨부파일</th>
								<td><input type="file" id="upfile" name="upfile" style="margin-left:40px;"></td>
							</tr> -->
							<tr>
								<th>내 용</th>			
								<td><textarea rows="10" cols="62" id="contents" name="content"></textarea></td>			
							</tr>
							<tr align="center">
								<td colspan = "2">			
									<input type = "button" onclick="insertNotice();" value="글 등록"> &nbsp;
									<input type = "button" value="이전" onclick = "history.go(-1); return false;">
								</td>
							</tr>
						</table>
					</form>
					</div>
					<div class="col-sm-2 sidenav">
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


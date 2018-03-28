<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리 페이지</title>
<%@ include file="../../resources/include/meta.jsp" %>
<style type="text/css">
	th{
		text-align:center;
		width:150px;
	}
	td{
		width:150px;
	}
</style>
</head>
<body>
	<%@ include file="adminHeader.jsp" %>
	
	<!-- sidenav -->
	<div class="container-fluid text-center">
		<div class="row content">
			<%-- <div class="col-sm-2 sidenav"><!-- side2 -->
				<%@ include file="../../resources/include/sidenav.jsp"%>
			</div> --%>
			<!-- main contents -->
			<div class="col-sm-8 text-left">
				<!-- 컨텐츠를 넣으세요 -->
				<h1 align="center" style="margin-left:300px;">회원관리</h1>
				<fieldset align="center" style="margin-left:300px;">
					<legend>일반유저</legend>
					<table border="1" cellspacing="0" align="center">
						<tr><th>이메일</th><th>이름</th><th>전화번호</th><th>등급</th></tr>
						<tr><td>abc@naver.com</td><td>주니</td><td>010-1234-1234</td><td>브론즈</td></tr>
					</table>
				</fieldset>
				<br><br>
				<fieldset align="center" style="margin-left:300px;">
					<legend>판매가능유저</legend>
					<table border="1" cellspacing="0" align="center">
						<tr><th>이메일</th><th>이름</th><th>전화번호</th><th>등급</th></tr>
						<tr><td>dkei@gmail.com</td><td>한진</td><td>010-1234-5234</td><td>골드</td></tr>
					</table>
				</fieldset>
				<br><Br>
				<fieldset align="center" style="margin-left:300px; margin-bottom:50px;">
					<legend>신고받은 횟수 많은 유저</legend>
					<form action="" method="post">
						<table border="1" cellspacing="0" align="center">
							<tr><th>이메일</th><th>이름</th><th>전화번호</th><th>신고받은 횟수</th></tr>
							<tr><td>qwer1234@daum.net</td><td>민규</td><td>010-9383-4241</td><td>3</td></tr>
							<tr><td colspan="4"><input type="submit" value="회원삭제"></td></tr>
						</table>
					</form>
				</fieldset>
				
			</div>
			<%-- <div class="col-sm-2 sidenav">
				<%@ include file="../../resources/include/add.jsp" %>
			</div> --%>
		</div>

	</div>
	
	
	<%@ include file="../../resources/include/login.jsp" %>
	<%@ include file="../../resources/include/footer.jsp" %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 관리</title>
<%@ include file="../../resources/include/meta.jsp" %>
<style type="text/css">
	/* th{
		text-align:center;
		width:500px;
	}
	td{
		width:500px;
	} */
	table th,td{
		text-align:center;
	}
	.title{
		/* text-align:center; */
		width:350px;
	}
	.no, .writer{
		/* text-align:center; */
		width:120px;
	}
	.date{
		width:150px;
	}
	a{
		text-decoration:none;
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
				<h1 align="center" style="margin-left:300px;">게시글관리</h1>
				<fieldset align="center" style="margin-left:300px;">
					<legend>공지사항</legend>
					<table border="1" cellspacing="0" align="center">
						<tr><th class="no">번호</th><th class="title">제목</th><th class="writer">글쓴이</th><th class="date">작성일</th></tr>
						<tr><td class="no">1</td><td class="title"><a href="#">4월3일~4월5일 홈페이지 이용 중단</a></td><td class="writer">병준</td><td class="date">2018/04/01</td></tr>
						<tr>
							<td colspan="4">
								<a href="#">글 추가</a>&nbsp;&nbsp;&nbsp;
								<a href="#">글 삭제</a>&nbsp;&nbsp;&nbsp;
								<a href="#">글 수정</a>
							</td>
						</tr>
					</table>
				</fieldset>
				<br><br>
				<fieldset align="center" style="margin-left:300px;">
					<legend>FAQ</legend>
					<table border="1" cellspacing="0" align="center">
						<tr><th class="no">번호</th><th class="title">제목</th><th class="writer">카테고리</th></tr>
						<tr><td class="no">1</td><td class="title"><a href="#">사고 고장 발생 시 어떻게 하면 되나요?</a></td><td class="writer">자주 찾는 질문</td></tr>
						<tr>
							<td colspan="3">
								<a href="#">글 추가</a>&nbsp;&nbsp;&nbsp;
								<a href="#">글 삭제</a>&nbsp;&nbsp;&nbsp;
								<a href="#">글 수정</a>
							</td>
						</tr>
					</table>
				</fieldset>
				<br><Br>
				<fieldset align="center" style="margin-left:300px; margin-bottom:50px;">
					<legend>불량고객신고</legend>
					<table border="1" cellspacing="0" align="center">
						<tr><th class="no">번호</th><th class="title">제목</th><th class="writer">글쓴이</th><th class="date">작성일</th></tr>
						<tr><td class="no">1</td><td class="title"><a href="#">사기 당했습니다ㅡㅡ</a></td><td class="writer">명재</td><td class="date">2018/04/02</td></tr>
					</table>
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
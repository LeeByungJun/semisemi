<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의완료</title>
<%@ include file="../../resources/include/meta.jsp"%>
</head>
<body>
<!-- header -->
	<%@ include file="../../resources/include/header.jsp"%>

	<!-- sidenav -->
	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-2 sidenav">
				<!-- side2 -->
				<%@ include file="../../resources/include/sidenav.jsp"%>
			</div>
			<!-- main contents -->
			<div class="col-sm-8 text-left">
				<!-- 컨텐츠를 넣으세요 -->
				<h2 align="center" style="margin-top:150px;">성공적으로 문의가 접수되었습니다!</h2><br>
				<h2 align="center">2~3일 내로 이메일로 답변이 발송될 예정입니다...</h2>

			</div>
			<div class="col-sm-2 sidenav">
				<%@ include file="../../resources/include/add.jsp"%>
			</div> 
		</div>

	</div>

	<!-- login 관련 modal -->
	<%@ include file="../../resources/include/login.jsp"%>

	<!-- footer -->
	<%@ include file="../../resources/include/footer.jsp"%>
</body>
</html>
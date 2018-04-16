<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약방법 보기</title>
<%@ include file="../../resources/include/meta.jsp" %>
</head>
<body>
	<%@ include file="../../resources/include/header.jsp" %>
	
	<!-- sidenav -->
	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-2 sidenav" style="width:200px;"><!-- side2 -->
				<%@ include file="../resources/include/sidenav.jsp" %>
			</div>
			<!-- main contents -->
			<div class="col-sm-8 text-left" style="width:860px;">
				<!-- 컨텐츠를 넣으세요 -->
				<img src="../resources/images/렌트설명.jpg" style="width:100%;">
				<img src="../resources/images/단기.jpg" style="width:100%;">
				<hr style="border-color:black;">
				<img src="../resources/images/장기.jpg" style="width:100%;">
				<!-- 장기예약설명 -->
				
			</div>
			<div class="col-sm-2 sidenav" style="width:200px; background:white;">
				<%@ include file="../../resources/include/add.jsp" %>
			</div>
		</div>

	</div>
	
	<%@ include file="../../resources/include/login.jsp" %>
	<%@ include file="../../resources/include/footer.jsp" %>
</body>
</html>
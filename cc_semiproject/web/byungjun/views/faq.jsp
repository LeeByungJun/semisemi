<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 묻는 질문</title>
<%@ include file="../../resources/include/meta.jsp"%>
</style>
</head>
<body>
	<!-- header -->
	<%@ include file="../../resources/include/header.jsp"%>

	<!-- sidenav -->
	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-2 sidenav"><!-- side2 -->
				<%@ include file="../../resources/include/sidenav.jsp"%>
			</div>
			<!-- main contents -->
			<div class="col-sm-8 text-left">
				<!-- 컨텐츠를 넣으세요 -->
				
				
			
			</div>
			<div class="col-sm-2 sidenav">
				<%@ include file="../../resources/include/add.jsp" %>
			</div>
		</div>

	</div>



	<!-- login 관련 modal -->
	<%@ include file="../include/login.jsp"%>

	<!-- footer -->
	<%@ include file="../include/footer.jsp"%>

</body>
</body>
</html>
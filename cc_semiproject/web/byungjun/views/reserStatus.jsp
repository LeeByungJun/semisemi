<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약현황보기</title>
<%@ include file="../../resources/include/meta.jsp"%>

</head>
<body>
	<%@ include file="adminHeader.jsp"%>
	
	<!-- sidenav -->
	<div class="container-fluid text-center">
		<div class="row content">
			<!-- main contents -->
			<div class="col-sm-8 text-left">
				<!-- 컨텐츠를 넣으세요 -->
				<h1 align="center" style="margin-left: 300px;">예약 현황</h1>
				<fieldset>
					<legend>유저 예약 리스트</legend>
				</fieldset>

			</div>
		</div>

	</div>
	
	<%@ include file="../../resources/include/login.jsp"%>
	<%@ include file="../../resources/include/footer.jsp"%>	
</body>
</html>
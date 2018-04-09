<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Reservation</title>
<%@ include file="../include/meta.jsp"%>
</head>
<body>
	<!-- header -->
	<%@ include file="../../resources/include/header.jsp"%>
	<!-- sidenav -->
	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-2 sidenav">
				<!-- side2 -->
				<%@ include file="../include/sidenav.jsp"%>
			</div>
			<!-- main contents -->
			<div class="col-sm-8 text-left">
				<h2>예약 및 이용내역</h2>
				<br>
				<form action="/cs/reservation" method="post">
					<table class="table">
						<tr align="center">
							<th style="text-align:center;">예약번호</th>
							<th style="text-align:center;">대여기간</th>
							<th style="text-align:center;">대여지점</th>
							<th style="text-align:center;">차명</th>
							<th style="text-align:center;">대여금액</th>
							<th style="text-align:center;">결제여부</th>
							<th style="text-align:center;">보험 가입여부</th>
						</tr>
						<tr>
							<td align="center">1</td>
							<td align="center">7일</td>
							<td align="center">테헤란로점</td>
							<td align="center">소나타</td>
							<td align="center">500,000원</td>
							<td align="center">Y</td>
							<td align="center">N</td>
						</tr>
						<tr>
							<td align="center">2</td>
							<td align="center">1일</td>
							<td align="center">강남점</td>
							<td align="center">스타렉스</td>
							<td align="center">100,000원</td>
							<td align="center">N</td>
							<td align="center">Y</td>
						</tr>
					</table>
				</form>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.reservation.model.vo.ReservationView" %>
<% 
	ReservationView rsview = (ReservationView)request.getAttribute("rsview");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
							<th style="text-align:center;">대여일</th>
							<th style="text-align:center;">반납일</th>
							<th style="text-align:center;">대여지점</th>
							<th style="text-align:center;">차명</th>
							<th style="text-align:center;">대여금액</th>
							<th style="text-align:center;">보험 가입여부</th>
						</tr>
						<% if(rsview != null){ %>
						<tr>
							<td align="center"><input style="text-align:center; border:none;" value="<%= rsview.getReser_no() %>"></td>
							<td align="center"><input style="text-align:center; border:none;" value="<%= rsview.getReser_startday() %>"></td>
							<td align="center"><input style="text-align:center; border:none;" value="<%= rsview.getReser_endday() %>"></td>
							<td align="center"><input style="text-align:center; border:none;" value="<%= rsview.getReser_office() %>"></td>
							<td align="center"><input style="text-align:center; border:none;" value="<%= rsview.getReser_car() %>"></td>
							<td align="center"><input style="text-align:center; border:none;" value="<%= rsview.getReser_cash() %>"></td>
							<td align="center"><input style="text-align:center; border:none;" value="<%= rsview.getReser_insurance() %>"></td>
						</tr>
						<% }else{ %>
						<tr>
							<td align="center" colspan="7">예약 내역 없음!!!</td>
							
						</tr>
						<% } %>
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
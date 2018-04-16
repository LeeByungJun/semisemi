<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.reservation.model.vo.ReservationView,java.util.*,member.model.vo.Member"%>
<%
	ArrayList<ReservationView> rsview = (ArrayList<ReservationView>)request.getAttribute("rsview");
	Member member1 = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reservation</title>
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
				<%@ include file="../include/sidenav.jsp"%>
			</div>
			<!-- main contents -->
			<div class="col-sm-8 text-left">
				<i class="fa fa-calendar" style="font-size:36px; float:left; margin-top:15px;"></i><h2>예약 및 이용내역</h2>
				<br>
				<form action="/cs/reservation" method="post">
					<table class="table">
						<tr align="center" style="background:<%= member1.getG_Rank() %>;">
							<th style="text-align: center; width: 60px;">예약번호</th>
							<th style="text-align: center; width: 80px;">대여일</th>
							<th style="text-align: center; width: 80px;">반납일</th>
							<th style="text-align: center; width: 100px;">대여지점</th>
							<th style="text-align: center; width: 100px;">차명</th>
							<th style="text-align: center; width: 80px;">대여금액</th>
							<th style="text-align: center; width: 100px;">보험 가입여부</th>
						</tr>
						<%
							if (rsview != null) {
						%>
						<% for(int i = 0; i < rsview.size(); i++){ %>
						<tr>
							<td align="center">
							<input type="text" style="text-align:center; border:none; width:60px;" value="<%= rsview.get(i).getReser_no() %>" readonly></td>
							<td align="center">
							<input type="text" style="text-align:center; border:none; width:80px;" value="<%= rsview.get(i).getReser_startday() %>" readonly></td>
							<td align="center">
							<input type="text" style="text-align:center; border:none; width:80px;" value="<%= rsview.get(i).getReser_endday() %>" readonly></td>
							<td align="center">
							<input type="text" style="text-align:center; border:none; width:100px;" value="<%= rsview.get(i).getReser_office() %>" readonly></td>
							<td align="center">
							<input type="text" style="text-align:center; border:none; width:100px;" value="<%= rsview.get(i).getReser_car() %>" readonly></td>
							<td align="center">
							<input type="text" style="text-align:center; border:none; width:80px;" value="<%= rsview.get(i).getReser_cash() %>원" readonly></td>
							<td align="center">
							<input type="text" style="text-align:center; border:none; width:100px;" value="<%= rsview.get(i).getReser_insurance() %>" readonly></td>
						</tr>
						<% } %>
						<%
							} else {
						%>
						<tr>
							<td align="center" colspan="7">예약 내역 없음!!!</td>

						</tr>
						<%
							}
						%>
					</table>
				</form>
			</div>
			<div class="col-sm-2 sidenav" style="background: white;">
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
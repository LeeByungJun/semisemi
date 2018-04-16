<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="grade.model.vo.Grade, java.util.*" %>
<% 
	ArrayList<Grade> list= (ArrayList<Grade>)request.getAttribute("grade");
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
				<h2>회원 등급별 혜택</h2>
				<form action="/cs/reservation" method="post">
					<table class="table" align="center" cellspacing="0" border="0">
						<tr>
							<th style="text-align:center;">회원등급</th>
							<th><input style="text-align:center; border:none; color:gold;" value="<%= list.get(0).getG_rank() %>" readonly></th>
							<th><input style="text-align:center; border:none; color:silver;" value="<%= list.get(1).getG_rank() %>" readonly></th>
							<th><input style="text-align:center; border:none; color:brown;" value="<%= list.get(2).getG_rank() %>" readonly></th>
							<th><input style="text-align:center; border:none;" value="<%= list.get(3).getG_rank() %>" readonly></th>
						</tr>
						<tr>
							<td align="center">등급별 할인율</td>
							<td><input style="text-align:center; border:none;" value="<%= list.get(0).getG_rate() %>%" readonly></td>
							<td><input style="text-align:center; border:none;" value="<%= list.get(1).getG_rate() %>%" readonly></td>
							<td><input style="text-align:center; border:none;" value="<%= list.get(2).getG_rate() %>%" readonly></td>
							<td><input style="text-align:center; border:none;" value="<%= list.get(3).getG_rate() %>%" readonly></td>
						</tr>
						<!-- <tr>
							<td align="center">제공 이벤트</td>
							<td align="center">평일, 주말 영화 예매권 4매</td>
							<td align="center">평일, 주말 영화 예매권 2매</td>
							<td align="center">평일 영화 예매권 2매</td>
							<td align="center">-</td>
						</tr> -->
					</table><br>
					<h2>회원 등급 선정 기준</h2>
					<table class="table">
						<tr>
							<th style="text-align:center;"><input style="text-align:center; border:none; color:gold;" value="<%= list.get(0).getG_rank() %>" readonly></th>
							<th style="text-align:center;"><input style="text-align:center; border:none; color:silver;" value="<%= list.get(1).getG_rank() %>" readonly></th>
						</tr>
						<tr>
							<td align="center">
							<input style="text-align:center; width:400px; height:300; border:none; margin:5px;" value="<%= list.get(0).getG_comment() %>" readonly>
							<input style="text-align:center; width:400px; height:300; border:none; margin:5px;" value="<%= list.get(0).getG_comment2() %>" readonly>
							<br><br></td>
							<td align="center">
							<input style="text-align:center; width:400px; height:300; border:none; margin:5px;" value="<%= list.get(1).getG_comment() %>" readonly>
							<input style="text-align:center; width:400px; height:300; border:none; margin:5px;" value="<%= list.get(1).getG_comment2() %>" readonly>
							<br><br></td>
						</tr>
						<tr>
							<th style="text-align:center;"><input style="text-align:center; border:none; color:brown;" value="<%= list.get(2).getG_rank() %>" readonly></th>
							<th style="text-align:center;"><input style="text-align:center; border:none; color:black" value="<%= list.get(3).getG_rank() %>" readonly></th>
						</tr>
						<tr>
							<td align="center">
							<input style="text-align:center; width:400px; height:300; border:none; margin:5px;" value="<%= list.get(2).getG_comment() %>" readonly>
							<input style="text-align:center; width:400px; height:300; border:none; margin:5px;" value="<%= list.get(2).getG_comment2() %>" readonly>
							<br><br></td>
							<td align="center">
							<input style="text-align:center; width:400px; height:300; border:none; margin:5px;" value="<%= list.get(3).getG_comment() %>" readonly>
							<input style="text-align:center; width:400px; height:300; border:none; margin:5px;" value="<%= list.get(3).getG_comment2() %>" readonly>
							<br><br></td>
						</tr>
					</table>
				</form>
			</div>
			
		</div>
	</div>
	<!-- login 관련 modal -->
	<%@ include file="../../resources/include/login.jsp"%>

	<!-- footer -->
	<%@ include file="../../resources/include/footer.jsp"%>
</body>
</html>
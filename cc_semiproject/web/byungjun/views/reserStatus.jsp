<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="admin.reservation.model.vo.ReservationList,java.util.*" %>
<%
	ArrayList<ReservationList> list = (ArrayList<ReservationList>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약현황보기</title>
<%@ include file="../../resources/include/meta.jsp"%>
<style type="text/css">
	th,td{
		text-align:center;
	}
	.size1{
		width:90px;
	}
	.size2{
		width:150px;
	}
	#gold{
		color:gold;
	}
	#silver{
		color:silver;
	}
	#bronze{
		color:brown;
	}
</style>
</head>
<body>
	<%@ include file="adminHeader.jsp"%>
	
	<!-- sidenav -->
	<div class="container-fluid text-center">
		<div class="row content">
			<!-- main contents -->
			<div class="col-sm-8 text-left">
				<!-- 컨텐츠를 넣으세요 -->
				<h1 style="margin-left: 100px;">등급별 예약 현황</h1>
				<fieldset>
					<legend id="gold">골드</legend>
					<table border="1" cellspacing="0">
						<tr><th class="size1">이름</th><th class="size2">이메일</th><th class="size1">차 이름</th><th class="size2">예약 시작일</th><th class="size2">예약 종료일</th><th class="size1">등급</th></tr>
						
						<% for(int i=0;i<list.size();i++){ %>
							<% if(list.get(i).getG_rank().equals("GOLD")){ %>
							<tr>
								<td class="size1"><%= list.get(i).getName() %></td>
								<td class="size2"><%= list.get(i).getEmail() %></td>
								<td class="size1"><%= list.get(i).getCarname() %></td>
								<td class="size2"><%= list.get(i).getCarstartdate() %></td>
								<td class="size2"><%= list.get(i).getCarenddate() %></td>
								<td class="size1"><%= list.get(i).getG_rank() %></td>
							</tr>
						<% }} %>
					</table>
				</fieldset>
				<br>
				<fieldset>
					<legend id="silver">실버</legend>
					<table border="1" cellspacing="0">
						<tr><th class="size1">이름</th><th class="size2">이메일</th><th class="size1">차 이름</th><th class="size2">예약 시작일</th><th class="size2">예약 종료일</th><th class="size1">등급</th></tr>
						<% for(int i=0;i<list.size();i++){ %>
							<% if(list.get(i).getG_rank().equals("SILVER")){ %>
							<tr>
								<td class="size1"><%= list.get(i).getName() %></td>
								<td class="size2"><%= list.get(i).getEmail() %></td>
								<td class="size1"><%= list.get(i).getCarname() %></td>
								<td class="size2"><%= list.get(i).getCarstartdate() %></td>
								<td class="size2"><%= list.get(i).getCarenddate() %></td>
								<td class="size1"><%= list.get(i).getG_rank() %></td>
							</tr>
						<% }} %>
						
					</table>
				</fieldset>
				<br>
				<fieldset>
					<legend id="bronze">브론즈</legend>
					<table border="1" cellspacing="0">
						<tr><th class="size1">이름</th><th class="size2">이메일</th><th class="size1">차 이름</th><th class="size2">예약 시작일</th><th class="size2">예약 종료일</th><th class="size1">등급</th></tr>
						<% for(int i=0;i<list.size();i++){ %>
							<% if(list.get(i).getG_rank().equals("BRONZE")){ %>
							<tr>
								<td class="size1"><%= list.get(i).getName() %></td>
								<td class="size2"><%= list.get(i).getEmail() %></td>
								<td class="size1"><%= list.get(i).getCarname() %></td>
								<td class="size2"><%= list.get(i).getCarstartdate() %></td>
								<td class="size2"><%= list.get(i).getCarenddate() %></td>
								<td class="size1"><%= list.get(i).getG_rank() %></td>
							</tr>
						<% }} %>
						
					</table>
				</fieldset>
				<br>
				<fieldset>
					<legend>일반</legend>
					<table border="1" cellspacing="0">
						<tr><th class="size1">이름</th><th class="size2">이메일</th><th class="size1">차 이름</th><th class="size2">예약 시작일</th><th class="size2">예약 종료일</th><th class="size1">등급</th></tr>
						<% for(int i=0;i<list.size();i++){ %>
							<% if(list.get(i).getG_rank().equals("BASIC")){ %>
							<tr>
								<td class="size1"><%= list.get(i).getName() %></td>
								<td class="size2"><%= list.get(i).getEmail() %></td>
								<td class="size1"><%= list.get(i).getCarname() %></td>
								<td class="size2"><%= list.get(i).getCarstartdate() %></td>
								<td class="size2"><%= list.get(i).getCarenddate() %></td>
								<td class="size1"><%= list.get(i).getG_rank() %></td>
							</tr>
						<% }} %>
						
					</table>
				</fieldset>
				<br><br><Br><br>
			</div>
		</div>

	</div>
	
	<%@ include file="../../resources/include/login.jsp"%>
	<%@ include file="../../resources/include/footer.jsp"%>	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, visit.model.vo.Visit" %>
<% 
	int todayVisit = ((Integer)session.getAttribute("todayVisit")).intValue(); 
	//int todayReservation = ((Integer)session.getAttribute("todayReservation")).intValue();

	ArrayList<Visit> totalVisit = (ArrayList<Visit>)session.getAttribute("totalVisit"); 
	ArrayList<Visit> totalReservationCount = (ArrayList<Visit>)session.getAttribute("totalReservationCount"); 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통계</title>
<%@ include file="../../resources/include/meta.jsp"%>
<!-- 차트용 스타일시트 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.css"/>

</head>
<body>
	<%@ include file="adminHeader.jsp"%>
	
	<!-- 차트용 스크립트 -->
	<script src="https://d3js.org/d3.v3.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.js"></script>

	<!-- sidenav -->
	<div class="container-fluid text-center">
		<div class="row content">
			<%-- <div class="col-sm-2 sidenav"><!-- side2 -->
				<%@ include file="../../resources/include/sidenav.jsp"%>
			</div> --%>
			<!-- main contents -->
			<div class="col-sm-8 text-left">
				<!-- 컨텐츠를 넣으세요 -->
				<h1 align="center" style="margin-left: 300px;">통계 페이지</h1>
				<br>
				<h4 align="center" style="margin-left: 300px; color:#329632;">일일 방문자 수</h4>
				<div id="areachart"
					style="width: 70%; height: 300px; margin-left:270px;"></div>
				<br><br>
				<h4 align="center" style="margin-left: 300px; color:#CD1039;">일일 예약 횟수</h4>
				<div id="areachart1" align="center"
					style="width: 70%; height: 300px; margin-left:270px;"></div>
				<script>
				
				<%-- <% for(Visit v:totalVisit){ %> --%>
				<%-- <% if(i == totalVisit.size()){ %>
					<%= totalVisit.get(i).getVisitDate() %>
				<% }else{ %> --%>
					<%-- <%= v.getVisitDate() %>, --%>
					/* new java.util.Date() */
				<%-- <% } %> --%>
				<%-- <% } %>  --%>
				<%-- date1 = <%= totalVisit.get(0).getVisitDate() %>;
				date2 = <%= totalVisit.get(1).getVisitDate() %>; --%>
				
					var areachart = c3.generate({
						bindto : "#areachart",
						/* data : {
							columns : [ 
									[ '총 접속자 수', 300, 350, 300, 190, 50, 25 ],
									[ '로그인한 유저 수', 130, 100, 140, 200, 150, 50 ] 
							]
							
						} */
						data : {
							x : 'x',
							columns : [
									[ 'x', 
										<% for(Visit v:totalVisit){ %>
										<%-- <% if(i == totalVisit.size()){ %>
											<%= totalVisit.get(i).getVisitDate() %>
										<% }else{ %> --%>
											<%= "'" + v.getVisitDate() + "'" %>, 
											/* new java.util.Date() */
										<% } %>
										<%-- <% } %>  --%>
										
									],
									[ '방문자 수', 
										<% for(int i=0;i<totalVisit.size();i++){ %>
											<%-- <% if(i == totalVisit.size()){ %>
												<%= totalVisit.get(i).getVisitCount() %>
											<% }else{ %> --%>
												<%= totalVisit.get(i).getVisitCount() %>,
											<%-- <% } %> --%>
										<% } %>
									] 
								],
							type : 'line',
							colors : {
								'방문자 수' : '#329632' //C12
							}
						},
					  axis : {
							x : {
								type : 'timeseries',
								tick : {
									format : '%y-%m-%d' //%H:%M:%S
								}
							}
						} 
					});

					var areachart1 = c3.generate({
						bindto : "#areachart1",
						/* data : {
							columns : [ 
									[ '총 접속자 수', 300, 350, 300, 190, 50, 25 ],
									[ '로그인한 유저 수', 130, 100, 140, 200, 150, 50 ] 
							]
							
						}  */
						data : {
							x : 'x',
							columns : [
									[ 'x', 
										<% for(Visit v:totalReservationCount){ %>
											<%= "'" + v.getVisitDate() + "'" %>, 
											/* new java.util.Date() */
										<% } %>
									],
									[ '예약 횟수', 
										<% for(int i=0;i<totalReservationCount.size();i++){ %>
											<%= totalReservationCount.get(i).getVisitCount() %>,
										<% } %>	
									] 
							],
							type : 'line',
							colors : {
								'x' : '#B0F7FF',
								'예약 횟수': "#CD1039"
							}/* 데이터 */
						},
						axis : {
							x : {
								type : 'timeseries',
								tick : {
									format : '%y-%m-%d' //%H:%M:%S
								}
							}
						}
					});
				</script>

			</div>
			<br>
			<%-- 오늘 예약횟수 : 
			<% for(Visit v:totalReservationCount){ %>
				<%= v.getVisitDate() %><br>
				<%= v.getVisitCount() %><br>
			<% } %>
			<br>
			총 방문자수 :
			<% for(Visit v:totalVisit){ %>
				<%= v.getVisitDate() %><br>
				<%= v.getVisitCount() %>
			<% } %>
			<br><br> --%>
			<%-- <div class="col-sm-2 sidenav">
				<%@ include file="../../resources/include/add.jsp" %>
			</div> --%>
		</div>

	</div>


	<%@ include file="../../resources/include/login.jsp"%>
	<%@ include file="../../resources/include/footer.jsp"%>
</body>
</html>
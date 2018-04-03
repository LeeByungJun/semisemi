<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<h4 align="center" style="margin-left: 300px;">일일 방문자 수</h4>
				<div id="areachart"
					style="width: 70%; height: 300px; margin-left:270px;"></div>
				<h4 align="center" style="margin-left: 300px;">일일 예약 횟수</h4>
				<div id="areachart1" align="center"
					style="width: 70%; height: 300px; margin-left:270px;"></div>
				<script>
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
									[ 'x', '2018-04-03', '2018-04-04',
											'2018-04-05', '2018-04-06',
											'2018-04-07', '2018-04-08' ],
									[ '방문자 수', 31, 48, 22, 77, 62, 11 ] ],
							type : 'line',
							colors : {
								'데이터' : '#F39C12'
							}
						},
						axis : {
							x : {
								type : 'timeseries',
								tick : {
									format : '%Y-%m-%d' /* %H:%M:%S */
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
							
						} */
						data : {
							x : 'x',
							columns : [
									[ 'x', '2018-04-03', '2018-04-04',
											'2018-04-05', '2018-04-06',
											'2018-04-07', '2018-04-08' ],
									[ '예약 횟수', 7, 19, 21, 38, 12, 47 ] ],
							type : 'line',
							colors : {
								'데이터' : '#FF0000'
							}
						},
						axis : {
							x : {
								type : 'timeseries',
								tick : {
									format : '%Y-%m-%d' /* %H:%M:%S */
								}
							}
						}
					});
				</script>

			</div>
			<%-- <div class="col-sm-2 sidenav">
				<%@ include file="../../resources/include/add.jsp" %>
			</div> --%>
		</div>

	</div>


	<%@ include file="../../resources/include/login.jsp"%>
	<%@ include file="../../resources/include/footer.jsp"%>
</body>
</html>
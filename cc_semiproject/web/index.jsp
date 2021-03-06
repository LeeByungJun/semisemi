<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="visit.model.vo.Visit,java.util.*,notice.model.vo.Notice" %>
<%-- <%@ page import="org.apache.log4j.*"%> --%>
<%-- <%!Logger logger = Logger.getLogger("order.jsp");%> --%>
<% 
	ArrayList<Visit> totalReservationCount = (ArrayList<Visit>)request.getAttribute("totalReservationCount");
	/* if(totalReservationCount == null){
		response.sendRedirect("/cs/makechart");
	}else{
		response.sendRedirect("/cs/index.jsp");
	} */
	//ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<title>C&C 렌터카</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="resources/include/meta.jsp"%>
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- 차트용 스타일시트 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.css" />

<style>
/* Remove the navbar's default margin-bottom and rounded borders */
/* .navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 450px
}

/* Set gray background color and 100% height */
.sidenav {
	padding-top: 20px;
	background-color: #f1f1f1;
	height: 100%;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
	margin-top: 0px;
}

#menu {
	height: 30px;
}

#utilMenu>ul {
	text-align: right;
	margin-left: 900px;
}

#utilMenu>ul li {
	list-style: none;
	float: left;
}

#utilMenu>ul li a {
	text-decoration: none;
	margin-right: 10px;
	font-size: 8pt;
}

.carousel-inner img {
	-webkit-filter: grayscale(90%);
	filter: grayscale(90%); /* make all photos black and white */
	width: 100%; /* Set width to 100% */
	margin: auto;
}

.carousel-caption h3 {
	color: #fff !important;
}

#imageslide {
	width: 100%;
	margin-top: 20px;
}

@media ( max-width : 600px) {
	.carousel-caption {
		display: none;
		/* Hide the carousel text when the screen is less than 600 pixels wide */
	}
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}

/* 로그인 모달폼 */
@import url(http://fonts.googleapis.com/css?family=Roboto);

* {
	font-family: 'Roboto', sans-serif;
}

#login-modal .modal-dialog {
	width: 350px;
}

#login-modal input[type=text], input[type=password] {
	margin-top: 10px;
}

#div-login-msg, #div-lost-msg, #div-register-msg {
	border: 1px solid #dadfe1;
	height: 30px;
	line-height: 28px;
	transition: all ease-in-out 500ms;
}

#div-login-msg.success, #div-lost-msg.success, #div-register-msg.success
	{
	border: 1px solid #68c3a3;
	background-color: #c8f7c5;
}

#div-login-msg.error, #div-lost-msg.error, #div-register-msg.error {
	border: 1px solid #eb575b;
	background-color: #ffcad1;
}

#icon-login-msg, #icon-lost-msg, #icon-register-msg {
	width: 30px;
	float: left;
	line-height: 28px;
	text-align: center;
	background-color: #dadfe1;
	margin-right: 5px;
	transition: all ease-in-out 500ms;
}

#icon-login-msg.success, #icon-lost-msg.success, #icon-register-msg.success
	{
	background-color: #68c3a3 !important;
}

#icon-login-msg.error, #icon-lost-msg.error, #icon-register-msg.error {
	background-color: #eb575b !important;
}

#img_logo {
	max-height: 100px;
	max-width: 100px;
}

.btn-primary {
	background-color: black;
}

.btn-primary:hover {
	background-color: white;
	color: black;
}

/* #########################################
   #    override the bootstrap configs     #
   ######################################### */
.modal-backdrop.in {
	filter: alpha(opacity = 50);
	opacity: .8;
}

.modal-content {
	background-color: #ececec;
	border: 1px solid #bdc3c7;
	border-radius: 0px;
	outline: 0;
}

.modal-header {
	min-height: 16.43px;
	padding: 15px 15px 15px 15px;
	border-bottom: 0px;
}

.modal-body {
	position: relative;
	padding: 5px 15px 5px 15px;
}

.modal-footer {
	padding: 15px 15px 15px 15px;
	text-align: left;
	border-top: 0px;
}

.checkbox {
	margin-bottom: 0px;
}

.btn {
	border-radius: 0px;
}

.btn:focus, .btn:active:focus, .btn.active:focus, .btn.focus, .btn:active.focus,
	.btn.active.focus {
	outline: none;
}

.btn-lg, .btn-group-lg>.btn {
	border-radius: 0px;
}

.btn-link {
	padding: 5px 10px 0px 0px;
	color: #95a5a6;
}

.btn-link:hover, .btn-link:focus {
	color: #2c3e50;
	text-decoration: none;
}

.glyphicon {
	top: 0px;
}

.form-control {
	border-radius: 0px;
} */

#divMain {
	
}
</style>
<script src="https://d3js.org/d3.v3.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.js"></script>
<script>

	$(function(){
		<% if(totalReservationCount == null){ %>
			location.href="/cs/makechart";
		<% } %>
		
		$.ajax({      
	         url : "/cs/notop5",
	         type : "post",
	         datatype : "json",
	         success : function(data) {
	            //alert("추가가 완료되었습니다.");
	            
	            var jsonStr = JSON.stringify(data);
	            //1.Json객체 하나(data)를 문자열 형태로바꿈
	            var json = JSON.parse(jsonStr);
	            //2.변형된 문자열을 JavaScript가 사용할 수 있는 json객체로 parsing(파싱)
	            var values = "";            
	            
	            for(var i in json.list){ //in실종
	                values+="<tr><td>"+json.list[i].n_no+"</td><td><a href='/cs/ndetail?no="+json.list[i].n_no+"&page=1' style='text-decoration:none; color:black;'>"+json.list[i].n_title+"</td></tr>";   
	            } 
	            
	            
	            $('#nt5').append(values); /* #버리지마세용  appand (x) -> append(0)*/
	         },
	         error : function(a,b,c){
	            /* alert(a +" "+b+" "+c); */
	         }
	      }); 
		<%-- <% if(list == null){ %>
		location.href="/cs/notop5";
		<% } %> --%>
		<%-- date = new Array();
		count = new Array();
		
		$.ajax({
			url:"/cs/makechart",
			dataType:"JSON",
			success:function(nunu){
				var jsonStr = JSON.stringify(nunu);
				var json = JSON.parse(jsonStr);
				
				for(var i in json.list){
					date[i] = json.list[i].visitdate;
					count[i] = json.list[i].visitcount;
					console.log("for문아");
					console.log(date[i]);
					console.log("멈추지마라");
					
				}
				
				
				console.log("요기는 for문 밖");
				console.log(date[1]);
				
				
			},
			error:function(a,b,c){
				alert(a + ", " + b + ", " + c);
			}
		}); --%>
		
		
	});
	
</script>
</head>
<body>
<%@ include file="resources/include/header.jsp"%>
	<!-- 차트용 스크립트 -->
	<!-- <script src="https://d3js.org/d3.v3.min.js"></script> -->
	<!-- <script
		src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.js"></script> -->
<% if(totalReservationCount != null){ %>
	<!-- <script type="text/javascript">
		alert("null이 아니라능");
	</script> -->
	
	<div class="row content" id="divMain">
		<div class="col-sm-8 text-left" id="imageslide">
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
					<li data-target="#myCarousel" data-slide-to="3"></li>
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<img src="images/car4.jpg" alt="New York">
					</div>

					<div class="item">
						<img src="images/car2.jpg" alt="Chicago">
					</div>

					<div class="item">
						<img src="images/car3.jpg" alt="Los Angeles">
					</div>

					<div class="item">
						<img src="images/car5.jpg" alt="Los Angeles">
					</div>
				</div>

				<!-- Left and right controls -->
				<a class="left carousel-control" href="#myCarousel" role="button"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel" role="button"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>
	</div>
	<div style="width: 100%; height: 380px; margin-top: 120px;">
		<table style="text-align: center; background: #d2d2d2; width: 100%;">
			<tr>
				<td style="width: 48%;">
					<!-- 공지사항 top5가 들어갈 곳 -->
					<fieldset>
						<legend>공지사항 Top5</legend>
						<table id="nt5" class="table" style="text-align:center; border-color: black;">
							<tr><td>글 번호</td><td>제목</td></tr>
						</table>
					</fieldset>
				</td>
				<td style="width: 48%;">
					<fieldset>
						<legend>일일 예약 횟수</legend>
						<div id="areachart1" align="center"
							style="width: 100%; height: 300px;"></div>
						<script>
							var areachart1 = c3.generate({
								bindto : "#areachart1",
								data : {
									x : 'x',
									columns : [
											[ 'x',
												<%for (Visit v : totalReservationCount) {%>
													<%="'" + v.getVisitDate() + "'"%>, 
													/* new java.util.Date() */
												<%}%>
											],
											[ '예약 횟수', 
												<%for (int i = 0; i < totalReservationCount.size(); i++) {%>
													<%=totalReservationCount.get(i).getVisitCount()%>,
												<%}%>
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
					</fieldset> <!-- 최근 5일 간의 예약 이용 수 차트가 들어갈 곳 -->
				</td>
			</tr>
		</table>
	</div>
	<% }else{ %>
		<script type="text/javascript">
			/* alert("차트만들고시포요"); */
			location.href="/cs/makechart";
		</script>
	<% } %>
	<%@ include file="resources/include/login.jsp"%>
	<%@ include file="resources/include/footer.jsp"%>
</body>
</html>
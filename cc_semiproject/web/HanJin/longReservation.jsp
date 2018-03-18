<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>longReservation</title>
<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">

</script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />
<script>
$(function() { 
	  $("#datepicker1").datepicker({
		dateFormat: 'yy'+'년'+'mm'+'월'+'dd'+'일',
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	     dayNamesMin: ['일','월','화','수','목','금','토'],
		 changeMonth: true, //월변경가능
	     changeYear: true, //년변경가능
		 showMonthAfterYear: true, //년 뒤에 월 표시
	  });
	 });
$(function() { 
	  $("#datepicker2").datepicker({
		dateFormat: 'yy'+'년'+'mm'+'월'+'dd'+'일',
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	     dayNamesMin: ['일','월','화','수','목','금','토'],
		 changeMonth: true, //월변경가능
	     changeYear: true, //년변경가능
		 showMonthAfterYear: true, //년 뒤에 월 표시
	  });
	 });
 
</script>

<style>
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
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
	margin-top: 120px;
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

</style>
</head>
<body>
	<%@ include file="../resources/include/header.jsp" %>
	<!-- <nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a href="index.jsp"><img src="images/C&C Logo.jpg" alt="Logo"
					width="120" height="50"></a>
				class="navbar-brand"
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="views/Hanjin/shortReservation.jsp">단기렌트</a></li>
					class="active"
					<li><a href="views/Hanjin/longReservation.jsp">장기렌트</a></li>
					<li><a href="#">P2P</a></li>
					<li><a href="#">고객센터</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#" role="button" data-toggle="modal"
						data-target="#login-modal"><span
							class="glyphicon glyphicon-log-in"></span> Login</a></li>
					<li><a href="#" role="button"><span
							class="glyphicon glyphicon-log-in"></span> 마이페이지</a></li>
				</ul>
			</div>
		</div>
	</nav> -->


	<div class="container-fluid text-center">
	<div class="row content"> 
		<div class="col-sm-2 sidenav">
				<p>
					<a href="insuranceReservation.jsp">보험약관</a>
				</p>
				
				<p>
					<a href="noMemberReservation.jsp">비회원 예약</a>
				</p>
				<p>
					<a href="shortReservation.jsp">단기 예약</a>
				</p>
				<p>
					<a href="longReservation.jsp">장기 예약</a>
				</p>
		</div>
		<div class="col-sm-8 text-left">
			<h1>장기 예약</h1>
				<p>
				<h4>기간 선택</h4> <br>
				단기렌터카대여일은 현재일로부터 60일 이내에만 가능합니다.<br> 
				(단, 인천공항점은 90일까지 가능) <br>
				대여시간이 24시간 이상인 경우에만 할인이 적용됩니다.<br>

				<br>
				<h4>차량선택</h4> <br>
				차량 선택 차량 선택 시, 일반예약(차종 지정)과 알뜰카(차량 유형만 지정)<br>
				일반예약은 회원/비회원, 알뜰카는 회원만 예약 가능합니다.<br>
				알뜰카는 해당지점의 상황에 따라 예약 및 대여가 불가능할 수 있습니다.<br>
				</p>
				<hr>
				<h3>예약 하기</h3>				
				<section style="text-align:left">
					<h3 align="center">장기 예약 하기</h3>
					
					<br>
					<!-- <form action="../../minsert"> 상대경로 -->
					<form action="/first/minsert" method="post"><!--절대경로  -->
					<table width="650" align="center">					
					<tr height="40">
						<th width="150">*이 름</th>
						<td><input type="text" name="username" required></td>
					</tr>
					<tr height="40">
						<th width="150">등급</th>
						<td><input type="text" name="grade"></td>
					</tr>
										
					<tr height="40">
						<th width="150">전화번호</th>
						<td><input type="tel" name="phone"></td>
					</tr>
					<tr height="40">
						<th width="150">대여일자</th>
						<td >
							<p>
  							 <input type="text" id="datepicker1" />
 							</p>
						</td>
					</tr>
					<tr height="40">
						<th width="150">반납일자</th>
						<td>
							 <p>
  							 <input type="text" id="datepicker2" />
 							</p>
						</td>
					</tr>
					<tr height="40">
						<th width="150">차종선택</th>
						<td>
							<select>
								<option>차종</option>
								<option>소형</option>
								<option>중형</option>
								<option>대형</option>
							</select>
							<select>
								<option>차량선택</option>
								<option>??</option>
								<option>??</option>
								<option>??</option>
							</select>
						</td>
					</tr>
					<tr height="40">
						<th width="150">보험선택</th>
						<td>
							<select>
								<option>장기보험선택</option>
								<option>????</option>
								<option>????</option>
								<option>선택안함</option>
							</select>							
						</td>
					</tr>
					
					<tr height="40">
						<th width="150">특이사항</th>
						<td>
							<textarea name="etc" rows="3" cols="30">
							</textarea>	
						</td>
					</tr>
					<tr height="40" align="right">
						<th width="150" colspan="2">
							<input type="submit" value="대여하기"> &nbsp;
							<input type="reset" value="작성취소"> &nbsp;							
						</th>
					</tr>
					</table>
					
					</form>
				</section>
			</div>
		</div>
	</div>
	<%@ include file="../resources/include/login.jsp" %>
	<%@ include file="../resources/include/footer.jsp" %>
	<!-- <footer class="container-fluid text-center">
		<p>
			상호명 : C&C 렌터카 대표자 : 홍길동 주소 : 서울시 강남구 역삼동 대표자 전화번호 : 02-1234-1234<br>
			여기엔 무엇을 써야 하는가?
		</p>
	</footer> -->
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>reservation_1</title>
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
					<li><a href="shortReservation.jsp">단기렌트</a></li>
					class="active"
					<li><a href="longReservation.jsp">장기렌트</a></li>
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
			<h1>비회원 단기 예약</h1>
				<p>
				C&C렌터카는 국내 최대 규모의 네트워크로 한 걸음 더 앞서갑니다.<br>
				<br>
				전국 180여개 영업망과 55,000여대의 최신 차량 보유, 국내 최대 규모의 차량 선택 폭(수입차 및 LPG차량), 230여 정비네트워크의 편리한 사고, 
				고장 처리 및 무상 대차 서비스 제공, 제주도 내 렌터카 1위, 최신 차량 2,000여대 보유, 다양한 파트너십을 통한 결합 상품 및 판매 채널 확대<br>
				<br>
				<br>
				국내 최고의 선진화 된 렌터카 시스템으로 고객만족 서비스를 제공합니다.<br>
				
				Fresh Driving Campaign을 실시해 상쾌한 금연차량을 제공합니다.<br>
				더욱 빠르고 편리해진 Express 대여시스템(선결제 고객)으로 고객편의를 제공합니다. <br>
				홈페이지·모바일·컨택센터·제휴채널 등 언제 어디서나 편리한 예약시스템을 제공합니다.<br>
				차량관리시스템(FMS)을 통한 신속하고 투명한 장기렌탈서비스를 제공합니다.<br>
				
				
				C&C렌터카는 Total 자동차 서비스 전문브랜드입니다.<br>
				
				중고차 매입/판매/공매 및 차량정비 서비스 차량이동관련 물류사업,<br>
				주차장 운영, Maintenance Lease를 주력으로 하는 캐피탈 사업 운영자동차 Total 업체로서의 시너지 효과 창출<br>
				</p>
				<hr>
				<h3>예약 하기</h3>				
				<section style="text-align:left">
					<h3 align="center">비회원 단기예약 하기</h3>
					
					<br>
					<!-- <form action="../../minsert"> 상대경로 -->
					<form action="/first/minsert" method="post"><!--절대경로  -->
					<table width="650" align="center">					
					<tr height="40">
						<th width="150">*이 름</th>
						<td><input type="text" name="username" required></td>
					</tr>
					<tr height="40">
						<th width="150">*식별번호</th>
						<td><input type="text" name="nomember" id="nomember1" required></td>
					<tr height="40">
					   <th width="150">*식별번호확인</th>
					   <td><input type="text" id="nomember2" onblur="checkPwd();"></td>
					</tr>
						<th width="150">성 별 </th>
						<td>
						<input type="radio" name="gender" value="M">남 &nbsp;
						<input type="radio" name="gender" value="F">여 
						
						</td>
					</tr>
					<tr height="40">
						<th width="150">나 이</th>
						<td><input type="number" name="age"min="20"max="100"></td>
					</tr><tr height="40">
						<th width="150">이메일</th>
						<td><input type="email" name="email"></td>
					</tr><tr height="40">
						<th width="150">전화번호</th>
						<td><input type="tel" name="phone"></td>
					</tr><tr height="40">
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
								<option>비회원보험선택</option>
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
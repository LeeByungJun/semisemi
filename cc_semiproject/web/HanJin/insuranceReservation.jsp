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
		<div class="section01" align="left">
					<h5>보험보상 및 자차손해면책 제도</h5>
					<p class="rentGuide02_txt">AJ회원님께서 자차면책제도에 가입하는 경우 , 내륙지역 예약시 자차면책제도 금액의 20%를 할인해 드립니다.<br />
					전차량이 자동차종합보험(대인,대물,자손)에 가입되어있으며, 등록하신 제2운전자까지 보험대상에 포함됩니다.<br />
					대인 : 무한대   /   자손 : 인당 15,000,000원 까지    /   대물 : 건당 20,000,000원 까지<br />
					<span>(단, 계약서상 등록되지 않은 운전자의 경우, 종합보험 및 자차손해면책제도의 보험혜택을 받으실 수 없습니다.)</span> <br />
					자차손해면책제도 : 운전자의 과실에 의한 대여차량 손해는 임차인의 책임이나, 본 제도에 가입함으로써 보상 받으실 수 있습니다. <br />
					<span class="last">(단, 면책금은 고객 부담입니다. / 면책금 : 고객 부담 최상한도 금액)</span></p>
				</div>

				<h6 align="left">면책금 종류 </h6>

				<!-- S:table //-->
				<div class="tbl02" align="left">
					<table summary="지역, 국산차량, 외국차량에 다른 면책금 정보 제공">
						<caption>면책금 종류</caption>
						<colgroup>
							<col width="33%" />
							<col width="34%" />
							<col width="33%" />
						</colgroup>
						<thead>
							<tr>
								<th>지역</th>
								<th>국산 차량</th>
								<th>외산 차량</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>내륙</td>
								<td>30만원, 10만원, 5만원</td>
								<td>30만원</td>
							</tr>
							<tr>
								<td>제주</td>
								<td>5만원, 완전면책</td>
								<td>30만원(단일 면책금 제도 운영)</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!--// E:table -->

				<p class="rentGuide02_txt mt15" align="left">자차손해면책제도는 1일 단위로 운영되오니 이용에 참고해 주시기 바랍니다.<br />
				<span>(예시 : 1일 1시간 이용 시 2일 요금 부과됨)</span><br />
				휴차 보상 : 자차손해면책제도 가입 유무와 관계없이 사고로 인하여 차량이 휴차할 경우에는 차량 운영의 차질로 인하여 발생한 수리기간동안 대여차량 <br />
				정상요금의 50%에 해당하는 휴차보상료가 청구되며, 이는 임차인이 배상하여야 합니다. <br />
				보험보상과 관련하여 임대차 계약서 뒷면 약관 내용을 숙지하시기 바랍니다.</p>
		
		
		
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
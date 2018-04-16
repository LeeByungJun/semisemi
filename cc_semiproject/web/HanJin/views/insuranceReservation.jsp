<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>보험약관</title>
<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="../../resources/include/meta.jsp" %>
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

.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

.row.content {
	height: 450px
}

.sidenav {
	padding-top: 20px;
	background-color: #f1f1f1;
	height: 100%;
}


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
	filter: grayscale(90%); 
	width: 100%; 
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
	}
}


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
	<%@ include file="../../resources/include/header.jsp" %>
	
	<div class="container-fluid text-center" style="overflow:hidden;">
		<div class="row content">
			<div class="col-sm-2 sidenav" style="width:200px;"><!-- side2 -->
				<%@ include file="../resources/include/sidenav.jsp" %>
			</div>
			<!-- main contents -->
			<div class="col-sm-8 text-left" style="width:860px;">
				<!-- 컨텐츠를 넣으세요 -->
				<img src="../resources/images/보험약관1.jpg" style="width:100%;">
				<img src="../resources/images/보험약관2.jpg" style="width:100%;">
			</div>
			<div class="col-sm-2 sidenav" style="width:200px; background:white;">
				<%@ include file="../../resources/include/add.jsp" %>
			</div>
		</div>

	</div>
	
	<%@ include file="../../resources/include/login.jsp" %>
	<%@ include file="../../resources/include/footer.jsp" %>
	<!-- <footer class="container-fluid text-center">
		<p>
			상호명 : C&C 렌터카 대표자 : 홍길동 주소 : 서울시 강남구 역삼동 대표자 전화번호 : 02-1234-1234<br>
			여기엔 무엇을 써야 하는가?
		</p>
	</footer> -->
</body>
</html>
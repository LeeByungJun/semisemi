<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>C&C 렌터카</title>
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
<script type="text/javascript">
	/* $(function(){
		$("#content").load("views/customerCenter.jsp");
	}); */

	function moveCustomer() {
		$("#content").load("views/customerCenter.jsp");
		//document.getElementById("content").innerHTML = '<object type="text/html" data="views/customerCenter.jsp"></object>';
	}
	
	/* function moveCarHugi(){
		$("#content").load("DongGuk/views/reviewRent.jsp");
	} */
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
	/* #f1f1f1 */
	height: 100%;
}
.side2{
	background-color: #2c2c2c;
}
.side2 > p a{
	color:white;
}
/* Set black background color, white text and some padding */
footer {
	background-color: #2c2c2c;
	/* #555 */
	color: white;
	padding: 15px;
	/* margin-top: 120px; */
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

#sidebar {
	height: auto;
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
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a href="index.jsp"><img src="images/C&C Logo.jpg" alt="Logo"
					width="120" height="50"></a>
				<!-- class="navbar-brand" -->
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="#" onclick="moveCustomer();">단기렌트</a></li>
					<!-- class="active" -->
					<li><a href="byungjun/views/faq.jsp">장기렌트</a></li>
					<li><a href="DongGuk/views/p2pRent.jsp">P2P</a></li>
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
	</nav>


	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-2 sidenav side2">
				<p>
					<a href="#" onclick="moveCustomer();">FAQ</a>
				</p>
				<p>
					<a href="WookJae/views/notice.jsp">공지사항</a>
				</p>
				<p>
					<a href="DongGuk/views/reviewRent.jsp">시승기</a>
				</p>
				<p>
					<a href="#">불량고객신고</a>
				</p>
				<p>
					<a href="#">자유게시판</a>
				</p>
			</div>
			<div class="col-sm-8 text-left" id="content">

				<!-- 컨텐츠가 들어갈 자리 -->
			</div>
			<div class="col-sm-2 sidenav">
				<!-- <div class="well"> -->
					<!-- <p>ADS</p> -->
					<img src="resources/gif/pop2.gif" width="100%;" height="90%;">
				<!-- </div> -->
			</div>
		</div>
	</div>

	<footer class="container-fluid text-center">
		<p>
			상호명 : C&C 렌터카 대표자 : 홍길동 주소 : 서울시 강남구 역삼동 대표자 전화번호 : 02-1234-1234<br>
			여기엔 무엇을 써야 하는가?
		</p>
	</footer>
</body>
</html>
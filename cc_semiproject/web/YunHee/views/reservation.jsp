<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Reservation</title>
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
				<li><a href="#">단기렌트</a></li>
				<!-- class="active" -->
				<li><a href="#">장기렌트</a></li>
				<li><a href="DongGuk/views/p2pRent.jsp">P2P</a></li>
				<li><a href="menuTemplate.jsp">고객센터</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#" role="button" data-toggle="modal"
					data-target="#login-modal"><span
						class="glyphicon glyphicon-log-in"></span> Login</a></li>
				<li><a href="YunHee/views/myPage.jsp" role="button"><span
						class="glyphicon glyphicon-log-in"></span> 마이페이지</a></li>
			</ul>
		</div>
	</div>
	</nav>


	<h1>예약 및 이용내역</h1>
	<br>
	<form action="/cs/reservation" method="post">
		<table width="650" align="center">
			<tr>
				<th>예약번호</th>
				<th>대여기간</th>
				<th>대여지점</th>
				<th>반납지점</th>
				<th>차명</th>
				<th>대여금액</th>
				<th>결제여부</th>
				<td>12345678</td>
				<td>7일</td>
				<td>테헤란로점</td>
				<td>Sonata</td>
				<td>500,000원</td>
				<td>Y</td>
			</tr>
		</table>
	</form>
	<hr style="clear: both;">
	<br>
	<footer class="container-fluid text-center">
	<p>
		상호명 : C&C 렌터카 대표자 : 홍길동 주소 : 서울시 강남구 역삼동 대표자 전화번호 : 02-1234-1234<br>
		여기엔 무엇을 써야 하는가?
	</p>
	</footer>
</body>
</html>
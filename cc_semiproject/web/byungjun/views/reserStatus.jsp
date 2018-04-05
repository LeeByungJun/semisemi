<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<h1 align="center" style="margin-left: 300px;">등급별 예약 현황</h1>
				<fieldset>
					<legend id="gold">골드</legend>
					<table border="1" cellspacing="0">
						<tr><th class="size1">이름</th><th class="size2">이메일</th><th class="size1">차 이름</th><th class="size2">예약 시작일</th><th class="size2">예약 종료일</th><th class="size1">등급</th></tr>
						<tr><td class="size1">낙타</td><td class="size2">camel@gmail.com</td><td class="size1">싼타페</td><td class="size2">2018/04/09</td><td class="size2">2018/04/12</td><td class="size1">골드</td></tr>
					</table>
				</fieldset>
				<br>
				<fieldset>
					<legend id="silver">실버</legend>
					<table border="1" cellspacing="0">
						<tr><th class="size1">이름</th><th class="size2">이메일</th><th class="size1">차 이름</th><th class="size2">예약 시작일</th><th class="size2">예약 종료일</th><th class="size1">등급</th></tr>
						<tr><td class="size1">릴라</td><td class="size2">rilla@naver.com</td><td class="size1">맥스크루즈</td><td class="size2">2018/04/05</td><td class="size2">2018/04/13</td><td class="size1">실버</td></tr>
					</table>
				</fieldset>
				<br>
				<fieldset>
					<legend id="bronze">브론즈</legend>
					<table border="1" cellspacing="0">
						<tr><th class="size1">이름</th><th class="size2">이메일</th><th class="size1">차 이름</th><th class="size2">예약 시작일</th><th class="size2">예약 종료일</th><th class="size1">등급</th></tr>
						<tr><td class="size1">주니</td><td class="size2">forlook@naver.com</td><td class="size1">벨로스터</td><td class="size2">2018/04/10</td><td class="size2">2018/04/19</td><td class="size1">브론즈</td></tr>
					</table>
				</fieldset>
				<br>
				<fieldset>
					<legend>일반</legend>
					<table border="1" cellspacing="0">
						<tr><th class="size1">이름</th><th class="size2">이메일</th><th class="size1">차 이름</th><th class="size2">예약 시작일</th><th class="size2">예약 종료일</th><th class="size1">등급</th></tr>
						<tr><td class="size1">도비</td><td class="size2">doby92@daum.net</td><td class="size1">모닝</td><td class="size2">2018/04/04</td><td class="size2">2018/04/06</td><td class="size1">일반</td></tr>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<metacharset= "UTF-8">
<title>MyPage</title>
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


	<H1>마이 페이지</H1>
	<br>
	<form action="/cs/myPage" method="post">
		<table width="650" align="center">
			<tr>
				<th align="right">성명&nbsp;&nbsp;&nbsp;</th>
				<td>한윤희</td>
			</tr>
			<tr>
				<th align="right">생년월일&nbsp;&nbsp;&nbsp;</th>
				<td><input type="hidden" name="BIRTHDAY_1" value="1986" /> <input
					type="hidden" name="BIRTHDAY_2" value="09" /> <input type="hidden"
					name="BIRTHDAY_3" value="14" /> 1986 년 09 월 14 일 <span
					class="ml20"> <input type="hidden" name="GENDER" class="radio"
						title="성별" value="F" /> 여자
				</span></td>
			</tr>
			<tr>
				<th align="right">휴대폰번호&nbsp;&nbsp;&nbsp;</th>
				<td><span class="formatIn"><select id="mobileNumber"
						class="w80" name="HP1"></select> <input type="text" name="HP2_1"
						class="itext w50 eng" maxlength="4" value="1111" /> <span
						class="ml5">-</span> <input type="text" name="HP2_2"
						class="itext w50 ml5 eng" maxlength="4" value="1111" />
				</span></td>
			</tr>
			<tr>
				<th align="right">주소&nbsp;&nbsp;&nbsp;</th>
				<td><span class="formatIn"> <input type="text"
						name="HOMEZIP_1" class="itext w50 eng" maxlength="3"
						readonly="readonly" value="111" /> <span class="ml5">-</span> <input
						type="text" name="HOMEZIP_2" class="itext w50 ml5 eng"
						maxlength="3" readonly="readonly" value="111" /> <a
						href="#zipCode" class="btnTbl01 ml5">우편번호검색</a></span>
					<p class="formatIn tblp">
						<input type="text" name="HOMEADDR1" maxLength="50"
							class="itext w200 kor" value="서울시  " /> <input type="text"
							name="HOMEADDR2" maxLength="50" class="itext w200 kor"
							value="111-11번지 111동 111호" />
					</p></td>
			</tr>
			<tr>
				<th align="right">이메일&nbsp;&nbsp;&nbsp;</th>
				<td>rainbow86h@naver.com</td>
			</tr>
			<tr height="40">
				<th align="right">비밀번호&nbsp;&nbsp;&nbsp;</th>
				<td><input type="password" name="userpwd" id="upwd1"></td>
			</tr>
			<tr height="40">
				<th align="right">비밀번호확인&nbsp;&nbsp;&nbsp;</th>
				<td><input type="password" id="upwd2" onblur="checkPwd();"></td>
			</tr>
			<tr height="40">
				<th width="150" colspan="2"><input type="submit" value="수정하기">
					&nbsp; <input type="submit" value="삭제하기"></th>
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
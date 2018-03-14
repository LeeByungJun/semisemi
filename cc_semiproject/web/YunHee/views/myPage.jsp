<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<metacharset= "UTF-8">
<title>MyPage</title>
<%@ include file="../include/meta.jsp"%>
</head>
<!-- header -->
<%@ include file="../include/header.jsp"%>
<!-- sidenav -->
<div class="container-fluid text-center">
	<div class="row content">
		<div class="col-sm-2 sidenav">
			<!-- side2 -->
			<%@ include file="../include/sidenav.jsp"%>
		</div>
		<!-- main contents -->
		<div class="col-sm-8 text-left">
			<!-- 컨텐츠를 넣으세요 -->
			<!-- 컨텐츠를 넣으세요 -->
			<!-- 컨텐츠를 넣으세요 -->
			<!-- 컨텐츠를 넣으세요 -->
			<!-- 컨텐츠를 넣으세요 -->
			<!-- 컨텐츠를 넣으세요 -->
			<!-- 컨텐츠를 넣으세요 -->
			<!-- 컨텐츠를 넣으세요 -->
			<!-- 컨텐츠를 넣으세요 -->
			<!-- 컨텐츠를 넣으세요 -->
			<!-- 컨텐츠를 넣으세요 -->
			ㅇㅇㅇ
		</div>
		<div class="col-sm-2 sidenav">
			<%@ include file="../include/add.jsp"%>
		</div>
	</div>
</div>
<!-- login 관련 modal -->
<%@ include file="../include/login.jsp"%>

<!-- footer -->
<%@ include file="../include/footer.jsp"%>
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
				name="BIRTHDAY_3" value="14" /> 1986 년 09 월 14 일 <span class="ml20">
					<input type="hidden" name="GENDER" class="radio" title="성별"
					value="F" /> 여자
			</span></td>
		</tr>
		<tr>
			<th align="right">휴대폰번호&nbsp;&nbsp;&nbsp;</th>
			<td><span class="formatIn"><select id="mobileNumber"
					class="w80" name="HP1"></select> <input type="text" name="HP2_1"
					class="itext w50 eng" maxlength="4" value="1111" /> <span
					class="ml5">-</span> <input type="text" name="HP2_2"
					class="itext w50 ml5 eng" maxlength="4" value="1111" /> </span></td>
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
</body>
</html>
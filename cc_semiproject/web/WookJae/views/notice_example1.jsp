<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 묻는 질문</title>
<%@ include file="../include/meta.jsp"%>
</style>
</head>
<body>
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
			<div class="col-sm-8 text-left" align="center">
			<h1 align="center" style="color:drakblue;font-family:'고딕'"><b>공지사항</b></h1>
			<br>&nbsp;
			<h3><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Notice</b></h3>				
			<div id="bd1" align="center" style="width:450;">
			<table width="550" border="1px solid green"> 
				<tr>
					<th rowspan="2" bgcolor="lightgray">제목<br>파일</th> 
					<td>2018년 3월 고객 설문 이벤트 당첨자 발표~~★</td>
					<th rowspan="2" bgcolor="lightgray">등록<br>조회</th>
					<td>2018.03.21</td>
				</tr>
				<tr>
					<td>첨부된 파일은 없습니다..</td> 
					<td>215</td>
				</tr>
				<tr  align="left">
					<td colspan="4">
					<textarea rows="10" cols="122">	
					2018년 2월 한 달 간 저희 AJ렌터카를 이용해 주신 고객님들을 대상으로 진행했던 
					사용 후기 이벤트의 당첨자를 발표합니다.
					응모 해 주신 모든 회원님들께 진심으로 감사를 드리며, 
					여러분의 의견 하나하나를 저희의 서비스 개선을 위해 적극적으로 활용하여 
					더욱 발전하는 AJ렌터카를 만들겠습니다.
					</textarea>	
					</td>
				</tr>
				<tr> 
					<th rowspan="2" align="center" bgcolor="lightgray">다음<br>이전</th>
					<td colspan="3"><a>다음페이지로 이동~~</a><td>
				</tr>
				<tr>
					<td colspan="3"><a>이전페이지로 이동~~</a><td>		
				</tr>
				

			</table>
			</div>

		</div>
			<div class="col-sm-2 sidenav">
				<%@ include file="../include/add.jsp"%>
			</div>

	</div>



	<!-- login 관련 modal -->
	<%@ include file="../include/login.jsp"%>

	<!-- footer -->
	<%@ include file="../include/footer.jsp"%>
	</body>
</html>
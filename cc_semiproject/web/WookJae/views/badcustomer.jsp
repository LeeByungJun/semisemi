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
					<div class="col-sm-2 sidenav"><!-- side2 -->
						<%@ include file="../include/sidenav.jsp"%>
					</div>
					<!-- main contents -->
					<div class="col-sm-8 text-left">
					
					<div class="container" style="width:100%; height:600%">
						<h1 align="center" style="font-family:'고딕'"><b>불량고객 신고</b></h1>
					
						<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
							<thread>
							<tr>
								<th style="background:#eeeeee; text-align:center;">번호</th>
								<th style="background:#eeeeee; text-align:center;">제목</th>
								<th style="background:#eeeeee; text-align:center;">작성자</th>
								<th style="background:#eeeeee; text-align:center;">날짜</th>
								<th style="background:#eeeeee; text-align:center;">조회수</th>
							</tr>	
							</thread>
							<tbody>	
							<tr>
								<td>171</td>
								<td>으앙</td>
								<td>운영자</td>
								<td>2018.03.12</td>
								<td>1</td>
							</tr>
							</tbody>
							<tbody>
							<tr>
								<td>181</td>
								<td>하아</td>
								<td>운영자</td>
								<td>2018.03.13</td>
								<td>4</td>
							</tr>
							<tr>
								<td>193</td>
								<td>하아</td>
								<td>운영자</td>
								<td>2018.03.13</td>
								<td>4</td>
							</tr>
							<tr>
								<td>198</td>
								<td>하아</td>
								<td>운영자</td>
								<td>2018.03.13</td>
								<td>4</td>
							</tr>							
							<tr>
								<td>181</td>
								<td>하아</td>
								<td>운영자</td>
								<td>2018.03.13</td>
								<td>4</td>
							</tr>	
							<tr>
								<td>181</td>
								<td>하아</td>
								<td>운영자</td>
								<td>2018.03.13</td>
								<td>4</td>
							</tr>													
							<tr>
								<td>181</td>
								<td>하아</td>
								<td>운영자</td>
								<td>2018.03.13</td>
								<td>4</td>
							</tr>													
							<tr>
								<td>181</td>
								<td>하아</td>
								<td>운영자</td>
								<td>2018.03.13</td>
								<td>4</td>
							</tr>
							<tr>
								<td>181</td>
								<td>하아</td>
								<td>운영자</td>
								<td>2018.03.13</td>
								<td>4</td>
							</tr>			
																																						
						</table>
						<hr>

						<a class="btn btn-default pull-right" href="/cs/views/write.jsp">글쓰기</a>
						<div class="text-center">
							<ul class="pagination">
								<li><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
							</ul>
						</div>
					</div>					
					

					</div>
					<div class="col-sm-2 sidenav">
						<%@ include file="../include/add.jsp" %>
					</div>
				</div>
		
			</div>
		
		
		
			<!-- login 관련 modal -->
			<%@ include file="../include/login.jsp"%>
		
			<!-- footer -->
			<%@ include file="../include/footer.jsp"%>		
		</body>
</html>
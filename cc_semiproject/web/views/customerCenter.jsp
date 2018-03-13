<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>게시판</title>
<link href="../bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script
	src="../bootstrap/js/jquery-3.3.1.min.js"></script>
<script
	src="../bootstrap/js/bootstrap.js"></script>
</head>
<body>
<div class="container" style="width:100%;">
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
			<td>165</td>
			<td>으앙</td>
			<td>박보영</td>
			<td>2018.03.12</td>
			<td>1</td>
		</tr>
		</tbody>
		<tbody>
		<tr>
			<td>181</td>
			<td>하아</td>
			<td>김수연</td>
			<td>2018.03.13</td>
			<td>4</td>
		</tr>
		</tbody>
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

</body>
</html>
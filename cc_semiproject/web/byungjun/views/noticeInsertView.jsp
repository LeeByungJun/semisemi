<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 입력 뷰</title>
<%@ include file="../../resources/include/meta.jsp" %>
<style type="text/css">
	table tr td{
		text-align:center;
	}
	table{
		width:500px;
	}
</style>
<script type="text/javascript">
	function nInsert(){
		var title = $('#title').val();
		var writer = $('#writer').val();
		var contents = $('#contents').val();
		
		if(title != "" && writer != "" && contents != ""){
			$.ajax({
				url:"/cs/noticeinsertservlet",
				data:{
					title:title,
					writer:writer,
					contents:contents
				},
				type:"post",
				success:function(data){
					alert(data);
					if(data = '게시글 입력 성공!'){
						location.href="/cs/boardmanage?npage=1";
					}
				}
			});
		}else{
			alert("빈칸이 존재해서는 안됩니다.");
		}
	}
</script>
</head>
<body>
	<%@ include file="adminHeader.jsp" %>
	
	<!-- sidenav -->
	<div class="container-fluid text-center">
		<div class="row content">
			<!-- main contents -->
			<div class="col-sm-8 text-left">
				<!-- 컨텐츠를 넣으세요 -->
				<form action="">
					<table class="table table-striped" style="margin-top:50px; margin-bottom:50px; margin-left:200px;">
						<tr>
							<td colspan="2"><h2>Notice 게시글 입력하기</h2></td>
						</tr>
						<tr>
							<td>제목</td>
							<td>
								<input type="text" id="title" style="width:90%;">
							</td>
						</tr>
						<tr>
							<td>작성자</td>
							<td><input type="text" id="writer" style="width:90%;"></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea id="contents" cols="95" rows="10"></textarea></td>
						</tr>
						<tr>
							<td colspan="2">
								<button onclick="nInsert();">글 입력</button>&nbsp;&nbsp;&nbsp;
								<a href="javascript:history.go(-1)">돌아가기</a>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	
	
	<%@ include file="../../resources/include/login.jsp" %>
	<%@ include file="../../resources/include/footer.jsp" %>
</body>
</html>
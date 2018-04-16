<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 게시글 추가</title>
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
	$(function(){
		$('#sel1').change(function(){
			if($('#sel1 option:selected').val() != '카테고리선택'){
				$('#category').val($('#sel1 option:selected').val());	
			}else{
				$('#category').val("");
			}
		});
	});
	
	function fInsert(){
		var category = $('#category').val();
		var title = $('#title').val();
		var contents = $('#contents').val();
		
		if(category != "" && title != "" && contents != ""){
			$.ajax({
				url:"/cs/faqinsert",
				data:{
					category:category,
					title:title,
					contents:contents
				},
				type:"post",
				success:function(data){
					alert(data);
					if(data = '게시글 입력 성공!'){
						location.href="/cs/boardmanage?fpage=1";
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
							<td colspan="2"><h2>FAQ 게시글 입력하기</h2></td>
						</tr>
						<tr>
							<td>카테고리</td>
							<td>
								<input type="text" id="category" style="width:40%;">
								<select id="sel1">
									<option>카테고리선택</option>
									<option>자주찾는질문</option>
									<option>사이트이용</option>
									<option>회원제도</option>
									<option>장기대여</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>제목</td>
							<td><input type="text" id="title" style="width:90%;"></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea id="contents" cols="94" rows="10"></textarea></td>
						</tr>
						<tr>
							<td colspan="2">
								<button onclick="fInsert();">글 입력</button>&nbsp;&nbsp;&nbsp;
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
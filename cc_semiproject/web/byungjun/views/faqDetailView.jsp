<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="faq.model.vo.Faq" %>
<%
	Faq f = (Faq)request.getAttribute("faq");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 게시글 상세보기</title>
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
	function fUpdate(no,category){
		var title = $('#title').val();
		var contents = $('#contents').val();;
		$.ajax({
			url:'/cs/faqupdate',
			data:{
				no: no,
				category: category,
				title: title,
				contents: contents
			},
			type:'post',
			success:function(data){
				alert(data);
				location.href="/cs/boardmanage?fpage=1";
			},
			error:function(a,b,c){
				console.log(a + ", " + b + ", " + c);
			}
		});
		//location.href="/cs/faqupdate?no="+no+"&category="+category+"&title="+title+"&contents="+contents;
	}
	function fDelete(no){
		location.href="/cs/faqdelete?no="+no;
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
				<form action=""> <!-- style="margin-left:300px; margin-top:50px; margin-bottom:50px;" -->
					<table class="table table-striped" style="margin-top:50px; margin-bottom:50px; margin-left:200px;">
						<tr>
							<td colspan="2"><h2><%= f.getF_no() %>번 FAQ 보기</h2></td>
						</tr>
						<tr>
							<td>카테고리</td>
							<td><input type="text" value="<%= f.getF_category() %>" style="width:90%; border:none;" readonly></td>
						</tr>
						<tr>
							<td>제목</td>
							<td><input type="text" id="title" value="<%= f.getF_title() %>" style="width:90%;"></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea id="contents" cols="94" rows="10"><%= f.getF_contents() %></textarea></td>
						</tr>
						<tr>
							<td colspan="2">
								<button onclick="fUpdate('<%= f.getF_no() %>','<%= f.getF_category() %>')">글 수정</button>&nbsp;&nbsp;&nbsp;
								<button onclick="fDelete('<%= f.getF_no() %>');">글 삭제</button>&nbsp;&nbsp;&nbsp;
								<a href="javascript:history.go(-1)">돌아가기</a><!-- /cs/boardmanage?page=1 -->
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
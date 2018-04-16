<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="notice.model.vo.Notice" %>
<%
	Notice n = (Notice)request.getAttribute("notice");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기 뷰</title>
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
	function nUpdate(no){
		var title = $('#title').val();
		var writer = $('#writer').val();
		var sysdate1 = $('#sysdate1').val();
		var contents = $('#contents').val();
		$.ajax({
			url:'/cs/noticeupdateservlet',
			data:{
				no: no,
				title: title,
				writer: writer,
				sysdate1: sysdate1,
				contents: contents
			},
			type:'post',
			success:function(data){
				alert(data);
				if(data == '게시글 수정 성공'){
					location.href="/cs/boardmanage?npage=1";
				}
			},
			error:function(a,b,c){
				console.log(a + ", " + b + ", " + c);
			}
		});
		//location.href="/cs/faqupdate?no="+no+"&category="+category+"&title="+title+"&contents="+contents;
	}
	function nDelete(no){
		location.href="/cs/noticedeleteserlvet?no="+no;
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
							<td colspan="2"><h2><%= n.getN_no() %>번 Notice 보기</h2></td>
						</tr>
						<tr>
							<td>제목</td>
							<td><input type="text" id="title" value="<%= n.getN_title() %>" style="width:90%;"></td>
						</tr>
						<tr>
							<td>글쓴이</td>
							<td><input type="text" id="writer" value="<%= n.getN_writer() %>" style="width:90%;"></td>
						</tr>
						<tr>
							<td>작성일</td>
							<td><input type="text" id="sysdate1" value="<%= n.getN_sysdate() %>" style="width:90%;"></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea id="contents" cols="95" rows="10"><%= n.getN_contents() %></textarea></td>
						</tr>
						<tr>
							<td colspan="2">
								<button onclick="nUpdate('<%= n.getN_no() %>')">글 수정</button>&nbsp;&nbsp;&nbsp;
								<button onclick="nDelete('<%= n.getN_no() %>');">글 삭제</button>&nbsp;&nbsp;&nbsp;
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
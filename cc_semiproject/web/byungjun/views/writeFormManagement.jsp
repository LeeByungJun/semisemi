<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="faq.model.vo.Faq,java.util.*"%>
<%
	ArrayList<Faq> list = (ArrayList<Faq>) request.getAttribute("list");
	int currentPage = ((Integer) request.getAttribute("currentPage")).intValue();
	int maxPage = ((Integer) request.getAttribute("maxPage")).intValue();
	int startPage = ((Integer) request.getAttribute("startPage")).intValue();
	int endPage = ((Integer) request.getAttribute("endPage")).intValue();
	int listCount = ((Integer) request.getAttribute("listCount")).intValue();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 관리</title>
<%@ include file="../../resources/include/meta.jsp" %>
<style type="text/css">
	/* th{
		text-align:center;
		width:500px;
	}
	td{
		width:500px;
	} */
	table th,td{
		text-align:center;
	}
	.title{
		/* text-align:center; */
		width:350px;
	}
	.no, .writer{
		/* text-align:center; */
		width:120px;
	}
	.date{
		width:150px;
	}
	a{
		text-decoration:none;
	}
</style>
<script type="text/javascript">
	function fInsert(){
		location.href="/cs/byungjun/views/faqInsertView.jsp";
	}
</script>
</head>
<body>
	<%@ include file="adminHeader.jsp" %>
	
	<!-- sidenav -->
	<div class="container-fluid text-center">
		<div class="row content">
			<%-- <div class="col-sm-2 sidenav"><!-- side2 -->
				<%@ include file="../../resources/include/sidenav.jsp"%>
			</div> --%>
			<!-- main contents -->
			<div class="col-sm-8 text-left">
				<!-- 컨텐츠를 넣으세요 -->
				<h1 align="center" style="margin-left:300px;">게시글관리</h1>
				<fieldset align="center" style="margin-left:300px;">
					<legend>공지사항</legend>
					<table border="1" cellspacing="0" align="center">
						<tr><th class="no">번호</th><th class="title">제목</th><th class="writer">글쓴이</th><th class="date">작성일</th></tr>
						<tr><td class="no">1</td><td class="title"><a href="#">4월3일~4월5일 홈페이지 이용 중단</a></td><td class="writer">병준</td><td class="date">2018/04/01</td></tr>
						<tr>
							<td colspan="4">
								<a href="#">글 추가</a>&nbsp;&nbsp;&nbsp;
								<a href="#">글 삭제</a>&nbsp;&nbsp;&nbsp;
								<a href="#">글 수정</a>
							</td>
						</tr>
					</table>
				</fieldset>
				<br><br>
				<fieldset align="center" style="margin-left:300px;">
					<legend>FAQ</legend>
					<table border="1" cellspacing="0" align="center">
						<tr><th class="no">번호</th><th class="title">제목</th><th class="writer">카테고리</th></tr>
						<% for(int i=0;i<list.size();i++){ %>
							<tr>
								<td class="no"><%= list.get(i).getF_no() %></td>
								<td class="title"><a href="/cs/faqview?no=<%= list.get(i).getF_no() %>"><%= list.get(i).getF_title() %></a></td>
								<td class="writer"><%= list.get(i).getF_category() %></td>
							</tr>
						<% } %>
						<tr>
							<td colspan="3">
							<% if(startPage > 0 && endPage > 0){ %>
								<!-- 페이징 처리 -->
								<div style="text-align:center;">
									<% if(currentPage <= 1){ %>
										[맨처음]&nbsp;
									<% }else{ %>
										<a href="/cs/boardmanage?page=1">[맨처음]</a>
									<% } %>
									<% if((currentPage-10) < startPage && (currentPage-10) > 1){ %>
										<a href="/cs/boardmanage?page=<%= startPage - 10 %>">[prev]</a>
									<% }else{ %>
										[prev]&nbsp;
									<% } %>
									<!-- 현재 페이지가 포함된 그룹의 페이지 숫자 출력 -->
									<% for(int p = startPage; p<=endPage; p++){ 
										if(p == currentPage){%>
											<font color="red" size="4"><b>[<%= p %>]</b></font>
										<%}else{ %>
											<a href="/cs/boardmanage?page=<%= p %>"><%= p %></a>
									<% }} %>
									
									<% if((currentPage+10) > endPage && (currentPage+10) < maxPage){ %>
										<a href="/cs/boardmanage?page=<%= endPage + 10 %>">[next]</a>
									<% }else{ %>
										[next]&nbsp;
									<% } %>
									
									<% if(currentPage >= maxPage){ %>
										[맨끝]&nbsp;
									<% }else{ %>
										<a href="/cs/boardmanage?page=<%= maxPage %>">[맨끝]</a>
									<% } %>
								</div>
								<% } %>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<button onclick="fInsert();">글 추가</button>&nbsp;&nbsp;&nbsp;
							</td>
							
							<!-- prompt로 글추가,삭제,수정 구현하기 -->
						</tr>
					</table>
				</fieldset>
				<br><Br>
				<!-- <fieldset align="center" style="margin-left:300px; margin-bottom:50px;">
					<legend>불량고객신고</legend>
					<table border="1" cellspacing="0" align="center">
						<tr><th class="no">번호</th><th class="title">제목</th><th class="writer">글쓴이</th><th class="date">작성일</th></tr>
						<tr><td class="no">1</td><td class="title"><a href="#">사기 당했습니다ㅡㅡ</a></td><td class="writer">명재</td><td class="date">2018/04/02</td></tr>
					</table>
				</fieldset> -->
				
			</div>
			<%-- <div class="col-sm-2 sidenav">
				<%@ include file="../../resources/include/add.jsp" %>
			</div> --%>
		</div>

	</div>
	
	
	<%@ include file="../../resources/include/login.jsp" %>
	<%@ include file="../../resources/include/footer.jsp" %>
</body>
</html>
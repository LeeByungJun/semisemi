<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="faq.model.vo.Faq,java.util.*,notice.model.vo.Notice"%>
<%
	ArrayList<Faq> faqList = (ArrayList<Faq>) request.getAttribute("faqList");
	/* ArrayList<Faq> categoryList = (ArrayList<Faq>)request.getAttribute("categoryList"); */
	int faqMaxPage = ((Integer) request.getAttribute("faqMaxPage")).intValue();
	int faqStartPage = ((Integer) request.getAttribute("faqStartPage")).intValue();
	int faqEndPage = ((Integer) request.getAttribute("faqEndPage")).intValue();
	int faqListCount = ((Integer) request.getAttribute("faqListCount")).intValue();
	
	ArrayList<Notice> noticeList = (ArrayList<Notice>) request.getAttribute("noticeList");
	int noticeMaxPage = ((Integer) request.getAttribute("noticeMaxPage")).intValue();
	int noticeStartPage = ((Integer) request.getAttribute("noticeStartPage")).intValue();
	int noticeEndPage = ((Integer) request.getAttribute("noticeEndPage")).intValue();
	int noticeListCount = ((Integer) request.getAttribute("noticeListCount")).intValue();
	
	int fCurrentPage = ((Integer) request.getAttribute("fCurrentPage")).intValue();
	int nCurrentPage = ((Integer) request.getAttribute("nCurrentPage")).intValue();
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
		width:400px;
	}
	.no, .writer{
		/* text-align:center; */
		width:150px;
	}
	.date{
		width:180px;
	}
	a{
		text-decoration:none;
	}
</style>
<script type="text/javascript">
	function fInsert(){
		location.href="/cs/fcategorylist";
	}
	function nInsert(){
		location.href="/cs/byungjun/views/noticeInsertView.jsp";
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
				<fieldset style="margin-left:170px;">
					<legend>공지사항</legend>
					<table class="table table-striped" style="width:800px;">
						<tr><th class="no">번호</th><th class="title">제목</th><th class="writer">글쓴이</th><th class="date">작성일</th></tr>
						<% for(int i=0;i<noticeList.size();i++){ %>
							<tr>
								<td class="no"><%= noticeList.get(i).getN_no() %></td>
								<td class="title"><a href="nview?no=<%= noticeList.get(i).getN_no() %>"><%= noticeList.get(i).getN_title() %></a></td>
								<td class="writer"><%= noticeList.get(i).getN_writer() %></td>
								<td class="date"><%= noticeList.get(i).getN_sysdate() %></td>
							</tr>
						<% } %>
						<tr>
							<td colspan="4">
							<% if(noticeStartPage > 0 && noticeEndPage > 0){ %>
								<!-- 페이징 처리 -->
								<div style="text-align:center;">
									<% if(nCurrentPage <= 1){ %>
										<< &nbsp;
									<% }else{ %>
										<a href="/cs/boardmanage?npage=1&fpage=<%= fCurrentPage %>"><<</a>&nbsp;
									<% } %>
									<% if(nCurrentPage > noticeStartPage){ %>
										<a href="/cs/boardmanage?npage=<%= nCurrentPage-1 %>&fpage=<%= fCurrentPage %>"><</a>&nbsp;
									<% }else{ %>
										<&nbsp;
									<% } %>
									<!-- 현재 페이지가 포함된 그룹의 페이지 숫자 출력 -->
									<% for(int p = noticeStartPage; p<=noticeEndPage; p++){ 
										if(p == nCurrentPage){%>
											<font color="red" size="4"><b><%= p %></b></font>&nbsp;
										<%}else{ %>
											<a href="/cs/boardmanage?npage=<%= p %>&fpage=<%= fCurrentPage %>"><%= p %></a>&nbsp;
									<% }} %>
									
									<% if(nCurrentPage != noticeEndPage){ %>
										<a href="/cs/boardmanage?npage=<%= nCurrentPage+1 %>&fpage=<%= fCurrentPage %>">></a>&nbsp;
									<% }else{ %>
										>&nbsp;
									<% } %>
									
									<% if(nCurrentPage >= noticeMaxPage){ %>
										>>&nbsp;
									<% }else{ %>
										<a href="/cs/boardmanage?npage=<%= noticeMaxPage %>&fpage=<%= fCurrentPage %>">>></a>
									<% } %>
								</div>
								<% } %>
							</td>
						</tr>
						<tr>
							<td colspan="4">
								<button onclick="nInsert();">글 추가</button>&nbsp;&nbsp;&nbsp;
							</td>
							
							<!-- prompt로 글추가,삭제,수정 구현하기 -->
						</tr>
						<!-- <tr><td class="no">1</td><td class="title"><a href="#">4월3일~4월5일 홈페이지 이용 중단</a></td><td class="writer">병준</td><td class="date">2018/04/01</td></tr>
						<tr>
							<td colspan="4">
								<a href="#">글 추가</a>&nbsp;&nbsp;&nbsp;
								<a href="#">글 삭제</a>&nbsp;&nbsp;&nbsp;
								<a href="#">글 수정</a>
							</td>
						</tr> -->
					</table>
				</fieldset>
				<br><br>
				<fieldset style="margin-left:170px;">
					<legend>FAQ</legend>
					<table class="table table-striped" style="width:800px;">
						<tr><th class="no">번호</th><th class="title">제목</th><th class="writer">카테고리</th></tr>
						<% for(int i=0;i<faqList.size();i++){ %>
							<tr>
								<td class="no"><%= faqList.get(i).getF_no() %></td>
								<td class="title"><a href="/cs/faqview?no=<%= faqList.get(i).getF_no() %>"><%= faqList.get(i).getF_title() %></a></td>
								<td class="writer"><%= faqList.get(i).getF_category() %></td>
							</tr>
						<% } %>
						<tr>
							<td colspan="3">
							<% if(faqStartPage > 0 && faqEndPage > 0){ %>
								<!-- 페이징 처리 -->
								<div style="text-align:center;">
									<% if(fCurrentPage <= 1){ %>
										<< &nbsp;
									<% }else{ %>
										<a href="/cs/boardmanage?fpage=1&npage=<%= nCurrentPage %>"><<</a>&nbsp;
									<% } %>
									<% if(fCurrentPage > faqStartPage){ %>
										<a href="/cs/boardmanage?fpage=<%= fCurrentPage-1 %>&npage=<%= nCurrentPage %>"><</a>&nbsp;
									<% }else{ %>
										<&nbsp;
									<% } %>
									<!-- 현재 페이지가 포함된 그룹의 페이지 숫자 출력 -->
									<% for(int p = faqStartPage; p<=faqEndPage; p++){ 
										if(p == fCurrentPage){%>
											<font color="red" size="4"><b><%= p %></b></font>&nbsp;
										<%}else{ %>
											<a href="/cs/boardmanage?fpage=<%= p %>&npage=<%= nCurrentPage %>"><%= p %></a>&nbsp;
									<% }} %>
									
									<% if(fCurrentPage != faqEndPage){ %>
										<a href="/cs/boardmanage?fpage=<%= fCurrentPage+1 %>&npage=<%= nCurrentPage %>">></a>&nbsp;
									<% }else{ %>
										>&nbsp;
									<% } %>
									
									<% if(fCurrentPage >= faqMaxPage){ %>
										>>&nbsp;
									<% }else{ %>
										<a href="/cs/boardmanage?fpage=<%= faqMaxPage %>&npage=<%= nCurrentPage %>">>></a>
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
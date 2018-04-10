<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="faq.model.vo.Faq,java.util.*"%>
<%
	ArrayList<Faq> list = (ArrayList<Faq>) request.getAttribute("list");
	ArrayList<Faq> cg = (ArrayList<Faq>) request.getAttribute("categoryGroup");
	int category = ((Integer) request.getAttribute("category")).intValue();
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
<title>자주 묻는 질문</title>
<%@ include file="../../resources/include/meta.jsp"%>
<style type="text/css">
#title {
	font-size: 18pt;
	text-align: left;
	font-weight: bold;
}

#all {
	text-align: left;
	font-size: 12pt;
	margin-top: 15px;
}

.ctitle {
	/* margin:0px;
		padding:0px; */
	font-size: 9pt;
}

hr {
	margin-top: 10px;
	margin-bottom: 10px;
}

#tb {
	margin-left: 100px;
}

table tr td {
	text-align: center;
	width: 200px;
}

.asearch{
	border:1px solid silver;
	border-radius: 5px;
	background:silver;
	text-decoration:none;
	margin-right:10px;
	color:red;
	font-size:12pt;
}
</style>
<script type="text/javascript">
	function display1(id) {

		switch (id) {
		case "a1":
			$("#c1").toggle('1');
			break;
		case "a2":
			$("#c2").toggle('1');
			break;
		case "a3":
			$("#c3").toggle('1');
			break;
		case "a4":
			$("#c4").toggle('1');
			break;
		case "a5":
			$("#c5").toggle('1');
			break;
		case "a6":
			$("#c6").toggle('1');
			break;
		}
	}
</script>
</head>
<body>
	<!-- header -->
	<%@ include file="../../resources/include/header.jsp"%>

	<!-- sidenav -->
	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-2 sidenav">
				<!-- side2 -->
				<%@ include file="../../resources/include/sidenav.jsp"%>
			</div>
			<!-- main contents -->
			<div class="col-sm-8 text-left">
				<!-- 컨텐츠를 넣으세요 -->
				<div id="title">FAQ</div>
				<%-- <div id="tb">
					<!-- <button class="btn btn-info" id="b5">전체조회</button> -->
					<a href="/cs/flist?page=1" class="asearch">전체조회</a>
					<!-- <button class="btn btn-info" id="b3">자주찾는질문</button> -->
					<% for(int i=0;i<list.size();i++){ %>
						<a href="/cs/fslist?category=<%= list.get(i).getF_category() %>" class="asearch"><%= list.get(i).getF_category() %></a>
					<% } %>
					<!-- <a href="/cs/fslist?category=자주찾는질문" class="asearch">자주찾는질문</a>
					<a href="/cs/fslist?category=사이트이용" class="asearch">사이트이용</a>
					<a href="/cs/fslist?category=회원제도" class="asearch">회원제도</a>
					<a href="/cs/fslist?category=장기대여" class="asearch">장기대여</a> -->
					<!-- <button class="btn btn-info" id="b1">사이트이용</button>
					<button class="btn btn-info" id="b2">회원제도</button>
					<button class="btn btn-info" id="b4">장기대여</button> -->
				</div> --%>
				<div>
            
	               <ul class="nav nav-tabs">
	                 <li class='<%=(category==0)?"active":""%>'><a href="/cs/flist?page=1">전체조회</a></li>
	                 <% for(int i=0;i<cg.size();i++){ %>
	                 	<li class='<%=(category==(i+1))?"active":""%>'><a href="/cs/flist?category=<%= i+1 %>&categoryName=<%= cg.get(i).getF_category() %>"><%= cg.get(i).getF_category() %></a></li>
	                 <% } %>
	               </ul>
	
	            </div>
				<div id="all">전체</div>
				<hr style="border-color: red; margin-top: 5px;">
				<% for(int i=0;i<list.size();i++){ %>
					<div class="ctitle">
						<%= list.get(i).getF_category() %> &nbsp;&nbsp;<a href="#" id="a<%= i+1 %>"
							onclick="display1(this.id);"><%= list.get(i).getF_title() %></a>
					</div>
					<hr>
					<div class="contents" id="c<%= i+1 %>" style="display: none;">	
						<br>
						A. <%= list.get(i).getF_contents() %>
						<br>
					</div>
					<hr>
				<% } %>
				<% if(startPage > 0 && endPage > 0){ %>
				<!-- 페이징 처리 -->
				<div style="text-align:center;">
					
					<% if(currentPage <= 1){ %>
						<< &nbsp;
					<% }else{ %>
						<a href="/cs/flist?page=1"><<</a>&nbsp;
					<% } %>
					<%-- <% if(currentPage <= 1){ %>
						<li>[맨처음]</li>&nbsp;
					<% }else{ %>
						<li><a href="/cs/flist?page=1">[맨처음]</a></li>
					<% } %> --%>
					
					<%-- <% if((currentPage-10) < startPage && (currentPage-10) > 1){ %>
						<a href="/cs/flist?page=<%= startPage - 10 %>"><</a>&nbsp;
					<% }else{ %>
						<&nbsp;
					<% } %> --%>
					
					<% if(currentPage > startPage){ %>
						<a href="/cs/flist?page=<%= currentPage - 1 %>"><</a>&nbsp;
					<% }else{ %>
						<&nbsp;
					<% } %>
					
					<!-- 현재 페이지가 포함된 그룹의 페이지 숫자 출력 -->
					<% for(int p = startPage; p<=endPage; p++){ 
						if(p == currentPage){%>
							<%-- <span style="color:white; background:black; font-size:12pt; font-family: bold"><%= p %></span> --%>
							<font color="red" size="4"><b><%= p %></b></font>&nbsp;
						<%}else{ %>
							<a href="/cs/flist?page=<%= p %>"><%= p %></a>&nbsp;
					<% }} %>
					
					<%-- <% if((currentPage+10) > endPage && (currentPage+10) < maxPage){ %>
						<a href="/cs/flist?page=<%= endPage + 10 %>">></a>&nbsp;
					<% }else{ %>
						> &nbsp;
					<% } %> --%>
					
					<% if(currentPage != endPage){ %>
						<a href="/cs/flist?page=<%= currentPage + 1 %>">></a>&nbsp;
					<% }else{ %>
						> &nbsp;
					<% } %>
					
					<% if(currentPage >= maxPage){ %>
						>> &nbsp;
					<% }else{ %>
						<a href="/cs/flist?page=<%= maxPage %>">>></a>
					<% } %>
					
				</div>
				<hr>
				<% } %>
			</div>
			<div class="col-sm-2 sidenav">
				<%@ include file="../../resources/include/add.jsp"%>
			</div>
		</div>

	</div>



	<!-- login 관련 modal -->
	<%@ include file="../../resources/include/login.jsp"%>

	<!-- footer -->
	<%@ include file="../../resources/include/footer.jsp"%>

</body>
</body>
</html>
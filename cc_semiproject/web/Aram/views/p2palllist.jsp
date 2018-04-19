<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page
	import="p2p.model.vo.p2p,member.model.vo.Member, java.util.*"%>
	

<%
	ArrayList<p2p> list = (ArrayList<p2p>)request.getAttribute("list");
	/* 페이징처리부분 */	
	int listCount = ((Integer) request.getAttribute("listCount")).intValue();
	int startPage = ((Integer) request.getAttribute("startPage")).intValue();
	int endPage = ((Integer) request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer) request.getAttribute("maxPage")).intValue();
	int currentPage = ((Integer) request.getAttribute("currentPage")).intValue();
	/* Member loginUser = (Member) session.getAttribute("loginUser"); */
%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>P2P</title>
		<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.css">
		<!-- <link rel="stylesheet" href="resources/css/custom.css"> -->
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<!-- <script src="js/bootstrap.js"></script> -->
		<script type="text/javascript">
			function p2pwrite(){
				alert("글쓰기 페이지로 이동합니다~~^^");
				location.href="/cs/Aram/views/p2pWritePage.jsp";
			}		
		</script>
		<%@ include file="../../../resources/include/meta.jsp"%>
		<style type="text/css">
			.title{
				width:70px;
			}
			.contents{
				width:;
			}
		</style>
	</head>
	<body>
		<!-- header -->
		<%@ include file="../../../resources/include/header.jsp"%>
		<!-- sidenav -->
		<div class="container-fluid text-center">
			<div class="row content">
				<div class="col-sm-2 sidenav">
					<!-- side2 -->
					<%@ include file="../../include/sidemenu.jsp"%>
				</div>
				<!-- main contents -->
				<div class="col-sm-8 text-left">
					<div class="container" style="width: 100%; height: 600%">
							<%if(loginUser.getCansell().equals("Y")){ %>
							<div style="display: inline; float: left; margin-top:30px;"> <!-- font-family: sans-serif; -->
							<b><font size=5 style="font-family: sans-serif;">P2P거래 게시판</font></b>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" onclick="p2pwrite();" value="글 쓰기">
							</div>
							<% }else if(loginUser.getCansell().equals("N")) { %>
							<div style="display: inline; float: left; margin-top:30px;">
							<b><font size=5 style="font-family: sans-serif;">P2P거래 게시판</font></b>
							</div>							
							<% } %>
							<hr style="clear:both;">
							
							<div class="row clearfix">
								<%for(int i=0; i<list.size(); i++){ %>							
							    <div class="col-lg-3 col-md-6 col-sm-12">
							        <div class="card agent">
							            <div class="agent-avatar"> 
							                <a href="/cs/p2pdetail?no=<%=list.get(i).getP_board()%>"> 
							                	<img src="<%=list.get(i).getP_image()%>" class="img-fluid " alt="이미지준비중" width="180" height="230"> 
							            	</a>
							           	</div>
							            <div class="agent-content">
							            	<div class="agent-name" align="center">
							            		<table style="text-align:center;">
							            			<tr>
							            				<td class="title">작성자</td>
							            				<td class="contents">
							            				<!-- <div class="col-sm-3"> -->
							            					<div class="btn-group float-right">
							            					<!-- <i class="fa fa-envelope-o fa-spin" style="font-size:20px; float:left;"></i> -->
							            					<% if(loginUser.getMem_num() != list.get(i).getMem_num()){ %>
							            					<%-- 	<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"
               														aria-haspopup="true" aria-expanded="false" style="background:white; color:blue; border:none;"><%=list.get(i).getName() %></button>
													                btn btn-primary --%>
													               <a role="button "class="dropdown-toggle" data-toggle="dropdown"
               														aria-haspopup="true" aria-expanded="false" style="background:white; color:blue; border:none;"><i class="fa fa-envelope-o fa-spin" style="font-size:20px; float:left;"></i><%=list.get(i).getName() %></a>
													               
													               <div class="dropdown-menu">
													                <a class="dropdown-item" href="/cs/Aram/chatMain.jsp?toID=<%= list.get(i).getEmail() %>">메세지보내기</a><!-- </div> --></div>
							            					<% }else{ %>
							            						<%=list.get(i).getName() %>
							            					<% } %>
							            				</td>
							            			</tr>
							            			<tr>
							            				<td class="title">제목</td><td class="contents" style="width:150px;"><font size="2"><%=list.get(i).getP_title() %></font></td>
							            			</tr>
							            		</table>
					                		</div>			                
							            </div>
							        </div>
							    </div>

							    <% } %>
							</div>
					</div>				
					<hr style="clear: both;">
					
					<!-- 페이징 처리 -->
					<div style="text-align: center;">
						<% if (currentPage <= 1) { %>
							[First] &nbsp;
						<% } else { %>
						<a href="/cs/p2plist?page=1"> [First] </a> &nbsp;
						<% } %>

						<% if (currentPage > startPage) { %>
						<a href="/cs/p2plist?page=<%=currentPage - 1%>"> [Before] </a> &nbsp;
						<% } else { %>
						  [Before] &nbsp;
						<% } %>

						<!-- 현재 페이지가 포함된 그룹의 페이지 숫자 출력 -->
						<%
							for (int p = startPage; p <= endPage; p++) {
								if (p == currentPage) {
						%>
						<font color="#0066ff" size="4"><b>[<%=p%>]
						</b></font> &nbsp;
						<% } else { %>
						<a href="/cs/p2plist?page=<%=p%>"><%=p%></a> &nbsp;
						<%
							}
						  }
						%>
						
						<% if (currentPage != endPage) { %>
						<a href="/cs/p2plist?page=<%=currentPage + 1%>"> [Next] </a> &nbsp;
						<% } else { %>
						[Next] &nbsp;
						<% } %>

						<% if (currentPage >= maxPage) { %>
							[End] &nbsp;
						<% } else { %>
						<a href="/cs/p2plist?page=<%=maxPage%>"> [End] </a>&nbsp;
						<%
							}
						%>
					</div>			
				</div>
				<div class="col-sm-2 sidenav" style="background:white;">
					<%@ include file="../../../resources/include/add.jsp"%>
				</div>				
			</div>
		</div>
		<!-- login 관련 modal -->
		<%@ include file="../../../resources/include/login.jsp"%>
	
		<!-- footer -->
		<%@ include file="../../../resources/include/footer.jsp"%>
	</body>
</html>










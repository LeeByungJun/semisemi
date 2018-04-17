<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="./noticeError.jsp"%>
<%@ page import="notice.model.vo.Notice, member.model.vo.Member"%>	

<% 
	Notice notice = (Notice)request.getAttribute("notice");	
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();	
	//Member loginUser = (Member)session.getAttribute("loginUser");
%>	
	
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>상세보기 페이지</title>
		<%@ include file="../../include/meta.jsp"%>
		
		<style type="text/css">
			#te1 {
				align:left;
				text-align:left;
			}
		
			#t1 > #c3 {
			align:center;
			}		
			
			
		</style>
		<script type="text/javascript" src="../../../resources/bootstrap/js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript">
		 <%-- function moveupdatepage(){
			 location.href="/cs/nupdateready?no="+<%=notice.getN_no()%>;
			 /* nupdate라는 Servlet컨트롤러를 호출하며 no에 notice.getN_no()값을 넣어 전달함 */
		 }	 --%>		
		 function movedeletepage(){
			 location.href="/cs/ndelete?no="+<%=notice.getN_no()%>;
		 }
		
		</script>
	</head>
<body>

	<!-- header -->
	<%@ include file="../../../resources/include/header.jsp"%>

	<!-- sidenav -->
	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-2 sidenav">
			<!-- side2 -->
			<%@ include file="../../../resources/include/sidenav.jsp"%>
			</div>
			<!-- main contents -->
			<div class="col-sm-8 text-left" align="center">
			<!-- <h1 align="center" style="color:drakblue; font-family:'고딕'"><b>공지사항</b></h1> -->
			
			<div id="bd1" align="center" style="margin-top:15px;">
			
			
			<table class="table table-striped" style="text-align:center;">
				<tr><td colspan="4"><h2><b>Notice</b></h2></td></tr> 
				<tr><!-- width="550" border="1px solid green" -->
					<td style="background:black; color:white;">제목</td> 
					<td><%=notice.getN_title()%></td> <!-- notice객체의 파일명을 가져온다. -->
					<td style="background:black; color:white;">등록일</td>
					<td><%=notice.getN_sysdate()%></td> <!-- 글 등록 날짜를 가져온다. -->
				</tr>
				<tr>
					<td style="background:black; color:white;">작성자</td>
					<td>
					Administrator
					<%-- <% if(notice.getN_original_filename()==null){ %>
					첨부파일 없음
					<% }else{ %>
					<a href="/cs/nfdown?ofile=<%=notice.getN_original_filename()%>&rfile=<%=notice.getN_rename_filename()%>">
					<%=notice.getN_original_filename() %>
					</a>
					<% } %> --%>
					</td>
					<td style="background:black; color:white;">조회수</td>
					<td><%=notice.getReadCount()%></td> <!-- 조횟수를 가져온다. -->
				</tr>
				<tr  align="left">
					<td colspan="4">
					<textarea rows="13" cols="117" readonly><%=notice.getN_contents()%></textarea>	
					<!-- 글의 내용을 불러온다. -->
					</td>
				</tr>
			</table>
			<!-- <button onclick="location.href='/cs/nlist?page=currentPage'">목록으로</button> -->
			<button onclick = "history.go(-1); return false;">목록으로</button><br><br>

			</div>

			<br><br><br>
			
			</div>
				<div class="col-sm-2 sidenav">
				<%@ include file="../../../resources/include/add.jsp"%>
				</div>
		</div>
	</div>
	<!-- login 관련 modal -->
	<%@ include file="../../../resources/include/login.jsp"%>
	
	
	<div>
	<!-- footer -->
	<%@ include file="../../../resources/include/footer.jsp"%>
	</div>
	
	</body>
</html>





















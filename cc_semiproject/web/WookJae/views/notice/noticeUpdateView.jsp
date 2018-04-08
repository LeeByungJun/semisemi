<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="./noticeError.jsp"%>
<%@ page import="notice.model.vo.Notice"%>
<%
	Notice notice = (Notice)request.getAttribute("notice"); 
	int currentPage = ((Integer)request.getAttribute("page")).intValue();	
	//컨트롤러 Service에서 setAttribute에서 가져온 Notice의 객체를 가져와 활용함
%>	
	
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>글수정 페이지</title>
		<%@ include file="../../../resources/include/meta.jsp"%>
		<script type="text/javascript" src="/cs/resources/bootstrap/js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript">
			function changeNotice(){
				location.href="/cs/nupdate2?nnum="+<%=notice.getN_no()%>+"&page="+<%=currentPage%>+"&ntitle="+$('#ntitle').val()+"&ncontents="+$('#ncontents').val();
			} 
		
			/* $(function(){			
				$('#submitbtn').click(function(){
					alert("실행");
					$('#changenotice').submit();
					$('#testBtn').click();
				});
			}); */
			/* function(){
			document.getElementById('submitbtn').onclick=function(){
					document.getElementById('changenotice').submit();
					return false;
				};
			}; */
		</script>
		<style type="text/css">
			table {
				text-align:center;
			}

			table tr th {
				background:skyblue;
				text-align:center;
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
				<%@ include file="../../../resources/include/sidenav.jsp"%>
			</div>
			<!-- main contents -->
			<div class="col-sm-8 text-left" align="center">
			<h1></h1>
			<br>
			<h3 align="center"><b>공지글 수정</b></h3>				
			<div id="bd1" align="center" style="width:450;">			
			
			<form action="/cs/nupdate2" id="changenotice" method="post">	
				<input type="hidden" id="nnum" name="nnum" value="<%=notice.getN_no()%>">
				<input type="hidden" id="page" name="page" value="<%=currentPage%>">
				<%-- <input type="hidden" name="ofile" value="<%=notice.getN_original_filename()%>">
				<input type="hidden" name="rfile" value="<%=notice.getN_rename_filename()%>"> --%>
				
				<table width="600" height="400" align="center" border="1">
					<tr text-align="center">
						<th>제목</th>			
						<td><input type="text" id="ntitle" name="ntitle" size="60" value="<%=notice.getN_title()%>"></td>			
					</tr>
					<tr align="center">
						<th>작성자</th>			
						<td><label>운영자</label></td>			
					<%-- </tr>
					<tr align="center">
						<th>첨부 파일</th>
						<td>
							<% if(notice.getN_original_filename()!=null){ %> 
							<%=notice.getN_original_filename()%> 
							<br>
							<% } %>
							<input type="file" name="upfile">	
						</td>
					</tr> --%>
					<tr>
						<th>내 용</th>			
						<td><textarea rows="10" cols="62" id="ncontents" name="ncontents"><%=notice.getN_contents()%></textarea></td>			
					</tr>
					<tr align="center">
						<td colspan = "2">	
						<input type="button" onclick="changeNotice();" value="글 수정">		
						<%-- <input type = "button" onclick="location.href='/cs/nupdate2?nnum=<%=notice.getN_no()%>&page=<%=currentPage%>&ofile=<%=notice.getN_original_filename()%>&rfile=<%=notice.getN_rename_filename()%>&ntitle=<%=notice.getN_title()%>&ncontents=<%=notice.getN_contents()%>'" value="수정완료">  --%>
					  	<!-- <input id="testBtn" type="submit" value="수정" hidden> 
						<input type="button" id="submitbtn" value="수정">--> 
						&nbsp;
						<input type = "button" value="목록" onclick = "history.go(-1); return false;">
						</td>
					</tr>
				</table>
			</form>
			</div>
			</div>
				<div class="col-sm-2 sidenav">
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
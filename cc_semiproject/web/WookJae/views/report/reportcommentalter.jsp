<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="./reportError.jsp"%>
<%@ page import="report.model.vo.Report, member.model.vo.Member, reportcomment.model.vo.ReportComment"%>	

<% 
	ReportComment rec = (ReportComment)request.getAttribute("reportcommentobject");
	Member loginUser = (Member)session.getAttribute("loginUser");
%>	
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>댓글수정 페이지</title>
		<%@ include file="../../include/meta.jsp"%>
		
		<style type="text/css">
			table > #c3 {
			align:center;
			}		
		</style>
		<script type="text/javascript" src="../../../resources/bootstrap/js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript">
		 //댓글 수정2
		 function alertcomment2(){ //DB로 데이터를 전송하여 실질적으로 수정이이루어지는 페이지
			 alert("댓글수정이 완료되었습니다!!");
			 location.href="/cs/altercom2?email="+$('#hide1').val()+"&reportno="+$('#hide2').val()+"&reportcommentno="+$('#hide3').val()+"&contents="+$('#text1').val();
		 }
		
		</script>
	</head>
<body>

	<!-- header -->
	<%@ include file="../../include/header.jsp"%>

	<!-- sidenav -->
	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-2 sidenav">
			<!-- side2 -->
			<%@ include file="../../include/sidenav.jsp"%>
			</div>
			<!-- main contents -->
			<div class="col-sm-8 text-left" align="center">
			<!-- <h1 align="center" style="color:drakblue; font-family:'고딕'"><b>공지사항</b></h1> -->
			<br>
			<h1><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reply Alter</b></h1>						
			<div id="bd1" align="center" style="width:450;">
				<br>
				
				<table border="1""> 								
					<tr style="margin-right:100px; margin-left:100px;">
						<td align="center" style="background-color:#464244; color:white; width:200px;"><%=loginUser.getName()%>(<%=loginUser.getEmail()%>)</td>
						<td colspan="4" style="padding-left:20px; padding-top:10px; padding-bottom:10px; padding-right:20px;">
						<textarea rows="1" cols="60" id="text1">
							<%=rec.getReportcommentcontents() %>
						</textarea>
						<input type="hidden" id="hide1" value="<%=rec.getUserEmail()%>"><!-- 유저의 이메일자료를 넘기는 것 -->	
						<input type="hidden" id="hide2" value="<%=rec.getReportno()%>"><!-- 수정할 게시글페이지의 번호를 넘기는 것  -->	
						<input type="hidden" id="hide3" value="<%=rec.getReportcommentno()%>"><!-- 댓글 고유번호를 넘기는 것 -->	
						<%-- <input type="hidden" id="hide3" value="<%=checkReplyNo%>"> --%>
						
						</td>
						<td style="padding-left:30px; padding-right:30px;"> 
						
<!-- 						<a href="/cs/altercom2?email=$('hide1').val()$report('hide2').val()&reportcommentno=$('hide3').val()&contents=$('')    "  > 댓글수정완료</a>				
 -->						
 						<input type="button" onclick="alertcomment2();" value="댓글 수정완료"> 
						
						</td>
					</tr>	
					<tr style="margin-right:100px; margin-left:100px;">

					</tr> 
				</table>
				<br>
				<div style="align:center;">
				<img src="/cs/images/트와이스.jpg" style="width:700px; height:300px;">	
				<img src="/cs/images/카카오.gif" style="width:200px; height:180px;"><br>
				</div>
				<br><br><br>
			</div>
			
			
			</div>
				<div class="col-sm-2 sidenav">
				<%@ include file="../../include/add.jsp"%>
				</div>
		</div>
	</div>
	<!-- login 관련 modal -->
	<%@ include file="../../include/login.jsp"%>
	
	
	<div>
	<!-- footer -->
	<%@ include file="../../include/footer.jsp"%>
	</div>
	
	</body>
</html>





















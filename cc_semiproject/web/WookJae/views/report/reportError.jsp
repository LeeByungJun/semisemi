<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<%  
	String errormessage=(String)request.getAttribute("error"); 
%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>에러 페이지</title>
	<%@ include file="../../include/meta.jsp"%>
	<script type="text/javascript">
		function checkMain(){
				alert("메인페이지로 이동합니다.");
				location.href="/cs/index.jsp";
			}
	</script>
	<style></style>
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
					<div class="col-sm-8 text-left">					
					<!-- main contents -->
					<% if(errormessage!=null){ %>
					<h1>Error Comfirm : <%=errormessage%></h1>
					<% }else { %>
					<h1>에러발생 :<%=exception.getMessage()%></Ph1>
					<% } %>
					<hr style="clear:both;">
					<div align="center">
					<img src="/cs/images/car2.jpg" width="800"> <br>
					<a href="#" style="border:1px solid red; font-size:20px; background:#cc66ff;" onclick="checkMain();"><font color="white">메인페이지 이동</font></a>	
					</div>
					</div>
					<div class="col-sm-2 sidenav">
						<%@ include file="../../../resources/include/add.jsp" %>
					</div>			
				</div>		
			</div>
			
			<!-- login 관련 modal -->
			<%@ include file="../../../resources/include/login.jsp"%>
		
			<!-- footer -->
			<%@ include file="../../../resources/include/footer.jsp"%>		
		</body>
</html>
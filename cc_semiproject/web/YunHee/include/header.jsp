<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.Member" %>
<% Member loginUser = (Member)session.getAttribute("loginUser"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>헤더</title>
</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a href="../../index.jsp"><img src="../images/C&C Logo.jpg" alt="Logo"
					width="120" height="50"></a>
				<!-- class="navbar-brand" -->
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="#">단기렌트</a></li>
					<!-- class="active" -->
					<li><a href="#">장기렌트</a></li>
					<li><a href="DongGuk/views/p2pRent.jsp">P2P</a></li>
					<li><a href="menuTemplate.jsp">고객센터</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<% if(loginUser == null){ %>
						<li>
							<a href="#" role="button" data-toggle="modal"
								data-target="#login-modal"><span
									class="glyphicon glyphicon-log-in"></span> Login</a>					
						</li>
						<!-- <li><a href="#" role="button"><span
								class="glyphicon glyphicon-log-in"></span> 마이페이지</a></li> -->
					<% }else{ %>
						<li><a><%= loginUser.getName() %>님 환영합니다</a></li>
						<li>
						<a href="/cs/logout" role="button"><span
								class="glyphicon glyphicon-log-out"></span> Logout</a>					
						</li>
						<li><a href="/cs/YunHee/views/myPage.jsp" role="button"><span
								class="glyphicon glyphicon-log-in"></span> 마이페이지</a></li>
					<% } %>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>
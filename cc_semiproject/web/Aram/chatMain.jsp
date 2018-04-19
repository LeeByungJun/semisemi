<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.Member" %>
<!DOCTYPE html >
<html>
<%
	String toID = request.getParameter("toID");
	Member loginUser = (Member)session.getAttribute("loginUser");
	//userID = request.getParameter("userID");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>JSP Ajax 실시간 회원제 채팅서비스</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript">
        function getUnread() {
        	$.ajax({
        	 	type: "POST",
        	 	url: "./chatUnread",
        	 	data: {
        	 		userID: encodeURIComponent('<%= loginUser.getEmail() %>'),
        	 	},
        		success: function(result) {
        			
        			if(result >= 1) {
        				showUnread(result);
        			} else {
        				showUnread('');
        			}
        		}
        	
        	});
        	
        }
        function getInfiniteUnread(){
        	setInterval(function() {
        		getUnread();
        	}, 15000);
        }
       function showUnread(result) {
    	   $('#unread').html(result);
       }
</script>
</head>
<body>
	
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collopse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>

			</button>
			<a class="navbar-brand" href="/cs/Aram/chatMain.jsp">채팅 서비스</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="/cs/Aram/chat.jsp?toID=<%= toID %>">채팅하기</a>
						<!-- <li><a href="find.jsp">회원찾기</a></li> -->
		                <li><a href="/cs/Aram/box.jsp?toID=<%= toID %>">메세지함<span id="unread" class="Label Label-info"></span></a></li> 
		                <li><a href="javascript:history.go(-1);">돌아가기</a></li>
			</ul>

			<%
				if (loginUser == null) {
			%>

			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul></li>
			</ul>
			<%
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span>
				</a>
				<ul class="dropdown-menu">
						<li><a href="logout.jsp">로그아웃</a></li>
				
				</ul>
				</li>
			</ul>
			<%
				}
			%>

		</div>
	</nav>
	
		<div class="alert alert-success" id="successMessage" style="display: none;">
		  <strong>메세지 전송에 성공했습니다.</strong>
		  </div>
		<div class="alert alert-danger" id="dangerMessage" style="display: none;">
		  <strong>이름과 내용을 모두 입력해주세요</strong>
		  </div>
		  <div class="alert alert-warning" id="warningMessage" style="display: none;">
		  <strong>데이터베이스 오류가 발생했습니다.</strong>
		  </div>
	
 <%
     String messageContent = null;
     if (session.getAttribute("messageContent") != null) {
    	 messageContent = (String) session.getAttribute("messageContent");
    	 
     }
     String messageType = null;
     if (session.getAttribute("messageType") != null) {
    	 messageType = (String) session.getAttribute("messageType");
    	 
     }
        if(messageContent != null) {  
 
 
 
 %>
<div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="vertical-alignment-helper">
  	<div class="modal-dialog vertical-align-center">
  	 	<div class="modal-content <% if(messageType.equals("오류 메시지")) out.println("panel-warning"); else out.println("panel-success");%>">
  	 		<div class="modal-header panel-heading">
  	 			<button type="button" class="close" data-dismiss="modal"> 
  	 			  <span aria-hidden="true">&times</span>
  	 			  <span class="sr-only">Close</span>
  	 			</button>
  	 		    <h4 class="modal-title">
  	 		           <%= messageType %>
  	 		    </h4>
  	 		</div>
  	 	       <div class="modal-body">
  	 	         <%= messageContent %>
  	 	       </div>
  	 	        <div class="modal-footer">
  	 	            <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
  	 	        </div>
  	 	</div>
  	</div>
  </div>
</div>
<script>
 $('#messageModal').modal("show");

</script>

<%
    session.removeAttribute("messageContent");
    session.removeAttribute("messageType");
        }

%>
<%
   
  if(loginUser != null) {
    

%>
<script type="text/javascript">
       $(document).ready(function() {
    	   getInfiniteUnread();
       });

</script>
<%
  }
%>
</body>
</html>
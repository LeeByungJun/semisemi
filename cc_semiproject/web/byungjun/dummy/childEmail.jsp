<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String num = (String)(request.getAttribute("num")); 
	//세션으로 회원가입 처리 해보자
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 전달</title>
<script type="text/javascript" src="/cs/resources/bootstrap/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		setTimeout(function(){
			var email = document.getElementById("email").value;
			alert(email);
			location.href = "/cs/msender?email1=" + email;		
			<%-- opener.document.getElementById("eemail").value = <%= num %>; --%>
			
	        // 창을 닫음
	        window.close();
	        
	       <%--  if(<%=num%> != null){
	        	window.close();
	        } --%>
		},2000);
	});
	
	function callBody(){
		
		<%-- opener.document.getElementById("eemail").value = <%= num %>; --%>
        var fsubmit = $("f1");
        fsubmit.submit();
        
        if(<%=num%> != null){
        	window.close();
        }
	}
	<%-- $(function(){
		$('body').load(function(){
			var email = document.getElementById("email").value;
			alert(email);
			location.href = "/cs/msender?email1=" + email;	
			
			opener.document.getElementById("eemail").value = <%= num %>;
			/* var fsubmit = $("f1");
	        fsubmit.submit(); */
	        
	        window.close();
		});이거 필요없는 파일이야 ajax로할꺼라 아
	}); --%>
	
</script>
</head>
<body onload="">
<form id="f1" method="post" action="../../resources/include/login.jsp">
	<input type="text" id="email" name="email">
	<input type="hidden" id="num" name="num">
</form>
</body>
</html>
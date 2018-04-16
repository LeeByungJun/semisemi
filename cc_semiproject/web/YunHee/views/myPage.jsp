<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.Member, grade.model.vo.Grade" %>
<% 
	//Member member = (Member)session.getAttribute("loginUser"); 
	Member member1 = (Member)request.getAttribute("member");
	Grade grade = (Grade)request.getAttribute("grade");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset= "UTF-8">
<title>MyPage</title>
<%@ include file="../../resources/include/meta.jsp"%>
<script type="text/javascript">
function updateClient(){
	var name = $('#name').val();
	var grade = $('#grade').val();
	var birthday = $('#birthday').val();	
	var email = $('#email').val();
	var phone = $('#phone').val();
	var address = $('#address').val();
	var userpwd1 = $('#userpwd').val();
	var userpwd2 = $('#userpwd2').val();
	
	var ucase = new RegExp("[A-Z]+");
	var lcase = new RegExp("[a-z]+");
	var num = new RegExp("[0-9]+");
	if(!ucase.test(userpwd1) || !lcase.test(userpwd1) || !num.test(userpwd1)){
		//패스워드 체크
		alert("대/소문자/숫자를 한 글자 이상씩 입력해주세요.");
		
	}else if(!ucase.test(userpwd2) || !lcase.test(userpwd2) || !num.test(userpwd2)){
		alert("대/소문자/숫자를 한 글자 이상씩 입력해주세요.");
		
	}else if(userpwd1 != userpwd2){ 
		alert("비밀번호가 일치하지 않습니다.");
	}else if(userpwd1.length < 8 || userpwd2.length < 8){
		alert("비밀번호는 8자리 이상이어야 합니다.");
	}else if(userpwd1 == "" || userpwd2 == ""){
		alert("비밀번호를 입력해주세요.");
	} else {
		
		$.ajax({
    		url : "/cs/mupdate.me",
    		data : {
    			num: $('#num').val(),
    			name : name,
    			grade : grade,
    			birthday : birthday,
    			phone : phone,
    			address : address,
    			email : email,
    			userpwd : userpwd1
    			},
    		type : "post",
    		success : function(data) {
    			if (data != null) {
    				alert("회원정보 수정 성공");
                    location.href = "/cs/index.jsp";
    			} else {
                	alert("회원정보 수정 실패");
                }
    		}
    	});
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
				<%@ include file="../include/sidenav.jsp"%>
			</div>
			<!-- main contents -->
			<div class="col-sm-8 text-left">
				<div align="center">
				<table>
					<tr>
						<td><i class="fa fa-user" style="font-size:36px;"></i></td>
						<td><H2><b>마이 페이지&nbsp;&nbsp;&nbsp;&nbsp;</b></H2></td>
					</tr>
				</table>
				</div>
				<br>
				<form>
					<input type="hidden" id="num" value="<%= member1.getMem_num() %>">
					<table class="table">
						<tr>
							<th style="text-align:right;">이름&nbsp;&nbsp;&nbsp;</th>
							<td><input type="text" id="name" name="name" value="<%= member1.getName() %>" readonly></td>
						</tr>
						<tr>
							<th style="text-align:right;">등급&nbsp;&nbsp;&nbsp;</th>
							<td><input type="text" id="grade" name="grade" value="<%= grade.getG_rank() %>" readonly></td>
						</tr>
						<tr>
							<th style="text-align:right;">생년월일&nbsp;&nbsp;&nbsp;</th>
							<td><input type="text" id="birthday"  name="birthday" value="<%= member1.getBirthday() %>" readonly></td>
						</tr>
						<tr>
							<th style="text-align:right;">휴대폰번호&nbsp;&nbsp;&nbsp;</th>
							<td><input type="text"  id="phone" name="phone" value="<%= member1.getPhone() %>"></td>
						</tr>
						<tr>
							<th style="text-align:right;">주소&nbsp;&nbsp;&nbsp;</th>
							<td><input type="text" id="address" name="address" value="<%= member1.getAddress() %>"></td>
						</tr>
						<tr>
							<th style="text-align:right;">이메일&nbsp;&nbsp;&nbsp;</th>
							<td><input type="text" id="email" name="email" value="<%= member1.getEmail() %>" readonly></td>
						</tr>
						<tr>
							<th style="text-align:right;">비밀번호&nbsp;&nbsp;&nbsp;</th>
							<td><input type="password" name="userpwd" id="userpwd" value=""></td>
						</tr>
						<tr>
							<th style="text-align:right;">비밀번호확인&nbsp;&nbsp;&nbsp;</th>
							<td><input type="password" name="userpwd2" id="userpwd2" required></td><!-- required -->
						</tr>
						<tr height="40">
							<th style="text-align:center;" colspan="2">
							<input type="button" id="update" value="수정하기" onclick="updateClient();"> &nbsp;
							<a href="/cs/mdelete?mem_num=<%= member1.getMem_num() %>">탈퇴하기</a> &nbsp;
							<a href="/cs/index.jsp">시작페이지로</a></th>
						</tr>
					</table>
				</form>
			</div>
			<div class="col-sm-2 sidenav" style="background:white;">
				<%@ include file="../../resources/include/add.jsp"%>
			</div>
		</div>
	</div>
	<!-- login 관련 modal -->
	<%@ include file="../../resources/include/login.jsp"%>

	<!-- footer -->
	<%@ include file="../../resources/include/footer.jsp"%>
</body>
</html>
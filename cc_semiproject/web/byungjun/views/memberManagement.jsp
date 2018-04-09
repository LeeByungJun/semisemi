<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.MemberAdmin,java.util.*" %>
<% 
	ArrayList<MemberAdmin> all = (ArrayList<MemberAdmin>)request.getAttribute("all");
	ArrayList<MemberAdmin> cansell = (ArrayList<MemberAdmin>)request.getAttribute("cansell");
	ArrayList<MemberAdmin> count = (ArrayList<MemberAdmin>)request.getAttribute("count");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리 페이지</title>
<%@ include file="../../resources/include/meta.jsp" %>
<style type="text/css">
	/* th{
		text-align:center;
		width:150px;
	}
	td{
		width:150px;
	} */
	#tab1{
		width:1200px;
	}
	.td1{
		text-align:center;
		width:600px;
		/* width:1000px; */
	}
	#tab2{
		width:70%;
		text-align:center;
	}
	.th1, .td2{
		text-align:center;
	}
	.thth1{
		width:150px;
		text-align:center;
	}
	.thth2{
		width:100px;
		text-align:center;
	}
</style>
</head>
<body>
	<%@ include file="adminHeader.jsp" %>
	
	<!-- sidenav -->
	<div class="container-fluid text-center">
		<div class="row content">
			<!-- main contents -->
			<div class="col-sm-8 text-left">
				<!-- 컨텐츠를 넣으세요 -->
				<h1 align="center" style="margin-left:300px;">회원관리</h1>
				<table border="1" cellspacing="0" id="tab1">
					<tr id="tr1">
						<td class="td1">
							<fieldset align="center" style="">
								<legend>판매가능유저</legend>
								<table align="center">
									<tr><th class="thth1">이메일</th><th class="thth2">이름</th><th class="thth1">전화번호</th><th class="thth2">등급</th></tr>
										<% for(int i=0;i<cansell.size();i++){ %>
										<tr>
											<td class="thth1">
												<%= cansell.get(i).getEmail() %>
											</td>
											<td class="thth2">
												<%= cansell.get(i).getName() %>
											</td>
											<td class="thth1">
												<%= cansell.get(i).getPhone() %>
											</td>
											<td class="thth2">
												<%= cansell.get(i).getG_Rank() %>
											</td>
										</tr>
										<% } %>
								</table>
							</fieldset>
						</td>
						<td class="td1">
							<fieldset align="center" style="">
								<legend>신고받은 횟수 많은 유저</legend>
								<form action="" method="post">
									<table align="center">
										<tr><th class="thth1">이메일</th><th class="thth2">이름</th><th class="thth1">전화번호</th><th class="thth2">신고받은 횟수</th></tr>
										<% for(int i=0;i<count.size();i++){ %>
										<tr>
											<td class="thth1">
												<% if(count.get(i).getCount() >= 3){ %>
													<a href="/cs/admindel?email=<%= count.get(i).getEmail() %>"><%= count.get(i).getEmail() %></a>
												<% }else{ %>
													<%= count.get(i).getEmail() %>
												<% } %>
											</td>
											<td class="thth2">
												<%= count.get(i).getName() %>
											</td>
											<td class="thth1">
												<%= count.get(i).getPhone() %>
											</td>
											<td class="thth2">
												<%= count.get(i).getCount() %>
											</td>
										</tr>
										<% } %>
										<!-- <tr>
										<td colspan="4">
										<input type="submit" value="회원삭제" style="background:red;">
										</td>
										</tr> -->
									</table>
								</form>
							</fieldset>
						</td>
					</tr>
					<tr id="tr2" style="">
						<td class="td2" colspan="2">
							<fieldset align="center" style="">
								<legend>전체회원목록</legend>
								<table align="center" id="tab2">
									<tr><th class="th1">이메일</th><th class="th1">이름</th><th class="th1">전화번호</th><th class="th1">등급</th></tr>
									<% for(int i=0;i<all.size();i++){ %>
										<tr>
											<td class="thth1">
												<%= all.get(i).getEmail() %>
											</td>
											<td class="thth2">
												<%= all.get(i).getName() %>
											</td>
											<td class="thth1">
												<%= all.get(i).getPhone() %>
											</td>
											<td class="thth2">
												<%= all.get(i).getG_Rank() %>
											</td>
										</tr>
									<% } %>
								</table>
						    </fieldset>
						</td>
					</tr>
				</table>
				
				<br><br>
				
			</div>
		</div>

	</div>
	
	
	<%@ include file="../../resources/include/login.jsp" %>
	<%@ include file="../../resources/include/footer.jsp" %>
</body>
</html>
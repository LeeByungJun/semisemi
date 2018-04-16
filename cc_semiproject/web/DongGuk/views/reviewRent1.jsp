%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<%@ include file="../dbconn.jsp" %> <!-- dbCon.jsp 파일을 불러오는 부분입니다. -->
<%@ page import="java.util.*,java.text.*"%>

<!DOCTYPE html>
<html>
<head>
	<%@include file="/include/meta.jsp"%>
	<link href="../sub.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%@include file="/include/header.jsp"%>


	<div class="container-fluid text-center">
		<div class="row content"> 
			<div class="col-sm-2 sidenav">
				<%@include file="/include/sidemenu.jsp"%>
			</div>
			<div class="col-sm-10 text-left">
				<h1>시승기</h1>
					<hr>
					<div class="content" id="review">
						<ul class="review">
							<%
							  sql="select * from xe_review"; //쿼리 부분, 실제 접속 계정에 저장 되어 있는 table을 입력해야 합니다.
							
							  stmt = con.createStatement();  
							  rs = stmt.executeQuery(sql);
							
							  while(rs.next()) {
							%>
							<li class="col-sm-3">						
								<div class="thumb">
									<img src="/cs/DongGuk/resources/img/review/benzs350.jpg" border="0" style="width:100%">							
									<div class="rLine"><img src="/cs/DongGuk/resources/img/common/review.gif"></div>
									</a>							
								</div>
								<h3>
										<%out.print(rs.getString("SUBJECT")); %><br>
										<strong>BENZ S63 AMG 렌트 후기</strong>
									</a>
								</h3>
								<p>
									<%out.print(rs.getString("CONTENT")); %>
								</p>						
							</li>
							<%
							  }
							
							  if(rs != null) rs.close();
							  if(stmt != null)stmt.close();
							  if(con != null)con.close();
							%>


						</ul>	
						<div class="paging-area">
							<ul>
								<li><a href='javascript:alert("첫 페이지 입니다.")'>&lt;</a></li>
								<li class="on">1</li>
								<li><a href='javascript:alert("마지막 페이지 입니다.")'>&gt;</a></li>
							</ul>				
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/include/footer.jsp"%>
</body>
</html>
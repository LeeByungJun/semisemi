<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="./noticeError.jsp"%>
<%@ page
	import="report.model.vo.Report,member.model.vo.Member, java.util.*"%>

<%
	ArrayList<Report> list = (ArrayList<Report>) request.getAttribute("list");
	//ArrayList<Report> list2 = (ArrayList<Report>) request.getAttribute("list2");
	int listCount = ((Integer) request.getAttribute("listCount")).intValue();

	int	startPage = ((Integer) request.getAttribute("startPage")).intValue();
	int	endPage = ((Integer) request.getAttribute("endPage")).intValue();
	int	maxPage = ((Integer) request.getAttribute("maxPage")).intValue();
	int currentPage = ((Integer) request.getAttribute("currentPage")).intValue();
	//Member loginUser = (Member) session.getAttribute("loginUser");
	/* 저장된 세션으로부터 유저의정보를 가져오며 활용함  */
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>불량고객 신고 게시판</title>
<%@ include file="../../../resources/include/meta.jsp"%>
<script type="text/javascript">
	function reportWrite() {
		/* 글쓰기 페이지로 이동함*/
		location.href = "/cs/WookJae/views/report/reportWrite.jsp";
	}
</script>
<style type="text/css">
#t7 {
	background: #8080c0;
}

#d11 {
	text-align: center;
}

.addfile {
	width: 80px;
}

.writedate {
	width: 90px;
}

.readcount {
	width: 80px;
}

.wno {
	width: 50px;
}
</style>
<script type="text/javascript">
	<%-- $(function() {

		$('#sbtn1').on("click",function() {
							$.ajax({
										url : "/cs/research",
										data : {
											searchoption : $(
													'#sel_1 option:selected')
													.val(),
											search : $('#sub_1').val()
										},
										type : "post",
										datatype : "json",
										success : function(data) {
											<% startPage = 0; endPage = 0; maxPage = 0; %>
											var jsonStr = JSON.stringify(data);
											//json객체 하나(data)를 문자열 형태로 바꿈 

											var json = JSON.parse(jsonStr);
											//문자열을 다시 자바 스크립트가 사용할 수 있는 
											//json객체로 parseing(파싱)함

											var values = "<tr style='height:40px;'><th style='background:#eeeeee; text-align:center;'>번호</th><th style='background:#eeeeee; text-align:center;'>제목</th><th style='background:#eeeeee; text-align:center;'>작성자</th><th style='background:#eeeeee; text-align:center;'>첨부파일</th><th style='background:#eeeeee; text-align:center;'>작성날짜</th><th style='background:#eeeeee; text-align:center;'>조회수</th></tr>";
											for ( var i in json.list) {
												if (json.list[i].r_original_filename != null) {
													values += "<tr style='height:40px;'><td>"
															+ json.list[i].r_no
															+ "</td><td><a href='/cs/rdetail?no="
															+ json.list[i].r_no
															+ "&page=1'>"
															+ json.list[i].r_title
															+ "</a></td><td>"
															+ json.list[i].email
															+ "</td><td> ◐ </td>"
															+ json.list[i].r_original_filename
															+ "</td><td>"
															+ json.list[i].r_sysdate
															+ "</td><td>"
															+ json.list[i].readcount
															+ "</td></tr>";
												} else {
													values += "<tr style='height:40px;'><td>"
															+ json.list[i].r_no
															+ "</td><td><a href='/cs/rdetail?no="
															+ json.list[i].r_no
															+ "&page=1'>"
															+ json.list[i].r_title
															+ "</a></td><td>"
															+ json.list[i].email
															+ "</td><td> - </td>"
															+ json.list[i].r_original_filename
															+ "</td><td>"
															+ json.list[i].r_sysdate
															+ "</td><td>"
															+ json.list[i].readcount
															+ "</td></tr>";
												}
											}
											
											alert("검색이 완료되었습니다!!..");
											$('#search1').html(values);
										},
										error : function(a, b, c) {
											alert(a + " " + b + " " + c);
										}
									});
						});

	}); --%>
	function fnSearch(){
		location.href="/cs/research?searchoption=" + $('#sel_1 option:selected').val() + "&search="+$('#sub_1').val();
		<%-- $.ajax({
			url : "/cs/research",
			data : {
				searchoption : $(
						'#sel_1 option:selected')
						.val(),
				search : $('#sub_1').val()
			},
			type : "post",
			datatype : "json",
			success : function(data) {
				<% startPage = 0; endPage = 0; maxPage = 0; %>
				var jsonStr = JSON.stringify(data);
				//json객체 하나(data)를 문자열 형태로 바꿈 

				var json = JSON.parse(jsonStr);
				//문자열을 다시 자바 스크립트가 사용할 수 있는 
				//json객체로 parseing(파싱)함

				var values = "<tr style='height:40px;'><th style='background:#eeeeee; text-align:center;'>번호</th><th style='background:#eeeeee; text-align:center;'>제목</th><th style='background:#eeeeee; text-align:center;'>작성자</th><th style='background:#eeeeee; text-align:center;'>첨부파일</th><th style='background:#eeeeee; text-align:center;'>작성날짜</th><th style='background:#eeeeee; text-align:center;'>조회수</th></tr>";
				for ( var i in json.list) {
					if (json.list[i].r_original_filename != null) {
						values += "<tr style='height:40px;'><td>"
								+ json.list[i].r_no
								+ "</td><td><a href='/cs/rdetail?no="
								+ json.list[i].r_no
								+ "&page=1'>"
								+ json.list[i].r_title
								+ "</a></td><td>"
								+ json.list[i].email
								+ "</td><td> ◐ </td>"
								+ json.list[i].r_original_filename
								+ "</td><td>"
								+ json.list[i].r_sysdate
								+ "</td><td>"
								+ json.list[i].readcount
								+ "</td></tr>";
					} else {
						values += "<tr style='height:40px;'><td>"
								+ json.list[i].r_no
								+ "</td><td><a href='/cs/rdetail?no="
								+ json.list[i].r_no
								+ "&page=1'>"
								+ json.list[i].r_title
								+ "</a></td><td>"
								+ json.list[i].email
								+ "</td><td> - </td>"
								+ json.list[i].r_original_filename
								+ "</td><td>"
								+ json.list[i].r_sysdate
								+ "</td><td>"
								+ json.list[i].readcount
								+ "</td></tr>";
					}
				}
				
				alert("검색이 완료되었습니다!!..");
				$('#search1').html(values);
			},
			error : function(a, b, c) {
				alert(a + " " + b + " " + c);
			}
		}); --%>
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
			<div class="col-sm-8 text-left">
				<div class="container" style="width: 100%; height: 600%">
					<i class="fa fa-frown-o"
						style="font-size: 42px; float: left; margin-top: 0; margin-right: 5px;'"></i>
					<div align="right">
						<%-- 	<h4>☆★☆ 인기글 Top5 ★☆★</h4>
						<table border="1" style="width: 240px;">
							<%
								if (loginUser != null) {
							%>
							<%
								for (int i = 0; i < list2.size(); i++) {
							%>
							<tr>
								<td id="t7" style="width: 40px;"><B><font color="red">TOP <%=i + 1%></font></B></td>
								<td align="center"><a
									href="/cs/rdetail?no=<%=list2.get(i).getR_no()%>&page=<%=currentPage%>"><%=list2.get(i).getR_title()%>...</a></td>
							</tr>
							<%
								}
							%>
							<%
								} else if (loginUser == null) {
							%>
							<%
								for (int i = 0; i < list2.size(); i++) {
							%>
							<tr>
								<td id="t7"><%=i + 1%>위</td>
								<td align="center"><%=list2.get(i).getR_title()%></td>
							</tr>
							<%
								}
							%>
							<%
								}
							%>
						</table>
						. . .
						.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --%>
						<div align="left">
							<h2 style="color: black; font-family: '굴림체'; margin-top: 5px;">
								<b>Report</b>
							</h2>
						</div>
					</div>


					<%
						if (loginUser != null) {
					%>

					<!-- <input type="hidden" id="ss" value="1">  -->
					<table class="table table-striped" id="search1"
						style="text-align: center; border: 1px solid #dddddd">
						<tr>
							<th class="wno" style="background: #eeeeee; text-align: center;">번호</th>
							<th style="background: #eeeeee; text-align: center;">제목</th>
							<th style="background: #eeeeee; text-align: center;">작성자</th>
							<th class="addfile"
								style="background: #eeeeee; text-align: center;">첨부파일</th>
							<th class="writedate"
								style="background: #eeeeee; text-align: center;">작성날짜</th>
							<th class="readcount"
								style="background: #eeeeee; text-align: center;">조회수</th>
						</tr>
						<%
							for (Report r : list) {
						%>
						<!-- 반복문을 통하여게시판의 내용을불러옴  -->
						<tr>
							<td class="wno" align="center"><%=r.getR_no()%></td>
							<td align="center"><a
								href="/cs/rdetail?no=<%=r.getR_no()%>&page=<%=currentPage%>&commentpage=1">
									<%=r.getR_title()%>
							</a></td>
							<td align="center"><%=r.getEmail()%></td>
							<td class="addfile" align="center">
								<%
									if (r.getR_original_filename() != null) {
								%> ◐ <%
									} else {
								%> - <%
									}
								%>
							</td>
							<td class="writedate" align="center"><%=r.getR_sysdate()%></td>
							<td class="readcount" align="center"><%=r.getReadCount()%></td>
						</tr>
						<%
							}
						%>
					</table>

					<!-- </form> -->
					<hr style="clear: both;">

					<div align="right"
						style="padding-left: 100px; padding-right: 100px;">

						<select id="sel_1">
							<option>작성자(이메일)</option>
							<option>제목</option>
						</select> 
						<input type="text" id="sub_1"> &nbsp; <input
							type="button" id="sbtn1" value="검색" onclick="fnSearch()"> <a
							href="/cs/rlist?page=1"
							style="background-color: #464244; color: white; font-size: 8; border: 2; padding-right: 4px; padding-left: 5px; padding-top: 5px; padding-bottom: 5px;">
							<b>전체목록</b>
						</a> &nbsp;&nbsp;
						<!-- <input type="text" id="sub_1"> &nbsp; <input type="submit" value="검색"> -->
						 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<!--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
						<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						-->
						<button onclick="reportWrite();">Write</button>
					</div>
					<%
						} else {
					%>
					<table class="table table-striped"
						style="text-align: center; cellspacing: 0; border: 1px solid #dddddd">
						<tr>
							<th class="wno" style="background: #eeeeee; text-align: center;">번호</th>
							<th style="background: #eeeeee; text-align: center;">제목</th>
							<th style="background: #eeeeee; text-align: center;">작성자</th>
							<th class="addfile"
								style="background: #eeeeee; text-align: center;">첨부파일</th>
							<th class="writedate"
								style="background: #eeeeee; text-align: center;">작성날짜</th>
							<th class="readcount"
								style="background: #eeeeee; text-align: center;">조회수</th>
						</tr>

						<%
							for (Report r : list) {
						%>
						<!-- 반복문을 통하여게시판의 내용을불러옴  -->
						<tr id="t1">
							<td class="wno" align="center"><%=r.getR_no()%></td>
							<td align="center"><%=r.getR_title()%></td>
							<td align="center"><%=r.getEmail()%></td>
							<td align="center" class="addfile">
								<%
									if (r.getR_original_filename() != null) {
								%> ◐ <%
									} else {
								%> - <%
									}
								%>
							</td>
							<td align="center" class="writedate"><%=r.getR_sysdate()%></td>
							<td align="center" class="readcount"><%=r.getReadCount()%></td>
						</tr>
						<%
							}
						%>
					</table>
					<%
						}
					%>
					<hr style="clear: both;">

					<!-- 페이징 처리 -->
					<% if(startPage > 0 && endPage > 0){ %>
					<div style="text-align: center;">
						<%
							if (currentPage <= 1) {
						%>
						[First] &nbsp;
						<%
							} else {
						%>
						<a href="/cs/rlist?page=1"> [First] </a> &nbsp;
						<%
							}
						%>

						<%-- <% if((currentPage - 10) < startPage && (currentPage - 10) > 1){ %>
							<a href="/cs/rlist?page=<%= startPage - 10 %>">[이전]</a>	
						<% }else{ %>
							[이전]&nbsp;
						<% } %> --%>

						<%
							if (currentPage > startPage) {
						%>
						<a href="/cs/rlist?page=<%=currentPage - 1%>"> [←] </a> &nbsp;
						<%
							} else {
						%>
						[←] &nbsp;
						<%
							}
						%>

						<!-- 현재 페이지가 포함된 그룹의 페이지 숫자 출력 -->
						<%
							for (int p = startPage; p <= endPage; p++) {
								if (p == currentPage) {
						%>
						<font color="#0066ff" size="4"><b>[<%=p%>]
						</b></font> &nbsp;
						<%
							} else {
						%>
						<a href="/cs/rlist?page=<%=p%>"><%=p%></a> &nbsp;
						<%
							}
							}
						%>
						<%
							if (currentPage != endPage) {
						%>
						<a href="/cs/rlist?page=<%=currentPage + 1%>"> [→] </a> &nbsp;
						<%
							} else {
						%>
						[→] &nbsp;
						<%
							}
						%>

						<%-- <% if((currentPage + 10) > endPage 
								&& (currentPage + 10) < maxPage){ %>
							<a href="/cs/rlist?page=<%= endPage + 10 %>">[다음]</a>	
						<% }else{ %>
							[다음]&nbsp;
						<% } %> --%>

						<%
							if (currentPage >= maxPage) {
						%>
						[End]&nbsp;
						<%
							} else {
						%>
						<a href="/cs/rlist?page=<%=maxPage%>">[End]</a>&nbsp;
						<%
							}
						%>
					</div>
					<% } %>
				</div>
			</div>
			<div class="col-sm-2 sidenav" style="background: white;">
				<!-- padding-right: 100px; -->
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
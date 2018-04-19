<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="./reportError.jsp"%>
<%@ page import="report.model.vo.Report, member.model.vo.Member, reportcomment.model.vo.ReportComment"%>	

<% 
	Report report = (Report)request.getAttribute("report");	
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();	
	int reportNo = ((Integer)request.getAttribute("reportNo")).intValue(); 
	
	/* 댓글부문 페이징 처리 부분 */
	ArrayList<ReportComment> list = (ArrayList<ReportComment>)request.getAttribute("Commentlist2"); 
	/* 댓글테이블로부터 목록을 불러옴 body에 테이블에 뿌려줌 */
	//int commentCurrentPage = ((Integer)request.getAttribute("commentCurrentPage")).intValue(); 
	int CommentListCount = ((Integer)request.getAttribute("CommentListCount")).intValue();
	int CstartPage = ((Integer)request.getAttribute("CstartPage")).intValue();
	int CendPage = ((Integer)request.getAttribute("CendPage")).intValue();
	int CmaxPage = ((Integer)request.getAttribute("CmaxPage")).intValue();
	
	
	//Member loginUser = (Member)session.getAttribute("loginUser");
%>	
	
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>상세보기 페이지</title>
		<%@ include file="../../../resources/include/meta.jsp"%>
		
		<style type="text/css">
			table > #c3 {
			align:center;
			}		

		</style>
		<script type="text/javascript" src="../../../resources/bootstrap/js/jquery-3.3.1.min.js"></script>
	
		<script type="text/javascript">
		/* $(function(){
		//댓글추가 ajax		
		$('join2').click(function(){
			alert("댓글추가 버튼동작 실행~");
			 $.ajax({
					url : "addcom2",
					data : { username : $('#hide').val(), reportNo : $('#hide2').val(), addcomments : $('#text1').val() },
					type : "get"
						
					});			 
				 });			
			}); */
		
		$(function(){

			$("#b1").click(function(){
				alert("댓글 등록이 완료되었습니다!^^");
				$.ajax({
					url : "/cs/pluscomment",
					data : { 
							 username:$("#hide1").val(), 
						     reportNo:$("#hide2").val(), 
							 addcomments:$('#text1').val() 
						   },
					type : "post",
					dataType : "json",
					success : function(data){
						
						/* var jsonStr = JSON.stringify(data);
						//json객체 하나(data)를 문자열 형태로 바꿈 
						
						var json = JSON.parse(jsonStr);
						//문자열을 다시 자바 스크립트가 사용할 수 있는 
						//json객체로 parseing(파싱)함 */
												
						var values = "<tr>";
						values+="<td style='background-color:#464244; color:white;' align='center'>("+data.useremail+")</td><td colspan='5' align='center' width='1000'><textarea rows='1' cols='90'>"+data.replycontents+"</textarea></td></tr>";
						$('#ta1').append(values);	
						
 						<%-- <td><input type='button' id='d<%=r.getReportcommentno()%>' onclick='deletecomment(this);' value='삭제'>&nbsp;<input type='button' id='u<%=r.getReportcommentno()%>' onclick='alertcomment(this);' value='수정'></td> --%>					
					
					},
					error:function(a,b,c){
						console.log(a+b+c);
					} 
				});	//댓글 신규등록
			});			
		}); //ready
		
		
		 //댓글 추가 
		 /* function addcomment(){
			 alert("새로운 댓글이 등록되었습니다^^");
			 //location.href="/cs/addcom?username="+$('#hide1').val()+"&reportNo="+$('#hide2').val()+"&addcomments="+$('#text1').val();
		 } */
		 
		 
		 //댓글 삭제 
		 /* 해당 댓글의 고유번호와 원글번호 두가지를 인자값으로 보내어 글을삭제한다. */
		  function deletecomment(del){ 
			 alert("기존 댓글이 삭제되었습니다^^");
			 console.log(del.id);
			 location.href="/cs/deletereply?reportCommentNo="+del.id+"&username="+$('#hide3').val()+"&currentReport="+$('#hide4').val()+"&rpage="+$('#hide5').val();			 
			 //console.log(a);
		 } 

			
		 //댓글 수정
		  function alertcomment(chang){
			 console.log(chang.id);			 
			 alert("댓글 수정페이지로 이동합니다.");
			 location.href="/cs/altercom?reportCommentNo="+chang.id; 기존방식 
			
			 
			 
			 
			 /* alert("User가 수정을 시도하셨습니다~");
			 alert(chang.id);
			 $.ajax({
				url : "/cs/abctest",
				data : { 
					useremail : $("#hide1").val(),
					writeNo : $('#hide2').val(),
					replyContents : $('#newchange').val(),
					replyNo : chang.id
				},
				type:"post",
				error:function(){
					console.log(a+b+c);
				} 
			 }); */
		  }
			
		 function loadimage(){
			 $('#sm7').html("<img src='/cs/images/트와이스.jpg' style='width:800px; height:300px;'>");
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
			<div class="col-sm-8 text-left" align="center">
			<!-- <h1 align="center" style="color:drakblue; font-family:'고딕'"><b>공지사항</b></h1> -->
			<br>
			<div id="bd1" align="center">
			<table class="table table-striped" style="text-align:center;"> 
				<tr>
					<th colspan="4"><h2 style="font-weight: bold;">Report</h2></th>
				</tr>
				<tr>
					<td style="color:white; background:black; width:150px;">제목</th> 
					<td style="width:250px;"><%=report.getR_title()%></td> <!-- notice객체의 파일명을 가져온다. -->
					<td style="color:white; background:black; width:150px;">등록일</th>
					<td><%=report.getR_sysdate()%></td> <!-- 글 등록 날짜를 가져온다. -->
				</tr>
				<tr>
					<td style="color:white; background:black;">첨부파일</th>
					<td>
					<% if(report.getR_original_filename()==null){ %>
					&nbsp;&nbsp;&nbsp;&nbsp;	 -
					<% }else{ %>
					<a href="/cs/rfdown?ofile=<%=report.getR_original_filename()%>&rfile=<%=report.getR_rename_filename()%>">
					<%=report.getR_original_filename()%>
					</a>
					<% } %>
					</td>
					<td style="color:white; background:black;">조회수</th>
					<td><%=report.getReadCount()%></td> <!-- 조횟수를 가져온다. -->
				</tr>
				<tr  align="left">
					<td colspan="4" align="left">
					<div id="sm7" contentEditable="true">
					<textarea rows="10" cols="117" readonly style="border:none;"><%=report.getR_contents()%></textarea>	
					<!-- <button onclick="loadimage();">사진불러오기</button> -->
					</div>
					<!-- <img src="/cs/images/트와이스.jpg" style="width: 550px; height:200px;"> -->
					<!-- 글의 내용을 불러온다. -->
					</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align:right;">
						<% if(report.getEmail().equals(loginUser.getEmail())){ %>																			
			            <a href="/cs/rupdateready?no=<%=report.getR_no()%>&page=<%=currentPage%>" style="background-color:#464244; color:white; font-size:10; border:2; padding-right:8px; padding-left:8px; padding-top:8px; padding-bottom:8px;"> <B>수정하기</B> </a> &nbsp;&nbsp; <!-- a태그로 현재페이지 전송후 수정작업..  -->
						<a href="/cs/rdelete?no=<%=report.getR_no()%>" style="background-color:#464244; color:white; font-size:10; border:2; padding-right:8px; padding-left:8px; padding-top:8px; padding-bottom:8px;"> <b>글삭제</b> </a> &nbsp;&nbsp;
						<a href="/cs/rlist?page=<%=currentPage%>" style="background-color:#464244; color:white; font-size:10; border:2; padding-right:8px; padding-left:8px; padding-top:8px; padding-bottom:8px;"> <b>목록으로</b> </a> &nbsp;&nbsp;
						<% }else if(report.getEmail()!=(loginUser.getEmail())){ %>
						<a href="/cs/rlist?page=<%=currentPage%>" style="background-color:#464244; color:white; font-size:10; border:2; padding-right:8px; padding-left:8px; padding-top:8px; padding-bottom:8px;"> <b>목록으로</b> </a> &nbsp;&nbsp;
						<% } %>
					</td>
				</tr>
			</table>
			<br>
			
			

			<!-- <button onclick = "movedeletepage();">글 삭제</button> &nbsp; -->	
			
			<!---------------------------------------------------------- 여기아래서부터 댓글테이블 ------------------------------------------------------------->
			
				<div align="center">
				<h3 align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Reply</b></h3>

				<table border="1" style="width:850px;"> 
						<tr style="margin-right:100px; margin-left:100px;">
						<td align="center" style="background-color:#464244; width:200px; height:30px; color:white;"><%=loginUser.getName()%>(<%=loginUser.getEmail()%>)</td>
						<td colspan="4" style="padding-left:20px; padding-top:10px; padding-bottom:10px; padding-right:20px;">
						<textarea rows="1" cols="60" id="text1"></textarea>
						<input type="hidden" id="hide1" value="<%=loginUser.getEmail()%>"><!-- 로그인한 유저의 이메일자료를 넘기는 것 -->	
						<input type="hidden" id="hide2" value="<%=report.getR_no()%>"><!-- 게시글의 번호를 넘기는 것 -->	
						</td>
						<td style="padding-left:30px; padding-right:30px;"> 
						<!-- <input type="button" onclick="addcomment();" value="댓글등록"> --> 
						<!-- <input type="button" id="join1" value="댓글등록">  -->
						<button id="b1">작성</button>
						</td>
					</tr>
				</table>
				<hr style="clear:both;">
				
<!-- 			<script type="text/javascript">
					function a(data){
						switch(data){
						case "email1":
							break;							
						}					
					}			
				</script> -->
				<table border="1" id="ta1" style="width:850px;"> 								
					<% for(ReportComment r : list){ %> 
						<%if(r.getReportno()==reportNo) { %> <!-- 댓글테이블의 원글번호와 원글 글번호가 일치한것만 댓글 목록을 띄워준다. -->
						<tr id="t1"> 	
							<%if(r.getUserEmail().equals(loginUser.getEmail())){ %> <!-- 댓글테이블에 저장된email정보와 session의 email정보가 일치하면 수정/삭제버튼 활성화 -->											
							
							<td style="background-color:#464244; color:white;" align="center"> 
						    <input type="hidden" id="hide3" value="<%=loginUser.getEmail()%>"><!-- 로그인한 유저의 이메일정보 넘기는 것 -->					
							<input type="hidden" id="hide4" value="<%=report.getR_no()%>"><!-- 현재 페이지의 번호를 넘기는것  -->
							<input type="hidden" id="hide5" value="<%=currentPage%>">
							
							CommentNo : <%=r.getReportcommentno()%> <br>(<%=loginUser.getEmail()%>) 
							</td> 
							
							<td colspan="4" align="center" >						
							<textarea rows="1" cols="70" style="align-content:left;"><%=r.getReportcommentcontents()%></textarea>						
							</td>
							<td style="padding-left:30px; padding-top:10px; padding-bottom:10px; padding-right:10px;">
							
							
							<%-- <input type="hidden" id="hide11" value="<%=r.getReportcommentno()%>"> --%> 
							
 									
							<input type="button" id="d<%=r.getReportcommentno()%>" onclick="deletecomment(this);" value="삭제"> 							
							<input type="button" id="u<%=r.getReportcommentno()%>" onclick="alertcomment(this);" value="수정"> 	

				
							</td>
							
							<% }else { %>	<!-- 이메일이 일치하지않으면 버튼이 안보이며 조회만가능  -->									
							<td style="background-color:#464244; color:white;" align="center"> CommentNo : <%=r.getReportcommentno()%> <br> (<%=r.getUserEmail()%>)</td> 
							<td colspan="4" align="center"> 
							<textarea rows="1" cols="70" style="align-content:left;"><%=r.getReportcommentcontents()%></textarea>	
							</td>
							<td> &nbsp; </td>
							<% } %>
						</tr>	
						<% } %>
					<% } %>	
					
					<!-- 댓글목록 페이징처리 한 페이지당 댓글목록 5개씩 보이도록 한다.  -->
				</table>	
				
				
				
				</div>				
				<!-- 댓글쪽 페이징 처리 -->			
				<% if(CstartPage> 0  && CendPage > 0){ %>
				
				<div>
				<% if(currentPage <= 1){ %>
					[First]&nbsp;
				<% }else{ %>
					<a href="/cs/rdetail?page=1&no=<%=report.getR_no()%>">[First]</a>&nbsp;
				<% } %>
			
				<%-- <% if((currentPage - 10) < CstartPage && (currentPage - 10) > 1){ %>	
					<a href="/cs/rdetail?no=<%=report.getR_no()%>&page=<%= CstartPage - 10 %>">[←]</a>	
				<% }else{ %>
					[←]&nbsp;
				<% } %> --%>
				
				<%-- <% if(currentPage>CstartPage){ %>
					<a href="/cs/rdetail?no<%=report.getR_no()%>&page=<%=currentPage-1%>"> [←] </a> &nbsp;
				<% }else{ %>
					[←] &nbsp;
				<% } %> --%>
				
				<!-- 현재 페이지가 포함된 그룹의 페이지 숫자 출력 -->
				
				<% for(int p = CstartPage; p <= CendPage; p++){ 
						if(p==currentPage){
				%>
					<font color="#0066ff" size="4"><b>[<%= p %>]</b></font>&nbsp;&nbsp;
				<% }else{ %>
					<a href="/cs/rdetail?page=<%=p%>&no=<%=report.getR_no()%>"><%=p%></a>&nbsp;&nbsp;
				<% }
				} %>
			
				<%-- <% if(currentPage!=CendPage){ %>
					<a href="/cs/rdetail?no<%=report.getR_no()%>&page=<%=currentPage+1%>"> [→] </a> &nbsp;
				<% }else{ %>
					[→] &nbsp;
				<% } %> --%>
				
				
				<%-- <% if((currentPage + 10) > CendPage 
						&& (currentPage + 10) < CmaxPage){ %>
					<a href="/cs/rdetail?page=<%= CendPage + 10 %>&no=<%=report.getR_no()%>">[→]</a>	
				<% }else{ %>
					[→]&nbsp;
				<% } %> --%>
				
				<% if(currentPage >= CmaxPage){ %>
					[End]&nbsp;
				<% }else{ %>
					<a href="/cs/rdetail?page=<%= CmaxPage %>&no=<%=report.getR_no()%>">[End]</a>&nbsp;
				<% } %>
				</div>
				
			<% } %>
						
			</div>
			<br><br><br>
			
			</div>
				<div class="col-sm-2 sidenav" style="background:white;">
				<%@ include file="../../../resources/include/add.jsp"%>
				</div>
		</div>
	</div>
	<!-- login 관련 modal -->
	<%@ include file="../../../resources/include/login.jsp"%>
	
	
	<div>
	<!-- footer -->
	<%@ include file="../../../resources/include/footer.jsp"%>
	</div>
	
	</body>
</html>





















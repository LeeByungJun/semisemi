<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../dbconn.jsp"%>
<!-- dbCon.jsp 파일을 불러오는 부분입니다. -->
<%@ page import="java.util.*,java.text.*"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/meta.jsp"%>
<link href="../sub.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="../editor/js/service/HuskyEZCreator.js" charset="utf-8"></script> <!-- editor add -->

</head>
<body>

<%
	String id = request.getParameter("id");
%>
	<!-- header -->
	<%@ include file="../include/header.jsp"%>

	<!-- sidenav -->
	
	<div class="container-fluid text-center">
		<div class="row content" style="display:table; width:100%;">
			<div class="col-sm-2 sidenav">
				<div id="scroll">
					<%@include file="/include/sidemenu.jsp"%>
				</div>
				<script type="text/javascript"> 
					function scroll_follow(id){
					  $(window).scroll(function( )  //스크롤이 움직일때마다 이벤트 발생
					  { 
					      var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.
					      $( id ).stop().animate({top:position+"px"}, 1); //해당 오브젝트 위치값 재설정
					   });
					}
				 	scroll_follow( "#scroll" );

				</script> 
				
				
			</div>
			<div class="col-sm-10 text-left" id="contentWrap1">
				<h1>자유게시판</h1>
				<hr>
				<div class="content" id="review">
					<div class="write-area">
			<form action="/cs/rwrite" method="POST" name="insertForm" enctype="multipart/form-data">
			<div class="table table-responsive">
			
			<table class="table table-striped">
		 	<tr>
		 		<td>제목</td>
		 		<td><input type="text"  class="form-control" name="subject"></td>
		 	</tr>
		 	<tr>
		 		<td>작성자</td>
		 		<td><input type="text"  class="form-control" name="writer"></td>
		 	</tr>
		 	<tr>
		 		<td>글내용</td>
		 		<td><textarea name="ir1" id="ir1" rows="10" cols="100">123</textarea></td>

				
				<script type="text/javascript">
				var oEditors = [];
				
				nhn.husky.EZCreator.createInIFrame({
				   oAppRef: oEditors,
				   elPlaceHolder: "ir1",
				   sSkinURI: "../editor/SmartEditor2Skin.html?ver=201804112",   
				   htParams : {
				      bUseToolbar : true,            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				      bUseVerticalResizer : true,      // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				      bUseModeChanger : true,         // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				      //aAdditionalFontList : aAdditionalFontSet,      // 추가 글꼴 목록
				      fOnBeforeUnload : function(){
				         //alert("완료!");
				      }
				   }, //boolean
				   fOnAppLoad : function(){
				      //예제 코드
				      //oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
				   }
				});
				</script>
		 		<!-- <td><textarea rows="10" cols="50" name="content" class="form-control"></textarea></td> -->
		 	</tr>
		 	<tr>
		 		<td>첨부파일</td>
		 		<td><input type="text"  class="form-control" name="email"></td>
		 	</tr>
		 	
		 	<tr>
		 		<td>작성일</td>
		 		<td><input type="text"  class="form-control" name="writedate"></td>
		 	</tr>
		 	
		 	
		  	<tr>	
		 		<td colspan="2"  class="text-center">
		 		
		 			<input type="hidden" name="num"  <%-- value="<%= num %>" --%>>
			 		<input type="hidden" name="ref"  <%-- value="<%= ref %>" --%>>
			 		<input type="hidden" name="re_step"  <%-- value="<%= re_step %>" --%>>
			 		<input type="hidden" name="re_level"  <%-- value="<%= re_level %>" --%>>
		 		
		 			<input type="submit" value="답글쓰기완료" class="btn btn-success">
		 			<input type="reset" value="취소" class="btn btn-warning">
		 			<input type="button"  class="btn btn-primary" onclick="location.href='RentCarMain.jsp?center=BoardList.jsp'" value="전체글보기">
		 		</td>
		 	</tr>
		 	
		  </table>
		
	
			</div>
			</form> 
					
					<div class="btn-area">
						<a href="reviewRent.jsp" class="left">뒤로가기</a>
						<a href="#" class="right submit">저장하기</a>
					</div>
					<script>
						$(document).ready(function(){
							$(".btn-area a.submit").on("click",function(){
								var form = document.insertForm;
								if( !form.subject.value ){ 
									alert( "제목을 입력해주세요" );
									form.subject.focus();
									return; 
								}
								if( !form.content.value ){ 
									alert( "내용을 입력해주세요" );
									form.content.focus();
									return; 
								}
								form.submit();
							});
						});
					</script>
				</div>
			</div>
		</div>
	
	
	
		</div>
		</div>	
	
	<%@include file="/include/footer.jsp"%>
</body>
</html>
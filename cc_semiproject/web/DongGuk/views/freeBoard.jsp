<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../dbconn.jsp"%>
<!-- dbCon.jsp 파일을 불러오는 부분입니다. -->
<%@ page import="java.util.*,java.text.*"%>


<%

 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
 String today = formatter.format(new java.util.Date());


%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/meta.jsp"%>
<link href="../sub.css?date=<%=today%>" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
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
			<div class="col-sm-10 text-left" id="contentWrap"> 
				<h1>자유게시판</h1>
				<hr>
	<table class="counselList">
	<colgroup>
		<col style="width:160px;">
		<col style="width:100px;">
		<col>
		<col style="width:165px;">
		<col style="width:175px;">
	</colgroup>
	<thead>
	<tr>
		<th>신청일</th>
		<th>구분</th>
		<th>모델</th>
		<th>신청자</th>
		<th>상태</th>
	</tr>
	</thead>
	<tbody>
			<tr>
			<td>sysdate</td>
			<td>	
				리스	
				
			</td>
			<td style="text-align: left; padding-left:10px;">
				자유게시판 내용			</td>
			<td>작성자</td>
			<td>접수중</td>
		</tr>
			<tr>
			<td>sysdate</td>
			<td>	
				장기렌트	
				
			</td>
			<td style="text-align: left; padding-left:10px;">
				자유게시판 내용  			</td>
			<td>작성자</td>
			<td>완료</td>
		</tr>
			<tr>
			<td>sysdate</td>
			<td>	
				리스	
				
			</td>
			<td style="text-align: left; padding-left:10px;">
				자유게시판 내용  			</td>
			<td>작성자</td>
			<td>완료</td>
		</tr>
			<tr>
			<td>sysdate</td>
			<td>	
				장기렌트	
				
			</td>
			<td style="text-align: left; padding-left:10px;">
				자유게시판 내용  			</td>
			<td>작성자</td>
			<td>완료</td>
		</tr>
			<tr>
			<td>sysdate</td>
			<td>	
				장기렌트	
				
			</td>
			<td style="text-align: left; padding-left:10px;">
				자유게시판 내용  			</td>
			<td>작성자</td>
			<td>완료</td>
		</tr>
			<tr>
			<td>sysdate</td>
			<td>	
				장기렌트	
				
			</td>
			<td style="text-align: left; padding-left:10px;">
				자유게시판 내용  			</td>
			<td>작성자</td>
			<td>완료</td>
		</tr>
			<tr>
			<td>sysdate</td>
			<td>	
				장기렌트	
				
			</td>
			<td style="text-align: left; padding-left:10px;">
				자유게시판 내용  			</td>
			<td>작성자</td>
			<td>완료</td>
		</tr>
			<tr>
			<td>sysdate</td>
			<td>	
				장기렌트	
				
			</td>
			<td style="text-align: left; padding-left:10px;">
				자유게시판 내용 			</td>
			<td>작성자</td>
			<td>완료</td>
		</tr>
			<tr>
			<td>sysdate</td>
			<td>	
				리스	
				
			</td>
			<td style="text-align: left; padding-left:10px;">
				자유게시판 내용 			</td>
			<td>작성자</td>
			<td>완료</td>
		</tr>
			<tr>
			<td>sysdate</td>
			<td>	
				리스	
				
			</td>
			<td style="text-align: left; padding-left:10px;">
				자유게시판 내용  		</td>
			<td>작성자</td>
			<td>완료</td>
		</tr>
		</tbody>
</table>
</div>
	
	<%@include file="/include/footer.jsp"%>
</body>
</html>
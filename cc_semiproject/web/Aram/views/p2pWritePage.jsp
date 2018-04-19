<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ page import="p2p.model.vo.p2p, member.model.vo.Member, java.util.*" %>    

    
<!DOCTYPE html>

	<html>
		<head>
		<meta charset=UTF-8>
		<title>게시글 작성하기</title>
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">		
	    <!-- 부트스트랩 CSS 추가하기 -->
	    <link rel="stylesheet" href="./css/bootstrap.min.css">
	    <link rel="stylesheet" href="./css/sidebar.css">	
	
	    <!-- 제이쿼리 자바스크립트 추가하기 -->
	    <script src="../resources/js/jquery-3.2.1.min.js"></script>
	    <!-- Popper 자바스크립트 추가하기 -->
	    <script src="../resources/js/popper.min.js"></script>
	    <!-- 부트스트랩 자바스크립트 추가하기 -->
	    <script src="../resources/js/bootstrap.min.js"></script>	  
	      	
		<script type="text/javascript">   
			function checkWrite(){
				alert("작성이 완료되었습니다 ^^");
			}
		/* 메소드를 작성하는 공간  */
		</script>
		<%@ include file="../../../resources/include/meta.jsp"%>
		
	    
  </head>
	<body>
	<!-- header -->
	<%@ include file="../../../resources/include/header.jsp"%>
	<!-- sidenav -->
	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-2 sidenav">
				<!-- side2 -->
				<%@ include file="../../include/sidemenu.jsp"%>
			</div>
			<!-- main contents -->
			<div class="col-sm-8 text-left">	
			<div style="padding-left:130px;">
		          <div class="page-header mt-3" style="width: 65%; padding-left: 0%" align="left">
			          <!-- <h1>P2P글쓰기 </h1> -->
			          	<!-- <hr style="clear:both;"width="100%"> -->
				          	<form action="/cs/p2pAdd" method="post" enctype="multipart/form-data">
				          		<input type="hidden" name="writerNo" value="<%=loginUser.getMem_num()%>">
				          		<table class="table table-striped" style="text-align:center; width:600px;">
				          		
				          			<tr>
				          				<td colspan="2"><h2>P2P글쓰기</h2></td>
				          			</tr>
				          			<tr>
				          				<td>작성자 : </td><Td><%=loginUser.getName()%></Td>
				          			</tr>
				          			<tr>
				          				<td>제목 : </td><td><input type="text" name="ptitle"></td>
				          			</tr>
				          			<tr>
				          				<td colspan="2" style="padding-left:180px;"><input type="file" name="pfile"></td>
				          			</tr>
				          			<tr>
				          				<td colspan="2"><textarea rows="8" cols="63" name="pcontents"></textarea> </td>
				          			</tr>
				          			<tr>
				          				<td colspan="2">
				          					<input type="submit" class="btn btn-primary" value="작성완료" onclick="checkWrite();">&nbsp;&nbsp;&nbsp; 
				          					<a href="/cs/p2plist?page=1" class="btn btn-primary">돌아가기</a>
				          				</td>
				          			</tr>
				          		</table>
			            </form>
					</div>
		        </div>
		      	</div>
				<div class="col-sm-2 sidenav" style="padding-right: 100px;">
					<%@ include file="../../../resources/include/add.jsp"%>
				</div>
		    </div>
		</div>
		<!-- footer -->
		<%@ include file="../../../resources/include/footer.jsp"%>
		
		</body>
	</html>





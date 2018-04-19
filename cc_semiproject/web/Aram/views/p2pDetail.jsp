<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="p2p.model.vo.p2p, member.model.vo.Member, java.util.*"%>
<%
	p2p p = (p2p) request.getAttribute("p2p");
	/* Member loginUser = (Member) session.getAttribute("loginUser"); */
%>

<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>게시글 상세보기</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 부트스트랩 CSS 추가하기 -->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/sidebar.css">
<%@ include file="../../../resources/include/meta.jsp"%>
<!-- 제이쿼리 자바스크립트 추가하기 -->
<script src="../resources/js/jquery-3.2.1.min.js"></script>
<!-- 부트스트랩 자바스크립트 추가하기 -->
<script src="../resources/js/bootstrap.min.js"></script>

<%@ include file="../../include/meta.jsp"%>
<script type="text/javascript">
	function p2premove() {
		var bool = confirm('정말 삭제하시겠습니까?');
		if (bool == true) {
			alert("게시글이 삭제되었습니다.");
			location.href = "/cs/delp2p?pb=" + $('#c1').val();
		} else {
			alert("게시글 삭제를 취소하셨습니다.");
		}
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
				<%@ include file="../../include/sidemenu.jsp"%>
			</div>

			<!-- main contents -->
			<div class="col-sm-8 text-left">

				<input type="hidden" class="c1" id="c1" value="<%=p.getP_board()%>">

				<main id="main" class="col-md-9 float-left col pl-md-5 pt-3 main">

				<div style="padding-left: 25%;">

					<div class="page-header mt-3"
						style="width: 131%; padding-top: 0px; padding-bottom: 0px; box-shadow: rgba(0, 0, 0, .7) 1px 1px 9px; -webkit-box-shadow: rgba(0, 0, 0, .7) 1px 1px 9px; -moz-box-shadow: rgba(0, 0, 0, .7) 1px 1px 9px; text-shadow: rgba(0, 0, 0, .3) 0 -1px 1px; border-bottom: rgba(0, 0, 0, .3) 1px solid; transition-property: background-color, border, transform; transition-duration: 2s, 2s, 6s; -webkit-trasform-origin: center, center; -moz-transform-origin: center, center; -o-transform-origin: center, center; transform-origin: center, center; -webkit-transition-property: background-color, border, transform; -webkit-transition-duration: 2s, 2s, 6s; -moz-transition-property: background-color, border, transform; -moz-transition-duration: 2s, 2s, 6s; -o-transition-property: background-color, border, transform; -o-transition-duration: 2s, 2s, 6s; background: white;"
						align="center">
						<font style="color: black;"><h2
								id="f1" style="padding-top:8px;">
								제목 :
								<%=p.getP_title()%></h2></font>
					</div>



					<table>
						<tr>
							<td><img src="<%=p.getP_image()%>" width="300" height="202"
								style="border: 1px solid blue;">
							<td>
							<td><textarea rows="10" cols="37" style="font-size: 10;"
									readonly="readonly"><%=p.getP_context()%></textarea></td>
						</tr>
					</table>

					<div align="center">
						<img src="<%=p.getP_image()%>" width="565" height="310"
							style="border: 1px solid blue;">
					</div>
					<br>

					<div align="center">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<%
							if (loginUser.getMem_num() == p.getMem_num()) {
						%>
						<button onclick="p2premove();"
							style="background: black; color: white; width: 80px; height: 33px; border: 1px solid black;">글
							삭제</button>
						&nbsp;&nbsp; <a href="/cs/p2pUpdate?pbno=<%=p.getP_board()%>"
							class="btn btn-primary">글 수정</a> &nbsp;&nbsp;
						<%-- <a href="/cs/p2pdel?p2pNo=<%=p.getP_board()%>" style="padding-bottom: 8px; padding-left: 14px; padding-top: 8px; padding-right: 14px; background: black; color: white; ">글 삭제</a>--%>
						<%
							} else {
						%>
						&nbsp;
						<%
							}
						%>
						<a href="/cs/p2plist?page=1" class="btn btn-primary">돌아가기</a>
					</div>
				</div>
			</div>
			</main>
		<div class="col-sm-2 sidenav" style="">
			<%@ include file="../../../resources/include/add.jsp"%>
		</div>

		</div>

	</div>
	</div>



	<!-- login 관련 modal -->
	<%@ include file="../../../resources/include/login.jsp"%>

	<!-- footer -->
	<%@ include file="../../../resources/include/footer.jsp"%>

</body>
</html>





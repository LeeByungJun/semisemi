<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="rentreview.model.vo.ReviewRent, java.util.*"%>


<%
	ArrayList<ReviewRent> list = (ArrayList<ReviewRent>)request.getAttribute("list");

	int listSize = ((Integer)request.getAttribute("listSize")).intValue();
	int listCount = ((Integer)request.getAttribute("listCount")).intValue();
	int startPage = ((Integer)request.getAttribute("startPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer)request.getAttribute("maxPage")).intValue();			
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
%>


<%

 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
 String today = formatter.format(new java.util.Date());


%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="../../resources/include/meta.jsp"%>
<link href="/cs/DongGuk/sub.css?date=<%=today%>" rel="stylesheet" type="text/css">


</head>
<body>
	<!-- header -->
	<%@ include file="../../resources/include/header.jsp"%>

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
				<h1>시승기</h1>
				<hr>
				<div class="content" id="review">
					<ul class="review">
						<%if(listSize > 0) {%>
							<%for(ReviewRent r : list){ %>
							
								<li class="col-sm-3">
									<div class="thumb">
										<a href="rdetail?rr_num=<%=r.getRr_num()%>">
											<img src="/cs/DongGuk/images/<%=r.getRr_original_filename()%>"
											border="0" style="width: 100%">
										</a>
										<div class="rLine">
											<img src="/cs/DongGuk/resources/img/common/review.gif">
										</div>
										</a>
									</div>
									<h3>
										
										<%=r.getRr_subject()%><br> <strong>
										렌트 후기</strong> </a>
									</h3>
									<p>
										<%=r.getRr_content()%>
									</p>
								
								</li>	
							<% } %>
						<% }else{ %>
							<li>등록된 게시물이 없습니다</li>
						<% } %>
					</ul>
					<div>
						<form action="/cs/rlist" name="frm" method="GET">
							<input type="text" name="keyword" value="">
							<input type="submit" value="검색">
						</form>
					</div>
					<div class="btn-area">
						<a href="/cs/DongGuk/views/reviewWrite.jsp" class="right">글쓰기</a>
					</div>
					<div class="paging-area">
						<ul>
							<li><a href='javascript:alert("첫 페이지 입니다.")'> &lt;</a></li>
							<li class="on">1</li>
							<li><a href='javascript:alert("마지막 페이지 입니다.")'> &gt;</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../../resources/include/footer.jsp"%>
</body>
</html>
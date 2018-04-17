<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../dbconn.jsp"%>
<!-- dbCon.jsp 파일을 불러오는 부분입니다. -->

<%@ page import="rentreview.model.vo.*, member.model.vo.Member"%>	

<% 
	ReviewRent review = (ReviewRent)request.getAttribute("review");	
	ArrayList<ReviewRentComment> comment_list = (ArrayList<ReviewRentComment>)request.getAttribute("comment_list");

	int listSize = ((Integer)request.getAttribute("listSize")).intValue();
	int listCount = ((Integer)request.getAttribute("listCount")).intValue();
	int startPage = ((Integer)request.getAttribute("startPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer)request.getAttribute("maxPage")).intValue();			
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
%>


<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/meta.jsp"%>
<link href="/cs/DongGuk/sub.css" rel="stylesheet" type="text/css">


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
			<div class="col-sm-10 text-left" id="contentWrap1">
				<h1>시승기</h1>
				<div class="content" id="review">
					<div class="write-area">
						<div class="wrapper">
							<div id="pageTitle">
							</div>
							<div class="content">
								<div class="review_detail">
									<button onclick="history.back();" class="top">이전 목록</button>
									<h2>
										<strong><%=review.getRr_subject()%></strong>
									</h2>
									<div class="detail_content">
										<%=review.getRr_content()%>
									</div>
									<button onclick="history.back();" class="buttom">이전 목록</button>
								</div>
							</div>
						</div>
					</div>
					
					<ul class="review">
						<%if(listSize > 0) {%>
							<%for(ReviewRentComment rc : comment_list){ %>
							
								<li class="col-sm-12">
									<h3>
										<%=rc.getRc_content()%>
									</h3>
									<p>
										<%=rc.getRc_date()%>
									</p>
								
								</li>	
							<% } %>
						<% }else{ %>
							<li>등록된 게시물이 없습니다</li>
						<% } %>
					</ul>
					<div id="add-comment">
	                    <form action="/cs/rrcomment" method="post" class="form-horizontal" id="commentForm" role="form">
	                    	<input type="hidden" name="rr_num" value="<%=review.getRr_num()%>">
	                        <div class="form-group">
	                            <label for="email" class="col-sm-2 control-label">Comment</label>
	                            <div class="col-sm-10">
	                              <textarea class="form-control" name="content" rows="5"></textarea>
	                            </div>
	                        </div>
	                        <div class="form-group">
	                            <div class="col-sm-offset-2 col-sm-10">                    
	                                <button class="btn btn-success btn-circle text-uppercase" type="submit" id="submitComment"><span class="glyphicon glyphicon-send"></span> Summit comment</button>
	                            </div>
	                        </div>            
	                    </form>
	                </div>
					<div class="btn-area">
						<a href="/cs/rrdelete?id=<%=review.getRr_num()%>" class="left">삭제</a>
						<a href="/cs/DongGuk/views/reviewUpdate.jsp?id=<%=review.getRr_num()%>" class="right submit">수정</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/include/footer.jsp"%>
</body>
</html>
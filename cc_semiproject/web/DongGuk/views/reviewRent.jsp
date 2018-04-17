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
	
	int category = 0;
	if(request.getParameter("category")!=null){
		category = Integer.parseInt(request.getParameter("category"));
	}

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
	
	<div>
		<div class="row content">
		
			<section id="secondary-banner" class="dynamic-image-10"><!--for other images just change the class name of this section block like, class="dynamic-image-2" and add css for the changed class-->
			    <div class="container">
			        <div class="row">
			            <div class="col-lg-8 col-md-8 col-sm-6 col-xs-12">
			                <h2>렌트후기</h2>
			                <h4>C&amp;C 렌트카를 이용해주신 고객분들의 리뷰입니다.</h4>
			            </div>
			            <div class="col-lg-4 col-md-4 col-sm-6 ">
			                <ul class="breadcrumb">
			                    <li><a href="#">Home</a></li>
			                    <li><a href="#">Portfolio</a></li>
			                    <li>3 Column</li>
			                </ul>
			            </div>
			        </div>
			    </div>
			</section>
			<div class="container" id="review">
				<div class="inner-page portfolio-container row" id="contentWrap">

				<ul class="review portfolioContainer portfolio_3">
					<%if(listSize > 0) {%>
						<%for(ReviewRent r : list){ %>
						
							<li class="col-sm-4">
								<div class="thumb">
									<a href="rrdetail?rr_num=<%=r.getRr_num()%>">
										<img src="/cs/DongGuk/images/<%=r.getRr_original_filename()%>"
										border="0" style="width: 100%">
									</a>
									<div class="rLine">
										<a href="rrdetail?rr_num=<%=r.getRr_num()%>">
										<img src="/cs/DongGuk/resources/img/common/review.gif">
										</a>
									</div>
								</div>
								<h4>
									<a href="rrdetail?rr_num=<%=r.getRr_num()%>">
										<%=r.getRr_subject()%>
									</a>
								</h4>
								<p>
									<%
										String getContent = r.getRr_content().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>","");
										if(getContent.length() > 40){
											out.print(getContent.substring(0,40));
										}else{
											out.print(getContent);
										}
									
									%>
								</p>
							
							</li>	
						<% } %>
					<% }else{ %>
						<li>등록된 게시물이 없습니다</li>
					<% } %>
				</ul>
			</div>
			<div class="row">
				<div class="col-xs-6 col-xs-offset-3">
		    	    <div class="input-group">
		    	    	
		                <div class="input-group-btn search-panel">
		                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
		                    	<span id="search_concept">All</span> <span class="caret"></span>
		                    </button>
		                    <ul class="dropdown-menu" role="menu">
		                      <li><a href="#1">제목</a></li>
		                      <li><a href="#2">작성자</a></li>
		                    </ul>
		                </div>
		                <input type="hidden" name="search_param" value="1" id="search_param">         
		                <input type="text" class="form-control" name="keyword" placeholder="Search">
		                <span class="input-group-btn">
		                    <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search"></span></button>
		                </span>
		   
		            </div>
		        </div>
				<script type="text/javascript">
					$(document).ready(function(e){
				    $('.search-panel .dropdown-menu').find('a').click(function(e) {
				    	e.preventDefault();
						var param = $(this).attr("href").replace("#","");
						var concept = $(this).text();
						$('.search-panel span#search_concept').text(concept);
						$('.input-group #search_param').val(param);
					});
				});
				</script>
	        </div>
			<div class="btn-area">
				<%if(loginUser!=null){%>
				<a href="/cs/DongGuk/views/reviewWrite.jsp" class="right">글쓰기</a>
				<%}%>
			</div>
			
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pagiation-page">
                <ul class="pagination margin-top-20 margin-bottom-none">
                    <li><a href="#"><i class="fa fa-angle-left"></i></a></li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                </ul>
            </div>		
		</div>
	</div>
	<%@ include file="../../resources/include/login.jsp" %>
	<%@include file="../../resources/include/footer.jsp"%>
</body>
</html>
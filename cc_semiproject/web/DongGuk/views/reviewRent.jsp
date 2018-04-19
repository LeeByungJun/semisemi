<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="rentreview.model.vo.ReviewRent,rentreview.model.service.ReviewRentService , java.util.*"%>


<%

	ArrayList<ReviewRent> list = (ArrayList<ReviewRent>)request.getAttribute("list");

	int listTotal = ((Integer)request.getAttribute("listTotal")).intValue();
	int startPage = ((Integer)request.getAttribute("startPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer)request.getAttribute("maxPage")).intValue();			
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
	
	int category = 1;
	String keyword = "";
	
	if(request.getParameter("keyword")!=null){
		keyword = request.getParameter("keyword");
	}
	if(request.getParameter("category")!=null){
		category = Integer.parseInt(request.getParameter("category"));
	}

%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="../../resources/include/meta.jsp"%>
<link href="/cs/DongGuk/sub.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/cs/resources/css/style.css">

<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-116658073-1');
  
  function logoutFunc(){
	  var bool = confirm('정말 로그아웃 하시겠습니까?');
	  if(bool){
		  //true
		  location.href="/cs/logout";
	  }else{
		  //false
		  alert('로그아웃을 취소하셨습니다!');
	  }
  }
</script>

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
			                    <li><a href="/cs">Home</a></li>
			                    <li><a href="/cs/rrlist">렌트후기</a></li>
			                </ul>
			            </div>
			        </div>
			    </div>
			</section>
			<div class="container" id="review">

				<div class="row inner-page"> 
		            <!--FAQ LEFT-->
		            <div class="col-md-3 padding-right-15 md-padding-right-15 padding-left-none sm-padding-left-none xs-padding-left-none xs-margin-top-30">
						<%@ include file="../views/sideContent.jsp"%>
		       		</div>
					<div class="col-md-9 padding-right-none padding-left-30 md-padding-left-30 xs-padding-right-none xs-padding-bottom-40">

						<div class="portfolio-container row" id="contentWrap">
							<ul class="review portfolioContainer portfolio_3">
								<%if(list.size() > 0) {%>
									<%for(ReviewRent r : list){ %>
									
										<li class="col-sm-4">
											<div class="thumb">
												<a href="rrdetail?rr_num=<%=r.getRr_num()%>">
													<img src="/cs/DongGuk/images/<%=r.getRr_original_filename()%>"
													border="0" style="width: 100%; height:170px;">
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
				    	    	<form action="/cs/rrlist" method="GET">
				    	    		<fieldset>
							    	    <div class="input-group">
							                <div class="input-group-btn search-panel">
							                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
							                    	<%if(category==1){%>
							                    	<span id="search_concept">제목</span> <span class="caret"></span>
							                    	<%}else{%>
							                    	<span id="search_concept">작성자</span> <span class="caret"></span>
							                    	<%}%>
							                    </button>
							                    <ul class="dropdown-menu" role="menu">
							                      <li><a href="#1">제목</a></li>
							                      <li><a href="#2">작성자</a></li>
							                    </ul>
							                </div>
							                
							                <input type="hidden" name="category" value="<%=category%>" id="search_param">         
							                <input type="text" class="form-control" name="keyword" placeholder="Search" value="<%=keyword%>">
							                <span class="input-group-btn">
							                    <button class="btn btn-default" type="button" onclick="this.form.submit();"><span class="glyphicon glyphicon-search"></span></button>
							                </span>
							            </div>
									</fieldset>
								</form>
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
				<% if(startPage > 1){ %>
					<li><a href="/cs/rrlist?page=1"><i class="fa fa-angle-double-left"></i></a></li>
				<% } %>
				<% if(currentPage > 1){ %>
					<li><a href="/cs/rrlist?page=<%= (currentPage - 1) %>"><i class="fa fa-angle-left"></i></a></li>
				<% } %>

				<!-- 현재 페이지가 포함된 그룹의 페이지 숫자 출력 -->
				<% for(int p = startPage; p <= endPage; p++){ %>
					<% if(p == currentPage){%>
						<li class="active"><a href="#"><%= p %></a></li>
					<% }else{ %>
						<li><a href="/cs/rrlist?page=<%= p %>"><%= p %></a></li>
					<% } %>
				<% } %>
				
				
				<% if(currentPage < maxPage){ %>
					<li><a href="/cs/rrlist?page=<%= currentPage + 1 %>"><i class="fa fa-angle-right"></i></a></li>
				<% } %>
				
				<% if(endPage < maxPage){ %>
					<li><a href="/cs/rrlist?page=<%= maxPage %>"><i class="fa fa-angle-double-right"></i></a></li>
				<% } %>
				</ul>
				

            </div>		
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../../resources/include/login.jsp" %>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>
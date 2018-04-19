<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="freeboard.model.vo.FreeBoard,rentreview.model.vo.ReviewRent,rentreview.model.service.ReviewRentService, java.util.*"%>


<%

	ArrayList<FreeBoard> list = (ArrayList<FreeBoard>)request.getAttribute("list");


	int listTotal = ((Integer)request.getAttribute("listTotal")).intValue();
	int startPage = ((Integer)request.getAttribute("startPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer)request.getAttribute("maxPage")).intValue();			
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
	
	int category = 1;
	if(request.getParameter("category")!=null){
		category = Integer.parseInt(request.getParameter("category"));
	}
	
	String keyword = "";
	
	if(request.getParameter("keyword")!=null){
		keyword = request.getParameter("keyword");
	}

%>


<!DOCTYPE html>
<html>
<head>
<%@ include file="../../resources/include/meta.jsp"%>
<link href="/cs/DongGuk/sub.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/cs/resources/css/style.css">


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
			                <h2>자동차 팁</h2>
			                <h4>C&amp;C에서 드리는 자동차 관련 팁</h4>
			            </div>
			            <div class="col-lg-4 col-md-4 col-sm-6 ">
			                <ul class="breadcrumb">
			                    <li><a href="/cs">Home</a></li>
			                    <li><a href="/cs/fblist">자동차 팁</a></li>
			                </ul>
			            </div>
			        </div>
			    </div>
			</section>
			<section class="content faq">
		
				<div class="container">
	
			        <div class="row inner-page"> 
			            <!--FAQ LEFT-->
			            <div class="col-md-3 padding-right-15 md-padding-right-15 padding-left-none sm-padding-left-none xs-padding-left-none xs-margin-top-30">
							<%@ include file="../views/sideContent.jsp"%>
			       		</div>
						<div class="col-md-9 padding-right-none padding-left-30 md-padding-left-30 xs-padding-right-none xs-padding-bottom-40">
					    	<div class="accodian_panel">
						        <div class="panel-group description-accordion faq-sort margin-bottom-none" id="accordion">
								<%if(list.size() > 0) {%>
									<%for(FreeBoard fb : list){ %>
									<div class="panel panel-default padding-top-20 padding-bottom-15" data-categories="Electrical,Navigational,Wiring">
										<div class="panel-heading padding-vertical-10 padding-horizontal-15" style="overflow:hidden;">
											<h4 class="panel-title padding-left-30" style="float:left;"><!--  -->
											<a data-toggle="collapse" data-parent="#accordion" href="#collapse<%=fb.getFb_num()%>" class="collapsed" aria-expanded="false"><%=fb.getFb_subject()%></a>

											</h4>
																						<div style="float:right; display:inline-flex;">
												<a href="/cs/DongGuk/views/freeBoardUpdate.jsp?id=<%=fb.getFb_num()%>" style="background:blue; color:white; font-size:12px; border-radius:3px; padding:4px 10px; margin-right:3px;">수정</a>
												<a href="/cs/fbdelete?id=<%=fb.getFb_num()%>" style="background:red; color:white; font-size:12px; border-radius:3px; padding:4px 10px;">삭제</a>
											</div>
											
										</div>
	                               		<div id="collapse<%=fb.getFb_num()%>" class="panel-collapse collapse" style="height: 0px;" aria-expanded="false">
											<div class="panel-body"> 
												<!--Panel_body-->
												<div class="faq_post padding-left-40">
												    <div class="post-entry clearfix margin-top-10">
														<%=fb.getFb_content()%>
												    </div>
												</div>
												<!--Panel_body--> 
									        </div>
									    </div>
									</div>
									<% } %>
								<% }else{ %>
									<li>등록된 게시물이 없습니다</li>
								<% } %>
		                    	</div>
		                	</div>
							<div class="row">
								<div class="col-xs-6 col-xs-offset-3">
					    	    	<form action="/cs/fblist" method="GET">
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
								<a href="/cs/DongGuk/views/freeBoardWrite.jsp" class="right">글쓰기</a>
								<%}%>
							</div>
							
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pagiation-page">

								<ul class="pagination margin-top-20 margin-bottom-none">
								<% if(startPage > 1){ %>
									<li><a href="/cs/fblist?page=1"><i class="fa fa-angle-double-left"></i></a></li>
								<% } %>
								<% if(currentPage > 1){ %>
									<li><a href="/cs/fblist?page=<%= (currentPage - 1) %>"><i class="fa fa-angle-left"></i></a></li>
								<% } %>
				
								<!-- 현재 페이지가 포함된 그룹의 페이지 숫자 출력 -->
								<% for(int p = startPage; p <= endPage; p++){ %>
									<% if(p == currentPage){%>
										<li class="active"><a href="#"><%= p %></a></li>
									<% }else{ %>
										<li><a href="/cs/fblist?page=<%= p %>"><%= p %></a></li>
									<% } %>
								<% } %>
								
								
								<% if(currentPage < maxPage){ %>
									<li><a href="/cs/fblist?page=<%= currentPage + 1 %>"><i class="fa fa-angle-right"></i></a></li>
								<% } %>
								
								<% if(endPage < maxPage){ %>
									<li><a href="/cs/fblist?page=<%= maxPage %>"><i class="fa fa-angle-double-right"></i></a></li>
								<% } %>
								</ul>
				            </div>
		            	</div>

		        	
		        	</div>

				</div>
			</section>
		</div>  
	</div>                
	<%@ include file="../../resources/include/login.jsp" %>
	<%@include file="../include/footer.jsp"%>
</body>
</html>
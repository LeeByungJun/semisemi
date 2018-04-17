<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="freeboard.model.vo.FreeBoard, java.util.*"%>


<%
	ArrayList<FreeBoard> list = (ArrayList<FreeBoard>)request.getAttribute("list");

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
			                <h2>자유게시판</h2>
			                <h4>운전 시 팁, 차량구매 노하우등 C&amp;C 렌트카에서 공유하세요!</h4>
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
			<section class="content faq">
		
				<div class="container">
	
			        <div class="row inner-page"> 
			            <!--FAQ LEFT-->
						<div class="col-md-9 padding-left-none padding-right-30 md-padding-right-30 xs-padding-right-none xs-padding-bottom-40">
						    <div class="accodian_panel">
						        <div class="panel-group description-accordion faq-sort margin-bottom-none" id="accordion">
								<%if(listSize > 0) {%>
									<%for(FreeBoard fb : list){ %>
									<div class="panel panel-default padding-top-20 padding-bottom-15" data-categories="Electrical,Navigational,Wiring">
										<div class="panel-heading padding-vertical-10 padding-horizontal-15">
											<h4 class="panel-title padding-left-30">
											<a data-toggle="collapse" data-parent="#accordion" href="#collapse<%=fb.getFb_num()%>" class="collapsed" aria-expanded="false"><%=fb.getFb_subject()%></a>
											<div style="float:right; display:inline-flex;">
											<a href="/cs/DongGuk/views/freeBoardUpdate.jsp?id=<%=fb.getFb_num()%>" style="background:blue; color:white; font-size:12px; border-radius:3px; padding:4px 10px; margin-right:3px;">수정</a>
											<a href="/cs/fbdelete?id=<%=fb.getFb_num()%>" style="background:red; color:white; font-size:12px; border-radius:3px; padding:4px 10px;">삭제</a>
											</div>
											</h4>
											
											
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
								<a href="/cs/DongGuk/views/freeBoardWrite.jsp" class="right">글쓰기</a>
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
		        		<div class="col-md-3 padding-left-15 md-padding-left-15 padding-right-none sm-padding-left-none xs-padding-left-none xs-margin-top-30">
							<div class="right_faq">
								<div class="side-widget side-content">
									<div class="recent_posts_container padding-bottom-50">
										
			                                <h3 class="recent_posts">RECENT POSTS</h3>
			                                <div class="side-blog"><img src="/cs/images/blog-thumb-1.jpg" class="alignleft" alt=""> <strong>Most recent post</strong>
			                                    <p>Lorem ipsum dolor sit amet, id melius accusam mea ...</p>
			                                </div>
			                                <div class="side-blog"><img src="/cs/images/blog-thumb-2.jpg" class="alignleft" alt=""> <strong>Second most recent post</strong>
			                                    <p>Oblique copiosae dissentiunt ea vim, ius ea ...</p>
			                                </div>
			                                <div class="side-blog"><img src="/cs/images/blog-thumb-3.jpg" class="alignleft" alt=""> <strong>Third most recent post</strong>
			                                    <p>Eos ad errem virtute convenire, ex sea hinc ...</p>
			                                </div>
			                                <div class="side-blog"><img src="/cs/images/blog-thumb-4.jpg" class="alignleft" alt=""> <strong>Fourth most recent post</strong>
			                                    <p>Ea vis gloriatur efficiantur intellegebat, id ...</p>
			                                </div>
			                                <div class="side-blog"><img src="/cs/images/blog-thumb-5.jpg" class="alignleft" alt=""> <strong>Fifth most recent post</strong>
			                                    <p>Sea ea semper eripuit inermis, nec ut elit ...</p>
			                                </div>
			                                
			                        	
		                            </div>
		                    	</div>
		                    </div>
		        			<img src="https://tpc.googlesyndication.com/daca_images/simgad/619241601095039295" style="width:100%;">
		        		</div>
		        	
		        	</div>

				</div>
			</section>
		</div>  
	</div>                
	<%@ include file="../../resources/include/login.jsp" %>
	<%@include file="../../resources/include/footer.jsp"%>
</body>
</html>
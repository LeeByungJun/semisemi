<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="rentreview.model.vo.ReviewRent,rentreview.model.service.ReviewRentService, member.model.vo.Member, rentreview.model.vo.ReviewRentComment, java.util.*"%>	

<% 
	Member m = (Member)session.getAttribute("loginUser");
	ReviewRentService rservice = new ReviewRentService();
	ArrayList<ReviewRent> list = rservice.selectList(1,5);


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
<%@ include file="../../resources/include/meta.jsp"%>
<link href="/cs/DongGuk/sub.css" rel="stylesheet" type="text/css">


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
			<section class="content faq">
		
				<div class="container">
	
			        <div class="row inner-page"> 
			            <!--FAQ LEFT-->
						<div class="col-md-9 padding-left-none padding-right-30 md-padding-right-30 xs-padding-right-none xs-padding-bottom-40">

							<div class="blog-content">
			                    <div class="blog-title">
			                        <h2><%=review.getRr_subject()%></h2>
				                    <ul class="margin-top-10">
				                        <li class="fa fa-calendar"><a href="#"><%=review.getRr_date()%></a></li>
				                        <li class="fa fa-user"><a href="#"><%=review.getRr_writer()%></a></li>
				                    </ul>
			                    	<div class="post-entry clearfix">
			                    		<%=review.getRr_content()%>
			                    	</div>
			                        <div class="clearfix"></div>
			                        




			                        <div class="comments margin-top-30 margin-bottom-40">
			                            <h3 class="padding-top-40 padding-bottom-30"><%=listSize%> COMMENTS</h3>
			                            <ol class="comment-list">
			                            
				                            <%if(listSize > 0) {%>
												<%for(ReviewRentComment rc : comment_list){ %>
					                                <li>
					                                    <div class="comment-profile clearfix margin-top-30">
					                                        <div class="col-lg-1 col-md-1 col-sm-1col-xs-1 threadauthor"> <img src="/cs/images/profile-img.jpg" alt=""> </div>
					                                        <div class="col-lg-11 col-md-11 col-sm-11 col-xs-11">
					                                            <div class="comment-data">
					                                                <div class="comment-author clearfix">
					                                                	<strong><%=rc.getRc_writer()%></strong>|<small><%=rc.getRc_date()%></small>
					                                                </div>
					                                                <div class="comment-text">
					                                                    <p><%=rc.getRc_content()%></p>
					                                                </div>
					                                            </div>
					                                        </div>
					                                    </div>
					                                </li>
												<% } %>
											<% } %>
			                            </ol>
			                        </div>
			                        <div class="leave-comments clearfix xs-margin-bottom-40">
			                            <h3 class="margin-bottom-20">댓글</h3>
			                            <form action="/cs/rrcomment" method="post" class="form-horizontal" name="commentForm" role="form">
			                                <input type="hidden" name="writer" value="<%= m.getName() %>">
			                                <input type="hidden" name="rr_num" value="<%=review.getRr_num()%>">
			                                <textarea class="form-control margin-bottom-none" placeholder="내용을 입력하세요" rows="7" name="content"></textarea>
			                                <input type="submit" id="submitComment" class="pull-left margin-top-10">
			                            </form>
			                            <script>
			                            	$("#submitComment").click(function(){
			                            		var form = document.commentForm;
			                            		form.submit();
			                            	});
			                            </script>
			                        </div>
			                    </div>
			                </div>
							<div class="btn-area margin-top-30">
								<a href="/cs/rrdelete?id=<%=review.getRr_num()%>" class="left">삭제</a>
								<a href="/cs/DongGuk/views/reviewUpdate.jsp?id=<%=review.getRr_num()%>" class="right submit">수정</a>
							</div>
		            	</div>
		        		<div class="col-md-3 padding-left-15 md-padding-left-15 padding-right-none sm-padding-left-none xs-padding-left-none xs-margin-top-30">
							<div class="right_faq">
								<div class="side-widget side-content">
									<div class="recent_posts_container padding-bottom-50">
										
			                                <h3 class="recent_posts">최근리뷰 게시글</h3>
			                                
			                                <%for(ReviewRent recent : list){ %>
			                                <div class="side-blog">
			                                	<img src="/cs/DongGuk/images/<%=recent.getRr_original_filename()%>" class="alignleft" alt="" style="width:50px; height:50px;">
			                                	<strong>
			                                	<%
													String getSubject = recent.getRr_subject();
													if(getSubject.length() > 10){
														out.print(getSubject.substring(0,10));
													}else{
														out.print(getSubject);
													}
			      
			                                	%>
			                                	</strong>
			                                    <p>
													<%
														String getContent = recent.getRr_content().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>","");
														if(getContent.length() > 40){
															out.print(getContent.substring(0,40));
														}else{
															out.print(getContent);
														}
													
													%>
												</p>
			                                </div>
			                                <% } %>
			                                
			                        	
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


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="rentreview.model.vo.ReviewRent,rentreview.model.service.ReviewRentService, member.model.vo.Member, rentreview.model.vo.ReviewRentComment, java.util.*"%>	
<% 
	ReviewRentService rservice = new ReviewRentService();
	ArrayList<ReviewRent> recent_list = rservice.selectList(1,5);
%>

<div class="right_faq">
	<div class="side-widget side-content">
		<div class="list padding-bottom-50">
               <h3 class="margin-bottom-25">고객센터</h3>
               <div class="choose-list">
                   <ul>
                       <li><a href="/cs/rrlist">렌트후기</a></li>
                       <li><a href="/cs/fblist">자동차팁</a></li>
                   </ul>
               </div>
           </div>
		<div class="recent_posts_container padding-bottom-50">
			<h3 class="recent_posts">최근리뷰 게시글</h3>
			
			<%for(ReviewRent recent : recent_list){ %>
			<div class="side-blog" style="overflow:hidden;">
				<a href="/cs/rrdetail?rr_num=<%=recent.getRr_num()%>">
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
				</a>
			</div>
			<% } %>     	
		</div>
	</div>
</div>
<img src="https://tpc.googlesyndication.com/daca_images/simgad/619241601095039295" style="width:100%;">


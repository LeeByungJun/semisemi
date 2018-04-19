<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ page import="p2p.model.vo.p2p, member.model.vo.Member, java.util.*" %>    

<% 
	p2p p = (p2p)request.getAttribute("p2pObject");
	/* Member loginUser = (Member) session.getAttribute("loginUser"); */
%>

    
<!DOCTYPE html>

	<html>
		<head>
		<meta charset=UTF-8>
		<title>P2P게시글 수정하기</title>
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
			function checkComplete(){
				alert("수정을 완료하였습니다^^...");
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
         <div style="padding-left: 0">
                <div class="page-header mt-3" style="padding-left: 0%" align="center">
                  
                         <form action="/cs/p2pRepeat" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="writerNo" value="<%=loginUser.getMem_num()%>">
                            <input type="hidden" name="boardNo" value="<%=p.getP_board()%>">    
                            
                            <table class="table table-striped" style="text-align:center;">
                            <tr align="center"> 
                               <th colspan="2" style="padding-left: 37%;"><font size="5">P2P게시글 수정하기</font></th>
                            </tr>
                            <tr>
                               <td align="center" style=""> <h4> 작성자  </h4></td> <td style=""> <%=loginUser.getEmail()%> </td>                             
                            </tr>
                            <tr>
                               <td style=""> <h4> 제목  </h4></td> <td style=""> <input type="text" name="ptitle" value="<%=p.getP_title()%>" style="width:60%;"> </td>                                   
                            </tr>                         
                          <tr>
                              <td colspan="2"> <img src="<%=p.getP_image()%>" width="440" height="200"> </td>
                          </tr>    
                            <tr>
                               <td colspan="2"> <input type="file" name="pfile" style="padding-left:300px;"> </td>
                            </tr>
                        <tr>
                           <td colspan="2"><textarea rows="5" cols="80" name="pcontents"><%=p.getP_context()%></textarea></td>
                        </tr>
                        <tr align="center">
                           <td colspan="2" align="center"><input type="submit" value="수정완료" onclick="checkComplete();"> &nbsp;&nbsp;&nbsp; <a href="/cs/p2plist?page=1" class="btn btn-primary" style="width: 70px; height: 30px;">Main</a></td>
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





<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ page import="p2p.model.vo.p2p, member.model.vo.Member, java.util.*" %>    
<%
	
%>
<!doctype html>
<html>
  <head>
    <title>P2P상세보기</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- ë¶í¸ì¤í¸ë© CSS ì¶ê°íê¸° -->
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/sidebar.css">
    <%@ include file="../resources/include/meta.jsp"%>
      <script type="text/javascript">   
         function p2premove(){
            var bool = confirm('정말 삭제하시겠습니까?');
            if(bool == true){
               alert("게시글이 삭제되었습니다.");
               location.href="/cs/delp2p?pb="+$('#c1').val();   
            }else{
               alert("게시글 삭제를 취소하셨습니다.");
            }
         }
      </script>
  </head>
  <body>
  	<%@ include file="../resources/include/header.jsp" %>
	<main id="main" class="col-md-9 float-left col pl-md-5 pt-3 main">
          <div class="page-header mt-3">
              <h2>ê¸ ë³´ê¸°</h2>
          </div>
          
          <hr>
          <form class="pt-3 md-3" style="max-width: 920px">
            <div class="form-group">
              <label>ì ëª©</label>
               <p class="lead"> <%-- <%=p.getP_title()%> --%></p>  <p class="lead">ìì±ì: <a href="http://www.naver.com">ë¤ì´ë²</a></p> 
            </div>	   
			
                <hr>
		          <form class="pt-3 md-3" style="max-width: 920px">
		            <div class="form-group">
					&nbsp;&nbsp;<img src="<%-- <%=p.getP_image()%> --%>" width="600" height="350"> 
		            </div>	   
		            <div class="form-group">
		              <p class="boardContent"><font size="5" style="font-family: 'ê³ ë';"><%-- <%=p.getP_context() %> --%></font></p>
		            </div>
				
            <a href="./boardEdit.html" class="btn btn-primary">ê¸ ìì </a>
            <a href="#" class="btn btn-primary">ê¸ ì­ì </a>
            <a href="./board.html" class="btn btn-primary">ê¸ ëª©ë¡</a>
          </form>
        </main>
      </div>
    </div>
    <script src="./js/jquery-3.2.1.min.js"></script>
    <script src="./js/popper.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
	<%@ include file="../resources/include/footer.jsp" %>
	</body>
</html>


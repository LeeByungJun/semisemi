<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.Member" %>
<% Member loginUser = (Member)session.getAttribute("loginUser"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="resources/bootstrap/js/jquery-3.3.1.min.js"></script>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-116658073-1"></script>
<script type="text/javascript"
		src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
  /* window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-116658073-1'); */
  
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

	function fnPayment(){
		//컨트롤러 접근해서 멤버 정보 업그레이드 하기
		
			$.ajax({
				url: '/cs/csellupdate',
				data:{
					email: $('#email').val()
				},
				type:'post',
				success:function(data){
					if(data == 'cancell 변경실패'){
						alert(data);	
					}else{
						
					}
				},
				error:function(a,b,c){
					alert(a + ", " + b + ", " + c);
				}
			});
			
			//y로 바꿔주고 결제창띄우기
			var IMP = window.IMP;
			IMP.init('imp58527987');
			IMP.request_pay({
				pg : 'html5_inicis',
				pay_method : 'vbank',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : $('#sel1 option:selected').val(),
				amount : $('#price').val(),
				buyer_email : $('#email').val(),
				buyer_name : $('#name').val(),
				buyer_tel : $('#phone').val(),
				buyer_addr : '서울특별시 강남구 삼성동',
				buyer_postcode : '123-456'
			}, function(rsp) {
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
				}

				alert(msg);
				location.href="/cs/makechart";
			});
	
		
		
		
		<%-- buyer_name : $('#name').val(),
			buyer_tel : $('#phone').val(), --%>
	} 
	
	$(function(){
		$('#sel1').change(function(){
			var price;
			var kind = $(this).val();
			switch(kind){
			case '1개월 이용권':
				price = 9900;
				break;
			case '3개월 이용권':
				price = 24900; 
				break;
			case '6개월 이용권':
				price = 45900;
				break;
			default:
				price = "선택하세요";
			}
			$('#price').val(price);
		});
	});
</script>
<title>헤더</title>
</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a href="/cs/index.jsp"><img src="/cs/resources/images/C&C Logo.jpg" alt="Logo"
					width="120" height="50"></a>
				<!-- class="navbar-brand" -->
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
				<% if(loginUser == null){ %>
					<li><a href="/cs/HanJin/views/noMemberReservation.jsp">비회원예약</a></li>
					<li><a href="#">P2P</a></li>
				<% }else{ %>
					<li><a href="/cs/HanJin/views/reservationView.jsp">회원예약</a></li>
					<li><a href="/cs/p2plist?page=1">P2P</a></li>
				<% } %>
					<!-- class="active" -->
					<li><a href="/cs/nlist?page=1">고객센터</a></li>
					<li><a href="/cs/rrlist">커뮤니티</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<% if(loginUser == null){ %>
						<li>
							<a href="#" role="button" data-toggle="modal"
								data-target="#login-modal"><span
									class="glyphicon glyphicon-log-in"></span> Login</a>					
						</li>
						<!-- <li><a href="#" role="button"><span
								class="glyphicon glyphicon-log-in"></span> 마이페이지</a></li> -->
					<% }else{ %>
						<li><a><%= loginUser.getName() %>님 환영합니다</a></li>
						<li>
						<a href="javascript:void(0);" role="button" onclick="logoutFunc();"><span
								class="glyphicon glyphicon-log-out"></span> Logout</a>					
						</li>
						<li><a href="/cs/mypage?email=<%= loginUser.getEmail() %>" role="button"><span
								class="glyphicon glyphicon-user"></span> MyPage</a></li>
						<li>
						<% if(loginUser.getCansell().equals("Y")){ %>
							<a href="#">Ticketing</a>
						<% }else{ %><!-- javascript:void(0) -->
							<a href="#" role="button" data-toggle="modal" data-target="#meModal">Ticketing</a>
						<% } %>
						</li>
					<% } %>
				</ul>
			</div>
		</div>
	</nav>
	<!--  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">모달열기</button> -->

  <!-- Modal -->
  <div class="modal fade" id="meModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">P2P이용권</h4>
        </div>
        <div class="modal-body">
        <table>
        <%if(loginUser!=null){ %>
        	<input type="hidden" id="email" value="<%= loginUser.getEmail() %>">
        	<input type="hidden" id="name" value="<%= loginUser.getName() %>">
        	<input type="hidden" id="phone" value="<%= loginUser.getPhone() %>">
        <%} %>
        	
         <tr>
             <td>종류 : &nbsp;&nbsp;&nbsp;&nbsp;</td>
             <td>
                <select id="sel1" style="width:157px;">
                   <option selected>선택하세요</option>
                   <option>1개월 이용권</option>
                   <option>3개월 이용권</option>
                   <option>6개월 이용권</option>          
                </select>
             </td>
        </tr>  
        <tr>
        	<td>가격 : &nbsp;&nbsp;&nbsp;&nbsp;</td><td><input id="price" type="text" readonly></td>
        </tr>
          </table>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" onclick="fnPayment();">결제</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div>

</body>
</html>
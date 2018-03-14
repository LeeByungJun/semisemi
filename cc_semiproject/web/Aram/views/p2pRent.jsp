<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="../../include/meta.jsp"%>
</head>
<body>
	<%@include file="../../include/header.jsp"%>

	<div class="container-fluid text-center">
		<div class="row content"> 
			<div class="col-sm-2 sidenav">
				<%@include file="../../include/sidemenu.jsp"%>
			</div>
			<div class="col-sm-10 text-left">
				<h1>Person to Person</h1>
					<hr>
					<div class="content" id="review">
						<ul class="row review">

							<li class="col-sm-3">						
								<div class="thumb">
									<img src="/cs/DongGuk/resources/img/review/benzs350.jpg" border="0" style="width:100%">							
									<div class="rLine"><img src="/cs/DongGuk/resources/img/common/review.gif"></div>
									</a>							
								</div>
								<h3>
										박OO 고객님<br>
										<strong>BENZ S63 AMG 렌트 후기</strong>
									</a>
								</h3>
								<p>
									안녕하세요!! C&C 렌트카 &nbsp;입니다.&nbsp;&nbsp;BENZ 세단의 끝판왕 세단중의&nbsp;세단&nbsp;&nbsp;S63 AMG&nbsp;렌트 후기 입니다.
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</p>						
							</li>
							<li class="col-sm-3">						
								<div class="thumb">
									<img src="/cs/DongGuk/resources/img/review/bmwx5.jpg" border="0" style="width:100%">							
									<div class="rLine"><img src="/cs/DongGuk/resources/img/common/review.gif"></div>
									</a>
									
								</div>
								<h3>
										정OO 고객님<br>
										<strong>BMW X5 렌트 후기</strong>
									</a>
								</h3>
								<p>
									안녕하세요!! C&C 렌트카 &nbsp;입니다.&nbsp;&nbsp;고급 suv의 상징 BMW X5&nbsp;렌트 후기입니다&nbsp;&nbsp;
									
								</p>						
							</li>
							<li class="col-sm-3">						
								<div class="thumb">
									<img src="/cs/DongGuk/resources/img/review/genesis.jpg" border="0" style="width:100%">							
									<div class="rLine"><img src="/cs/DongGuk/resources/img/common/review.gif"></div>
									</a>
									
								</div>
								<h3>
										최OO 고객님<br>
										<strong>제네시스 렌트 후기</strong>
									</a>
								</h3>
								<p>
									안녕하세요!! C&C 렌트카 &nbsp;입니다.&nbsp;&nbsp;국내 대형세단의 자존심 제네시스 G80&nbsp;렌트 후기입니다&nbsp;&nbsp;
									
								</p>						
							</li>
						</ul>	
						<div class="paging-area">
							<ul>
								<li><a href='javascript:alert("첫 페이지 입니다.")'>&lt;</a></li>
								<li class="on">1</li>
								<li><a href='javascript:alert("마지막 페이지 입니다.")'>&gt;</a></li>
							</ul>				
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../../include/footer.jsp"%>
</body>
</html>
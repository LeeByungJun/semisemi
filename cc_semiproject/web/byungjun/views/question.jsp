<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문하기</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Oswald:700|Patua+One|Roboto+Condensed:700"
	rel="stylesheet">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<%@ include file="../../resources/include/meta.jsp"%>
<style type="text/css">
/* body{
	width:100%;
	height:100%;
	font-family: 'Roboto Condensed', sans-serif;
}
section{
	margin-top:50px;
	margin-left:0px;
	width:80%;
}


h1,h2,h3 {
	margin:0 0 10px 0;
	font-family: 'Patua One', cursive;
	text-transform: uppercase;
	letter-spacing:1px;
}

p{
	margin:0 0 25px;
	font-size:18px;
	line-height:1.6em;
}
a{
	color:#26a5d3;
}
a:hover,a:focus{
	text-decoration:none;
	color:#26a5d3;
}
#contact{
	background:#333333;
	color:#f4f4f4;
	color:black;
	padding-bottom:80px;
}*/

textarea.form-control{
    height:100px;
}
form{
	text-align:center;
	margin-left:200px;
}
form table{
	margin:10px;
	margin-top:50px;
}
form table tr th{
	text-align:center;
	
}
#title{
	font-size:22pt;
}
#btn{
	margin-top:10px;
	width:200px;
}
</style>
</head>
<body>
	<!-- header -->
	<%@ include file="../../resources/include/header.jsp"%>

	<!-- sidenav -->
	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-2 sidenav">
				<!-- side2 -->
				<%@ include file="../../resources/include/sidenav.jsp"%>
			</div>
			<!-- main contents -->
			<div class="col-sm-8 text-left">
				<!-- 컨텐츠를 넣으세요 -->
				
				<!-- <section id="contact" class="content-section text-center">
					<div class="contact-section">
						<div class="container">
							<h2>Contact Us</h2>
							<p>저희 C&C사에 하고 싶은 말을 적어 보내주세요! 고객님의 한마디가 큰 힘이 됩니다.</p>
							<div class="row">
								<div class="col-md-8 col-md-offset-2">
									<form class="form-horizontal">
										<div class="form-group">
											<label for="exampleInputName2">Name</label> <input
												type="text" class="form-control" id="exampleInputName2"
												placeholder="Jane Doe">
										</div>
										<div class="form-group">
											<label for="exampleInputEmail2">Email</label> <input
												type="email" class="form-control" id="exampleInputEmail2"
												placeholder="jane.doe@example.com">
										</div>
										<div class="form-group ">
											<label for="exampleInputText">Your Message</label>
											<textarea class="form-control" placeholder="Description"></textarea>
										</div>
										<button type="submit" class="btn btn-default">보내기</button>
									</form>

									<hr>
									<h3>Our Social Sites</h3>
									<ul class="list-inline banner-social-buttons">
										<li><a href="#" class="btn btn-default btn-lg"><i
												class="fa fa-twitter"> <span class="network-name">Twitter</span></i></a></li>
										<li><a href="#" class="btn btn-default btn-lg"><i
												class="fa fa-facebook"> <span class="network-name">Facebook</span></i></a></li>
										<li><a href="#" class="btn btn-default btn-lg"><i
												class="fa fa-youtube-play"> <span class="network-name">Youtube</span></i></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</section> -->
				<form action="" method="post">
					<table>
						<tr>
							<th id="title">Contact Us</th>
						</tr>
						<tr>
							<th><p>저희 C&C사에 하고 싶은 말을 적어 보내주세요! 고객님의 한마디가 큰 힘이 됩니다</p></th>
						</tr>
						<tr><th><label for="exampleInputName2">Name</label> <input
												type="text" class="form-control" id="exampleInputName2"
												placeholder="Jane Doe"></th></tr>
						<tr><th><label for="exampleInputEmail2">Email</label> <input
												type="email" class="form-control" id="exampleInputEmail2"
												placeholder="jane.doe@example.com"></th></tr>
						<tr><th><label for="exampleInputText">Your Message</label>
											<textarea class="form-control" placeholder="Description"></textarea></th></tr>
						<tr>
							<th><input type="submit" value="보내기" id="btn"></th>
						</tr>
					</table>
				</form>

			</div>
			<%-- <div class="col-sm-2 sidenav">
				<%@ include file="../include/add.jsp"%>
			</div> --%>
		</div>

	</div>



	<!-- login 관련 modal -->
	<%@ include file="../../resources/include/login.jsp"%>

	<!-- footer -->
	<%@ include file="../../resources/include/footer.jsp"%>
</body>
</html>
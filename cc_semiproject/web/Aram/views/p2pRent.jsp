<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="../../include/meta.jsp"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
body {font-family: Arial, Helvetica, sans-serif;}

#myImg {
    border-radius: 5px;
    cursor: pointer;
    transition: 0.3s;
}

#myImg:hover {opacity: 0.7;}

/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.9); /* Black w/ opacity */
}

/* Modal Content (image) */
.modal-content {
    margin: auto;
    display: block;
    width: 80%;
    max-width: 700px;
}

/* Caption of Modal Image */
#caption {
    margin: auto;
    display: block;
    width: 80%;
    max-width: 700px;
    text-align: center;
    color: #ccc;
    padding: 10px 0;
    height: 150px;
}

/* Add Animation */
.modal-content, #caption {    
    -webkit-animation-name: zoom;
    -webkit-animation-duration: 0.6s;
    animation-name: zoom;
    animation-duration: 0.6s;
}

@-webkit-keyframes zoom {
    from {-webkit-transform:scale(0)} 
    to {-webkit-transform:scale(1)}
}

@keyframes zoom {
    from {transform:scale(0)} 
    to {transform:scale(1)}
}

/* The Close Button */
.close {
    position: absolute;
    top: 15px;
    right: 35px;
    color: #f1f1f1;
    font-size: 40px;
    font-weight: bold;
    transition: 0.3s;
}

.close:hover,
.close:focus {
    color: #bbb;
    text-decoration: none;
    cursor: pointer;
}

/* 100% Image Width on Smaller Screens */
@media only screen and (max-width: 700px){
    .modal-content {
        width: 100%;
    }
}
</style>

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
						<ul class="row review" >

							<li class="col-sm-3">						
								<div class="thumb">
									<img src="../../Aram/resources/img/review/benzs350.jpg" border="0" style="width:100%">							
									
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
									<img src="../../Aram/resources/img/review/bmwx5.jpg" border="0" style="width:100%">							
									
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
								<div class="thumb" >
									<img id= "myImg" img src="../../Aram/resources/img/review/genesis.jpg" alt="10일동안 렌트 해드립니다." border="0" style="width:100%">							
									
									
									
								</div>
								<h3>
										최OO 고객님<br>
										<strong>제네시스 </strong>
									
								</h3>
								<div class="container"></div>
								<!-- <a href="#myModal" role="button" class="btn" data-toggle="modal" data-target="#myModal"> -->
									<p>
									안녕하세요!! C&C 렌트카 &nbsp;입니다.&nbsp;&nbsp;국내 대형세단의 자존심 제네시스 G80&nbsp;렌트 후기입니다&nbsp;&nbsp;
									
								</p>
								
							</li>							
						</ul>	
	<!-- 					<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
   <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">큰 Modal 제목</h4>
      </div>
      <div class="modal-body">
           
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div> -->
								
<div id="myModal" class="modal" >
  <span class="close">&times;</span>
  <img class="modal-content" id="img01">
  <div id="caption"></div>
</div>

<script>
// Get the modal
var modal = document.getElementById('myModal');

// Get the image and insert it inside the modal - use its "alt" text as a caption
var img = document.getElementById('myImg');
var modalImg = document.getElementById("img01");
var captionText = document.getElementById("caption");
img.onclick = function(){
    modal.style.display = "block";
    modalImg.src = this.src;
    captionText.innerHTML = this.alt;
}

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on <span> (x), close the modal
span.onclick = function() { 
    modal.style.display = "none";
}
</script>
					
					
						
					
						<div class="container">

	<!--  <h2 align= center>페이지넘기기 </h2> --> 

	<nav>
	  <ul class="pagination pagination-right">
	
	    <li><a href='javascript:alert("첫 페이지 입니다.")'><span aria-hidden="true">«</span><span class="sr-only">Previous</span></a></li>
	    <li><a href="#">1</a></li>
	    <li><a href="#">2</a></li>
	    <li><a href="#">3</a></li>
	    <li><a href="#">4</a></li>
	    <li><a href="#">5</a></li>
	    <li><a href="#"><span aria-hidden="true">»</span><span class="sr-only">Next</span></a></li>
	  </ul>
	  </ul>
	  </ul>
	</nav>

</div>			
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="../../include/footer.jsp"%>
	
	
</body>
</html>
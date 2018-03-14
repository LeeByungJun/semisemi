<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>C&C 렌터카</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
<script type="text/javascript">
	$(function() {

		var $formLogin = $('#login-form');
		var $formLost = $('#lost-form');
		var $formRegister = $('#register-form');
		var $divForms = $('#div-forms');
		var $modalAnimateTime = 300;
		var $msgAnimateTime = 150;
		var $msgShowTime = 2000;

		$("form")
				.submit(
						function() {
							switch (this.id) {
							case "login-form":
								var $lg_username = $('#login_username').val();
								var $lg_password = $('#login_password').val();
								if ($lg_username == "ERROR") {
									msgChange($('#div-login-msg'),
											$('#icon-login-msg'),
											$('#text-login-msg'), "error",
											"glyphicon-remove", "Login error");
									return false;
								} else {
									msgChange($('#div-login-msg'),
											$('#icon-login-msg'),
											$('#text-login-msg'), "success",
											"glyphicon-ok", "Login OK");
									//alert("로그인 성공!");
									//$('#login-modal').modal("hide");
								}
								return true;
								break;
							case "lost-form":
								var $ls_email = $('#lost_email').val();
								if ($ls_email == "ERROR") {
									msgChange($('#div-lost-msg'),
											$('#icon-lost-msg'),
											$('#text-lost-msg'), "error",
											"glyphicon-remove", "Send error");
								} else {
									msgChange($('#div-lost-msg'),
											$('#icon-lost-msg'),
											$('#text-lost-msg'), "success",
											"glyphicon-ok", "Send OK");
								}
								return false;
								break;
							case "register-form":
								var $rg_username = $('#register_username')
										.val();
								var $rg_email = $('#register_email').val();
								var $rg_password = $('#register_password')
										.val();
								if ($rg_username == "ERROR") {
									msgChange($('#div-register-msg'),
											$('#icon-register-msg'),
											$('#text-register-msg'), "error",
											"glyphicon-remove",
											"Register error");
								} else {
									msgChange($('#div-register-msg'),
											$('#icon-register-msg'),
											$('#text-register-msg'), "success",
											"glyphicon-ok", "Register OK");
								}
								return false;
								break;
							default:
								return false;
							}
							return false;
						});

		$('#login_register_btn').click(function() {
			modalAnimate($formLogin, $formRegister)
		});
		$('#register_login_btn').click(function() {
			modalAnimate($formRegister, $formLogin);
		});
		$('#login_lost_btn').click(function() {
			modalAnimate($formLogin, $formLost);
		});
		$('#lost_login_btn').click(function() {
			modalAnimate($formLost, $formLogin);
		});
		$('#lost_register_btn').click(function() {
			modalAnimate($formLost, $formRegister);
		});
		$('#register_lost_btn').click(function() {
			modalAnimate($formRegister, $formLost);
		});

		function modalAnimate($oldForm, $newForm) {
			var $oldH = $oldForm.height();
			var $newH = $newForm.height();
			$divForms.css("height", $oldH);
			$oldForm.fadeToggle($modalAnimateTime, function() {
				$divForms.animate({
					height : $newH
				}, $modalAnimateTime, function() {
					$newForm.fadeToggle($modalAnimateTime);
				});
			});
		}

		function msgFade($msgId, $msgText) {
			$msgId.fadeOut($msgAnimateTime, function() {
				$(this).text($msgText).fadeIn($msgAnimateTime);
			});
		}

		function msgChange($divTag, $iconTag, $textTag, $divClass, $iconClass,
				$msgText) {
			var $msgOld = $divTag.text();
			msgFade($textTag, $msgText);
			$divTag.addClass($divClass);
			$iconTag.removeClass("glyphicon-chevron-right");
			$iconTag.addClass($iconClass + " " + $divClass);
			setTimeout(function() {
				msgFade($textTag, $msgOld);
				$divTag.removeClass($divClass);
				$iconTag.addClass("glyphicon-chevron-right");
				$iconTag.removeClass($iconClass + " " + $divClass);
			}, $msgShowTime);
		}

		/*
		 * 회원가입 비밀번호 체크 부분
		 */

		$("input[type=password]").keyup(function() {
			var ucase = new RegExp("[A-Z]+");
			var lcase = new RegExp("[a-z]+");
			var num = new RegExp("[0-9]+");

			if ($("#password1").val().length >= 8) {
				$("#8char").removeClass("glyphicon-remove");
				$("#8char").addClass("glyphicon-ok");
				$("#8char").css("color", "#00A41E");
			} else {
				$("#8char").removeClass("glyphicon-ok");
				$("#8char").addClass("glyphicon-remove");
				$("#8char").css("color", "#FF0004");
			}

			if (ucase.test($("#password1").val())) {
				$("#ucase").removeClass("glyphicon-remove");
				$("#ucase").addClass("glyphicon-ok");
				$("#ucase").css("color", "#00A41E");
			} else {
				$("#ucase").removeClass("glyphicon-ok");
				$("#ucase").addClass("glyphicon-remove");
				$("#ucase").css("color", "#FF0004");
			}

			if (lcase.test($("#password1").val())) {
				$("#lcase").removeClass("glyphicon-remove");
				$("#lcase").addClass("glyphicon-ok");
				$("#lcase").css("color", "#00A41E");
			} else {
				$("#lcase").removeClass("glyphicon-ok");
				$("#lcase").addClass("glyphicon-remove");
				$("#lcase").css("color", "#FF0004");
			}

			if (num.test($("#password1").val())) {
				$("#num").removeClass("glyphicon-remove");
				$("#num").addClass("glyphicon-ok");
				$("#num").css("color", "#00A41E");
			} else {
				$("#num").removeClass("glyphicon-ok");
				$("#num").addClass("glyphicon-remove");
				$("#num").css("color", "#FF0004");
			}

			if ($("#password1").val() == $("#password2").val()) {
				$("#pwmatch").removeClass("glyphicon-remove");
				$("#pwmatch").addClass("glyphicon-ok");
				$("#pwmatch").css("color", "#00A41E");
			} else {
				$("#pwmatch").removeClass("glyphicon-ok");
				$("#pwmatch").addClass("glyphicon-remove");
				$("#pwmatch").css("color", "#FF0004");
			}
		});
	});
</script>
<style>
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 450px
}

/* Set gray background color and 100% height */
.sidenav {
	padding-top: 20px;
	background-color: #f1f1f1;
	height: 100%;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
	margin-top: 120px;
}

#menu {
	height: 30px;
}

#utilMenu>ul {
	text-align: right;
	margin-left: 900px;
}

#utilMenu>ul li {
	list-style: none;
	float: left;
}

#utilMenu>ul li a {
	text-decoration: none;
	margin-right: 10px;
	font-size: 8pt;
}

.carousel-inner img {
	-webkit-filter: grayscale(90%);
	filter: grayscale(90%); /* make all photos black and white */
	width: 100%; /* Set width to 100% */
	margin: auto;
}

.carousel-caption h3 {
	color: #fff !important;
}

#imageslide {
	width: 100%;
	margin-top: 20px;
}

@media ( max-width : 600px) {
	.carousel-caption {
		display: none;
		/* Hide the carousel text when the screen is less than 600 pixels wide */
	}
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}

/* 로그인 모달폼 */
@import url(http://fonts.googleapis.com/css?family=Roboto);

* {
	font-family: 'Roboto', sans-serif;
}

#login-modal .modal-dialog {
	width: 350px;
}

#login-modal input[type=text], input[type=password] {
	margin-top: 10px;
}

#div-login-msg, #div-lost-msg, #div-register-msg {
	border: 1px solid #dadfe1;
	height: 30px;
	line-height: 28px;
	transition: all ease-in-out 500ms;
}

#div-login-msg.success, #div-lost-msg.success, #div-register-msg.success
	{
	border: 1px solid #68c3a3;
	background-color: #c8f7c5;
}

#div-login-msg.error, #div-lost-msg.error, #div-register-msg.error {
	border: 1px solid #eb575b;
	background-color: #ffcad1;
}

#icon-login-msg, #icon-lost-msg, #icon-register-msg {
	width: 30px;
	float: left;
	line-height: 28px;
	text-align: center;
	background-color: #dadfe1;
	margin-right: 5px;
	transition: all ease-in-out 500ms;
}

#icon-login-msg.success, #icon-lost-msg.success, #icon-register-msg.success
	{
	background-color: #68c3a3 !important;
}

#icon-login-msg.error, #icon-lost-msg.error, #icon-register-msg.error {
	background-color: #eb575b !important;
}

#img_logo {
	max-height: 100px;
	max-width: 100px;
}

.btn-primary {
	background-color: black;
}

.btn-primary:hover {
	background-color: white;
	color: black;
}

/* #########################################
   #    override the bootstrap configs     #
   ######################################### */
.modal-backdrop.in {
	filter: alpha(opacity = 50);
	opacity: .8;
}

.modal-content {
	background-color: #ececec;
	border: 1px solid #bdc3c7;
	border-radius: 0px;
	outline: 0;
}

.modal-header {
	min-height: 16.43px;
	padding: 15px 15px 15px 15px;
	border-bottom: 0px;
}

.modal-body {
	position: relative;
	padding: 5px 15px 5px 15px;
}

.modal-footer {
	padding: 15px 15px 15px 15px;
	text-align: left;
	border-top: 0px;
}

.checkbox {
	margin-bottom: 0px;
}

.btn {
	border-radius: 0px;
}

.btn:focus, .btn:active:focus, .btn.active:focus, .btn.focus, .btn:active.focus,
	.btn.active.focus {
	outline: none;
}

.btn-lg, .btn-group-lg>.btn {
	border-radius: 0px;
}

.btn-link {
	padding: 5px 10px 0px 0px;
	color: #95a5a6;
}

.btn-link:hover, .btn-link:focus {
	color: #2c3e50;
	text-decoration: none;
}

.glyphicon {
	top: 0px;
}

.form-control {
	border-radius: 0px;
}
</style>
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
				<a href="index.jsp"><img src="images/C&C Logo.jpg" alt="Logo"
					width="120" height="50"></a>
				<!-- class="navbar-brand" -->
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="#">단기렌트</a></li>
					<!-- class="active" -->
					<li><a href="#">장기렌트</a></li>
					<li><a href="DongGuk/views/p2pRent.jsp">P2P</a></li>
					<li><a href="menuTemplate.jsp">고객센터</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#" role="button" data-toggle="modal"
						data-target="#login-modal"><span
							class="glyphicon glyphicon-log-in"></span> Login</a></li>
					<li><a href="YunHee/views/myPage.jsp" role="button"><span
							class="glyphicon glyphicon-log-in"></span> 마이페이지</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="row content">
		<div class="col-sm-8 text-left" id="imageslide">
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
					<li data-target="#myCarousel" data-slide-to="3"></li>
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<img src="images/car4.jpg" alt="New York">
					</div>

					<div class="item">
						<img src="images/car2.jpg" alt="Chicago">
					</div>

					<div class="item">
						<img src="images/car3.jpg" alt="Los Angeles">
					</div>

					<div class="item">
						<img src="images/car5.jpg" alt="Los Angeles">
					</div>
				</div>

				<!-- Left and right controls -->
				<a class="left carousel-control" href="#myCarousel" role="button"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel" role="button"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>
	</div>

	<!-- BEGIN # MODAL LOGIN -->
	<div class="modal fade" id="login-modal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"
		style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" align="center">
					<img class="img-circle" id="img_logo" src="images/C&C Logo.jpg">
					<!-- src="http://bootsnipp.com/img/logo.jpg" -->
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					</button>
				</div>

				<!-- Begin # DIV Form -->
				<div id="div-forms">

					<!-- Begin # Login Form -->
					<form id="login-form" action="login" method="post">
						<div class="modal-body">
							<div id="div-login-msg">
								<div id="icon-login-msg"
									class="glyphicon glyphicon-chevron-right"></div>
								<span id="text-login-msg">이메일과 비밀번호를 입력하세요</span>
							</div>
							<input id="login_username" name="useremail" class="form-control" type="email"
								placeholder="E-mail" required> 
							<input id="login_password" name="userpwd" class="form-control" type="password"
								placeholder="Password" required>
							<div class="checkbox">
								<label> <input type="checkbox"> 아이디 기억
								</label>
							</div>
						</div>
						<div class="modal-footer">
							<div>
								<!-- <button type="submit" class="btn btn-primary btn-lg btn-block"
									id="loginSuccess">로그인</button> -->
								<input type="submit" class="btn btn-primary btn-lg btn-block"
									id="loginSuccess" value="로그인">
							</div>
							<div>
								<button id="login_lost_btn" type="button" class="btn btn-link">비밀번호
									찾기</button>
								<button id="login_register_btn" type="button"
									class="btn btn-link">회원가입</button>
							</div>
						</div>
					</form>
					<!-- End # Login Form -->

					<!-- Begin | Lost Password Form -->
					<form id="lost-form" style="display: none;">
						<div class="modal-body">
							<div id="div-lost-msg">
								<div id="icon-lost-msg"
									class="glyphicon glyphicon-chevron-right"></div>
								<span id="text-lost-msg">이메일을 입력하세요</span>
							</div>
							<input id="lost_email" class="form-control" type="text"
								placeholder="E-Mail (type ERROR for error effect)" required>
						</div>
						<div class="modal-footer">
							<div>
								<button type="submit" class="btn btn-primary btn-lg btn-block">보내기</button>
							</div>
							<div>
								<button id="lost_login_btn" type="button" class="btn btn-link">로그인
								</button>
								<button id="lost_register_btn" type="button"
									class="btn btn-link">회원가입</button>
							</div>
						</div>
					</form>
					<!-- End | Lost Password Form -->
					<!-- Begin | Register Form -->
					<form id="register-form" style="display: none;">
						<div class="modal-body">
							<div id="div-register-msg">
								<div id="icon-register-msg"
									class="glyphicon glyphicon-chevron-right"></div>
								<span id="text-register-msg">계정등록</span>
							</div>
							<input id="register_email" class="form-control" type="email"
								placeholder="이메일" required>
							<button class="btn btn-primary btn-lg btn-block" style="width:100px; margin-top:10px;
								text-align:center; margin-left:100px;">인증</button>
							<input id="register_email_confirm" class="form-control"
								type="text" placeholder="인증번호" required> <input
								id="register_username" class="form-control" type="text"
								placeholder="이름 " required>
							<!-- <input id="register_password" class="form-control" type="password"
								placeholder="비밀번호" required>
							<input id="register_password2" class="form-control" type="password"
								placeholder="비밀번호 재입력" required> -->
							<input type="password" class="form-control" name="password1"
								id="password1" placeholder="New Password" autocomplete="off">
							<div class="row">
								<div class="col-sm-6">
									<span id="8char" class="glyphicon glyphicon-remove"
										style="color: #FF0004;"></span> 8자리이상<br> <span
										id="ucase" class="glyphicon glyphicon-remove"
										style="color: #FF0004;"></span> 대문자한개이상
								</div>
								<div class="col-sm-6">
									<span id="lcase" class="glyphicon glyphicon-remove"
										style="color: #FF0004;"></span> 소문자한개이상<br> <span
										id="num" class="glyphicon glyphicon-remove"
										style="color: #FF0004;"></span> 숫자한개이상
								</div>
							</div>
							<input type="password" class="form-control" name="password2"
								id="password2" placeholder="Repeat Password" autocomplete="off">
							<div class="row">
								<div class="col-sm-12">
									<span id="pwmatch" class="glyphicon glyphicon-remove"
										style="color: #FF0004;"></span> Passwords Match
								</div>
							</div>
							<input id="register_birthday" class="form-control" type="date"
								placeholder="생년월일" required> <input id="register_phone"
								class="form-control" type="text" placeholder="전화번호" required>
							<input id="register_address" class="form-control" type="text"
								placeholder="주소" required>
						</div>
						<div class="modal-footer">
							<div>
								<button type="submit" class="btn btn-primary btn-lg btn-block">회원가입</button>
							</div>
							<div>
								<button id="register_login_btn" type="button"
									class="btn btn-link">로그인</button>
								<button id="register_lost_btn" type="button"
									class="btn btn-link">비밀번호 찾기</button>
							</div>
						</div>
					</form>
					<!-- End | Register Form -->
				</div>
				<!-- End # DIV Form -->

			</div>
		</div>
	</div>
	<!-- END # MODAL LOGIN -->

	<footer class="container-fluid text-center">
		<p>
			상호명 : C&C 렌터카 대표자 : 홍길동 주소 : 서울시 강남구 역삼동 대표자 전화번호 : 02-1234-1234<br>
			여기엔 무엇을 써야 하는가?
		</p>
	</footer>
</body>
</html>
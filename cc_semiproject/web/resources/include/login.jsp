<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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
	<!-- BEGIN # MODAL LOGIN -->
	<div class="modal fade" id="login-modal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"
		style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" align="center">
					<img class="img-circle" id="img_logo" src="/cs/resources/images/C&C Logo.jpg">
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
</body>
</html>
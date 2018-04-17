<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//String num = session1.getAttribute("emailnum");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script type="text/javascript">
	//아이디 기억용 쿠키 생성 및 활용
	function setCookie(cookieName, value, exdays) {
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + exdays);
		var cookieValue = escape(value)
				+ ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
		document.cookie = cookieName + "=" + cookieValue;
	}

	function deleteCookie(cookieName) {
		var expireDate = new Date();
		expireDate.setDate(expireDate.getDate() - 1);
		document.cookie = cookieName + "= " + "; expires="
				+ expireDate.toGMTString();
	}

	function getCookie(cookieName) {
		cookieName = cookieName + '=';
		var cookieData = document.cookie;
		var start = cookieData.indexOf(cookieName);
		var cookieValue = '';
		if (start != -1) {
			start += cookieName.length;
			var end = cookieData.indexOf(';', start);
			if (end == -1)
				end = cookieData.length;
			cookieValue = cookieData.substring(start, end);
		}
		return unescape(cookieValue);
	}

	
	$(function() {

		//로그인 창 열릴 시 쿠키 정보 있나없나 확인해서 이메일 뿌려줌
		var uemail = getCookie("useremail");
		if (uemail) { //쿠키가 존재한다면
			$('#idSave').attr("checked", true);
			$('#login_username').val(uemail);
		}
		

		var $formLogin = $('#login-form');
		var $formLost = $('#lost-form');
		var $formRegister = $('#register-form');
		var $divForms = $('#div-forms');

		var $formidLost = $('#lost-id-form');

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
							case "lost-id-form":
								var $rg_username = $('#lost_id_name').val();
								var $rg_userbirth = $('#lost_id_birth').val();
								if ($rg_username == "ERROR") {
									msgChange($('#div-lost-msg'),
											$('#icon-lost-msg'),
											$('#text-lost-msg'), "error",
											"glyphicon-remove", "Send error");
								} else {
									msgChange($('#div-lost-msg'),
											$('#icon-lost-msg'),
											$('#text-lost-msg'), "id를 여기에",
											"glyphicon-ok", "Send OK");
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

		$('#login_id_lost_btn').click(function() {
			modalAnimate($formLogin, $formidLost);
		});
		/* $('#login_id_lost_btn').click(function(){
			modalAnimate($formLost, $formidLost);
		}); */
		$('#lost_id_login_btn').click(function() {
			modalAnimate($formidLost, $formLogin);
		});
		/* $('#lost_id_lost_btn').click(function({
			modalAnimate($formidLost, $formLost);
		}); */
		$('#lost_id_register_btn').click(function() {
			modalAnimate($formidLost, $formRegister);
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

	valueCheck = false;
	emailConfirm = null;

	function checkEnroll() {
		if (emailConfirm != false) {
			var email = $('#register_email').val();
			var email_confirm = $('#register_email_confirm').val();
			var name = $('#register_username').val();
			var password1 = $('#password1').val();
			var password2 = $('#password2').val();
			var birthday = $('#register_birthday').val();
			var address = $('#register_address').val();
			var phone = $('#register_phone').val();
			//회원가입 유효성 체크
			//이메일 체크
			// 4글자 이상(\w = [a-zA-Z0-9_], [\w-\.]) @가 나오고
			// 1글자 이상(주소). 글자 가 1~3번 반복됨
			var re = /^[\w]{4,}@[\w]+(\.[\w-]+){1,3}$/;
			//비밀번호
			var ucase = new RegExp("[A-Z]+");
			var lcase = new RegExp("[a-z]+");
			var num = new RegExp("[0-9]+");
			//이름 2글자 이상, 한글만
			var re = /^[가-힝]{2,}$/;
			//전화번호 정규식
			var pattern = /^\d{3}-\d{3,4}-\d{4}$/;

			/* if(!re.test(email)){
				alert("이메일을 다시 입력해주세요.");
				return false;
			}else  */if (!ucase.test(password1) || !lcase.test(password1)
					|| !num.test(password1)) {
				//패스워드 체크
				alert("비밀번호를 다시 확인해주세요.");
				return false;
			} else if (!ucase.test(password2) || !lcase.test(password2)
					|| !num.test(password2)) {
				alert("비밀번호를 다시 확인해주세요.");
				return false;
			} else if (password1 != password2) {
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			} else if (password1.length < 8 || password2.length < 8) {
				alert("비밀번호는 8자리 이상이어야 합니다.");
				return false;
			} else if (!re.test(name)) {
				//이름검사
				alert("이름을 다시 입력해주세요.");
				return false;
			} else if(!pattern.test(phone)){
				//전화번호 유효성 검사
				alert("전화번호를 다시 확인하세요.");
				return false;
			} else {
				//alert("성공");
				$.ajax({
					url : "/cs/enroll.me",
					data : {
						email : email,
						name : name,
						userpwd : password1,
						birthday : birthday,
						address : address,
						phone : phone
					},
					type : "post",
					success : function(data) {
						alert(data);
						if (data == '회원가입 성공') {
							//$('#login-modal').modal("hide");
							location.href = "/cs/index.jsp";
						}
					}
				});
			}

		} else {
			return false;
		}
	}

	function goEmail() {
		// 새창에 대한 세팅(옵션)
		//var settings ='toolbar=0,directories=0,status=no,menubar=0,scrollbars=auto,resizable=no,height=400,width=400,left=0,top=0';
		// 자식창을 열고 자식창의 window 객체를 windowObj 변수에 저장
		/* alert($('#register_email').val());
		windowObj = window.open("/cs/byungjun/views/childEmail.jsp","자식창","width=300,height=300"); */

		// 자식창의 childText라는 id를 가진 태그 요소의 값에 부모창의 값을 넣음
		/* windowObj.document.getElementById("email").value = $('#register_email').val(); */
		var email = $('#register_email').val();
		var re = /^[\w]{4,}@[\w]+(\.[\w-]+){1,3}$/;
		if (!re.test(email)) {
			alert("이메일을 다시 입력해주세요.");
		} else {

			$.ajax({
				url : "/cs/msender",
				data : {
					email : $('#register_email').val()
				},
				type : "post",
				success : function(data) {
					if (data != null) {
						alert("발송성공! 인증번호를 입력하세요.");
						$('#register_email').attr('readonly', 'readonly');
						emailConfirm = data;
						valueCheck = true;
						console.log(emailConfirm);
					} else {
						alert("이메일을 확인하고 버튼을 다시 눌러주세요.");
					}

				}
			});

		}
	}

	function checkEmail() {
		var confirm = $('#register_email_confirm').val();
		if (confirm == emailConfirm) {
			valueCheck = true;
			alert("인증번호가 일치합니다!");
			$('#confirmBtn').attr('disabled', 'disabled');
		} else {
			alert("인증번호가 일치하지 않습니다.");
			valueCheck = false;
		}
	}

	function fnLogin() {
		$.ajax({
			url : "/cs/login.me",
			data : {
				useremail : $('#login_username').val(),
				userpwd : $('#login_password').val()
			},
			type : "post",
			success : function(data) {
				
				if (data != "로그인에 실패하였습니다") {
					var selectBox = $('#idSave');
					if (selectBox[0].checked) {
						setCookie("useremail", $('#login_username').val(), 7); /* 유효기간7일 */
					} else {
						deleteCookie("useremail");
					}
					
					alert("로그인 성공!");
					
					/* $('#login-modal').modal("hide"); */
					
					if (data != "pjlee92@naver.com") {
						location.href = "/cs/index.jsp";
					} else {
						location.href = "/cs/byungjun/views/adminMain.jsp";
					}
				}else{
					alert(data);
				}
			}
		});
	}

	/* 아이디찾기 */
	function findId() {
		var name = $('#lost_id_name').val();
		var birth = $('#lost_id_birth').val();

		$.ajax({
			url : "/cs/fid",
			data : {
				username : name,
				userbirth : birth
			},
			type : "post",
			success : function(data) {
				if (data == '조회 실패') {
					alert("이메일 조회 실패.. 정보를 다시 확인하세요!");
				} else {
					alert("당신의 이메일 : " + data);
				}
			}
		});
	}

	/* 비밀번호 재설정 */
	function fnPwd() {
		var email = $('#lost_email').val();

		//임시비밀번호를 이메일로 보내고, 보낸 임시비밀번호로 멤버 정보 갱신 후 유저에게 로그인 유도
		$.ajax({
			url : "/cs/mpsender",
			data : {
				useremail : email
			},
			type : "get",
			success : function(data) {
				alert(data);
			}
		});
	}
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
					<img class="img-circle" id="img_logo"
						src="/cs/resources/images/C&C Logo.jpg">
					<!-- src="http://bootsnipp.com/img/logo.jpg" -->
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					</button>
				</div>

				<!-- Begin # DIV Form -->
				<div id="div-forms">

					<!-- Begin # Login Form -->
					<form id="login-form" action="/cs/login.me" method="post">
						<div class="modal-body">
							<div id="div-login-msg">
								<div id="icon-login-msg"
									class="glyphicon glyphicon-chevron-right"></div>
								<span id="text-login-msg">이메일과 비밀번호를 입력하세요</span>
							</div>
							<input id="login_username" name="useremail" class="form-control"
								type="email" placeholder="E-mail" required> <input
								id="login_password" name="userpwd" class="form-control"
								type="password" placeholder="Password" required>
							<div class="checkbox">
								<label> <input type="checkbox" id="idSave"> 아이디
									기억
								</label>
							</div>
						</div>
						<div class="modal-footer">
							<div>
								<!-- <button type="submit" class="btn btn-primary btn-lg btn-block"
									id="loginSuccess">로그인</button> -->
								<!-- <input type="submit" class="btn btn-primary btn-lg btn-block"
									id="loginSuccess" value="로그인"> -->
								<input type="button" class="btn btn-primary btn-lg btn-block"
									id="loginSuccess" value="로그인" onclick="fnLogin();">
							</div>
							<div>
								<button id="login_id_lost_btn" type="button"
									class="btn btn-link">아이디 찾기</button>
								<button id="login_lost_btn" type="button" class="btn btn-link">비밀번호
									재설정</button>
								<button id="login_register_btn" type="button"
									class="btn btn-link">회원가입</button>
							</div>
						</div>
					</form>
					<!-- End # Login Form -->

					<!-- Begin | Lost Password Form -->
					<form id="lost-form" method="post" action="/cs/msender"
						style="display: none;">
						<div class="modal-body">
							<div id="div-lost-msg">
								<div id="icon-lost-msg"
									class="glyphicon glyphicon-chevron-right"></div>
								<span id="text-lost-msg">이메일을 입력하세요</span>
							</div>
							<input id="lost_email" class="form-control" type="email"
								placeholder="E-Mail" required>
						</div>
						<div class="modal-footer">
							<div>
								<input type="button" class="btn btn-primary btn-lg btn-block"
									value="보내기" onclick="fnPwd();">
							</div>
							<div>
								<button id="lost_login_btn" type="button" class="btn btn-link">로그인
								</button>
								<!-- <button id="login_id_lost_btn" type="button" class="btn btn-link">아이디
									찾기</button> -->
								<!-- <button id="lost_register_btn" type="button"
									class="btn btn-link">회원가입</button> -->
							</div>
						</div>
					</form>
					<!-- End | Lost Password Form -->
					<!-- Begin | Lost ID Form -->
					<form id="lost-id-form" style="display: none;">
						<div class="modal-body">
							<div id="div-lost-msg">
								<div id="icon-lost-msg"
									class="glyphicon glyphicon-chevron-right"></div>
								<span id="text-lost-msg">이름과 생년월일을 입력하세요</span>
							</div>
							<input id="lost_id_name" class="form-control" type="text"
								placeholder="이름" required> <input id="lost_id_birth"
								class="form-control" type="date" placeholder="생년월일" required>
						</div>
						<div class="modal-footer">
							<div>
								<button type="button" class="btn btn-primary btn-lg btn-block"
									onclick="findId();">찾기</button>
							</div>
							<div>
								<button id="lost_id_login_btn" type="button"
									class="btn btn-link">로그인</button>
								<!-- <button id="lost_id_lost_btn" type="button" class="btn btn-link">비밀번호
									찾기</button> -->
								<!-- <button id="lost_id_register_btn" type="button"
									class="btn btn-link">회원가입</button> -->
							</div>
						</div>
					</form>
					<!-- End | Lost Id Form -->
					<!-- Begin | Register Form -->
					<form id="register-form" method="post" action=""
						style="display: none;">
						<!-- /cs/enroll  onsubmit="return checked();" -->
						<div class="modal-body">
							<div id="div-register-msg">
								<div id="icon-register-msg"
									class="glyphicon glyphicon-chevron-right"></div>
								<span id="text-register-msg">계정등록</span>
							</div>
							<input id="register_email" name="useremail" class="form-control"
								type="email" placeholder="이메일" required>
							<!-- <button class="btn btn-primary btn-lg btn-block" style="width:100px; margin-top:10px;
								text-align:center; margin-left:100px;">인증</button> -->
							<input type="button" class="btn btn-primary btn-lg btn-block"
								style="margin-top: 10px; text-align: center;" value="번호발송"
								onclick="goEmail();">
							<!-- <a href="/cs/msender">인증</a> -->
							<input id="register_email_confirm" class="form-control"
								type="text" placeholder="인증번호" required> <input
								type="button" id="confirmBtn"
								class="btn btn-primary btn-lg btn-block"
								style="margin-top: 10px; text-align: center;" value="인증하기"
								onclick="checkEmail();">
							<!-- width:100px; margin-top:10px;
								text-align:center; margin-left:100px; -->
							<input id="register_username" name="username"
								class="form-control" type="text" placeholder="이름 " required>
							<!-- <input id="register_password" class="form-control" type="password"
								placeholder="비밀번호" required>
							<input id="register_password2" class="form-control" type="password"
								placeholder="비밀번호 재입력" required> -->
							<input type="password" name="userpwd" class="form-control"
								name="password1" id="password1" placeholder="New Password"
								autocomplete="off">
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
							<input type="password" class="form-control" id="password2"
								placeholder="Repeat Password" autocomplete="off">
							<div class="row">
								<div class="col-sm-12">
									<span id="pwmatch" class="glyphicon glyphicon-remove"
										style="color: #FF0004;"></span> Passwords Match
								</div>
							</div>
							<input id="register_birthday" name="userbirthday"
								class="form-control" type="date" placeholder="생년월일" required>
							<input id="register_phone" class="form-control" name="userphone"
								type="text" placeholder="전화번호" required> <input
								id="register_address" name="useraddress" class="form-control"
								type="text" placeholder="주소" required>
						</div>
						<div class="modal-footer">
							<div>
								<input type="button" class="btn btn-primary btn-lg btn-block"
									value="회원가입" onclick="checkEnroll();">
								<!-- onclick="fnEnroll();" -->
							</div>
							<div>
								<button id="register_login_btn" type="button"
									class="btn btn-link">로그인</button>
								<!-- <button id="login_id_lost_btn" type="button" class="btn btn-link">아이디
									찾기</button>
								<button id="register_lost_btn" type="button"
									class="btn btn-link">비밀번호 찾기</button> -->
							</div>
						</div>
					</form>
					<!-- End | Register Form -->
					<div id="eemail"></div>
				</div>
				<!-- End # DIV Form -->

			</div>
		</div>
	</div>
	<!-- END # MODAL LOGIN -->
</body>
</html>
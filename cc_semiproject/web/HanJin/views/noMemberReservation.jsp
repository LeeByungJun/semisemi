<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>noMemberReservation</title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="../../resources/include/meta.jsp"%>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<script type="text/javascript"
      src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<!-- //<link rel="stylesheet" href="/resources/demos/style.css" /> -->
<script>


	var insurance = "";
	inselect = new Array();

	$.ajax({
				url : "/cs/inselect",
				data : {
					no : $('#carinsurance_no_1').val()
				},
				type : "post",
				datatype : "json",
				success : function(data) {
					//alert("ggg");

					var jsonStr = JSON.stringify(data);
					var json = JSON.parse(jsonStr);

					var values = "<option>보험선택</option>";

					for ( var i in json.list) {
						//values += "<option>"+decodeURIComponent(json.list[i].carname)+"</option>";
						values += "<option value ='"
								+ decodeURIComponent(json.list[i].carinsurance_name)
								+ "'>"
								+ decodeURIComponent(json.list[i].carinsurance_name)
								+ "</option>";
						inselect[i] = decodeURIComponent(json.list[i].carinsurance_name);
					}
					$('#carinsurance_no_1').html(values);
					/* $('#carinsurance_no_2').html(values); */
					//insurance+=values;
				},
				error : function(a, b, c) {
					console.log(a + b + c);
				}

			});

	$(function() {
		//보험 선택
		$('#carinsurance_no_1').change(
				function() {

					//for(var i in ){
					//$('#carinsurance_no_2').html($("#carinsurance_no_1 option:selected").val());
					$('#carinsurance_no_2').html(
							inselect[$("#carinsurance_no_1 option:selected")
									.val()]);
					//}
				});

		//차종 선택 Ajax
		$('#catype_select1')
				.change(
						function() {

							$.ajax({
										url : "/cs/carcategory",
										data : {
											no : $('#catype_select1').val()
										},
										type : "post",
										dataType : "json",
										success : function(data) {

											var jsonStr = JSON.stringify(data);//데이터 넘어올때 주소값을 String 형태로 바꿔주는 메소드 
											var json = JSON.parse(jsonStr);//json 객체로 형변환 해주는것 !

											var values = '<option>차량선택</option>';

											for ( var i in json.list) {
												//values += "<option>"+decodeURIComponent(json.list[i].carname)+"</option>";
												values += "<option value ='"
														+ decodeURIComponent(json.list[i].carname)
														+ "'>"
														+ decodeURIComponent(json.list[i].carname)
														+ "</option>";
											}

											$('#cartype').html(values);

										},
										error : function(a, b, c) {
											console.log(a + b + c);
										}

									});
						});

		//모달 리스트 출력 
		$('#list_1').click(function() {

			var name = $("#name_1").val();
			var number = $("#nomember1").val();
			/* var gender = $("#gender_1").val(); */
			var gender = "";
			var gen = document.getElementsByName("nomembergender");
			for(var i in gen){
				if(gen[i].checked){
					gender = gen[i].value;
				}
			}
			var age = $("#age_1").val();
			var email = $("#email_1").val();
			var tel = $("#tel_1").val();
			var start = $("#datepicker1").val();
			var end = $("#datepicker2").val();
			var cartype_s = $("#catype_select1 option:checked").text();
			var cartype_i = $("#cartype").val();
			var insurance = $("#carinsurance_no_1").val();
			var note = $("#note_1").val();

			$('#namelist').val(name);
			$('#numberlist').val(number);
			$('#ganderlist').val(gender);
			$('#agelist').val(age);
			$('#emaillist').val(email);
			$('#tellist').val(tel);
			$('#startlist').val(start);
			$('#endlist').val(end);
			$('#catype_select_list').val(cartype_s);
			$('#cartypelist').val(cartype_i);
			$('#insurancelist').val(insurance);
			$('#notelist').val(note);
			

		});
	});

	$(function() {
		$("#datepicker1").datepicker(
				{
					dateFormat : 'yy' + '-' + 'mm' + '-' + 'dd',
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					changeMonth : true, //월변경가능
					changeYear : true, //년변경가능
					showMonthAfterYear : true, //년 뒤에 월 표시
				});
	});
	$(function() {
		$("#datepicker2").datepicker(
				{
					dateFormat : 'yy' + '-' + 'mm' + '-' + 'dd',
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					changeMonth : true, //월변경가능
					changeYear : true, //년변경가능
					showMonthAfterYear : true, //년 뒤에 월 표시

				});

		//달력 유효성 검사

		$('#datepicker1')
				.change(
						function() {

							var startdate = $('#datepicker1').val();
							var enddate = $('#datepicker2').val();

							var date = new Date();

							var year = date.getFullYear();
							var month = date.getMonth() + 1;
							var day = date.getDate();

							if (date.getMonth() + 1 < 10) {
								month = '0' + (date.getMonth() + 1);
							}

							if (date.getDate() + 1 < 10) {
								day = '0' + (date.getDate() + 1);
							}

							var getToday = year + "-" + month + "-" + day;
							//			alert("현재날짜"+getToday);

							//alert(enddate);
							sumdate = '';

							$.ajax({
								url : "/cs/calendar_c",
								data : {
									getToday : getToday,
									startdate : startdate
								},
								type : "post",
								success : function(data) {

									if (data == true) {
										//date = true
										//alert(data);	
										//alert("진행하십시오");							
									} else {
										//date = false
										//alert(data);
										alert(getToday + '이후로 입력바랍니다.');
										$('#datepicker1').val('');
									}
								}
							});

							if (startdate > enddate && startdate != ""
									&& enddate != "") {
								alert('다시 입력바랍니다.');
								$('#datepicker1').val('');

							} else if (startdate < enddate && startdate != ""
									&& enddate != "") {
								//alert('진행하십시오');
							}

						});

		$('#datepicker2')
				.change(
						function() {

							var startdate = $('#datepicker1').val();
							var enddate = $('#datepicker2').val();

							//alert($('#datepicker2').val());

							if (startdate > enddate && startdate != ""
									&& enddate != "") {
								alert('다시 입력바랍니다.');
								$('#datepicker2').val('');

							} else if (startdate < enddate && startdate != ""
									&& enddate != "") {
								//alert('진행하십시오');					
							}

						});

	});

	//////////////////
	//유효성 검사
	
	//결제창 함수
	function pay(){
		alert("a함수 실행 ");
	}
	
	function checkEnroll() {

		var c_name = $('#namelist').val();
		var c_nomember = $('#numberlist').val();
		
		var c_gander=$('#ganderlist').val();
		var c_age=$('#agelist').val();
		
		var c_email = $('#emaillist').val();
		var c_phone = $('#tellist').val();
		
		var c_s_date=$('#startlist').val();
		var c_e_date=$('#endlist').val();
		
		var c_car_s=$('#catype_select_list').val();
		var c_car_t=$('#cartypelist').val();
			
		var c_insurance=$('#insurancelist').val();		
		var c_car_note=$('#notelist').val();
		
		
		//회원가입 유효성 체크
		//이메일 체크
		// 4글자 이상(\w = [a-zA-Z0-9_], [\w-\.]) @가 나오고
		// 1글자 이상(주소). 글자 가 1~3번 반복됨
		var re = /^[\w]{4,}@[\w]+(\.[\w-]+){1,3}$/;
		//비밀번호
		var ucase = new RegExp("[A-Z]+");
		var lcase = new RegExp("[a-z]+");
		
		//이메일 
		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

		///이름 2글자 이상, 한글만
		var re = /^[가-힝]{2,}$/;

		//식별번호 숫자만...
		var num = /^[0-9]*$/;
		//alert(c_name);
		
		
		//전화번호 정규식
		//var pattern = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/; 

		var pattern = /^\d{3}-\d{3,4}-\d{4}$/;


		//alert(c_email);
		if (!re.test(c_name)) {
			/* $('#myModal').modal('hide'); */
			alert("이름을 다시 입력해주세요");
			return false;			

		} else if (!num.test(c_nomember)) {
			alert("숫자만 입력해주세요.");
			/* $('#myModal').modal('hide'); */
			return false;
		} else if (c_nomember.length < 4) {
			alert("식별번호는 4자리 이상이어야 합니다.");
			/* $('#myModal').modal('hide'); */
			return false;

		} else if (!c_gander) {
			alert("성별을 선택하세요.");
			/* $('#myModal').modal('hide'); */
			return false;

		} else if (!c_age) {
			alert("나이를 입력하세요");
			/* $('#myModal').modal('hide'); */
			return false;

		} else if(!regExp.test(c_email)) {
			alert("이메일 형식이 다릅니다.");
			/* $('#myModal').modal('hide'); */
			return false;

		} else if(!pattern.test(c_phone)) {
			alert("연락처 형식이 다릅니다.(예시:010-1234-1234)");
			/* $('#myModal').modal('hide'); */
			return false;
		
		}
		
		else if(!c_s_date) {
			alert("대여 날짜를 적으세요.");
			/* $('#myModal').modal('hide'); */
			return false;
		}else if(!c_e_date) {
			alert("반납 날짜를 적으세요.");
			/* $('#myModal').modal('hide'); */
			return false;
			
			
			
		}else if(c_car_s== '차종') {
			alert("차종을 선택하세요");
			/* $('#myModal').modal('hide'); */
			return false;
			
			
			
		}else if(c_car_t== '차량선택') {
			alert("차량을 선택하세요.");
			/* $('#myModal').modal('hide'); */
			return false;
			
			
			
		}else if(c_insurance == '보험선택') {
			alert("보험을 선택하세요.");
			/* $('#myModal').modal('hide'); */
			return false;
		
		}else{
			alert("예약하겠습니다.");
			//에이작스 처리
			
			var price;
			
			$.ajax({
				url:"/cs/n_m_reservation_a",
				data: {	n_name : c_name,
						n_number : c_nomember,
						n_gander : c_gander,
						n_age : c_age,
						n_email : c_email,
						n_tel : c_phone,
						n_s_date : c_s_date,
						n_e_date : c_e_date,
						c_type : c_car_t,
						n_insurance : c_insurance,
						n_note : c_car_note},
				type:"post",
				dataType:"json",
				success:function(data){
					
					price=data;
					
					//페이
					var IMP = window.IMP;
				      IMP.init('imp58527987');
				      IMP.request_pay({
				         pg : 'kakao', /* html5_inicis */
				         pay_method : 'card', /* vbank */
				         merchant_uid : 'merchant_' + new Date().getTime(),
				         name : '비회원차량렌트',/*상품명  */
				         amount : data,/*금액  */
				         buyer_email : $('#emaillist').val(),/* 사용자 메일 */
				         buyer_name : $('#namelist').val(), /* 사용자 메일 */
				         buyer_tel : $('#tellist').val(), /* 사용자 메일 */
				         buyer_addr : '서울특별시 강남구 삼성동', /* 비회원은 빼기  */
				         buyer_postcode : '123-456' /*  메일 */
				      }, function(rsp) {
				         if (rsp.success) {
				            var msg = '결제가 완료되었습니다.';
				            msg += '고유ID : ' + rsp.imp_uid;
				            msg += '상점 거래ID : ' + rsp.merchant_uid;
				            msg += '결제 금액 : ' + rsp.paid_amount;
				            msg += '카드 승인번호 : ' + rsp.apply_num;
				            location.href = "/cs/index.jsp";
				         } else {
				            var msg = '결제에 실패하였습니다.';
				            msg += '에러내용 : ' + rsp.error_msg;
				            
				            location.href = "/cs/index.jsp";
				         }

				         alert(msg);
				      });
				      
				     
				}
				
			});
			//결제창에 데이터도 넘기고
			
			
			//결제창 띄우고
			return true;
		}
		
		
	}
	
	
</script>

<style>

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

.th1 {
	text-align: right;
	width:280px;
}

.mod_sy{
	
	text-align: center;
	
}
.mod_sy_1{
	width: 200px;
	text-align: center;
	
}
</style>
</head>
<body>
	<%@ include file="../../resources/include/header.jsp"%>

	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-2 sidenav">
				<%@ include file="../resources/include/sidenav.jsp"%>
			</div>
			<div class="col-sm-8 text-left">
				<section style="align:center; margin-bottom:0px;">
				<div id="d1" style="text-align:left; margin-top:30px; margin-bottom: 0">
					<!-- <form action="../../minsert"> 상대경로 -->
					<form action="" method="post">
						<!--절대경로  -->
						<table align="center" class="table table-striped">
							<tr>
								<th colspan="2" style="padding-left:280px; font-size:25px;">비회원 예약</th>
							</tr>
							<tr>
								<th class="th1">*이 름&nbsp;&nbsp;&nbsp;</th>
								<td><input id="name_1" type="text" name="nomembername"
									required></td>
							</tr>
							<tr>
								<th class="th1">*식별번호&nbsp;&nbsp;&nbsp;</th>
								<td><input type="text" name="nomembernumber" id="nomember1" placeholder="숫자 4글자를 입력해주세요(ex.1234)"
									required></td>
							<tr>
								<th class="th1">성 별&nbsp;&nbsp;&nbsp;</th>
								<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" id="gender_1" name="nomembergender"	value="M">남
									&nbsp; <input type="radio" id="gender_1" name="nomembergender" value="F">여</td>
							</tr>
							<tr>
								<th class="th1">나 이&nbsp;&nbsp;&nbsp;</th>
								<td><input type="number" id="age_1" name="nomemberage"
									min="20" max="100"></td>
							</tr>
							<tr>
								<th class="th1">이메일&nbsp;&nbsp;&nbsp;</th>
								<td>
								<input type="email" id="email_1" name="nomemberemail" required>
								</td>
							</tr>
							<tr>
								<th class="th1">전화번호&nbsp;&nbsp;&nbsp;</th>
								<td><input type="text" id="tel_1" name="nomembertell" required></td>
							</tr>
							<tr>
								<th class="th1">대여일자&nbsp;&nbsp;&nbsp;</th>
								<td>
									<p>
										<input type="text" name="carstartdate" id="datepicker1"
											readonly />
									</p>
								</td>
							</tr>
							<tr>
								<th class="th1">반납일자&nbsp;&nbsp;&nbsp;</th>
								<td>
									<p>
										<input type="text" name="carenddate" id="datepicker2" readonly />
									</p>
								</td>
							</tr>
							<tr>
								<th class="th1">차종선택&nbsp;&nbsp;&nbsp;</th>
								<td><select class="catype_select" id="catype_select1">
										<option>차종</option>
										<option value="1">경차</option>
										<option value="2">소형</option>
										<option value="3">준중형</option>
										<option value="4">중형</option>
										<option value="5">SUV</option>
										<option value="6">대형</option>

								</select> 
								<select id="cartype" name="cartype">
										<option>차량선택</option>
								</select></td>
							</tr>
							<tr>
								<th class="th1">보험선택&nbsp;&nbsp;&nbsp;</th>
								<td><select style="width:141px;" name="carinsurance_no" id="carinsurance_no_1">
										<option>비회원보험선택</option>								
								</select></td>
							</tr>
							<tr>
								<th class="th1">특이사항&nbsp;&nbsp;&nbsp;</th>
								<td><textarea name="carnote" id="note_1" rows="3" cols="30"></textarea></td>
							</tr>
							<tr>
								<th colspan="2" style="padding-left:270px;">
									<!-- 모달을 켜고 끄는 버튼 --> 
									<a href="#myModal" id="list_1" role="button" class="btn btn-default" data-toggle="modal" onsubmit="return checkEnroll();">대여하기</a>
									<!-- <input type="submit" value="대여하기"> --> &nbsp; <!-- 모달 -->
									<!-- Modal --> &nbsp; 
									<!-- <input type="submit" class="btn btn-default" data-toggle="modal" value="대여하기">
									 -->
									<input type="reset"	class="btn btn-default" value="작성취소"> &nbsp;
								</th>
						</table>
					</form>
				</div>
				<div class="modal fade" id="myModal" role="dialog">
						<div class="modal-dialog modal-sm">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">대여 정보 확인</h4>
								</div>
								<form action="" method="post">
									<!-- /cs/n_m_reservation onsubmit="return checkEnroll();"-->
									<div class="modal-body">
										<table>
										<tr class="mod_sy">
											<td>
												<p>성함:</p>
											</td>
											<td>
												<p>
												<input type="text" id="namelist" name="n_name" style="border:none;" readonly>									
												</p>
											</td>
										</tr>
										<tr class="mod_sy">
											<td>
												<p>식별번호:</p>
											</td>
											<td><p>
												<input type="text" id="numberlist" name="n_number" style="border:none;" readonly>									
											</p></td>
										</tr>
										<tr class="mod_sy">
											<td class="mod_sy_1">
												<p>성별<br></p>											
												<p style="font-size: 10px;">(M:남,F:여):</p>
											</td>
											<td><p>
												<input type="text" id="ganderlist" name="n_gander" style="border:none;" readonly>									
											</p></td>
										</tr>
										
										<tr class="mod_sy">
											<td>
												<p>나이:</p>
											</td>
											<td><p>
												<input type="number" id="agelist" name="n_age" style="border:none;" readonly>									
											</p></td>
										</tr>
										<tr class="mod_sy">
											<td>
												<p>이메일:</p>
											</td>
											<td><p>
												<input type="text" id="emaillist" name="n_email" style="border:none;" readonly>									
											</p></td>
										</tr>
										
										<tr class="mod_sy">
											<td>
												<p>전화번호:</p>
											</td>
											<td><p>
												<input type="text" id="tellist" name="n_tel" style="border:none;" readonly>									
											</p></td>
										</tr>
										
										<tr class="mod_sy">
											<td>
												<p>대여일자:</p>
											</td>
											<td><p>
												<input type="text" id="startlist" name="n_s_date" style="border:none;" readonly>									
											</p></td>
										</tr>
										
										<tr class="mod_sy">
											<td>
												<p>반납일자:</p>
											</td>
											<td><p>
												<input type="text" id="endlist" name="n_e_date" style="border:none;" readonly>									
											</p></td>
										</tr>
										
										<tr class="mod_sy">
											<td>
												<p>차종:</p>
											</td>
											<td><p>
												<input type="text" id="catype_select_list" name="c_type_s" style="border:none;" readonly>									
											</p></td>
										</tr>
										
										<tr class="mod_sy">
											<td>
												<p>차량모델:</p>
											</td>
											<td><p>
												<input type="text" id="cartypelist" name="c_type" style="border:none;" readonly>									
											</p></td>
										</tr>
										
										<tr class="mod_sy">
											<td>
												<p>보험선택:</p>
											</td>
											<td><p>
												<input type="text" id="insurancelist" name="n_insurance" style="border:none;" readonly>									
											</p></td>
										</tr>
										
										<tr class="mod_sy">
											<td>
												<p>특이사항:</p>
											</td>
											<td><p>
												<input type="text" id="notelist" name="n_note" style="border:none;" readonly>									
											</p></td>
										</tr>										
										</table>
										
									</div>
									<div class="modal-footer">
										<!-- <button type="button" class="btn btn-default" data-dismiss="modal">대여하기</button> -->
										<input type="button" class="btn btn-default" value="대여하기" onclick="checkEnroll();">
										<!-- onclick="checkEnroll();" -->
										
										&nbsp;
										<button type="button" class="btn btn-default"
											data-dismiss="modal">취소하기</button>
									</div>
								</form>
							</div>

						</div>
					</div>
				</section>
			</div>
			<div class="col-sm-2 sidenav" style="background:white;">
				<%@ include file="../../resources/include/add.jsp"%>
			</div>
		</div>
	</div>
	<%-- <%@ include file="../../resources/include/login.jsp"%> --%>
	<%@ include file="../../resources/include/footer.jsp"%>
</body>
</html>
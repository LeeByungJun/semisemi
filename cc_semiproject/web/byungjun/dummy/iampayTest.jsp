<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아임포트 결제 테스트</title>
</head>
<body>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript"
		src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

	<script>
	function pay(){
		var IMP = window.IMP;
		IMP.init('imp58527987');
		IMP.request_pay({
			pg : 'html5_inicis',
			pay_method : 'vbank',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : '1개월 이용권',
			amount : 14000,
			buyer_email : 'iamport@siot.do',
			buyer_name : '이병준',
			buyer_tel : '010-2683-4346',
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
		});
	}
	</script>

	<button onclick="pay();">결제하기</button>
</body>
</html>
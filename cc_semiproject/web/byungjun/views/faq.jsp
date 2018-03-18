<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 묻는 질문</title>
<%@ include file="../../resources/include/meta.jsp"%>
<style type="text/css">
	#title{
		font-size:18pt;
		text-align:left;
		font-weight:bold;
	}
	#all{
		text-align:left;
		font-size:12pt;
		margin-top:15px;
	}
	.ctitle{
		/* margin:0px;
		padding:0px; */
		font-size:9pt;
	}
	hr{
		margin-top:10px;
		margin-bottom:10px;
	}
	#tb{
		margin-left:100px;
	}
	table tr td{
		text-align:center;
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
			<div class="col-sm-2 sidenav"><!-- side2 -->
				<%@ include file="../../resources/include/sidenav.jsp"%>
			</div>
			<!-- main contents -->
			<div class="col-sm-8 text-left">
				<!-- 컨텐츠를 넣으세요 -->
				<div id="title">FAQ</div>
				<div id="tb">
					<table border="1">
						<tr>
							<td><button>자주찾는질문</button></td>
							<td><button>사이트이용</button></td>
							<td><button>회원제도</button></td>
						</tr>
						<tr>
							<td><button>윤</button></td>
							<td><button>식</button></td>
							<td><button>당</button></td>
						</tr>
					</table>
				</div>
				<div id="all"> 
					전체
				</div>
				<hr style="border-color: red; margin-top:5px;">
				<div class="ctitle">
					자주 찾는 질문 &nbsp;&nbsp;<a href="#" onclick="displayC1();">사고 고장 발생시 어떻하면 되나요?</a> 
				</div>
				<div class="contents" id="c1" style="display:none;">
					사고, 고장이 발생하셨습니까? 당황하지 마시고,1544-1600로 전화 주세요. 1번 사고, 고장 접수를 누르세요<br>
					 저희 C&C렌터카는 24시간 연중무휴 컨택센터를 운영하며 고객님들의 편의를 보장하고 있습니다.<br> 
					 차량에 문제가 있을 경우 당황하지 마시고 언제라도 컨텍센터로 연락주시기 바랍니다. 바로 해결해 드리겠습니다.
				</div>
				<script type="text/javascript">
					function displayC1(){
						var obj = document.getElementById('c1');
						if(obj.style.display == "none"){
							obj.style.display = "inline";
						}else{
							/* obj.css("display","none"); */
							obj.style.display = "none";
						}
					}
				</script>
				<hr>
				<div class="ctitle">
					자주 찾는 질문 &nbsp;&nbsp;<a href="#">사정상 계약 시간보다 초과해서 사용하게 될 경우 비용은 어떻게 되나요?</a> 
				</div>
				<hr>
				<div class="ctitle">
					사이트 이용 &nbsp;&nbsp;<a href="#">회원가입을 하면 어떤 혜택이 있나요?</a>
				</div>
				<hr>
				<div class="ctitle">
					사이트 이용 &nbsp;&nbsp;<a href="#">홈페이지 ID와 PASSWORD를 분실 했습니다.</a>
				</div>
				<hr>
				<div class="ctitle">
					회원 제도 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">회원가입 이전에 사용한 실적도 포인트 적립이 가능한가요?</a>
				</div>
				<hr>
				<div class="ctitle">
					회원 제도 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">여긴 무엇을 넣어야 될까요?</a>
				</div>
				<hr>
				
			</div>
			<div class="col-sm-2 sidenav">
				<%@ include file="../../resources/include/add.jsp" %>
			</div>
		</div>

	</div>



	<!-- login 관련 modal -->
	<%@ include file="../include/login.jsp"%>

	<!-- footer -->
	<%@ include file="../include/footer.jsp"%>

</body>
</body>
</html>
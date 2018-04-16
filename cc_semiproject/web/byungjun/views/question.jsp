<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문하기</title>
<script src="/cs/resources/bootstrap/js/jquery-3.3.1.min.js"></script>
<%@ include file="../../resources/include/meta.jsp"%>
<style type="text/css">

textarea.form-control{
    height:100px;
}
#form1{
	text-align:center;
	margin-left:200px;
}
#form1 table{
	margin:10px;
	margin-top:50px;
}
#form1 table tr th{
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
<script>
function fn( ){
	// 시발 제이쿼리 이거 뭐가 어떻게 됬나본대 ㅡ,ㅡ
	/* document.form1.action = "/cs/msender?email="+$('#exampleInputEmail2').val()+"&username="
			+$('#exampleInputName2').val()+"&contents="+$('#contents').val();
	document.form1.submit(); // = $('form1').submit(); */
	//에러다!! 기분좋게 잘수있겠군
	
	$.ajax({
		url:"/cs/msender",
		data:{
			email:$('#exampleInputEmail2').val(),
			username:$('#exampleInputName2').val(),
			contents:$('#contents').val()
		},
		type:"post",
		success:function(data){
			alert(data);
			$('#exampleInputEmail2').val("");
			$('#exampleInputName2').val("");
			$('#contents').val("");
		}
	});
}
</script>
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
				<form action="" name="form1" method="post" id="form1">
					<table style="margin-bottom:50px;">
						<tr>
							<th id="title">Contact Us</th>
						</tr>
						<tr>
							<th><p>저희 C&C사에 하고 싶은 말을 적어 보내주세요! 고객님의 한마디가 큰 힘이 됩니다</p></th>
						</tr>
						<tr><th><label for="exampleInputEmail2">관리자이메일</label> <input
												type="email" class="form-control"
												placeholder="abcd123@example.com" value="pjlee9212@gmail.com" readonly></th></tr>
						<tr><th><label for="exampleInputName2">고객명</label> <input
												type="text" name="username" class="form-control" id="exampleInputName2"
												placeholder="Jane Doe"></th></tr>
						<tr><th><label for="exampleInputEmail2">고객이메일</label> <input
												type="email" name="email" class="form-control" id="exampleInputEmail2"
												placeholder="abcd123@example.com"></th></tr>
						<tr><th><label for="exampleInputText">하실 말씀</label>
											<textarea class="form-control" id="contents" name="contents" placeholder="Description"></textarea></th></tr>
						<tr>
							<th class="_onFocus">
								<input type="button" id="btn" value="보내기" onclick="fn();">
							</th>
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
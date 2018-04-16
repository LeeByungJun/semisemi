<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>텍스트에리어 테스트</title>
<script type="text/javascript" src="../../resources/bootstrap/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	function imgInsert(){
		$("#d1").html("<img src='../../resources/images/car1.png' style='width:300px; height:300px;'>");
	}
</script>
</head>
<body>

	<div id="d1" contentEditable="true" style="width:500px; height:500px;">
  		
	</div>
	<button onclick="imgInsert();">이미지넣기</button>

</body>
</html>
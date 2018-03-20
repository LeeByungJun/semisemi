<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test2</title>
<script type="text/javascript" src="../../../resources/bootstrap/js/jquery-3.3.1.min.js"></script>
<script>
	$(function(){
		
		setTimeout(function(){
			var ha = document.getElementById("childText").value;
			console.log(ha);
			alert(ha);
		},1500);
	});
</script>
</head>
<body>
	부모창에서 전달받은 값 : <input type="text" id="childText" />
    <button type="button" name="button" onclick="sendToParent();">부모에게 전달</button>
    <script type="text/javascript">
      function sendToParent(){
        var txt = document.getElementById("childText").value + "자식창 값을 +합니다.";
        // opener 를 이용해 부모 window 객체에 접근할 수 있습니다.
        // 부모에게서 전달받은 값에 추가로 문자열을 더해서 다시 부모의 receiveFromChild 라는 id를 갖는
        // 태그요소에 value 값을 바꾸어 주는 작업입니다.
        opener.document.getElementById("receiveFromChild").value = txt;
 
        // 창을 닫음
        window.close();
      }
    </script>
</body>
</html>
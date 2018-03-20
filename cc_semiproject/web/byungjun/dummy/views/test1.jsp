<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test1</title>
<script type="text/javascript">
	function popup(){
		var windowObj = window.open("test2.jsp","자식창","width=300,height=300");
		windowObj.document.getElementById("child1").innerHTML = "안녕";
	}
</script>
</head>
<body>
	<input type="text" id="parentText" value="부모창의값" />
    <input type="text" id="receiveFromChild" value=""/>
    <button type="button" onclick="javascript:openChildWindow();">자식창열기</button>
    <script type="text/javascript">
      // 자식창 window 객체를 저장할 변수
      var windowObj;
      function openChildWindow(){
 
        // 새창에 대한 세팅(옵션)
        var settings ='toolbar=0,directories=0,status=no,menubar=0,scrollbars=auto,resizable=no,height=200,width=200,left=0,top=0';
        // 자식창을 열고 자식창의 window 객체를 windowObj 변수에 저장
        windowObj = window.open("test2.jsp","자식창",settings);
 
        // 자식창의 childText라는 id를 가진 태그 요소의 값에 부모창의 값을 넣음
        windowObj.document.getElementById("childText").value = document.getElementById("parentText").value;
      }
    </script>

</body>
</html>
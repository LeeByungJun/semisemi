<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>게시글 쓰기</title>
<link href="../bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script
	src="../bootstrap/js/jquery-3.3.1.min.js"></script>
<script
	src="../bootstrap/js/bootstrap.js"></script>
<style type="text/css">
	table {
		text-align:center;
	}
</style>
</head>
<body>
	<h2>게시글 쓰기</h2>
	<!-- <div>
		<form>
			<table border="1">
				<tr>
					<td>제목</td>
				</tr>
				<tr>
					<td><input type="text" name="title"></td>
				</tr>
				<tr>
					<td>내용</td>
				</tr>
				<tr>
					<td><textarea rows="6" cols="30"></textarea></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="작성"> &nbsp;
					<button>취소</button></td>
				</tr>
			</table>
		</form>
	</div> -->
	<!-- enctype="application/x-www-form-urlencoded" 속성이 default로 잡혀있음 -->

  <!-- <form action="/bbs/write.bbs" method="post" enctype="application/x-www-form-urlencoded"> -->

  <form action="/bbs/write.bbs" method="post">

      <input type="hidden" name="pageNum" value="${pageNum}">${pageNum}

      <input type="hidden" name="depth" value="${article.depth}">

      <input type="hidden" name="pos" value="${article.pos}">

      <input type="hidden" name="groupId" value="${article.groupId}">

       

      <div align="center">

      <!-- HTML5에서는 태그 속성을 바로 명시하지 않고, CSS를 작성하여 붙여준다. -->

      <table border="2" width="200">

        <tr>

          <td>글쓴이 : </td>

          <td>${id}</td>

        </tr>

        <tr>

          <td>제목 : </td>

          <td><input type="text" name="title"></td>

        </tr>

        <tr>

          <td colspan="2">

            <textarea cols="50" rows="20" name="content"></textarea>

          </td>

        </tr>

        <tr>

          <td>첨부 : </td>

          <td><input type="file" name="fileName"></td>

        </tr>

        <tr>

          <td><input type="submit" value="글쓰기"></td>

          <td><input type="reset" value="글쓰기취소"></td>

        </tr>

      </table>

    </div>

  </form>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>공지&소개 등록</h1>
<form action="" method="post">
	작성아이디<br>
	<input type="text" name="id" value="${vo.r_id }"><br>
	내용<br>
	<textarea rows="5" cols="50" name="content">${vo.r_info }</textarea><br>
	대표사진<br>
	<span><img src="" id="restaurantimg"></span><br>
	<input type="text" name="regdate" value="${vo.regdate }"><br>
	<input type="submit" value="등록하기"><br>
</form>
</body>
</html>
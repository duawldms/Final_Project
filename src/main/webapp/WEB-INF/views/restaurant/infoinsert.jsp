<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>공지&소개 등록</h1>
	<form action="${pageContext.request.contextPath }/infoinsert"method="post">
	작성자 id<br>
	<input type="text" name="r_writer"><br>
	소개&공지사항
	<input type="text" name="r_content"><br>
	대표사진
	<input type="">
	</form>
</body>
</html>
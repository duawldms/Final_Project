<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#wrap {
	text-align: center;
}
#infoupdate {
	margin: auto;
	font-family: fantasy;
	font-size: 18px;
	width: 1200px;
	border-collapse: collapse;
	text-align: center;
}
#infoupdate input {
	border-collapse: collapse;
	font-size: 18px;
	font-weight: normal;
	color: #F6416C;
	padding: 10px 8px;
	border-bottom: 2px solid #00B8A9;
}
#infoupdate textarea {
	border-collapse: collapse;
	font-size: 18px;
	font-weight: normal;
	color: #F6416C;
	padding: 10px 8px;
	border-bottom: 2px solid #00B8A9;
}
</style>
</head>
<body>
<div class="wrap">
	<h1 style="text-align: center; padding-bottom: 50px; color: #00B8A9">공지&소개 등록</h1>
	<form action="${cp }/infoinsert" method="post" id="infoupdate">
	<h3 style="color: #F6416C">매장명</h3>
	<input type="text" name="r_name"><br>
	<h3 style="color: #F6416C">소개&공지사항</h3>
	<textarea rows="5" cols="50" name="r_info"></textarea><br>
	<h3 style="color: #F6416C">대표사진</h3>
	<input type="file" value="file1"><br>
	<input type="submit" value="등록"><br>
	</form>
	</div>
</body>
</html>
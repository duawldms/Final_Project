<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리등록</title>
</head>
<body>
<form:form method="post" action="${cp }/category/upload" enctype="multipart/form-data" acceptCharset="utf-8">
<h1>카테고리등록</h1>
	카테고리명<br>
	<input type="text" name="cg_name"><br><br>
	
	첨부이미지<br>
	<input type="file" name="file1"><br><br>
	<input type="submit" value="카테고리등록">
</form:form>
</body>
</html>
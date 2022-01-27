<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리등록</title>
<script type="text/javascript">
$(function(){
	$("#frm").submit(function(){
		if($("#cg_name").val() == ""){
			$("#cg_name").focus();
			alert("카테고리명을 입력하세요.");
			return false;
		}
		if($("#file1").val() == ""){
			$("#file1").focus();
			alert("표지이미지를 등록해주세요.");
			return false;
		}
</script>
</head>
<body>
<form:form method="post" action="${cp }/category/upload" id = "frm" enctype="multipart/form-data" acceptCharset="utf-8">
<h1>카테고리등록</h1>
	카테고리명<br>
	<input type="text" name="cg_name" id="cg_name"><br><br>
	
	첨부이미지<br>
	<input type="file" name="file1" id="file1"><br><br>
	<input type="submit" value="카테고리등록">
</form:form>
</body>
</html>
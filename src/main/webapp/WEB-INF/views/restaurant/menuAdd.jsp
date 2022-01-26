<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>메뉴 추가</h1>
	<form:form>
		<input type="text" id="food_name" name="food_name" placeholder="음식 이름">
		<br>
		<input type="hidden" id="r_id" value="${requestScope.r_id }">
		<input type="file" id="file1" name="file1" onchange="imageView()">
		<br>
		<img style="width: 400px; height: 400px;" id="fo_img" src="">
		<br>
		<input type="text" id="food_cost" name="food_cost" placeholder="음식 가격">
		<br>
		<input type="text" id="food_info" name="food_info" placeholder="음식 정보">
		<br>
	</form:form>
	<script>
		function imageView() {
			// 파일 리더
			var fileReader = new FileReader();
			fileReader.onload = function(e) {
				alert(e.target);
			}
		}
	</script>
</body>
</html>
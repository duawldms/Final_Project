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
	<form:form method="post" action="${cp }/menuadd" enctype="multipart/form-data" acceptCharset="utf-8">
		<input type="text" id="food_name" name="food_name" placeholder="음식 이름">
		<br>
		<input type="hidden" id="r_id" name="r_id" value="${requestScope.r_id }">
		<input type="file" id="file1" name="file1" onchange="imageView(event)">
		<br>
		<img style="width: 200px; height: 200px; display: none;" id="fo_img" src="">
		<input type="text" id="food_cost" name="food_cost" placeholder="음식 가격">
		<br>
		<textarea cols="30" rows="5" style="resize: none" name="food_info" id="food_info" placeholder="음식 정보"></textarea>
		<br>
		<input type="submit" value="등록">
		<!-- <input type="button" value="등록"> -->
	</form:form>
	<script>
		// 이미지 미리보기
		function imageView(e) {
			var reader = new FileReader();
			
			reader.onload = function(e) {
				let fo_img = document.getElementById("fo_img");
				fo_img.src = e.target.result;
				fo_img.style.display = 'block';
			}
			// readAsDataURL 파일을 데이터 URL로 만들기
			reader.readAsDataURL(e.target.files[0]);
		}
	</script>
</body>
</html>
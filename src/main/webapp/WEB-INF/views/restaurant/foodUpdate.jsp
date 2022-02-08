<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div>
	<h1>메뉴 수정</h1>
	<form:form method="post" action="${cp }/restaurant/foodUpdate" enctype="multipart/form-data" acceptCharset="utf-8">
		<label>음식명</label>
		<br>
		<input type="text" id="food_name" name="food_name" value="${requestScope.vo.food_name }">
		<br>
		<input type="hidden" id="food_num" name="food_num" value="${requestScope.vo.food_num }">
		<label>음식 사진</label>
		<br>
		<input type="file" id="file1" name="file1" onchange="imageView(event)">
		<br>
		<img style="width: 200px; height: 200px;" id="fo_img" src="../resources/img/${requestScope.vo.food_img }">
		<br>
		<label>가격</label>
		<br>
		<input type="text" id="food_cost" name="food_cost" value="${requestScope.vo.food_cost }">
		<br>
		<label>음식 정보</label>
		<br>
		<textarea cols="30" rows="5" style="resize: none" name="food_info" id="food_info">${requestScope.vo.food_info }</textarea>
		<br>
		<input type="submit" value="수정">
		<!-- <input type="button" value="등록"> -->
	</form:form>
	<script>
		// 이미지 미리보기
		function imageView(e) {
			var reader = new FileReader();
			
			reader.onload = function(e) {
				let fo_img = document.getElementById("fo_img");
				fo_img.src = e.target.result;
			}
			// readAsDataURL 파일을 데이터 URL로 만들기
			reader.readAsDataURL(e.target.files[0]);
		}
	</script>
</div>
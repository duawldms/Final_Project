<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div>
	<h1>메뉴 추가</h1>
	<form:form method="post" action="${cp }/restaurant/menuadd" enctype="multipart/form-data" acceptCharset="utf-8">
		<label>메뉴명</label>
		<br>
		<input type="text" id="food_name" name="food_name" placeholder="예) 빅맥">
		<br>
		<input type="hidden" id="r_id" name="r_id" value="${requestScope.r_id }">
		<label>메뉴 사진 등록</label>
		<br>
		<input type="file" id="file1" name="file1" onchange="imageView(event)">
		<br>
		<img style="width: 200px; height: 200px; display: none;" id="fo_img" src="">
		<label>가격</label>
		<br>
		<input type="text" id="food_cost" name="food_cost">
		<br>
		<label>메뉴 설명<small>(선택)</small></label>
		<br>
		<textarea cols="30" rows="5" style="resize: none" name="food_info" id="food_info" placeholder="에) 참깨빵 위에 순 쇠고기 패티 두 장 특별한 소스 양상추 치즈 피클 양파 까~지"></textarea>
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
</div>
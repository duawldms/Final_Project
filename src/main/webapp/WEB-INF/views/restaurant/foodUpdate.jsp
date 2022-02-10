<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" type="text/css" href="${cp }/resources/css/restaurant.css">
<div class="menu_update_wrap">
	<div class="menu_update_title">
		<h3>메뉴 수정</h3>
	</div>
	<form:form method="post" id="menuUpdateForm" action="${cp }/restaurant/foodUpdate" enctype="multipart/form-data" acceptCharset="utf-8">
		<table class="menu_update_table">
			<tr style="border-top: 3px solid #49505796;">
				<td class="edit_td1">메뉴명</td>
				<td class="edit_td2">
					<input type="text" id="food_name" name="food_name" value="${requestScope.vo.food_name }">
					<div class="food_name_err"></div>
				</td>
			</tr>
			<tr>
				<td class="edit_td1">음식 사진 등록</td>
				<td class="edit_td2">
					<input type="file" id="file1" name="file1" onchange="imageView(event)">
					<br>
					<img style="width: 200px; height: 200px; margin-top: 5px;" id="fo_img" src="../resources/img/${requestScope.vo.food_img }">
				</td>
			</tr>
			<tr>
				<td class="edit_td1">가격</td>
				<td class="edit_td2">
					<input type="text" id="food_cost" name="food_cost" value="${requestScope.vo.food_cost }">
					<div class="food_cost_err"></div>
				</td>
			</tr>
			<tr style="border-bottom: 3px solid #49505796;">
				<td class="edit_td1">음식 정보</td>
				<td class="edit_td2">
					<textarea cols="30" rows="5" style="resize: none" name="food_info" id="food_info">${requestScope.vo.food_info }</textarea>
				</td>
			</tr>
		</table>
		<input type="hidden" id="food_num" name="food_num" value="${requestScope.vo.food_num }">
		<div class="btn3_div">
			<input type="button" class="btn3" value="수정" onclick="menuUpdate()">
		</div>
		<!-- <input type="button" value="등록"> -->
	</form:form>
	<script>
		function menuUpdate() {
			let food_name = document.getElementById("food_name");
			let food_cost = document.getElementById("food_cost");
			
			if (food_name.value == '') {
				document.getElementById("food_name_err").innerText = "메뉴명을 입력해 주세요.";
				r_name.focus();
				return;
			}
			
			if (food_cost.value == '') {
				document.getElementById("food_cost_err").innerText = "가격을 입력해 주세요.";
				r_name.focus();
				return;
			}
			
			document.getElementById("menuUpdateForm").submit();
		}
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
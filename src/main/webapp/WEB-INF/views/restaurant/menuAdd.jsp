<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" type="text/css" href="${cp }/resources/css/restaurant.css">
<div class="menuadd_wrap">
	<div class="menuadd_title">
		<h3>메뉴 추가</h3>
	</div>
	<form:form method="post" id="menuAddForm" action="${cp }/restaurant/menuadd" enctype="multipart/form-data" acceptCharset="utf-8">
		<table class="menuadd_table">
			<tr style="border-top: 3px solid #49505796;">
				<td class="menuadd_td1">메뉴명</td>
				<td class="menuadd_td2">
					<input type="text" id="food_name" name="food_name" placeholder="예) 빅맥">
					<div id="food_name_err"></div>
				</td>
			</tr>
			<tr>
				<td class="menuadd_td1">메뉴 이미지 등록</td>
				<td class="menuadd_td2">
					<input type="file" id="file1" name="file1" onchange="imageView(event)">
					<br>
					<img style="width: 200px; height: 200px; display: none;" id="fo_img" src="">
				</td>
			</tr>
			<tr>
				<td class="menuadd_td1">가격</td>
				<td class="menuadd_td2">
					<input type="text" id="food_cost" name="food_cost">
					<div id="food_cost_err"></div>
				</td>
			</tr>
			<tr style="border-bottom: 3px solid #49505796;">
				<td class="menuadd_td1">메뉴 설명<small>(선택)</small></td>
				<td class="menuadd_td2">
					<textarea cols="30" rows="5" style="resize: none" name="food_info" id="food_info" placeholder="에) 참깨빵 위에 순 쇠고기 패티 두 장 특별한 소스 양상추 치즈 피클 양파 까~지"></textarea>
				</td>
			</tr>
		</table>
		<input type="hidden" id="r_id" name="r_id" value="${requestScope.r_id }">
		<div class="menuadd_btn_div">
			<input type="button" class="btn3" value="등록" onclick="menuAdd()">
		</div>
	</form:form>
</div>
<script>
	function menuAdd() {
		let food_name = document.getElementById("food_name");
		let food_cost = document.getElementById("food_cost");
		
		if (food_name.value == '') {
			document.getElementById("food_name_err").innerText = "메뉴명을 입력해 주세요.";
			r_id.focus();
			return;
		}
		
		if (food_cost.value == '') {
			document.getElementById("food_cost_err").innerText = "가격을 입력해 주세요.";
			r_id.focus();
			return;
		}
		
		document.getElementById("menuAddForm").submit();
	}
	
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
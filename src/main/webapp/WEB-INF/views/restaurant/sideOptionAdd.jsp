<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
	.multi_options {
		border: 1px solid skyblue;
		width: 250px;
	    height: auto;
	    margin-bottom: 5px;
	}
</style>
<div>
	<h1>옵션 추가</h1>
	<form:form id="side_form" method="post" action="${cp }/restaurant/optionAdd">
		<img alt="음식 메뉴" id="food_img" style="width: 200px; height: 200px;" src="../resources/img/${requestScope.vo.food_img }">
		<br>
		<label>카테고리</label>
		<br>
		<input type="text" id="fo_category" name="fo_category" placeholder="예) 소스">
		<br>
		<label>선택 사항</label>
		<br>
		<input type="radio" id="" name="select_option" value="필수선택"> 필수선택
		<input type="radio" id="" name="select_option" value="추가 선택"> 추가 선택
		<br>
		<label>옵션명</label>
		<br>
		<input type="text" id="fo_name" name="fo_name" placeholder="예) 칠리소스">
		<br>
		<label>가격</label>
		<br>
		<input type="text" id="fo_cost" name="fo_cost">
		<br>
		<input type="button" value="옵션 추가" onclick="optionAdd()">
		<div class="option_add"></div>
		<input type="button" value="등록" onclick="optionSend()">
		<input type="hidden" id="food_num" name="food_num" value="${requestScope.vo.food_num }">
	</form:form>
	<script>
		var cnt = 1;
		
		function optionSend() {
			document.getElementById("side_form").submit();
		}
		
		function optionAdd() {
			let div = document.querySelector(".option_add");
			let div2 = document.createElement("div");
			
			let label = document.createElement("label");
			let label2 = document.createElement("label");
			
			let input = document.createElement("input");
			let input2 = document.createElement("input");
			
			let br = document.createElement("br");
			let br2 = document.createElement("br");
			let br3 = document.createElement("br");
			let br4 = document.createElement("br");
			
			div2.className = "multi_options";
			
			label.innerText = "옵션명";
			label2.innerText = "가격";
			
			input.type = "text";
			input.className = "fo_name";
			input.name = "fo_name" + cnt;
			input.placeholder = "예) 칠리소스";
			
			input2.type = "text";
			input2.className = "fo_cost";
			input2.name = "fo_cost" + cnt;
			
			div2.appendChild(label);
			div2.appendChild(br);
			div2.appendChild(input);
			div2.appendChild(br2);
			div2.appendChild(label2);
			div2.appendChild(br3);
			div2.appendChild(input2);
			div2.appendChild(br4);
			div.appendChild(div2);
			cnt++;
		}
	</script>
</div>
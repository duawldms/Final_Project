<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" type="text/css" href="${cp }/resources/css/restaurant.css">
<div class="sideadd_wrap">
	<div class="sideadd_title">
		<h2>옵션 추가</h2>
	</div>
	<form:form id="side_form" method="post" action="${cp }/restaurant/optionAdd">
		<table class="sideadd_table">
			<tr>
				<td class="sideadd_td1">음식 이미지</td>
				<td class="sideadd_td2">
					<img alt="음식 메뉴" id="food_img" style="width: 200px; height: 200px;" src="../resources/img/${requestScope.vo.food_img }">
				</td>
			</tr>
			<tr>
				<td class="sideadd_td1">카테고리</td>
				<td class="sideadd_td2">
					<input type="text" id="fo_category" name="fo_category" placeholder="예) 소스">
				</td>
			</tr>
			<tr>
				<td class="sideadd_td1">선택 사항</td>
				<td class="sideadd_td2">
					<input type="radio" id="" name="select_option" value="필수선택"> 필수선택
					<input type="radio" id="" name="select_option" value="추가 선택"> 추가 선택
				</td>
			</tr>
			<tr>
				<td class="sideadd_td1">옵션명</td>
				<td class="sideadd_td2">
					<input type="text" id="fo_name" name="fo_name" placeholder="예) 칠리소스">
				</td>
			</tr>
			<tr>
				<td class="sideadd_td1">가격</td>
				<td class="sideadd_td2">
					<input type="text" id="fo_cost" name="fo_cost">
				</td>
			</tr>
			<tr>
				<td class="sideadd_td1">옵션 추가 등록</td>
				<td class="sideadd_td2">
					<input type="button" value="옵션 추가" onclick="optionAdd()">
				</td>
			</tr>
		</table>
		<input type="hidden" id="food_num" name="food_num" value="${requestScope.vo.food_num }">
		<div class="sideadd_btn_div">
			<input type="button" class="btn3" value="등록" onclick="optionSend()">
		</div>
	</form:form>
	<script>
		var cnt = 1;
		
		function optionSend() {
			document.getElementById("side_form").submit();
		}
		
		function optionAdd() {
			let table = document.querySelector(".sideadd_table");
			let tr = document.createElement("tr");
			let tr2 = tr.cloneNode();
			let td = document.createElement("td");
			let td2 = td.cloneNode();
			let td3 = td.cloneNode();
			let td4 = td.cloneNode();
			
			let input = document.createElement("input");
			let input2 = input.cloneNode();
			
			let br = document.createElement("br");
			let br2 = br.cloneNode();
			let br3 = br.cloneNode();
			let br4 = br.cloneNode();
			
			td.className = "sideadd_td1";
			td.innerText = "옵션명";
			td2.className = "sideadd_td2";
			
			td3.className = "sideadd_td1";
			td3.innerText = "가격";
			td4.className = "sideadd_td2";
			
			input.type = "text";
			input.className = "fo_name";
			input.name = "fo_name" + cnt;
			input.placeholder = "예) 칠리소스";
			
			input2.type = "text";
			input2.className = "fo_cost";
			input2.name = "fo_cost" + cnt;
			
			td2.append(input);
			td4.append(input2);
			
			tr.append(td);
			tr.append(td2);
			tr2.append(td3);
			tr2.append(td4);
			table.append(tr);
			table.append(tr2);
			cnt++;
		}
	</script>
</div>
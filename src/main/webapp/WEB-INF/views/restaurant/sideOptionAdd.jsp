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
					<input type="button" value="옵션 삭제" onclick="optionDel()">
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
			let fo_category = document.getElementById("fo_category");
			let fo_name = document.getElementById("fo_name");
			let fo_cost = document.getElementById("fo_cost");
			let class_fo_name = document.getElementsByClassName("fo_name");
			let class_fo_cost = document.getElementsByClassName("fo_cost");
			
			if (fo_category.value == '') {
				fo_category.focus();
				alert("카테고리를 입력해 주세요.");
				return;
			}
			
			if (fo_name.value == '') {
				fo_name.focus();
				alert("옵션명을 입력해 주세요.");
				return;
			}
			
			if (fo_cost.value == '') {
				fo_cost.focus();
				alert("가격을 입력해 주세요.");
				return;
			}
			
			for (let i = 0; i < class_fo_name.length; i++) {
				if (class_fo_name[i].value == '') {
					class_fo_name[i].focus();
					alert("옵션명을 입력해 주세요.");
					return;
				}
			}
			
			for (let i = 0; i < class_fo_cost.length; i++) {
				if (class_fo_cost[i].value == '') {
					class_fo_cost[i].focus();
					alert("가격을 입력해 주세요.");
					return;
				}
			}
			
			document.getElementById("side_form").submit();
		}
		
		function optionDel() {
			let table = document.querySelector(".sideadd_table");
			let tCount = table.childElementCount;
			
			if (tCount > 1) {
				table.removeChild(table.lastChild);
				table.removeChild(table.lastChild);
				cnt--;
			}
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
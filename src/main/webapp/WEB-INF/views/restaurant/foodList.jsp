<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="${cp }/resources/css/restaurant.css">
<h1 style="text-align: center;">사이드 메뉴 등록</h1>
<div class="food_list_wrep">
	<div class="side_search">
		<input type="text" id="food_search" name="food_search" placeholder="음식명 검색">
		<input type="button" value="검색" onclick="foodSearch()"> 
	</div>
	<div class="list">
		<c:forEach var="vo" items="${requestScope.menuList }">
		 	<div class="food_list" style="cursor: pointer;" onclick="location.href='${cp}/restaurant/optionAdd?food_num=${vo.food_num}'">
		 	<%-- <div class="food_list" style="cursor: pointer;" onclick="sidePopup('${vo.food_num}')"> --%>
				<img alt="음식 메뉴" id="food_img" src="../resources/img/${vo.food_img }">
				<br>
				<b>${vo.food_name }</b>
				<br>
				<b>${vo.food_cost }원</b>
			</div>
		</c:forEach>
	</div>
</div>
<script>
	function sidePopup(food_num) {
		var url = "${cp}/restaurant/sideOptionAdd?food_num=" + food_num;
		var name = "sideAdd";
		var option = "width = 300, height = 500, top = 300, left = 800";
		window.open(url, name, option);
	}
	
	function foodSearch() {
		var xhr = null;
		let food_search = document.getElementById("food_search");
		url = "${cp}/restaurant/foodSearch?food_search=" + food_search.value;
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				let div = document.querySelector(".list");
				div.innerHTML = "";
				
				let data = xhr.responseText;
				let json = JSON.parse(data);
				let childDiv = document.createElement("div");
				for (let i = 0; i < json.length; i++) {
					div.innerHTML += "<div class='food_list' style='cursor: pointer;' onclick='sidePopup(" + json[i].food_num + ")'>"
								+ "<img id='food_img' src='../resources/img/" + json[i].food_img + "'><br>"
								+ "<b>" + json[i].food_name + "</b><br>"
								+ "<b>" + json[i].food_cost + "원</b></div>";
				}
			}	
		}
		xhr.open('get', url, true);
		xhr.send();
	}
</script>
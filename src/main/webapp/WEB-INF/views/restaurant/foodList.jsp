<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.food_list_wrep {
		width: 70%;
		height: auto;
		margin: auto;
		background-color: yellow;
	}
	#food_img {
		width: auto;
		height: 150px;
	}
	
	.food_list {
		width: 150px;
		height: 200px;
		margin-left: 5%;
		background-color: lime;
	}
</style>
<div class="food_list_wrep">
	<div class="list">
		<c:forEach var="vo" items="${requestScope.menuList }">
		 	<div class="food_list" style="cursor: pointer;" onclick="location.href='${cp}/restaurant/optionAdd?food_num=${vo.food_num}'">
				<img alt="음식 메뉴" id="food_img" src="../resources/img/${vo.food_img }">
				<br>
				<b>${vo.food_name }</b>
				<br>
				<b>${vo.food_cost }원</b>
			</div>
		</c:forEach>
	</div>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.food_list_wrep {
		width: 70%;
		height: auto;
		overflow:hidden;
		margin: auto;
	}
	#food_img {
		width: 148px;
		height: 150px;
	}
	
	.list {
		width: auto;
		height: auto;
		margin-top: 5%;
	}
	
	.food_list {
		width: 150px;
		height: 200px;
		margin-left: 5%;
		margin-bottom: 5%;
		float: left;
		text-align: center;
		border: skyblue solid 1px;
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
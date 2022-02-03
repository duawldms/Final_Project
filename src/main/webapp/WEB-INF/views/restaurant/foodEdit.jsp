<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="${cp }/resources/css/restaurant.css">
<div class="food_list_wrep">
	<div class="side_search">
		<input type="text" id="food_search" name="food_search" placeholder="음식명 검색">
		<input type="button" value="검색" onclick="foodSearch()"> 
	</div>
	<div class="list">
		<c:forEach var="vo" items="${requestScope.menuList }">
		 	<%-- <div class="food_list" style="cursor: pointer;" onclick="location.href='${cp}/restaurant/optionAdd?food_num=${vo.food_num}'"> --%>
		 	<div class="food_edit">
				<img alt="음식 메뉴" id="food_img" src="../resources/img/${vo.food_img }">
				<br>
				<b>${vo.food_name }</b>
				<br>
				<b>${vo.food_cost }원</b>
				<br>
				<a href="">수정</a>
				<a href="">삭제</a>
			</div>
		</c:forEach>
	</div>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div>
	<h2>${requestScope.food_category } 사이드 추가</h2>
	<form:form id="sideForm" method="post" action="${cp }/restaurant/mainOptionAdd">
		<label>음식명</label>
		<br>
		<input type="text" name="mo_name" placeholder="예)사이즈 = 중, 면 추가">
		<br>
		<label>가격</label>
		<br>
		<input type="text" name="mo_cost" placeholder="음식 가격">
		<input type="hidden" name="mo_category" value="${requestScope.food_category }">
		<br>
		<input type="button" value="등록" id="" onclick="sideAdd()">
		<input type="button" value="종료" id="" onclick="popupClose()">
	</form:form>
	<script>
		function sideAdd() {
			let mo_name = document.getElementById("mo_name")
			document.getElementById("sideForm").submit();
		}
		
		function popupClose() {
			window.close();
		}
	</script>
</div>
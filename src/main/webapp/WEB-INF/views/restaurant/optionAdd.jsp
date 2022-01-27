<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div>
	<h1>사이드 메뉴 등록</h1>
	<form:form>
		<img alt="음식 메뉴" id="food_img" style="width: 200px; height: 200px;" src="../resources/img/${requestScope.vo.food_img }">
		<br>
		<input type="text" name="fo_name" placeholder="사이드 음식명">
		<br>
		<input type="text" name="fo_cost" placeholder="사이드 음식 가격">
		<input type="hidden" name="food_num" value="${requestScope.vo.food_num }">
		<br>
		<input type="button" value="등록" id="" onclick="sideAdd()">
	</form:form>
	<script>
		function sideAdd() {
			
		}
	</script>
</div>
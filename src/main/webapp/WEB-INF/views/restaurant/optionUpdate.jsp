<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div>
	<h1>사이드 메뉴 수정</h1>
	<form:form method="post" action="${cp }/restaurant/optionUpdate">
		<label>옵션명</label>
		<br>
		<input type="text" id="fo_name" name="fo_name" placeholder="음식 이름" value="${requestScope.vo.fo_name }">
		<br>
		<input type="hidden" id="food_num" name="food_num" value="${requestScope.vo.food_num }">
		<input type="hidden" id="fo_num" name="fo_num" value="${requestScope.vo.fo_num }">
		<label>가격</label>
		<br>
		<input type="text" id="fo_cost" name="fo_cost" value="${requestScope.vo.fo_cost }">
		<br>
		<input type="submit" value="수정">
	</form:form>
</div>
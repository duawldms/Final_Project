<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    

<form:form method="post" action="${cp }/insertadmin">
	<h2>기본정보</h2>
		아이디<br>
		<input type="text" name="admin_id" id="admin_id"><br>
		비밀번호<br>
		<input type="password" name="admin_pwd"><span></span><br>
		레벨<br>
		<input type="text" name="admin_lv"><span></span><br>
		<input type="submit" value="가입">
</form:form>
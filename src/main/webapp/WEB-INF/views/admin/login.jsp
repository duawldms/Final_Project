<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<style type="text/css">
#loginbox {
	text-align: center;
	border: 4px solid #7bcfbb;
	width: 400px;
	margin: auto;
	margin-top: 200px;
	margin-bottom: 200px;
	padding: 15px;
}

.btn3 {
	color: white;
	height: 35px;
	width: 150px;
	background-color: #F6416C;
	border: 2px solid white;
}

.btn3:hover {
	background-color: white;
	color: black;
	border: 2px solid #F6416C;
}
</style>
<div id="loginbox">
	<h1>관리자로그인</h1>
	<form:form method="post" action="${cp }/loginuser">
 아이디<br>
		<input type="text" name="username">
		<br>
 비밀번호<br>
		<input type="password" name="password">
		<br>
		<div>${requestScope.errMsg }</div>
		<input type="submit" value="로그인" id="btn" class="btn3">
		<br>
		<br> 
 로그인 유지 <input type="checkbox" name="remember-me" id="rememberMe">
		<br>
	</form:form>
</div>
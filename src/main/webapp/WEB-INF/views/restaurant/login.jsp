<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.login-btn {
		float: left;
	}
	
</style>
</head>
<body>
	<h1>판매자 로그인</h1>
	<form:form method="post" action="${cp }">
		<div class="login-group">
			<input type="text" name="r_id" placeholder="아이디">
		</div>
		<div class="login-group">
			<input type="password" name="r_pwd" placeholder="비밀번호">
		</div>
		<div class="login-btn">
			<input type="button" value="로그인">
		</div>
		<div>
			<label>로그인 유지</label>
			<input type="checkbox">
		</div>
		<div>
			<a href="${cp }/sellerCheck">회원가입</a> / <a href="">아이디 찾기</a>
		</div>
	</form:form>
</body>
</html>
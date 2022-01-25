<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<div>
	<h1>판매자 로그인</h1>
	<form:form method="post" action="${cp }/loginRestaurant">
		<div class="login-group">
			<input type="text" name="username" placeholder="아이디">
		</div>
		<div class="login-group">
			<input type="password" name="password" placeholder="비밀번호">
		</div>
		<div class="login-btn">
			<input type="submit" value="로그인">
		</div>
		<div>
			<label>로그인 유지</label>
			<input type="checkbox">
		</div>
		<div>
			<a href="${cp }/sellerCheck">회원가입</a> / <a href="">아이디 찾기</a>
		</div>
	</form:form>
</div>
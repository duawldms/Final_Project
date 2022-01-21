<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    

<!-- spring form태그라이브러리를 사용하면 자동으로 토큰값이 전송됨 -->
<form:form method="post" action="${cp }/joinuser">
	회원아이디<br>
	<input type="text" name="ui_id"><br>
	회원이름<br>
	<input type="text" name="ui_name"><br>
	비밀번호<br>
	<input type="password" name="ui_pwd"><br>
	회원이메일<br>
	<input type="text" name="ui_email"><br>
	회원전화번호<br>
	<input type="text" name="ui_phone"><br>
	
	<input type="submit" value="가입">
</form:form>

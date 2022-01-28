<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<h1>관리자로그인</h1>
<form:form method="post" action="${cp }/loginuser">
 아이디<br>
 <input type="text" name="username"><br>
 비밀번호<br>
 <input type="password" name="password"><br>
 로그인 유지 <input type="checkbox" name="chk" checked="checked"><br>
  <input type="submit" value="로그인"><br>
  <a href="${cp }/insertadmin">회원가입하기</a><br>
</form:form>
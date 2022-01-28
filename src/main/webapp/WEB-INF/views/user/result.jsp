<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#resultbox{width:400px;height:200px;border: solid 1px;align-items: center;border: solid 3px;border-color: #7bcfbb;
	           margin:10px;display: inline-block;text-align: center;}  

</style>
</head>
<body>
<div id="resultbox">
 안녕하세요 ${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}님<br>
 배달요기이츠 회원이 되어주셔서 감사합니다!<br>
<p></p>
 <a href="${cp}/loginuser">로그인</a> | <a href="${cp}/">주문하러가기</a> | <a href="${cp}/">홈으로</a>
</div>
</body>
</html>



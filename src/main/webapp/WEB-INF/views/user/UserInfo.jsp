<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1" width="600">
	<tr>
	<td>회원 아이디</td>
	<td><input type="text" name="ui_id" value="${vo.ui_id }"></td>
	</tr>
	<tr>
	<td>회원 이름</td>
	<td><input type="text" name="ui_name" value="${vo.ui_name }"></td>
	</tr>
	
	


</table>
</body>
</html>
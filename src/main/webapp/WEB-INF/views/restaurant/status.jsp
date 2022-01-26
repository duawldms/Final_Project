<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#wrap {
	text-align: center;
}
#statusForm {
	margin: auto;
	font-family: fantasy;
	font-size: 18px;
	width: 1200px;
	border-collapse: collapse;
	text-align: center;
}
#statusForm input {
	border-collapse: collapse;
	font-size: 18px;
	font-weight: normal;
	color: #F6416C;
	padding: 10px 8px;
	border-bottom: 2px solid #00B8A9;
}
#statusoption {
	margin: auto;
	font-family: fantasy;
	font-size: 18px;
	width: 240px;
	border-collapse: collapse;
	text-align: center;
}
#statusoption td {
	border-collapse: collapse;
	font-size: 18px;
	font-weight: normal;
	color: #F6416C;
	padding: 10px 8px;
	border-bottom: 2px solid #00B8A9;
}
</style>
</head>
<body>
	<div class="wrap">
	<div id="header">
		<jsp:include page="${requestScope.layout }">
			<jsp:param value="colophon" name="colophon"/>
		</jsp:include>
	</div>
	<h1 style="text-align: center; padding-bottom: 50px; color: #00B8A9">매장 상태 변경</h1>
	<form method="post" action="${cp }/status" id="statusForm">
		<h3 style="text-align: center; padding-bottom: 50px; color: #F6416C;">배달예상시간</h3>
				<input type="number" min="25" max="60" step="5" name="r_deltime1">분~
				<input type="number" min="45" max="90" step="5" name="r_deltime2">분<br>
	<table id="statusoption">
	    <tr>
			<td colspan="2">
				<h2 style="text-align: center; padding-bottom: 50px; color: #F6416C">매장상태</h2>
			</td>
	    </tr>
	    <tr>
			<td>
				<select name="items1">
					<option value="status1">영업대기</option>
					<option value="status2">영업중</option>
					<option value="status3">영업마감</option>
				</select>
			</td>
	    </tr>
    </table>
    <a href="${cp }/" style="text-decoration-line : none; color: #F6416C;" >등록</a>
	</form>
	</div>
</body>
</html>
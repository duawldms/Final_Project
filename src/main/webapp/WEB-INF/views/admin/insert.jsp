<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<style>
* {
	font-size: 16px;
	font-family: conslas, sans-serif;
}

h1 {
	text-align: center;
}
</style>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<div class="elementor-widget-container">
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<span>[${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}님
			반갑습니다.]</span>
		<span class="elementor-icon-list-text"><a href="#"
			onclick="document.getElementById('admin_logout').submit();">로그아웃</a></span>
		<form:form id="admin_logout" method="post" action="${cp }/logout">
		</form:form>
	</sec:authorize>
</div>
<body>
	<form:form method="post" action="${cp }/insertadmin">
		<div class="contatiner">
			<h2>하위관리자생성</h2>
			<div class="panel panel-default">
				<div class="panel-heading">하위관리자생성</div>
				<div class="panel-body">
					<div class="form-group">
						<label class="control-label col-sm-2" for="id">아이디:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="admin_id"
								name="admin_id" placeholder="아이디를 입력하세요" style="width: 30%">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="pass">비밀번호:</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" id="admin_pwd"
								name="admin_pwd" placeholder="비밀번호를 입력하세요" style="width: 30%">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="pass">관리자 LV:</label>
						<div class="col-sm-10">
							<label><input type="checkbox" name="admin_lv" value="1">1</label>
							<label><input type="checkbox" name="admin_lv" value="2">2</label>
						</div>
					</div>

				</div>
			</div>
		</div>

	</form:form>


















	<!--<form:form method="post" action="${cp }/insertadmin">
	<h2>기본정보</h2>
		아이디<br>
	<input type="text" name="admin_id" id="admin_id">
	<br>
		비밀번호<br>
	<input type="password" name="admin_pwd">
	<span></span>
	<br>
	<label><input type="checkbox" name="admin_lv" value="1">레벨1</label>
	<label><input type="checkbox" name="admin_lv" value="2">레벨2</label>
	<span></span>
	<br>
	<input type="submit" value="가입">
</form:form>--!>
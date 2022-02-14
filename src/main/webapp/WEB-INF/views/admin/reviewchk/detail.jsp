<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<style>
*{
 	font-size:16x;
 	font-family:consolas,sans-serif;
}
h1 {
	text-align: center
}

ul {
	width: 230px;
	margin-left: auto;
	margin-right: auto;
}

p {
	text-align: center
}
</style>
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
<div class="page-header">
	<h1>
		<a href="${cp }/admin/adminpage">관리자 페이지</a>
	</h1>
</div>
<ul class="nav nav-pills">
	<li><a href="${cp }/admin/reviewchk/list">리뷰 관리</a>
	<li><a href="${cp }/admin/refund/list">환불 관리</a>
</ul>
<br>
<!DOCTYPE html>
<html lang="en">
<head>
<title>detail.jsp</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-heading"></div>
			<div class="panel-body">
				<div class="form-group">
					<label>주문번호</label> <input type="text" class="form-control"
						id="idx" name="idx" value="${vo.or_num}" readonly="readonly">
				</div>
				<div class="form-group">
					<label>내용</label>
					<textarea class="form-control" rows="3" name="contents"
						readonly="readonly">${vo.re_content}</textarea>
				</div>
				<div class="form-group">
				<label>사진</label>
				<!-- 사용자 review insert 안만들어져 아직 사진 확인 어려움 -->
				<img src="${cp }/resources/img/check.png">
				</div>
					<input type="button" value="목록" onclick="location.href='${cp }/admin/reviewchk/list'" class='btn btn-primary'/>
				</div>
			<div class="panel-footer"></div>
		</div>
	</div>
	<p>쿠팡요기이츠 관리자페이지 입니다</p>
</body>
</html>
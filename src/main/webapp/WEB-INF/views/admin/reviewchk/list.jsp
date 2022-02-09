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
	width: 210px;
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
<title>list.jsp</title>
<meta charset="utf-8">
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean"
	rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>번호</th>
					<th>주문번호</th>
					<th>등록일</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${list }">
					<tr>
						<td>${vo.re_num}</td>
						<td><a href="${cp }/reviewchk/detail?re_num=${vo.re_num}">${vo.or_num}</a></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd "
								value="${vo.re_regdate}" /></td>
						<td><a href="${cp }/reviewchk/delete?re_num=${vo.re_num }"><input
								type="button" value="삭제" class="btn btn-warning"></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="text-center">
		<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
			<c:choose>
				<c:when test="${i==param.pageNum }">
					<a
						href="${cp }/reviewchk/list?pageNum=${i}&field=${field}&keyword=${keyword}"><span
						style='color: blue'>${i }</span></a>
				</c:when>
				<c:otherwise>
					<a
						href="${cp }/reviewchk/list?pageNum=${i}&field=${field}&keyword=${keyword}"><span
						style='color: gray'>${i }</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
	<br>
	<div class="text-center">
		<form:form method="post" action="${cp }/admin/reviewchk/list">
			<select name="field">
				<option value="or_num"
					<c:if test="${field=='or_num'}">selected</c:if>>주문번호</option>
			</select>
			<input type="text" name="keyword" value="${keyword }">
			<input type="submit" value="검색">
		</form:form>
	</div>
	<p>쿠팡요기이츠 메인화면으로 돌아가시려면 <strong><a href="${cp }/">여기</a></strong>를 클릭해 주세요!</p>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<style>
<style>
*{
 	font-size:16x;
 	font-family:consolas,sans-serif;
}
	h1{
	text-align:center;
	}
	
    ul {
    width: 430px; 
    margin-left: auto;
     margin-right: auto;
      }
      
	p{
	text-align:center;
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
		<h1><a href="${cp }/admin/adminpage">관리자  페이지</a></h1>
</div>
<ul class="nav nav-pills">
	<li><a href="${cp }/admin/permission/list">신규판매자 가입승인 관리</a>
	<li><a href="${cp }/admin/discount/list">매출우수매장 수수료감면 관리</a>
</ul>
<br>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>list.jsp</title>
  <meta charset="utf-8">
      <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>가게명</th>
					<th>매출액</th>
				</tr>
			</thead>
	
			<tbody>
				<c:forEach var="vo" items="${list }">
					<tr>
						<td>${vo.r_name }</td>
					<td>${vo.or_totalcost }</td> 
					</tr>
				</c:forEach>
			</tbody>
	
		</table>
	</div>
</body>
</html>
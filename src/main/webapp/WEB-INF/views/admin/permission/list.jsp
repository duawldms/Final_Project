<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
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
	font-size:16px;
	text-align:center;
	}

</style>
<div class="page-header">
	<h1><a href="${cp }/admin/adminpage">관리자 페이지</a></h1>
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
					<th>아이디</th>
					<th>가게명</th>
					<th>가게주소</th>
					<th>가게정보</th>
					<th>승인</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${list }">
					<tr>
						<td>${vo.r_id}</td>
						<td>${vo.r_name }</td>
						<td>${vo.r_addr }</td>
						<td>${vo.r_info }</td>
						<td><a href="${cp }/permission/update?r_id=${vo.r_id}"><input
								type="button" value="승인" class="btn btn-info"></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="text-center">
	<c:if test="${pu.startPageNum>5 }"><a href="${cp }/admin/permission/list?pageNum=${pu.startPageNum-1}">[이전페이지]</a></c:if>
		<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
			<c:choose>
				<c:when test="${i==param.pageNum }">
					<a
						href="${cp }/admin/permission/list?pageNum=${i}&field=${field}&keyword=${keyword}"><span
						style='color: blue'>${i }</span></a>
				</c:when>
				<c:otherwise>

					<a
						href="${cp }/admin/permission/list?pageNum=${i}&field=${field}&keyword=${keyword}"><span
						style='color: gray'>${i }</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
	<br>

<div class="elementor-widget-container" >
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<p>[${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}님
				반갑습니다:)] <a href="#"
				onclick="document.getElementById('admin_logout').submit();">로그아웃</a> | 쿠팡요기이츠 메인화면으로 돌아가시려면 <strong><a href="${cp }/" style="color:#D811FF">여기</a></strong>를 클릭해 주세요!</p>
			<form:form id="admin_logout" method="post" action="${cp }/logout">
			</form:form>
		</sec:authorize>
	</div>
</body>
</html>
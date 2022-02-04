<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<style>
	h1{text-align:center}
    ul {width: 210px; margin-left: auto; margin-right: auto; }
	p{text-align:center}

</style>
<div class="elementor-widget-container">
<sec:authorize access="hasRole('ROLE_ADMIN')">
<span>[${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}님 반갑습니다.]</span>
		<span class="elementor-icon-list-text"><a href="#" onclick="document.getElementById('admin_logout').submit();">로그아웃</a></span>
		<form:form id="admin_logout" method="post" action="${cp }/logout">
		</form:form>
</sec:authorize>
</div>
<div class="page-header">
	<h1><a href="${cp }/admin/adminpage">관리자 페이지</a></h1>
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
        <th>주문번호</th>
        <th>주문자 아이디</th>
        <th>요청사항</th>
        <th>주문상태</th>
        <th>총금액</th>
        <th>주문일</th>
        <th>취소</th>
        <th>문자</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="vo" items="${list }">
      <tr>
        <td>${vo.or_num}</td>
        <td>${vo.ui_id}</td>
        <td>${vo.or_request}</td>
        <td>${vo.or_status}</td>
        <td>${vo.or_totalcost}</td>
        <td>${vo.regdate}</td>
        <!-- <fmt:formatDate value="${vo.regdate}" var="regdate" pattern="yyyy-MM-dd"/> -->
        <td><a href="${cp }/refund/delete?or_num=${vo.or_num }"><input type="button" value="취소" class="btn btn-warning"></a></td>
        <td><a href="${cp }/refund/send"><input type="button" value="문자" class="btn btn-success"></a></td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
</div>
<div class="text-center">
	<c:forEach var= "i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
		<c:choose>
			<c:when test="${i==param.pageNum }">
				<a href="${cp }/refund/list?pageNum=${i}&field=${field}&keyword=${keyword}"><span style='color:blue'>${i }</span></a>
			</c:when>
			<c:otherwise>
				<a href="${cp }/refund/list?pageNum=${i}&field=${field}&keyword=${keyword}"><span style='color:gray'>${i }</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</div>
<br>
<div class="text-center">
	<form method="post" action="${cp }/admin/refund/list">
		<select name="field">
			<option value="or_num" <c:if test="${field=='or_num'}">selected</c:if> >주문번호</option>
			<option value="ui_id" <c:if test="${field=='ui_id'}">selected</c:if> >주문자 아이디</option>
		</select>
		<input type="text" name="keyword" value="${keyword }">
		<input type="submit" value="검색">
	</form>
</div>
<p>쿠팡요기이츠 관리자페이지 입니다</p>
</body>
</html>
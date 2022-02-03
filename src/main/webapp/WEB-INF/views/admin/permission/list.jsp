<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<style>
	h1{text-align:center}
    ul {width: 260px; margin-left: auto; margin-right: auto; }
	p{text-align:center}

</style>
<div class="page-header">
	<h1><a href="${cp }/admin/adminpage">관리자 페이지</a></h1>
</div>
<ul class="nav nav-pills">
	<li><a href="${cp }/admin/permission/list">신규판매자 가입승인 관리</a>
	<li><a href="${cp }/admin/discount/list">매출우수매장 수수료감면 관리</a>
</ul>
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
<head>
<meta charset="UTF-8">
<title>permission list</title>
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
        <th>승인<th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="vo" items="${list }">
      <tr>
        <td>${vo.r_id}</td>
        <td>${vo.r_name }</td>
        <td>${vo.r_addr }</td>
        <td>${vo.r_info }</td>
        <td><button id="permission" value="승인" class="btn btn-primary"><a href="${cp }/permission/update?r_id=${vo.r_id}">승인</a></button></td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
</div>
<p>쿠팡요기이츠 관리자페이지 입니다</p>
</body>
</html>
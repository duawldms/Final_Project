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
	<li><a href="${cp }/admin/reviewchk/list">리뷰 관리</a>
	<li><a href="${cp }/admin/complain/list">컴플레이션 관리</a>
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
  <script type="text/javascript">

  //function deleteFn(num){
	  //location.href="${cp}/memberDelete.do?num="+num; // ?num=12
 // }
  </script>
</head>
<body>
<div class="container">
    <table class="table table-striped">
    <thead>
      <tr>
        <th>번호</th>
        <th>주문번호</th>
        <th>등록일</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>${vo.re_num}</td>
        <td><a href="${cp }/admin/reviewchk/detail?num=${vo.re_num}">${vo.or_num}</a></td>
        <td>${vo.re_regdate}</td>
        <td><button type="button" value="삭제" class="btn btn-danger" onclick="deleteFn(${vo.re_num})">Danger</button></td>
      </tr>
    </tbody>
  </table>
</div>
<p>쿠팡요기이츠 관리자페이지 입니다</p>
</body>
</html>
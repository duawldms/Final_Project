<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${cp }/resources/css/common.css?after">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="${cp }/resources/js/jquery-3.6.0.js"></script>
</head>
<body>
<script type="text/javascript">
	
</script>
<div id="wrap">
	<div id="header">
		<div id="header-logo">
			<h2><a href="${cp }/">배달요기이츠</a></h2>
		</div>
		<div>
			<ul class="header-li">
				<c:choose>
				<c:when test="${empty sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">
				<li><a href="${cp }/loginuser">로그인</a></li>
				<li><a href="${cp }/joinuser">주문표</a></li>
				</c:when>
				<c:otherwise> 
				<span>[${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}님 반갑습니다.]</span>
				<li><a href="${cp }/joinuser">주문표</a></li>
				<li><a href="${cp }/usermypage">회원정보</a></li>
				</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
	<div id="main">
		<jsp:include page="${requestScope.main }"/>

	</div>
	<div id="footer">
		<div id="footer-menu">
			<ul>
				<li><a href="${cp }/loginRestaurant">판매자 로그인</a></li>
				<li><a href="${cp }/loginAdmin">관리자 로그인</a></li>
				<li><a href="${cp }/sellerInsert">도로 주소명 테스트</a></li>
				<li><a href="">c</a></li>
				<li><a href="">d</a></li>
			</ul>
		</div>
		<div id="footer-info">
			<p>유한책임회사 위대한개발자</p>
			<p>서울특별시 종로구 율곡로10길 105 디아망 4F(봉익동 10-1 디아망 4F) TEL : 070-8240-3211~3 FAX : 02-777-5407</p>
			<p>사업자등록번호 : 104-81-59383 통신판매업신고번호 : 중구 065325 중앙HTA㈜</p>
			<p>COPYRIGHT(C) HTA CO., LTD. ALL RIGHTS RESERVED.</p>
		</div>
	</div>
</div>
</body>
</html>
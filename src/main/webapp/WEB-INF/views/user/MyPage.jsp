<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/project/resources/js/jquery-3.6.0.js"></script>
	<style type="text/css">
	div#mypagelayout{height:900px;}
	div#sidepage{float:left;width:330px;height:900px;}  
	ul#list{list-style:none;}
	
	</style>
	<script type="text/javascript">
	
	
	
	</script>
</head>
<body>
<div id="mypagelayout">
	<div id="sidepage">
		<div>
		 <h2>마이 페이지</h2>
			<h4>${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}님 반갑습니다.</h4>
		</div>
		<!-- 회원등급? -->
		<ul id="list">
			<li><a href="${cp }/userdelivery?ui_id=${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">배달내역</a></li>
			<li><a href="${cp }/userreview?ui_id=${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">리뷰내역</a></li>
			<li><a href="${cp }/userinfocheck?ui_id=${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">기본정보</a></li>
			<li><a href="${cp }/userdelete?ui_id=${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">회원탈퇴하기</a></li>
		</ul>
	</div>
	<div id="mypagemain">
		<jsp:include page="${requestScope.mypagemain }"/>
	</div>
</div>
</body>
</html>
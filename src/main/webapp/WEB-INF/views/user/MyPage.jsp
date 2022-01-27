<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/project/resources/js/jquery-3.6.0.js"></script>
	<style type="text/css">
	
	
	
	</style>
	<script type="text/javascript">
	
	
	
	</script>
</head>
<body>

	<div id="sidepage">
		<div><h2>마이 페이지</h2></div>
		<!-- 회원등급? -->
		<ul>
			<li>${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}님 반갑습니다.</li>
			<li><a href=""></a>배달내역</li>
			<li><a href=""></a>리뷰내역</li>
			<li><a href="${cp }/userinfo"></a>기본정보</li><!--기본정보 안에 회원탈퇴하기 기능 추가하기 -->
		</ul>
	</div>
	<div id="mainpage">
			
	</div>

</body>
</html>
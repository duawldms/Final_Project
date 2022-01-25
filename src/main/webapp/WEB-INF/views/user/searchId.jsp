<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/project/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(function(){
		
	});


</script>
</head>
<body>

<h2>회원 아이디 찾기</h2>
	<form action="${cp }/serchid" method="post">
		이름<br>
		<input type="text" name="ui_id"><br>
		이메일<br>
		<input type="text" name="ui_email"><br>
		이메일 확인<br>
		<input type="text" name="checkemail"><br>
		<input type="submit" value="조회">
		<span></span>	
	</form>
</body>
</html>
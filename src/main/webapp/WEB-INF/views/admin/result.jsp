<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">

	#showresult{
	text-align:center;
	font-size:30px
	}
	p{
	text-align:center;
	}
</style>
 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
	img{display:block; margin:0px auto;}
</style>
</head>
<body>
<img src="${cp }/resources/img/check.png" style="display:block; margin:0 auto; width:260px; height:230px; top:100px;">
<br><br>
<div id="showresult">
${result }
</div>
<br>
<p>생성된 관리자 계정으로 로그인을 희망하시면 로그인 페이지로 이동해 주세요!</p>
<br>
<div align="center">
<a href="${cp }/admin/adminpage"><input type="button" value="메인" class="btn btn-primary"></a>&nbsp;
<a href="${cp }/loginAdmin"><input type="button" value="로그인" class="btn btn-success"></a>
</div>
</body>
</html>



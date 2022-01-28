<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#wrap #sallerMyPage li{
	list-style:none; display: inline-block;
}
#wrap #box1 li{
	list-style:none; display: inline-block;
}
#wrap #box1{
	 width:500px; text-align: center;display: inline-block; padding-bottom: 20px;
}
#wrap{
	margin:0px	; padding: 0px; text-align: center;
}
</style>
</head>
<body>
<div id="wrap">
	<div id="sallermypage">
		<ul>
			<li><a href="${cp}/">home</a></li>
			<li><strong>판매자페이지</strong></li>
		</ul>
	</div>
	<div id="saller1">
		<ul>
			<li><a href="">회원정보수정</a></li>
			<li><a href="">매장정보수정</a></li>
			<li><a href="${cp }/restaurant/menuadd">음식등록</a></li>
			<li><a href="${cp }/restaurant/foodList">음식수정</a></li>
			<li><a href="">음식옵션</a></li>
			<li><a href="">리뷰관리</a></li>
			<li><a href="">매출현황</a></li>
		</ul>
	</div>
</div>
</body>
</html>
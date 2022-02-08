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
			<li><a href="${cp }/restaurant/sellerUpdate">회원정보 수정</a></li>
			<li><a href="${cp }/restaurant/sellerPwdCheck">비밀번호 변경</a></li>
			<li><a href="${cp }/restaurant/infoupdate">매장정보수정</a></li>
			<li><a href="${cp }/restaurant/menuadd">음식 등록</a></li>
			<li><a href="${cp }/restaurant/foodEdit">음식 수정 및 삭제</a></li>
			<li><a href="${cp }/restaurant/foodList">사이드 음식 추가</a></li>
			<li><a href="">리뷰관리</a></li>
			<li><a href="${cp }/restaurant/chart">매출현황</a></li>
		</ul>
	</div>
</div>
</body>
</html>
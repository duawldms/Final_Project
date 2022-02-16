<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
#wrap #box1 li{
	list-style:none; 
	display: inline-block;
}
#wrap #box1{
	 width:500px; 
	 text-align: center;
	 display: inline-block; 
	 padding-bottom: 20px;
}
#wrap{
	margin:0px; 
	padding: 0px; 
	text-align: center;
	margin-top: 50px;
}

#saller1 ul li:not(.li_title) {
	height: 50px;
	line-height: 50px;
}

#saller1 ul li:hover:not(.li_title) {
	background-color: #E0E0E0;
}
#saller1 ul li img {
	margin-right: 5px;
	margin-bottom: 2px;
}
#saller1 ul li a {
	color: black;
	display: inline-block;
	width: 203px;
    height: 50px;
    text-decoration: none;
}

.li_title {
	font-weight: bold;
	padding: 5px;
}
</style>
<div id="wrap">
<div id="saller1">         
		 <h3>My Page</h3>
		<h6><img src="${cp }/resources/img/user.png" style="width: 20px; height: 20px;">${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}님 반갑습니다.</h6>
		<ul id="list"> 
			<li><a href="${cp }/userdelivery">배달내역</a></li>
			<li><a href="${cp }/">리뷰쓰기</a></li>
			<li><a href="${cp }/userinfocheck">기본정보</a></li>
			<li><a href="${cp }/useraddr">배송지 관리</a></li>
			<li><a href="${cp }/userdelete">회원탈퇴하기</a></li>
		</ul>
	  </div>  
</div>
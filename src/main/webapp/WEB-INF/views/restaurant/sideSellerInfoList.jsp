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
#saller1 ul {
	list-style:none;
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
		<ul>
			<li class="li_title"><img src="${cp }/resources/img/user.png" style="width: 20px; height: 20px;">정보 수정</li>
			<li><a href="${cp }/restaurant/sellerUpdate">회원정보 수정</a></li>
			<li><a href="${cp }/restaurant/sellerPwdCheck">비밀번호 변경</a></li>
			<li><a href="${cp }/restaurant/sellerDelete">회원 탈퇴</a></li>
			<li class="li_title"><img src="${cp }/resources/img/shop.png" style="width: 20px; height: 20px;">매장 관리</li>
			<li><a href="${cp }/restaurant/restaurantinfo">매장정보</a></li>
			<li><a href="${cp }/restaurant/infoupdate">매장정보수정</a></li>
			<li><a href="${cp }/restaurant/orderList">주문 목록</a></li>
			<li><a href="${cp }/restaurant/chart">매출현황</a></li>
			<li><a href="${cp }/restaurant/orderComplete">주문 완료 목록</a></li>
			<li class="li_title"><img src="${cp }/resources/img/fork.png" style="width: 20px; height: 20px;">메뉴 관리</li>
			<li><a href="${cp }/restaurant/menuadd">메뉴 등록</a></li>
			<li><a href="${cp }/restaurant/foodEdit">메뉴 수정</a></li>
			<li><a href="${cp }/restaurant/foodList">사이드 메뉴 추가</a></li>
		</ul>
	</div>
</div>
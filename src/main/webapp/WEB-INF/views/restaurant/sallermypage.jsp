<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.seller-my {
		display: table;
	    margin: 0 auto;
	    width: 100%;
	    height: 720px;
	    text-align: center;
	}
	
	.seller-info {
		height: 50%;
    	height: 100%;
	    display: table-cell;   
	    vertical-align: middle; 
	}
	
	.seller-edit {
		border: 1px solid #D8D8D8;
	    height: 25%;
	    width: 25%;
	    display: inline-block;
	    margin: 5px;
	    cursor: pointer;
	}
	
	.seller-edit:hover {
		background-color: #E0E0E0;
	}
	
	.seller-edit img {
		width: 100px;
		height: 100px;
	}
</style>
<div class="seller-my">
	<div class="seller-info">
		<div class="seller-edit"><img src="${cp }/resources/img/user2.png"><br>회원정보 수정</div>	
		<div class="seller-edit"><img src="${cp }/resources/img/password.png"><br>비밀번호 변경</div>	
		<div class="seller-edit"><img src="${cp }/resources/img/shop.png"><br>매장정보</div>	
		<div class="seller-edit"><img src="${cp }/resources/img/house-repair.png"><br>매장정보 수정</div>	
		<div class="seller-edit"><img src="${cp }/resources/img/order-food.png"><br>주문목록</div>	
		<div class="seller-edit"><img src="${cp }/resources/img/bill.png"><br>매출현황</div>	
		<div class="seller-edit"><img src="${cp }/resources/img/menu.png"><br>메뉴 등록</div>	
		<div class="seller-edit"><img src="${cp }/resources/img/product-design.png"><br>메뉴 수정</div>	
		<div class="seller-edit"><img src="${cp }/resources/img/food.png"><br>사이드 메뉴 추가</div>	
	</div>
</div>
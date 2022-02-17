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
	    padding: 25px;
	}
	
	.seller-edit:hover {
		background-color: #E0E0E0;
	}
	
	.seller-edit img {
		width: 100px;
		height: 100px;
		max-width:100%; max-height:100%;
            vertical-align:middle;
	}
</style>
<div class="seller-my">
	<div class="seller-info">
		<div class="seller-edit" onclick="location.href='${cp }/restaurant/sellerUpdate'"><img src="${cp }/resources/img/user2.png"><br><i>회원정보 수정</i></div>	
		<div class="seller-edit" onclick="location.href='${cp }/restaurant/sellerPwdCheck'"><img src="${cp }/resources/img/password.png"><br><i>비밀번호 변경</i></div>	
		<div class="seller-edit" onclick="location.href='${cp }/restaurant/restaurantinfo'"><img src="${cp }/resources/img/shop.png"><br><i>매장정보</i></div>	
		<div class="seller-edit" onclick="location.href='${cp }/restaurant/infoupdate'"><img src="${cp }/resources/img/house-repair.png"><br><i>매장정보 수정</i></div>	
		<div class="seller-edit" onclick="location.href='${cp }/restaurant/orderList'"><img src="${cp }/resources/img/order-food.png"><br><i>주문목록</i></div>	
		<div class="seller-edit" onclick="location.href='${cp }/restaurant/chart'"><img src="${cp }/resources/img/bill.png"><br><i>매출현황</i></div>	
		<div class="seller-edit" onclick="location.href='${cp }/restaurant/menuadd'"><img src="${cp }/resources/img/menu.png"><br><i>메뉴 등록</i></div>	
		<div class="seller-edit" onclick="location.href='${cp }/restaurant/foodEdit'"><img src="${cp }/resources/img/product-design.png"><br><i>메뉴 수정</i></div>	
		<div class="seller-edit" onclick="location.href='${cp }/restaurant/foodList'"><img src="${cp }/resources/img/food.png"><br><i>사이드 메뉴 추가</i>	</div>	
	</div>
</div>
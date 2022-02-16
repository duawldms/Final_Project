<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript" src="${cp }/resources/js/jquery-3.6.0.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.2/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<link rel="stylesheet" type="text/css" href="${cp }/resources/css/restaurant.css">
<style>
	.order-accept-wrap {
		margin: auto;
	}
	
	.order-accept-title {
		margin-top: 15px;
		text-align: center;
	}
	
	#or_deltime {
		padding: 5px;
	    margin: 5px;
	    width: 60px;
	    font-size: 20;
	}
	.order-accept-div {
		margin-top: 5px;
	}
	
	#order-accept-a {
		border-radius: 10px;
	    border: 1px solid;
	    display: block;
	    height: 40px;
	    width: 150px;
	    text-align: center;
	    margin: auto;
	    line-height: 2.5;
	    text-decoration: none;
	    background-color: #7bcfbb;
		color: white;
	}
	
	#order-accept-a:hover {
		color: #7bcfbb;
		background-color: white;
	}
	
	.order-accept-info {
		text-align: center;
	}
	
	order-accept-info lable {
		padding: 5px;
	}
</style>
<div class="order-accept-wrap">
	<form:form id="order-accept-form">
		<div class="order-accept-info">
			<label for="del-time"><b style="font-size: 20px">배달 예상시간</b></label>
			<br>
			<input type="number" step="5" min="10" id="or_deltime" name="or_deltime" value="30"><b style="font-size: 20px;">분</b>
		</div>
		<div class="order-accept-div">
			<a href="javascript:void(0)" id="order-accept-a" onclick="orderAccept(${requestScope.or_num})">주문 수락</a>
		</div>
		<input type="hidden" name="status" value="${requestScope.status }">
		<input type="hidden" name="or_num" value="${requestScope.or_num }">
	</form:form>	
</div>
<script>
	var stompClient = null;
	
	$(function() {
		var socket = new SockJS('/project/stomp');
		stompClient = Stomp.over(socket);
		stompClient.connect({}, function (frame) {
			console.log("connected : " + frame);
		});
	});
	
	function orderAccept(or_num) {
	   stompClient.send("/app/callback", {}, JSON.stringify({'or_num': or_num}));
	   window.opener.name = "orderList"; // 부모창의 이름 설정
	   document.getElementById("order-accept-form").target = "${cp}/restaurant/orderList"; // 타켓을 부모창으로 설정
	   document.getElementById("order-accept-form").action = "${cp}/restaurant/acceptReason";
	   document.getElementById("order-accept-form").method = "post";
	   document.getElementById("order-accept-form").submit();
	   self.close();
	}
	
</script>
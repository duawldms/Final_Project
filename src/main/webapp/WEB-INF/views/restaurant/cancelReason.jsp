<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript" src="${cp }/resources/js/jquery-3.6.0.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.2/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<link rel="stylesheet" type="text/css" href="${cp }/resources/css/restaurant.css">
<style>
	.cancel_reason_wrap {
		margin: auto;
	}
	
	.cancel_reason_title {
		margin-top: 15px;
		text-align: center;
	}
	
	.cancel_radio_wrap {
		width: 200px;
		margin: auto;
	}
	
	.cancel_radio {
		margin: 5px;
		font-size: 20px;
	}
	
	.cancel_radio input {
		font-size: 14px;
	    width: 18px;
	    height: 18px;
	}
	.order_cancel_div {
		margin-top: 30px;
	}
	
	#order_cancel_a {
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
	
	#order_cancel_a:hover {
		color: #7bcfbb;
		background-color: white;
	}
	
</style>
<div class="cancel_reason_wrap">
	<div class="cancel_reason_title">
		<h2>주문 거부 사유</h2>
	</div>
	<form:form id="cancel_reason_form">
		<div class="cancel_radio_wrap">
			<div class="cancel_radio">
				<input type="radio" name="cancel_reason" value="재료소진"> 재료 소진
			</div>
			<div class="cancel_radio">
				<input type="radio" name="cancel_reason" value="배달지연"> 배달 지연
			</div>
			<div class="cancel_radio">
				<input type="radio" name="cancel_reason" value="고객정보 불일치"> 고객정보 불일치
			</div>
			<div class="cancel_radio">
				<input type="radio" name="cancel_reason" value="기타"> 기타 사유
			</div>
		</div>
		<div class="order_cancel_div">
			<a href="javascript:void(0)" id="order_cancel_a" onclick="orderCancel()">주문 거부</a>
		</div>
		<input type="hidden" name="or_num" id="or_num" value="${requestScope.or_num }">
	</form:form>	
</div>
<div id="my_modal">
	<div class="modal_top">
		<span id="modal_info">오류</span>
		<span id="close" class="modal_close_btn">&times;</span>
	</div>
	<div class="modal_center">
	    취소 유형을 선택하세요.
	</div>
    <div style="text-align: center;">
	    <input type="button" value="확인" class="cancel_btn" style="width: 80px; height: 30px;">
    </div>
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

	function orderCancel() {
		let radio = document.getElementsByName("cancel_reason");
		let radio_check = false;
		let radio_value = null;
		let or_num = document.getElementById("or_num");
		
		for (let i = 0; i < radio.length; i++) {
			if (radio[i].checked == true) {
				radio_check = true;
				radio_value = radio[i].value + "(으)로 인해 주문이 취소되었습니다.";
				break;
			}
		}
		
		if (radio_check == false) {
			popup_open_btn();
			return;
		}
		stompClient.send("/app/callback", {}, JSON.stringify({'or_num': or_num, 'reject': radio_value}));
		window.opener.name = "orderList"; // 부모창의 이름 설정
	    document.getElementById("cancel_reason_form").target = "${cp}/restaurant/orderList"; // 타켓을 부모창으로 설정
	    document.getElementById("cancel_reason_form").action = "${cp}/restaurant/cancelReason";
	    document.getElementById("cancel_reason_form").method = "post";
	    document.getElementById("cancel_reason_form").submit();
	    window.opener.closeWin();
	    self.close();
	}
	
	function modal(id) {
	    var zIndex = 9999;
	    var modal = document.getElementById(id);
	
	    // 모달 div 뒤에 흐릿한 배경
	    var bg = document.createElement('div');
	    bg.setStyle({
	        position: 'fixed',
	        zIndex: zIndex,
	        left: '0px',
	        top: '0px',
	        width: '100%',
	        height: '100%',
	        overflow: 'auto',
	     // 레이어 색 변경
	        backgroundColor: 'rgba(0,0,0,0.4)'
	    });
	    document.body.append(bg);
	
	 	// 닫기 버튼 처리, 흐릿한 레이어와 모달 div 제거
	    modal.querySelector('.modal_close_btn').addEventListener('click', function() {
	        bg.remove();
	        modal.style.display = 'none';
	    });
	    
	    modal.querySelector('.cancel_btn').addEventListener('click', function() {
	        bg.remove();
	        modal.style.display = 'none';
	    });
	
	    modal.setStyle({
	        position: 'fixed',
	        display: 'block',
	        boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',
	
	        // 시꺼먼 레이어 보다 한칸 위에 보이기
	        zIndex: zIndex + 1,
	
	        // div center 정렬
	        top: '50%',
	        left: '50%',
	        transform: 'translate(-50%, -50%)',
	        msTransform: 'translate(-50%, -50%)',
	        webkitTransform: 'translate(-50%, -50%)'
	    });
	}
	
	// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
	Element.prototype.setStyle = function(styles) {
	    for (var k in styles) this.style[k] = styles[k];
	    return this;
	};
	
	function popup_open_btn() {
		modal('my_modal');
	}
</script>
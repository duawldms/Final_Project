<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#main{
		padding-top:20px;
		padding-bottom:20px
	}
	.btn{
		background-color:#7bcfbb;
		color:white;
	}
</style>    
<div id="purchaseResult" class="container">
	<h3>주문완료 되었습니다!</h3>
	<p>매장에서 주문 확인 중 입니다.</p>
	<span>매장의 상황에 따라 주문이 취소될 수 있습니다.</span><br>
	<span>접수되면 알림으로 알려드릴게요</span><br><br>
	<span>주문상황은 언제든 주문내역에서 확인하실 수 있습니다</span><br>
	<div>
		<button type="button" class="btn">주문내역 확인하기</button>
		<button type="button" class="btn" onclick="javascript:gohome()">홈으로 이동하기</button>
	</div>
</div>
<script>
	function goOrderDetail(){
		location.href="${cp}/delivertydetail?or_num=${or_num}";
	}
	function gohome(){
		location.href="${cp}/";
	}
</script>






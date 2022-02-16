<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${cp }/resources/css/restaurant.css">
<style>
	.del-result-wrap {
	    border: 4px solid #7bcfbb;
	    width: 600px;
	    height: 380px;
	    margin: auto;
	    padding: 50px;
	    margin-top: 170px;
	    margin-bottom: 170px;
	}
	
	.del-result-title {
		text-align: center;
	}
	
	.del-result-title h3 {
		color: cadetblue;
		padding: 10px;
	}
	
	.del-result-img {
		text-align: center;
	}
	
	.del-result-img img {
		width: 100px;
	}
	
	.del-result-btn {
		text-align: center;
		margin-top: 25px;
	}
	
	.del-info {
		text-align: center;
	}
</style>
<div class="del-result-wrap">
	<div class="del-result-img">
		<img src="${cp }/resources/img/check.png">
	</div>
	<div class="del-result-title">
		<h3>회원탈퇴가 완료되었습니다.</h3>
	</div>
	<div class="del-info">
		<b>그동안 배달이츠요기를 이용해 주셔서 감사합니다.</b>
	</div>
	<br>
	<div class="del-result-btn">
		<input type="button" value="홈으로 가기" class="btn3" onclick="location.href='${cp}/'">
	</div>
</div>
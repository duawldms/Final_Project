<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	
	.searchplace{width:700px;}
	.searchbar{width:400px}
</style>    
<div class="container">
	<div class="input-group container searchplace">
		<input type="text" class="form-control col-6" id="place" placeholder="배달받을 간단한 주소를 입력해주세요!">
		<input type="text" class="form-control col-4 place" id="placeDetail" aria-describedby="addr-addon">
		<button class="btn btn-outline-secondary" type="button" id="addr-addon">검색</button>
	</div>
	<br>
	<div class="input-group searchbar">
		<input type="text" class="form-control searchmenu" placeholder="먹고싶은 메뉴, 가게 검색" aria-describedby="button-addon2">
		<button class="btn btn-outline-secondary" type="button" id="button-addon2">검색</button>
	</div>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	var themeObj = {
		   bgColor: "#162525", //바탕 배경색
		   searchBgColor: "#162525", //검색창 배경색
		   contentBgColor: "#162525", //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
		   pageBgColor: "#162525", //페이지 배경색
		   textColor: "#FFFFFF", //기본 글자색
		   queryTextColor: "#FFFFFF", //검색창 글자색
		   //postcodeTextColor: "", //우편번호 글자색
		   //emphTextColor: "", //강조 글자색
		   outlineColor: "#444444" //테두리
		};
	window.onload = function(){
		document.getElementById("addr-addon").addEventListener('click',function(){
			new daum.Postcode({
		        oncomplete: function(data) {
		    	   	document.getElementById("place").value = data.address; // 주소 넣기
		        	document.getElementById("placeDetail").placeholder = "상세주소를 입력하세요";
		        	document.getElementById("placeDetail").focus();
		        },   
		        theme:themeObj
			 }).open({
				q:document.getElementById("place").value
			 });
		});
	}
</script>
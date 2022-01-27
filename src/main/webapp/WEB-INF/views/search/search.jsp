<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<style>
	.where{padding-top:100px;}
	#up{position:relative;left:220px}
	.searchplace{width:700px;margin-bottom:100px}
	.searchbar{width:400px}
	.restaurant{width:600px;margin:auto}
</style>    

<div class="container where">
	<div id="up">
		<a href="loginuser">아이디 있으신가요?</a>
		<h3>어디로 배달해드릴까요?</h3>
	</div>
	<sec:authorize access="isAuthenticated()">
		<div class="input-group container searchplace">
			<select onchange="changeAddr(this.options[this.selectedIndex].text)">
				<c:forEach var="vo" items="${list }" varStatus="status">
					<c:choose>
						<c:when test="${vo.ua_nickname=='기본배송지' }">
							<option selected="selected">${vo.ua_nickname }</option>
						</c:when>
						<c:otherwise>
							<option>${vo.ua_nickname }</option>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</select>
			<input type="text" class="form-control col-10" id="place" value="${vo.ua_addr }">
		</div>
	</sec:authorize>
	<sec:authorize access="isAnonymous()">
		<div class="input-group container searchplace">
			<input type="text" class="form-control col-6" id="place" placeholder="배달받을 간단한 주소를 입력해주세요!">
			<input type="text" class="form-control col-4 place" id="placeDetail" aria-describedby="addr-addon">
			<button class="btn btn-outline-secondary" type="button" id="addr-addon">검색</button>
		</div>
	</sec:authorize>
</div>
<div class="container" id="res">
	<div class="input-group container searchbar">
		<input type="text" class="form-control searchmenu" placeholder="먹고싶은 메뉴, 가게 검색" aria-describedby="button-addon2">
		<button class="btn btn-outline-secondary" type="button" id="button-addon2">검색</button>
	</div>
	<div class="container" id="restau">
		
	</div>   
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6cda1d2e6578e00f2f149b8981a3cb1f&libraries=services"></script>
<script>
	function changeAddr(selected){
		$.ajax({
			url:"${cp}/user/addrDetail?ua_nickname="+selected,
			dataType:"json",
			success:function(data){
				$("#place").prop("value",data.vo.ua_addr);
				let coordx="";
				let coordy="";
				var geocoder = new kakao.maps.services.Geocoder();
				// 주소로 좌표를 검색합니다
				geocoder.addressSearch(data.vo.ua_addr, function(result, status) {
				    // 정상적으로 검색이 완료됐으면 
				     if (status === kakao.maps.services.Status.OK) {
				    	 coordx=result[0].x;
				    	 coordy=result[0].y;
				    	 $.ajax({
								url:"${cp}/user/search",
								data:{
									pageNum:"${pu.pageNum}",
									field:"${field}",
									keyword:"${keyword}",
									user_coordx:coordx,
									user_coordy:coordy
								},
								dataType:"json",
								success:function(data){
									console.log(data); // 데이터 받아오는지 체크
									let seller="";
									$("#restau").empty();
									console.log(data.listvo[0].r_name);
									for(let i=0;i<data.listvo.length;i++){
										console.log("i:"+i);
										seller+="<div class='container restaurant'>";
										seller+="<h3>"+data.listvo[i].r_name+"</h3>";
										seller+="<img src='${cp}/resources/img/"+data.listvo[i].r_img+"'>";
										seller+="</div>";
									}
									$("#restau").append(seller);
								}
							});
				     }
				});
			}
		});
	}
	
	var themeObj = {
		   bgColor: "#162525", //바탕 배경색
		   searchBgColor: "#162525", //검색창 배경색
		   contentBgColor: "#162525", //본문 배경색(검색결과,결과없음,첫화면,검색 서제스트)
		   pageBgColor: "#162525", //페이지 배경색
		   textColor: "#FFFFFF", //기본 글자색
		   queryTextColor: "#FFFFFF", //검색창 글자색
		   //postcodeTextColor: "", //우편번호 글자색
		   //emphTextColor: "", //강조 글자색
		   outlineColor: "#444444" //테두리 
		};
	window.onload = function(){
		
		let detail=document.getElementById("placeDetail");
		$.ajax({
			url:"${cp}/user/addrDetail?ua_nickname=기본배송지",
			
			dataType:"json",
			success:function(data){
				$("#place").prop("value",data.vo.ua_addr);
				let coordx="";
				let coordy="";
				var geocoder = new kakao.maps.services.Geocoder();
				// 주소로 좌표를 검색합니다
				geocoder.addressSearch(data.vo.ua_addr, function(result, status) {
				    // 정상적으로 검색이 완료됐으면 
				     if (status === kakao.maps.services.Status.OK) {
				    	 coordx=result[0].x;
				    	 coordy=result[0].y;
				    	 $.ajax({
								url:"${cp}/user/search",
								data:{
									pageNum:"${pu.pageNum}",
									field:"${field}",
									keyword:"${keyword}",
									user_coordx:coordx,
									user_coordy:coordy
								},
								dataType:"json",
								success:function(data){
									console.log(data);
									let seller="";
									console.log(data.listvo[0].r_name);
									for(let i=0;i<data.listvo.length;i++){
										console.log("i:"+i);
										seller+="<div class='container restaurant'>";
										seller+="<h3>"+data.listvo[i].r_name+"</h3>";
										seller+="<img src='${cp}/resources/img/"+data.listvo[i].r_img+"'>";
										seller+="</div>";
									}
									$("#restau").append(seller);
								}
							});
				     }
				});
			}
		});
		if(detail!=null){
			detail.disabled=true;
			document.getElementById("addr-addon").addEventListener('click',function(){
				new daum.Postcode({
			        oncomplete: function(data) {
			    	   	document.getElementById("place").value = data.address; // 주소 넣기
			    	   	detail.disabled=false;
			    	   	detail.placeholder = "상세주소를 입력하세요";
			    	   	detail.focus();
			        },
			        theme:themeObj
				 }).open({
					q:document.getElementById("place").value
				 });
			});
		}
		
	}
</script>
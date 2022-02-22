<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<style>
	#main{padding-bottom:70px}
	.where{padding-top:100px;}
	#up{position:relative;left:220px}
	.searchplace{width:700px;margin-bottom:100px}
	.searchbar{width:600px;margin-bottom:10px;}
	.restaurant{width:600px;margin:auto;height:auto;padding-top:10px}
	.restaurant img{float:left;margin-right:10px}
	.resimg{width:100px;height:100px}
	.paging{position:relative;margin:auto;top:60px}
	#category{width:100px}
	.star{position:relative;top:-2px}
	.nav-pills .nav-link.active, .nav-pills .show>.nav-link {
	    color: #fff;
	    background-color: #7bcfbb;
	}
	.nav-item a{
		color:#71c9b4;
	}
</style>    

<div class="container where">
	<sec:authorize access="isAuthenticated()">
		<div class="input-group container searchplace">
			<select onchange="changeAddr(this.options[this.selectedIndex].text,'${param.keyword }')">
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
			<input type="text" class="form-control col-10" id="place" value="${vo.ua_addr }" readonly="readonly">
		</div>
	</sec:authorize>
</div>
<div class="container" id="res">
	<div class="input-group container searchbar">
		<select class="form-control col-3" id="category">
		<c:choose>
			<c:when test="${category==''||category==null }">
				<option value="" selected>전체</option>
				<c:forEach var="cg_name" items="${cglist }">
					<option value="${cg_name }">${cg_name }</option>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<option value="">전체</option>
				<c:forEach var="cg_name" items="${cglist }">
					<c:choose>
						<c:when test="${category==cg_name }">
							<option value="${cg_name }" selected>${cg_name }</option>
						</c:when>
						<c:otherwise>
							<option value="${cg_name }">${cg_name }</option>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</select>
		<input type="text" class="form-control col-8 searchmenu" placeholder="먹고싶은 메뉴, 가게 검색" 
							aria-describedby="button-addon2" id="keyword" value="${param.keyword }">
		<button class="btn btn-outline-secondary" type="button" id="button-addon2">검색</button>
	</div>
	<div style="margin-bottom:30px;position:relative;left:270px">
		<ul class="nav nav-pills">
			<li class="nav-item">
				<a class="nav-link active" aria-current="page" id="orderhit" onclick="javascript:orderby('hit')" href="#">별점순</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#" id="orderdelcost" onclick="javascript:orderby('delcost')">배달료 낮은 순</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#" id="orderdistance" onclick="javascript:orderby('distance')">거리순</a>
			</li>
		</ul>
	</div>
	<div class="container" id="restau"></div>
	<div class="container paging" id="paging"></div>   
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6cda1d2e6578e00f2f149b8981a3cb1f&libraries=services"></script>
<script>
	let x="";
	let y="";
	
	function orderby(order){
		if(keyword!=null||keyword!=''){
			location.href="${cp}/user/search?cg_name="+$("#category").val()+"&keyword="+$("#keyword").val()+"&orderby="+order;
		}else{
			location.href="${cp}/user/search?cg_name="+$("#category").val();
		}
	}
	$("#button-addon2").click(function(){
		let keyword=$("#keyword").val();
		if(keyword!=null||keyword!=''){
			location.href="${cp}/user/search?cg_name="+$("#category").val()+"&keyword="+keyword;
		}else{
			location.href="${cp}/user/search?cg_name="+$("#category").val();
		}
	});
	let category="";
	function changeAddr(selected,keyword){
		$.ajax({
			url:"${cp}/user/addrDetail?ua_nickname="+selected,
			dataType:"json",
			success:function(data){
				$("#place").prop("value",data.vo.ua_addr);
				let coordx="";
				let coordy="";
				var geocoder = new kakao.maps.services.Geocoder();
				// 주소로 좌표를 검색합니다
				let comma=(data.vo.ua_addr).indexOf(',');
				let address="";
				if(comma!=-1){
					address=(data.vo.ua_addr).substring(0,comma);
				}else{
					address=data.vo.ua_addr;
				}
				geocoder.addressSearch(address, function(result, status) {
				    // 정상적으로 검색이 완료됐으면 
				     if (status === kakao.maps.services.Status.OK) {
				    	 coordx=result[0].x;
				    	 coordy=result[0].y;
				    	 $.ajax({
								url:"${cp}/user/search",
								data:{
									pageNum:"${pu.pageNum}",
									cg_name:"${param.cg_name}",
									keyword:keyword,
									orderby:"${param.orderby}",
									user_coordx:coordx,
									user_coordy:coordy
								},
								dataType:"json",
								success:function(data){
									let seller="";
									$("#restau").empty();
									$("#paging").empty();
									for(let i=0;i<data.listvo.length;i++){
										let star=+Math.round(data.listvo[i].hit*10)/10;
										let starcount="("+data.listvo[i].re_num+")";
										if(star==0){
											star='아직 리뷰가 없어요';
											starcount=""
										}
										if(data.listvo[i].r_state==3){
											seller+="<a href='javascript:closepopup()' style='text-decoration:none;color:black'>"
											seller+="<div class='container restaurant' style='filter: opacity(0.4)'>";
											seller+="<span style='position:absolute;width:100px;left:25px;top:30px;font-weight:initial;filter:none;font-size:0.9em'>지금은<br>영업준비중<br>입니다</span>";
										}else{
											seller+="<a href='${cp}/searchDetail?r_id="+data.listvo[i].r_id+"&distance="+data.listvo[i].distance+"' style='text-decoration:none;color:black'>"
											seller+="<div class='container restaurant'>";
										}
										seller+="<img src='${cp}/resources/img/"+data.listvo[i].r_img+"' class='resimg' >";
										seller+="<h5>"+data.listvo[i].r_name+"</h5>";
										seller+="<img src='${cp}/resources/img/star.png' style='width:25px;height:20px;float:left;margin-right:2px'>";
										seller+="<span>"+star+"&nbsp"+starcount+"</span><br>" // 별점 
										seller+="<img src='${cp}/resources/img/clock.jpg' style='width:20px;height:20px;float:left;margin-right:2px'>";
										seller+="&nbsp<span style='float:left;font-size:0.9em'>"+data.listvo[i].r_delmin+"분~"+data.listvo[i].r_delmax+"분";
										seller+="&nbsp&nbsp·&nbsp"+Math.round(data.listvo[i].distance *10)/10+"km </span><br>";
										seller+="<span style='font-size:0.9em'>배달요금 "+(data.listvo[i].r_delCost).toLocaleString('ko-KR')+"원</span>";
										seller+="</div></a>";
									}
									$("#restau").append(seller);
									let page="";
									let keyword="";
									//$("#keyword").val();
									x=data.user_coordx;
									y=data.user_coordy;
									page+="<nav aria-label='Page navigation'><ul class='pagination justify-content-center'>"
									for(let i=1;i<=data.pu.totalPageCount;i++){
										if(i==1){
											page+="<li class='page-item active' aria-current='page'><a class='page-link' href='javascript:paging("+i+","+data.user_coordx+","+data.user_coordy+")'><span style='color:blue'>"
													+i+"</span></a></li>";
										}else{
											page+="<li class='page-item'><a class='page-link' href='javascript:paging("+i+","+data.user_coordx+","+data.user_coordy+")'><span style='color:blue'>"
													+i+"</span></a></li>";
										}
									}
									if(data.pu.totalPageCount>1){
										page+="<li class='page-item'><a class='page-link' href='javascript:paging("+2+","+data.user_coordx+","+data.user_coordy+")'><span style='color:blue'>"
										+"Prev</span></a></li></ul></nav>";
									}
									$("#paging").append(page);
								}
							});
				     }
				});
			}
		});
	}
	function paging(pageNum,user_coordx,user_coordy){
		$.ajax({
			url:"${cp}/user/search",
			data:{
				pageNum:pageNum,
				keyword:"${param.keyword}",
				category:"${param.cg_name}",
				orderby:"${param.orderby}",
				user_coordx:user_coordx,
				user_coordy:user_coordy
			},
			dataType:"json",
			success:function(data){
				let seller="";
				$("#restau").empty();
				$("#paging").empty();
				for(let i=0;i<data.listvo.length;i++){
					let star=+Math.round(data.listvo[i].hit*10)/10;
					let starcount="("+data.listvo[i].re_num+")";
					if(star==0){
						star='아직 리뷰가 없어요';
						starcount="";
					}
					if(data.listvo[i].r_state==3){
						seller+="<a href='javascript:closepopup()' style='text-decoration:none;color:black'>"
						seller+="<div class='container restaurant' style='filter: opacity(0.4)'>";
						seller+="<span style='position:absolute;width:100px;left:25px;top:30px;font-weight:initial;filter:none;font-size:0.9em'>지금은<br>영업준비중<br>입니다</span>";
					}else{
						seller+="<a href='${cp}/searchDetail?r_id="+data.listvo[i].r_id+"&distance="+data.listvo[i].distance+"' style='text-decoration:none;color:black'>"
						seller+="<div class='container restaurant'>";
					}
					seller+="<img src='${cp}/resources/img/"+data.listvo[i].r_img+"' class='resimg'>";
					seller+="<h5>"+data.listvo[i].r_name+"</h5>";
					seller+="<img src='${cp}/resources/img/star.png' style='width:25px;height:20px;float:left;margin-right:2px'>";
					seller+="<span>"+star+"&nbsp"+starcount+"</span><br>"; // 별점 
					seller+="<img src='${cp}/resources/img/clock.jpg' style='width:20px;height:20px;float:left;margin-right:2px'>";
					seller+="&nbsp<span style='float:left;font-size:0.9em'>"+data.listvo[i].r_delmin+"분~"+data.listvo[i].r_delmax+"분";
					seller+="&nbsp&nbsp·&nbsp"+Math.round(data.listvo[i].distance *10)/10+"km </span><br>";
					seller+="<span style='font-size:0.9em'>배달요금 "+(data.listvo[i].r_delCost).toLocaleString('ko-KR')+"원</span>";
					seller+="</div></a>";
					
				}
				$("#restau").append(seller);
				let page="";
				let keyword="";
				//$("#keyword").val();
				page+="<nav aria-label='Page navigation'><ul class='pagination justify-content-center'>";
				if(pageNum!=1){
					page+="<li class='page-item'><a class='page-link' href='javascript:paging("+(pageNum-1)+","+data.user_coordx+","+data.user_coordy+")'><span style='color:blue'>"
					+"Prev</span></a><li>";
				}
				for(let i=1;i<=data.pu.totalPageCount;i++){
					if(i==pageNum){
						page+="<li class='page-item active' aria-current='page'><a class='page-link' href='javascript:paging("+i+","+data.user_coordx+","+data.user_coordy+")'><span style='color:blue'>"
								+i+"</span></a></li>";
					}else{
						page+="<li class='page-item'><a class='page-link' href='javascript:paging("+i+","+data.user_coordx+","+data.user_coordy+")'><span style='color:blue'>"
								+i+"</span></a></li>";
					}
				}
				if(pageNum!=data.pu.totalPageCount){
					page+="<li class='page-item'><a class='page-link' href='javascript:paging("+(pageNum+1)+","+data.user_coordx+","+data.user_coordy+")'><span style='color:blue'>"
					+"Prev</span></a></li></ul></nav>";
				}
				$("#paging").append(page);
			}
		});
	}
	function closepopup(){
		alert('해당 매장은 영업준비중입니다.');
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
		let orderparams="${param.orderby}";
		if(orderparams==''||orderparams=='hit'){
			$("#orderhit").prop('class','nav-link active');
			
			$("#orderdistance").prop('class','nav-link');
			
			$("#orderdelcost").prop('class','nav-link');
			
		}else if(orderparams=='distance'){
			$("#orderdistance").prop('class','nav-link active');
			$("#orderhit").prop('class','nav-link');
			$("#orderdidelcost").prop('class','nav-link');
		}else if(orderparams=='delcost'){
			$("#orderdelcost").prop('class','nav-link active');
			$("#orderhit").prop('class','nav-link');
			$("#orderdistance").prop('class','nav-link');
		}
		category=$("#category").val();
		if(category=='all'){
			category="";
		}
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
				let comma=(data.vo.ua_addr).indexOf(',');
				let address="";
				if(comma!=-1){
					address=(data.vo.ua_addr).substring(0,comma);
				}else{
					address=data.vo.ua_addr;
				}
				geocoder.addressSearch(address, function(result, status) {
				    // 정상적으로 검색이 완료됐으면 
				     if (status === kakao.maps.services.Status.OK) {
				    	 coordx=result[0].x;
				    	 coordy=result[0].y;
				    	 $.ajax({
								url:"${cp}/user/search",
								data:{
									pageNum:"${pu.pageNum}",
									cg_name:category,
									keyword:"${param.keyword}",
									orderby:"${param.orderby}",
									user_coordx:coordx,
									user_coordy:coordy
								},
								dataType:"json",
								success:function(data){
									let seller="";
									$("#restau").empty();
									$("#paging").empty();
									x=data.user_coordx;
									y=data.user_coordy;
									for(let i=0;i<data.listvo.length;i++){
										let star=+Math.round(data.listvo[i].hit*10)/10;
										let starcount="("+data.listvo[i].re_num+")";
										if(star==0){
											star='아직 리뷰가 없어요';
											starcount="";
										}
										if(data.listvo[i].r_state==3){
											seller+="<a href='javascript:closepopup()' style='text-decoration:none;color:black'>"
											seller+="<div class='container restaurant' style='filter: opacity(0.4)'>";
											seller+="<span style='position:absolute;width:100px;left:25px;top:30px;font-weight:initial;filter:none;font-size:0.9em'>지금은<br>영업준비중<br>입니다</span>";
										}else{
											seller+="<a href='${cp}/searchDetail?r_id="+data.listvo[i].r_id+"&distance="+data.listvo[i].distance+"' style='text-decoration:none;color:black'>"
											seller+="<div class='container restaurant'>";
										}
										seller+="<img src='${cp}/resources/img/"+data.listvo[i].r_img+"' class='resimg' >";
										seller+="<h5>"+data.listvo[i].r_name+"</h5>";
										seller+="<img src='${cp}/resources/img/star.png' style='width:25px;height:20px;float:left;margin-right:2px'>";
										seller+="<span class='star'>"+star+"&nbsp"+starcount+"</span><br>" // 별점 
										seller+="<img src='${cp}/resources/img/clock.jpg' style='width:20px;height:20px;float:left;margin-right:2px'>";
										seller+="&nbsp<span style='float:left;font-size:0.9em'>"+data.listvo[i].r_delmin+"분~"+data.listvo[i].r_delmax+"분";
										seller+="&nbsp&nbsp·&nbsp"+Math.round(data.listvo[i].distance *10)/10+"km </span><br>"
										seller+="<span style='font-size:0.9em'>배달요금 "+(data.listvo[i].r_delCost).toLocaleString('ko-KR')+"원</span>"
										seller+="</div></a>";
									}
									let page="";
									let keyword="";
										//$("#keyword").val();
									$("#restau").append(seller);
									page+="<nav aria-label='Page navigation example'><ul class='pagination justify-content-center'>"
									for(let i=1;i<=data.pu.totalPageCount;i++){
										if(i==1){
											page+="<li class='page-item active' aria-current='page'><a class='page-link' href='javascript:paging("+i+","+data.user_coordx+","+data.user_coordy+")'><span style='color:blue'>"
													+i+"</span></a></li>";
										}else{
											page+="<li class='page-item'><a class='page-link' href='javascript:paging("+i+","+data.user_coordx+","+data.user_coordy+")'><span style='color:blue'>"
													+i+"</span></a></li>";
										}
									}
									if(data.pu.totalPageCount>1){
										page+="<li class='page-item'><a class='page-link' href='javascript:paging("+2+","+data.user_coordx+","+data.user_coordy+")'><span style='color:blue'>"
										+"Prev</span></a></li></ul></nav>";
									}
									$("#paging").append(page);
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

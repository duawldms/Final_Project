<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<style>
	#main{
		padding-top:20px;
		padding-bottom:20px
	}
	#purchaseAc{
		width:850px;
	}
	#cartlist{
		position:absolute;
		top:88px;
		left:1170px;
		width:352px;
		height:400px;
		background-color:#7bcfbb;
	}
	#cartTitle{
		width:100%;
		height:40px;
		border-bottom:1px solid black;
		text-align:center;
		border:1px solid black;
	}
	#cartTitle h3{color:white}
	#cartMain{
		width:100%;
		height:320px;
		background-color:white;
		padding-top:5px;
		overflow:auto;
		border-right:1px solid black;
		border-left:1px solid black;
	}
	.costtotalbox{
		width:100%;
		border-right:1px solid black;
		border-left:1px solid black;
		border-bottom:1px solid black;
		background-color:white;
	}
	.cart{
		width:100%;
		display:inline-block;
		border-bottom:1px solid gray;
		padding-top:5px;
		padding-left:10px;
		padding-right:10px;
	}
	.cartimg{
		width: 70px;
		height:100%;
		float: left;
		display:inline-block;
	}
	.cartsub{
		width:260px;
		height:100%;
		float:right;
		padding-left:10px
	}
	.total{
		width:340px;
		height:20px;
		display:inline-block;
		padding-left:40px;
		margin-bottom:10px;
	}
	.delimg{
		width:20px;
		height:20px;
	}
	.cartOptions{
		font-size:0.8em;
	}
	.cartbtn{
		width:100%;
		text-align:center;
		position:relative;
		background-color:white;
		padding-top: 5px;
	}
	.purchase{
		height:40px;
		background-color:#7bcfbb;
	}
	.purtitle{
		position:relative;
		top:5px;
		left:18px;
		color:white;
		font-size:1.1em;
	}
	.addrleft{
		width:25%;
		float:left;
		display:inline-block;
	}
	.addrleft span{
		text-align:right;
		display:block;
		margin-bottom: 20px;
	    position: relative;
	    top: 8px;
	}
	.addrright{
		width:75%;
		float:right;
		display:inline-block;
	}
	.addrright input{
		width:500px;
		height:35px;
		margin-bottom:10px;
		padding-left: 10px;
	}
	.addrbtn{
		background-color:#7bcfbb;
	}
	.accordion-button {
	    color: white;
	    background-color: #7bcfbb;
	    box-shadow: inset 0 -1px 0 rgb(0 0 0 / 13%);
	    height: 45px;
	}
	.accordion-button:not(.collapsed) {
	    color: white;
	    background-color: #7bcfbb;
	    box-shadow: inset 0 -1px 0 rgb(0 0 0 / 13%);
	    height: 45px;
	}
	.orderRequest{
		text-align:center;
	}
	.pur{
		height: 40px;
	    background-color: #7bcfbb
	}
	.purmain{
		position: relative;
	    top: 5px;
	    left: 18px;
	    color: white;
	}
	.purchasemain{
		background-color:white;
	}
	#purRadio{
		padding-left:40px;
		padding-top: 15px;
		padding-bottom:15px;
	}
	#now{
		display:none;
	}
	#later{
		display:none;
	}
</style>
<div id="cartlist">
	<div id="cartTitle">
		<h3>주문표</h3>
	</div>
	<div id="cartMain">
		<c:forEach var="cvo" items="${cflist }">
			<div class="cart" >
				<div class="cartimg">
					<img src="${cp }/resources/img/${food_img}" 
						style='width: 70px; height: 60px; float: left;display:inline-block;'>
				</div>
				<div class="cartsub">
				<span>${cvo.food_name }</span>
				<div id="options${cvo.cart_num }" class="cartOptions"></div>
				<span style="display:none" class="cartnum">${cvo.cart_num }</span>
				<span style="display:none" class="cost${cvo.cart_num }">${cvo.food_cost }</span>
				</div>
				<div id="total${cvo.cart_num }" class="total"></div>
			</div>
		</c:forEach>
	</div>
	<div class="costtotalbox" style="text-align:center;">
		<div style="font-size:0.9em">
			<c:choose>
				<c:when test="${delcost!=0 }">
					<span>배달료 +${delcost }원</span>
				</c:when>
				<c:otherwise>
					<span>배달료 무료</span>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="costtotal">
		</div>
	</div>
	<div class="d-grid gap-2 col-12 mx-auto cartbtn">
		
		<button type="button" class="btn text-white" id="orderNow" style="background-color:#7bcfbb">결제하기</button>
	</div>
</div>
<div class="container">
	<div class="accordion" id="purchaseAc">
		<div class="accordion-item purchase">	
			<span class="accordion-header purtitle" >
				결제하기
			</span>
		</div>
		<div class="accordion-item">
			<h2 class="accordion-header" id="addrheader">
				<button class="accordion-button addrbtn" type="button" data-bs-toggle="collapse" data-bs-target="#addr" aria-expanded="true" aria-controls="addr">
					배달정보
				</button>
			</h2>
			<div id="addr" class="accordion-collapse collpase show" aria-labelledby="addrheader" data-bs-parant="#purchaseAc">
				<!-- <div class="accordion-body addrBody">
					
				</div> -->
			</div>
		</div>
		<div class="accordion-item">
			<h2 class="accordion-header" id="headingTwo">
				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
		       		주문 시 요청사항
				</button>
			</h2>
			<div id="collapseTwo" class="accordion-collapse collapse show" aria-labelledby="headingTwo" data-bs-parent="#purchaseAc">
				<div class="accordion-body orderRequest">
					<textarea rows="3" cols="100" id="or_request"
						placeholder='코로나19 예방을 위해 비대면 배달 권장드립니다. 요청사항에 "문 앞 배달"을 요청사항에 남겨주세요'></textarea>
				</div>
			</div>
		</div>
		<div class="accordion-item pur" id="pur">
			<span class="accordion-header purmain" >
				결제방법 선택
			</span>
		</div>
		<div class="accordion-item purchasemain">
			<div id="purRadio">
				<div id="radios" style="width:90%;">
					<label for="purchasenow">바로결제</label>&nbsp<input type="radio" name="purchase" value="purchasenow" id="purchasenow">&nbsp&nbsp
					<label for="purchaselater">만나서결제</label>&nbsp<input type="radio" name="purchase" value="purchaselater" id="purchaselater">
				</div>
				<div id="now">
					<span>결제방법을 선택해주세요</span><br>
					<button type="button" class="btn btn-outline-secondary" id="card" style="width:100px;height:40px">신용카드</button>
					<button type="button" class="btn btn-outline-secondary" id="phone" style="width:120px;height:40px">휴대폰결제</button>
				</div>
				<div id=later>
					<p>사회적 거리두기 강화를 위해 만나서 결제 외 다른 결제방법을 이용해주세요.</p>
					<button type="button" class="btn btn-outline-secondary" style="width:100px;height:40px" disabled>신용카드</button>
					<button type="button" class="btn btn-outline-secondary" style="width:100px;height:40px" disabled>현금</button>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6cda1d2e6578e00f2f149b8981a3cb1f&libraries=services"></script>
<script>
	
	let paymethod=""
	$("#orderNow").click(requestPay);
	function requestPay(){
		IMP.init("imp85181988");
		if(paymethod==''||paymethod==null){
			alert('결제방법을 선택해주세요.');
		}else if(paymethod=='card'){
			IMP.request_pay({
				pg:'danal_tpay',
				pay_method:'card',
				merchant_uid:'merchant_'+new Date().getTime(),
				amount:$("#purcost").val(),
				name:'${requestScope.r_id}_${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}',
				buyer_tel:$("#phonenum").val()
			},function(rep){
				if(rep.success){
					$.ajax({
						url:"${cp}/user/purchase",
						data:{
							addr:$("#uamain").val()+", "+$("#uadetail").val(),
							or_request:$("#or_request").html(),
							or_totalcost:$("#purcost").val(),
							or_paymethod:paymethod
						},
						dataType:"json",
						success:function(data){
							if(data.result=='success'){
								alert('성공적으로 결제되었습니다.');
								location.href="${cp}/user/purchase/success?or_num="+data.or_num;
							}else{
								alert('결제는 성공적으로 되었으나, 데이터입력에 실패하였습니다.');
								//location.reload(true);
							}
						}
					});
				}else{
					console.log(rep.error_msg);
				}
			});
		}else if(paymethod=='phone'){
			IMP.request_pay({
				pg:'danal',
				pay_method:'card',
				merchant_uid:'merchant_'+new Date().getTime(),
				amount:$("#purcost").val(),
				name:'${requestScope.r_id}_${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}',
				buyer_tel:$("#phonenum").val()
			},function(rep){
				if(rep.success){
					$.ajax({
						url:"${cp}/user/purchase",
						data:{
							addr:$("#uamain").val()+", "+$("#uadetail").val(),
							or_request:$("#or_request").html(),
							or_totalcost:$("#purcost").val(),
							or_paymethod:paymethod
						},
						dataType:"json",
						success:function(data){
							if(data.result=='success'){
								alert('성공적으로 결제되었습니다.');
								location.href="${cp}/user/purchase/success?or_num="+data.or_num;
							}else{
								alert('결제는 성공적으로 되었으나, 데이터입력에 실패하였습니다.');
								//location.reload(true);
							}
						}
					});
				}else{
					alert('결제 중 오류가 발생하였습니다.');
					console.log(rep.error_msg);
				}
			});
		}
		
	}
	$("#purchasenow").click(function(){
		$("#radios").css('border-bottom','0.5px gray solid');
		$("#later").css('display','none');
		$("#now").css('display','block');
	});
	$("#purchaselater").click(function(){
		$("#radios").css('border-bottom','0.5px gray solid');
		$("#now").css('display','none');
		$("#later").css('display','block');
	});
	$("#card").click(function(){
		$("#phone").css({
			'background-color':'white',
			'color':'gray'
		});
		$("#card").css({
			'background-color':'gray',
			'color':'white'
		});
		paymethod='card';
		console.log(paymethod);
	});
	$("#phone").click(function(){
		$("#card").css({
			'background-color':'white',
			'color':'gray'
		});
		$("#phone").css({
			'background-color':'gray',
			'color':'white'
		});
		paymethod='phone';
		console.log(paymethod);
	});
	function del(cartnum){
		$.ajax({
			url:"${cp}/user/cartdelete",
			data:{
				cartnum:cartnum
			},
			dataType:"json",
			success:function(data){
				if(data.result=='success'){
					location.reload(true);
				}else if(data.result=='fail'){
					console.log(data.result)
				}else if(data.result=='none'){
					location.href='${cp}/searchDetail?r_id='+data.r_id+'&distance='+data.distance;
				}
			}
		});
	}
	$(function(){
		let cartnum=$(".cartnum")
		let total=0;
		cartnum.each(function(j){
			let num=$(this).html();
			$.ajax({
				url:"${cp}/user/cartdetail",
				data:{
					cartnum:num
				},
				dataType:"json",
				success:function(data){
					let options="";
					let cdlist=data.detail
					let totalcost=0;
					for(let i=0;i<data.detail.length;i++){
						if(i==0){
							if(cdlist[i].fo_category.indexOf('필수')!=-1){
								options+="<span>"+cdlist[i].fo_category+":"+cdlist[i].fo_name+"(+"+cdlist[i].fo_cost+"원)";
								totalcost+=parseInt(cdlist[i].fo_cost);
							}else{
								options+="<span>"+cdlist[i].fo_category+":"+cdlist[i].fo_name+"x"+cdlist[i].cd_count+"(+"+
										(cdlist[i].cd_count*cdlist[i].fo_cost).toLocaleString('ko-KR')+"원)";
								totalcost+=parseInt(cdlist[i].cd_count*cdlist[i].fo_cost);
							}
						}else{
							if(cdlist[i].fo_category.indexOf('필수')!=-1){
								if(cdlist[i-1].fo_category==cdlist[i].fo_category){
									options+="/"+cdlist[i].fo_name+"(+"+cdlist[i].fo_cost+"원)";
									totalcost+=parseInt(cdlist[i].fo_cost);
								}else{
									options+="<br>"+cdlist[i].fo_category+":"+cdlist[i].fo_name+"(+"+cdlist[i].fo_cost+"원)";
									totalcost+=parseInt(cdlist[i].fo_cost);
								}
							}else{
								if(cdlist[i-1].fo_category==cdlist[i].fo_category){
									options+="/"+cdlist[i].fo_name+"x"+cdlist[i].cd_count+"(+"+
									(cdlist[i].cd_count*cdlist[i].fo_cost).toLocaleString('ko-KR')+"원)";
									totalcost+=parseInt(cdlist[i].cd_count*cdlist[i].fo_cost);
								}else{
									options+="<br>"+cdlist[i].fo_category+":"+cdlist[i].fo_name+"x"+cdlist[i].cd_count+"(+"+
									(cdlist[i].cd_count*cdlist[i].fo_cost).toLocaleString('ko-KR')+"원)";
									totalcost+=parseInt(cdlist[i].cd_count*cdlist[i].fo_cost);
								}
							}
						}
						options+="</span>";
						$("#options"+num).html(options);
						
					}
					let indivdel=(parseInt($(".cost"+num).html())+totalcost).toLocaleString('ko-KR')+"원";
					total+=parseInt($(".cost"+num).html())+totalcost;
					$(".costtotal").html("<input type='hidden' value='"+(total+${delcost})+"' id='purcost'><span>합계 : "+
							((total+${delcost}).toLocaleString('ko-KR'))+"원</span>");
					$("#total"+num).html(indivdel);
				}
			});
			$.ajax({
				url:"${cp}/user/orderData",
				dataType:"json",
				success:function(data){
					let addrdiv="";
					addrdiv+="<div class='accordion-body addrleft'><span>배달주소</span><span>상세주소</span><span>전화번호</span></div>";
					if(data.nodetail=='nodetail'){
						
					}else{
						addrdiv+="<div class='accordion-body addrright'><input type='text' id='uamain' value='"+data.addrmain+"' disabled><br>";
						addrdiv+="<input type='text' id='uadetail' value='"+data.addrdetail+"' disabled><br>";
						addrdiv+="<input type='text' id='phonenum' value='"+data.addrvo.ua_phone+"' disabled>"
					}
					$("#addr").html(addrdiv);
				}
			});
		});
	});
</script>




<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
#main{
	padding-top:20px;
}
#mainImg {
	width: 1100px;
	height: 900px
}
<%-- 
#cropping {
	width: 1100px;
	height: 200px;
	overflow: hidden;
	margin-bottom: 10px
}
--%>
.title {
	margin-bottom: 10px
}

.menu {
	height: 100px;
	margin-top: 10px
}
.foodOptions{
	height:30px;
}
#cartlist{
	position:absolute;
	top:88px;
	left:1170px;
	width:352px;
	height:400px;
	border:1px solid black;
	background-color:#7bcfbb;
}
#cartTitle{
	width:100%;
	height:40px;
	border-bottom:1px solid black;
	text-align:center
}
#cartTitle h3{color:white}
#cartMain{
	width:100%;
	height:320px;
	background-color:white;
	padding-top:5px;
	overflow:auto;
}
.cart{
	width:100%;
	display:inline-block;
	border-bottom:1px solid gray;
	padding-top:5px;
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
	padding-left:10px;
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
}

</style>
<div class="container">
<!-- 
	<div id="cropping">
		<img src="${cp }/resources/img/${rvo.r_img}" id="mainImg">
	</div>
 -->
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
		<div class="d-grid gap-2 col-12 mx-auto cartbtn">
			<div class="costtotal" style="display:inline;margin-right:15px"></div>
			<button type="button" class="btn text-white goOrder" style="background-color:#7bcfbb">주문하기</button>
		</div>
	</div>
	<div class="container title">
		<h2>${ rvo.r_name}</h2>
		<img src='${cp}/resources/img/star.png'
			style='width: 25px; height: 20px; float: left'> <span></span><br>
		<!-- 별점 -->
	</div>
	<div class="container divmain">
		<table style="border-bottom:0.5px solid black;width:750px">
			<tr height="28px">
				<td width="120px">결제방법</td>
				<td>바로결제, 현장결제(카드/현금)</td>
			</tr>
			<tr height="28px">
				<td>최소주문금액</td>
				<td id="mincost">${rvo.r_minCost}</td>
			</tr>
			<tr height="28px">
				<td>배달요금</td>
				<c:choose>
					<c:when test="${rvo.r_delCost!=0 }">
						<td id="delcost">${rvo.r_delCost }원</td>
					</c:when>
					<c:otherwise>
						<td>무료</td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr height="28px">
				<td>배달시간</td>
				<td>${rvo.r_delmin }~${rvo.r_delmax }분</td>
			</tr>
			<tr height="28px">
				<td>가게위치</td>
				<td>${distance }km(배달주소기준)</td>
			</tr>
		</table>
		<div class="container menudiv">

			<c:forEach var="fvo" items="${flist }" varStatus="status">
				<a data-toggle="modal" href="#modal${status.index }"
					style='text-decoration: none; color: black' onclick="javascript:openModal(${status.index},${fvo.food_num })">
					<div class="container menu">
						<img src="${cp }/resources/img/${fvo.food_img}"
							style='width: 100px; height: 90px; float: left'>
						<h5>${fvo.food_name }</h5>
						<span>${fvo.food_info }</span><br> <span class="foodcost">${fvo.food_cost }</span>
					</div>
				</a>
				<div class="modal fade" id="modal${status.index }" tabindex="-1" role="dialog">
					<div class="modal-dialog modal-dialog-centered" >
						<div class="modal-content">
							<!-- Modal Header -->
							<div class="modal-header">
								<div>
									<img src="${cp }/resources/img/${fvo.food_img}"
										style='width: 100px; height: 90px; float: left'>
									<h4>${fvo.food_name }</h4>
									<span style="position:relative;top:5px">${fvo.food_info }</span>
									<div class="container" style="width:430px;float:left;position:relative;top:10px;left:10px">
										<span style="float:left">가격</span> <span style="float:right" class="foodcost">${fvo.food_cost }</span>
									</div>
								</div><br>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>
							<!-- Modal body -->
							<div class="modal-body">
								<form:form id="forms${status.index }" method="post" action="${cp }/user/gocart">
									<input type="hidden" name="food_num" value="${fvo.food_num }">
									<div class="modalBody">
										
									</div>
								</form:form>
							</div>
							<!-- Modal footer -->
							<div class="modal-footer">
								<button type="button" class="btn btn-outline-success goOrder">바로주문</button>
								<button type="button" class="btn btn-outline-success addCart" 
										onclick="javascript:gocart(${status.index},${fvo.food_num })" >주문표에 추가</button>
								<button type="button" class="btn btn-outline-danger" data-dismiss="modal">창닫기</button>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
<script>
	$(".goOrder").click(function(){
		location.href='${cp}/user/order';
	});
	let count=0;
	function gocart(index,foodnum,delcheck){
		let necoptions=[];
		let checkbox=[];
		let optionscnt=[];
		$("input[name='options"+index+"']:checked").each(function(i){
			if($(this).prop('class')=='nec'){
				necoptions.push($(this).val());
			}else{
				checkbox.push($(this).val());
			}
			optionscnt.push($("#cnt"+$(this).prop('id').substring(5)).val());
		});
		let nec=[];
		$("input[class='nec']:checked").each(function(i){
			nec.push($(this).val());
		});
		if(nec.length<count){
			alert('필수항목을 선택해주세요');
			return;
		}
		
		$.ajax({
			url:'${cp}/user/gocart',
			type:'get',
			dataType:'json',
			data:{
				checkbox:checkbox,
				necoptions:necoptions,
				optionscnt:optionscnt,
				foodnum:foodnum,
				delcheck:delcheck
			},
			success:function(data){
				if(data.result=='success'){
					alert('주문표에 추가되었습니다!');
					location.reload(true);
				}else if(data.result=='check'){
					if(confirm('다른 음식점에서 이미 담은 메뉴가 있습니다. \n담긴 메뉴를 취소하고 새로운 음식점의 메뉴를 담을까요?')){
						gocart(index,foodnum,'delete');
					}else{
						alert('no');
					}
				}
			}
		});
	}
	
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
					if("${param.cart}"=="empty"){
						location.href='${cp}/searchDetail?r_id='+data.r_id+'&distance='+data.distance;
					}else{
						location.href='${cp}/searchDetail?r_id='+data.r_id+'&distance='+data.distance;
					}
				}
			}
		});
	}
	
	$(function(){
		$("#mincost").html(parseInt($("#mincost").html()).toLocaleString('ko-KR')+"원");
		$("#delcost").html(parseInt($("#delcost").html()).toLocaleString('ko-KR')+"원");
		let foodcost=$(".foodcost");
		for(let i=0;i<foodcost.length;i++){
			foodcost[i].innerHTML=(parseInt(foodcost[i].innerHTML).toLocaleString('ko-KR')+"원");
		}
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
					let indivdel="<a href='javascript:del("+num+")'><img src='${cp}/resources/img/deleteimg.png' class='delimg'></a>&nbsp&nbsp";
					indivdel+=(parseInt($(".cost"+num).html())+totalcost).toLocaleString('ko-KR')+"원";
					total+=parseInt($(".cost"+num).html())+totalcost;
					$(".costtotal").html("<span>합계 : "+(total.toLocaleString('ko-KR'))+"원</span>");
					$("#total"+num).html(indivdel);
				}
			});
			
		});
	});
	

	function openModal(status,food_num){
		$.ajax({
			url:"${cp}/user/search/foodOptions",
			data:{
				food_num:food_num
			},
			dataType:"json",
			success:function(data){
				let divoptions="";
				$(".modalBody").empty();
				count=0;
				for(let i=0;i<data.folist.length;i++){
					if(i==0){
						divoptions+="<h5>"+data.folist[i].fo_category+"</h5>";
						if(data.folist[i].fo_category.indexOf('필수')!=-1){count++;}
					}else if(data.folist[i-1].fo_category!=data.folist[i].fo_category){
						divoptions+="<h5>"+data.folist[i].fo_category+"</h5>";
						if(data.folist[i].fo_category.indexOf('필수')!=-1){count++;}
					}
					if(data.folist[i].fo_category.indexOf('필수')!=-1){
						divoptions+="<div class='foodOptions' style='clear:both'>";
						divoptions+="<input type='checkbox' name='options"+status+"' class='nec' onclick='checknes(this)' value='"+data.folist[i].fo_num+
									"' style='float:left;width:18px;height:18px;position:relative;top:3px'>";
						divoptions+="<span style='float:left'>&nbsp"+data.folist[i].fo_name+"</span>";
						divoptions+="<span style='float:right'>+"+(data.folist[i].fo_cost).toLocaleString('ko-KR')+"원</span>";
						divoptions+="</div>";
					}else{
						divoptions+="<div class='foodOptions' style='clear:both'>";
						divoptions+="<input type='checkbox' name='options"+status+"' id='nomal"+i+"' onclick='optioncount("+i+")' value='"+data.folist[i].fo_num+
									"' style='float:left;width:18px;height:18px;position:relative;top:3px'>";
						divoptions+="&nbsp<input type='hidden' value='x' id='cntplus"+i+"' readonly"+
									" style='width:10px;border:none;border-right:0px;border-top:0px;boder-left:0px;boder-bottom:0px;'>";
						divoptions+="&nbsp<input type='hidden' name='optionscnt"+status+"' id='cnt"+i+"' value='1' min='1' max='5' onchange='javascript:changecnt("+i+","+data.folist[i].fo_cost+")'"+
									"style='width:30px;border:none;border-right:0px;border-top:0px;boder-left:0px;boder-bottom:0px;'>";			
						divoptions+="<span style='float:left'>&nbsp"+data.folist[i].fo_name+"</span>";
						divoptions+="<span style='float:right' id='opcost"+i+"'>+"+(data.folist[i].fo_cost).toLocaleString('ko-KR')+"원</span>";
						divoptions+="</div>";
					}
				}
				$(".modalBody").append(divoptions);
			}
		});
	}
	function changecnt(index,cost){
		let cnt=$("#cnt"+index).val();
		let cng=(cnt*cost).toLocaleString('ko-KR');
		$('#opcost'+index).html("+"+cng+"원");
	}
	function optioncount(i){
		if($("#nomal"+i).prop('checked')){
			$("#cnt"+i).prop('type','number');
			$("#cntplus"+i).prop('type','text');
		}else{
			$("#cnt"+i).prop('type','hidden');
			$("#cntplus"+i).prop('type','hidden');
		}
	}
	function checknes(element){
		const checkboxes=$(".nec");
		for(let i=0;i<checkboxes.length;i++){
			checkboxes[i].checked=false;
		}
		element.checked=true;
	}
</script>



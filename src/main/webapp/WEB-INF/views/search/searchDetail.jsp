<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
#main{
	padding-top:20px;
	padding-bottom:50px;
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
	width:385px;
	height:422px;
	border:1px solid black;
	background-color:#7bcfbb;
	border-radius:0.5em;
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
	border-radius:0 0 0.5em 0.5em;
}
#incartdelcost{
	font-size:0.9em;
}
.star{
	position:relative;
	top:-2px;
	left:5px;
}
.reviewbtn{
	background-color: #7bcfbb;
    position: relative;
    left:5px;
    top: -4px;
    color:white;
}
.reviewmodal{
	width: 700px;
    position: relative;
    left: -100px;
}
.reviewbody{
	overflow: auto;
    height: 700px;
}
.reviewfood{
	font-size:0.9em;
}
#tooltip {
  display: none;
  position: absolute;
  
  font-size: 0.8em;
}
#lesscost:hover .tooltip{
	
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
						<img src="${cp }/resources/img/${cvo.food_img}" 
							style='width: 90px; height: 75px; float: left;display:inline-block;'>
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
			<div id="incartdelcost">
				<input type="hidden" value="${rvo.r_delCost }" id="deliveryCost">
			</div>
			<div class="costtotal" style="display:inline;margin-right:15px"></div>
			<span class="d-inline-block" tabindex="0" data-bs-toggle="tooltip" title="">
			<button type="button" class="btn text-white goOrder" style="background-color:#7bcfbb">주문하기</button>
			</span>
		</div>
	</div>
	<div class="container title">
		<h2>${ rvo.r_name}</h2>
		<img src='${cp}/resources/img/star.png'
			style='width: 25px; height: 20px; float: left'>
			<span class='star'>
				<c:choose>
					<c:when test="${hit ==0}">
						리뷰가 아직 없습니다.
					</c:when>
					<c:otherwise>
						${hit }
					</c:otherwise>
				</c:choose>
			</span>
			<a data-toggle="modal" href="#exampleModal" onclick="javascript:openreview('${rvo.r_id }')">
				<button type="button" class="btn btn-sm reviewbtn">
					리뷰
				</button>
			</a>
			<br>
		<!-- 별점 -->
	</div>	
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content reviewmodal">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">리뷰</h5>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body reviewbody">
				        
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-danger" data-dismiss="modal" style="margin:auto">창닫기</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		function openreview(r_id){
			$.ajax({
				url:"${cp}/user/search/review",
				data:{
					r_id:r_id
				},
				dataType:"json",
				success:function(data){
					if(data.result=='success'){
						$(".reviewbody").empty();
						let rlist=data.review
						for(let i=0;i<rlist.length;i++){
							let review="";
							let hit="";
							for(let j=0;j<rlist[i].re_hit;j++){
								hit+="<img src='${cp}/resources/img/star.png' style='float:left;display:inline-block;width:25px;height:20px;"+
									 "position:relative;left:-4px;'>";
							}
							if(rlist[i].rp_photo!=null){
								review+="<div class='review' style='border-bottom:1px solid black;height:280px'>";
								review+="<img src='${cp}/resources/img/"+rlist[i].rp_photo+"' class='reviewimg' style='float:left;"+
								"width:320px;height:270px'>";
							}else{
								review+="<div class='review' style='border-bottom:1px solid black;height:auto'>";
							}
							review+="<div style='display:inline-block;width:320px;padding-left:10px;overflow:auto'>";
							review+=hit+"<br>";
							if(rlist[i].food_count>1){
								review+="<span class='reviewfood'>"+rlist[i].food_name+" 외 "+(rlist[i].food_count-1)+"개</span><br>";
							}else{
								review+="<span class='reviewfood'>"+rlist[i].food_name+"</span><br>";
							}
							review+="<span class='content'>"+rlist[i].re_content+"</span>";
							review+="</div>";
							review+="</div>";
							$(".reviewbody").append(review);
						}
					}else{
						console.log('fail');
					}
				}
			})
		}
	</script>
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
			<c:if test="${fvo.food_status==0 }">
				<a data-toggle="modal" href="#modal${status.index }"
					style='text-decoration: none; color: black' onclick="javascript:openModal(${status.index},${fvo.food_num })">
					<div class="container menu">
						<img src="${cp }/resources/img/${fvo.food_img}"
							style='width: 100px; height: 90px; float: left;margin-right:10px'>
						<div style="padding-top:3px">
							<h5>${fvo.food_name }</h5>
							<span>${fvo.food_info }</span><br> <span class="foodcost">${fvo.food_cost }</span>
						</div>
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
									<div class="modalBody" id="modalBody${status.index}">
										
									</div>
								</form:form>
							</div>
							<!-- Modal footer -->
							<div class="modal-footer">
								
								<button type="button" class="btn btn-outline-success addCart" 
										onclick="javascript:gocart(${status.index},${fvo.food_num })" >주문표에 추가</button>
								<button type="button" class="btn btn-outline-danger" data-dismiss="modal">창닫기</button>
							</div>
						</div>
					</div>
				</div>
			</c:if>
			</c:forEach>
		</div>
	</div>
</div>
<script>
	$(".goOrder").click(function(){
		location.href='${cp}/user/order?delcost=${rvo.r_delCost }';
	});
	function goorder(index,foodnum){
		gocart(index,foodnum,'a','order');
	}
	
	let test1='';
	let count=0;
	function gocart(index,foodnum,delcheck,ordercheck){
		let necoptions=[];
		let checkbox=[];
		let optionscnt=[];
		$("input[name='options"+index+"']:checked").each(function(i){
			if($(this).prop('class')=='nec'){
				necoptions.push($(this).val());
			}else{
				checkbox.push($(this).val());
				optionscnt.push($(".cnt"+$(this).prop('class').substring(5)).val());
			}
		});
		let nec=[];
		$("input[class='nec']:checked").each(function(i){
			nec.push($(this).val());
		});
		if(nec.length<count){
			alert('필수항목을 선택해주세요');
			return;
		}
		console.log(checkbox+","+optionscnt);
		$.ajax({
			url:'${cp}/user/gocart',
			type:'get',
			dataType:'json',
			data:{
				checkbox:checkbox,
				necoptions:necoptions,
				optionscnt:optionscnt,
				foodnum:foodnum,
				delcheck:delcheck,
				ordercheck:ordercheck
			},
			success:function(data){
				if(data.result=='success'){
					alert('주문표에 추가되었습니다!');
					location.reload(true);
				}else if(data.result=='check'){
					if(confirm('다른 음식점에서 이미 담은 메뉴가 있습니다. \n담긴 메뉴를 취소하고 새로운 음식점의 메뉴를 담을까요?')){
						gocart(index,foodnum,'delete');
					}
				}
			}
		});
		return;
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
	let tt;
	$(function(){
		let top=parseInt($("#cartlist").css("top"));
		$(window).scroll(function(){
			let sTop=$(window).scrollTop();//스크롤된 top의 위치 얻어오기
			let moveTop=sTop+top;
			$("#cartlist").stop().animate({
				top:moveTop
			},200);
		});
		if($("#deliveryCost").val()!=0){
			$("#incartdelcost").html("배달료 "+parseInt($("#deliveryCost").val()).toLocaleString('ko-KR')+"원 별도");
		}else{
			$("#incartdelcost").html("배달료 무료");
		}
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
				async: false,
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
					$(".costtotal").html("<span id='tc'>합계 : "+(total.toLocaleString('ko-KR'))+"원</span>");
					$("#total"+num).html(indivdel);
					tt=total;
					
				}
			});
			console.log("tt3:"+tt+"total:"+total);
		});
		console.log("tt3:"+tt+"total:"+total);
		if(total<${rvo.r_minCost }){
			$(".goOrder").prop('disabled','disabled');
			$(".d-inline-block").prop('title',((${rvo.r_minCost}).toLocaleString('ko-KR'))+"원 이상 주문가능합니다.");
		}else{
			$(".goOrder").removeProp("disabled");
			$(".d-inline-block").prop('title','');
		}
		
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
				$(".modalBody").each(function(){
					$(this).empty();
				});
				count=0;
				for(let i=0;i<data.folist.length;i++){
					if(data.folist[i].fo_status==0){
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
							divoptions+="<input type='checkbox' name='options"+status+"' class='nomal"+i+"' onclick='optioncount("+i+")' value='"+data.folist[i].fo_num+
										"' style='float:left;width:18px;height:18px;position:relative;top:3px'>";
							divoptions+="&nbsp<input type='hidden' value='x' class='cntplus"+i+"' readonly"+
										" style='width:10px;border:none;border-right:0px;border-top:0px;boder-left:0px;boder-bottom:0px;'>";
							divoptions+="&nbsp<input type='hidden' name='optionscnt"+status+"' class='cnt"+i+"' value='1' min='1' max='5' onchange='javascript:changecnt("+i+","+data.folist[i].fo_cost+")'"+
										"style='width:30px;border:none;border-right:0px;border-top:0px;boder-left:0px;boder-bottom:0px;'>";			
							divoptions+="<span style='float:left'>&nbsp"+data.folist[i].fo_name+"</span>";
							divoptions+="<span style='float:right' id='opcost"+i+"'>+"+(data.folist[i].fo_cost).toLocaleString('ko-KR')+"원</span>";
							divoptions+="</div>";
						}
					}
				}
				$("#modalBody"+status).append(divoptions);
			}
		});
	}
	function changecnt(index,cost){
		let cnt=$(".cnt"+index).val();
		console.log(cnt+","+cost);
		let cng=(cnt*cost).toLocaleString('ko-KR');
		$('#opcost'+index).html("+"+cng+"원");
	}
	function optioncount(i){
		/*
		$(".nomal"+i).each(function(a){
			if($(this).prop('checked')){
				$(".cnt"+i).each(function(b){
					$(this).prop('type','number');
				});
				$(".cntplus"+i).each(function(b){
					$(this).prop('type','text');
				});
			}else{
				$(".cnt"+i).each(function(b){
					$(this).prop('type','hidden');
				});
				$(".cntplus"+i).each(function(b){
					$(this).prop('type','hidden');
				});
			}
		});*/
		
		if($(".nomal"+i).prop('checked')){
			$(".cnt"+i).prop('type','number');
			$(".cntplus"+i).prop('type','text');
		}else{
			$(".cnt"+i).prop('type','hidden');
			$(".cntplus"+i).prop('type','hidden');
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



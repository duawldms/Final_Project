<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
#mainImg {
	width: 1100px;
	height: 900px
}

#cropping {
	width: 1100px;
	height: 200px;
	overflow: hidden;
	margin-bottom: 10px
}

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

</style>
<div class="container">
	<div id="cropping">
		<img src="${cp }/resources/img/${rvo.r_img}" id="mainImg">
	</div>
	<div class="container title">
		<h2>${ rvo.r_name}</h2>
		<img src='${cp}/resources/img/star.png'
			style='width: 25px; height: 20px; float: left'> <span></span><br>
		<!-- 별점 -->
	</div>
	<div class="container divmain">
		<table>
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
				<div class="modal fade" id="modal${status.index }">
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
									<div class="modalBody">
										<input type="hidden" name="food_num" value="${fvo.food_num }">
									</div>
								</form:form>
							</div>
							<!-- Modal footer -->
							<div class="modal-footer">
								<button type="button" class="btn btn-outline-success goOrder">바로주문</button>
								<button type="button" class="btn btn-outline-success addCart" onclick="javascript:gocart(${status.index})">주문표에 추가</button>
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
	function gocart(index){
		let checkbox=[];
		$("input[name='options"+index+"']:checked").each(function(i){
			checkbox.push($(this).val());
		});
		$.ajax({
			url:'${cp}/user/gocart',
			type:'get',
			dataType:'json',
			data:{
				checkbox:checkbox
			},
			success:function(data){
				if(data.result=='success'){
					alert('success')
				}else{
					alert('fail')
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
		
		
	})
	
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
				for(let i=0;i<data.folist.length;i++){
					if(i==0){
						divoptions+="<h5>"+data.folist[i].fo_category+"</h5>";
					}else if(data.folist[i-1].fo_category!=data.folist[i].fo_category){
						divoptions+="<h5>"+data.folist[i].fo_category+"</h5>";
					}
					if(data.folist[i].fo_category.indexOf('필수')!=-1){
						divoptions+="<div class='foodOptions' style='clear:both'>";
						divoptions+="<input type='checkbox' name='options"+i+"' class='nec' onclick='checknes(this)' value='"+data.folist[i].fo_name+
									"' style='float:left;width:18px;height:18px;position:relative;top:3px'>";
						divoptions+="<span style='float:left'>&nbsp"+data.folist[i].fo_name+"</span>";
						divoptions+="<span style='float:right'>"+(data.folist[i].fo_cost).toLocaleString('ko-KR')+"원</span>";
						divoptions+="</div>";
					}else{
						divoptions+="<div class='foodOptions' style='clear:both'>";
						divoptions+="<input type='checkbox' name='options"+i+"' value='"+data.folist[i].fo_name+
									"' style='float:left;width:18px;height:18px;position:relative;top:3px'>";
						divoptions+="<span style='float:left'>&nbsp"+data.folist[i].fo_name+"</span>";
						divoptions+="<span style='float:right'>+"+(data.folist[i].fo_cost).toLocaleString('ko-KR')+"원</span>";
						divoptions+="</div>";
					}
				}
				$(".modalBody").append(divoptions);
			}
		});
	}
	function checknes(element){
		const checkboxes=$(".nec");
		for(let i=0;i<checkboxes.length;i++){
			checkboxes[i].checked=false;
		}
		element.checked=true;
	}
</script>



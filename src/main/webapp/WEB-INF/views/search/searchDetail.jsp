<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<td>${rvo.r_minCost}원</td>
			</tr>
			<tr height="28px">
				<td>배달요금</td>
				<c:choose>
					<c:when test="${rvo.r_delCost!=0 }">
						<td>${rvo.r_delCost }원</td>
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
					style='text-decoration: none; color: black'>
					<div class="container menu">
						<img src="${cp }/resources/img/${food_img}"
							style='width: 100px; height: 100px; float: left'>
						<h5>${fvo.food_name }</h5>
						<span>${fvo.food_info }</span><br> <span>${fvo.food_cost }</span>
					</div>
				</a>
				<div class="modal fade" id="modal${status.index }" style="display: none;">
					<div class="modal-dialog">
						<div class="modal-content">
							<!-- Modal Header -->
							<div class="modal-header">
								<h4 class="modal-title">Modal Heading</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>
							<!-- Modal body -->
							<div class="modal-body">Modal body..</div>
							<!-- Modal footer -->
							<div class="modal-footer">
								<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
<script>
	/*(function openModal(status){
		
		$("*").css("background-color","rgba(0,0,0,0.8)");
		$(".modal"+status).css("display","inline");
		
		$("#modal"+status).modal();
	}
	
	function closeModal(status){
		$(".modal"+status).css("display","none");
	}*/
</script>



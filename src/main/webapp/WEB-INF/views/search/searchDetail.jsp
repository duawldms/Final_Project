<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<style>
#mainImg{width:1100px;height:900px}
#cropping{width:1100px;height:200px;overflow:hidden}
</style>        
<div class="container">
	<div id="cropping"> 
		<img src="${cp }/resources/img/${rvo.r_img}" id="mainImg">
	</div>
	<div class="container title">
		<h2>${ rvo.r_name}</h2>
		<img src='${cp}/resources/img/star.png' style='width:25px;height:20px;float:left'>
		<span></span><br> <!-- 별점 -->
	</div>
	<div class="container divmain">
		<table>
			<tr>
				<td width="120px">결제방법</td>
				<td>바로결제, 현장결제(카드/현금)</td>
			</tr>
			<tr>
				<td>최소주문금액</td>
				<td>${rvo.r_minCost}원</td>
			</tr>
			<tr>
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
			<tr>
				<td>배달시간</td>
				<td>${rvo.r_delmin }~${rvo.r_delmax }분</td>
			</tr>
			<tr>
				<td>가게위치</td>
				<td>${distance }km(배달 주소 기준)</td>
			</tr>
		</table>
		
	</div>
</div>




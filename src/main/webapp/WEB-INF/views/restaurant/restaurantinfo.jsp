<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
#wrap {
	text-align: center;
	width: 70%;
    height: 750px;
}

.restaurantinfo {
	margin: auto;
	font-family: fantasy;
	font-size: 18px;
	width: 1200px;
	border-collapse: collapse;
	text-align: center;
}

.restaurantinfo td {
	border-collapse: collapse;
	font-size: 18px;
	font-weight: normal;
	color: #F6416C;
	padding: 10px 8px;
	border-bottom: 2px solid #7bcfbb;
}


#restaurantimg {
	width: 200px;
}

#restaurantimg #col {
	background-color: black;
	color: white;
	width: 100px;
}
</style>

<h1 style="text-align: center; padding-bottom: 50px; color: #7bcfbb">매장
	설명&공지</h1>


<div class="wrap">
	<form:form action="${cp }/restaurant/restaurantinfo?r_id=${vo.r_id}" method="get" id="restaurantinfo" enctype="multipart/form-data" acceptCharset="utf-8">
		<table class="restaurantinfo">
			<tr>
				<td>카테고리</td>
				<td>${vo.cg_name }</td>
			</tr>
		<c:forEach items="${list }" var="vo">
			<tr>
				<td>매장이름</td>
				<td>${vo.r_name }</td>
			</tr>
			<tr>
				<td>매장상태</td>
				<td>
				<c:if test="${vo.r_state eq '2'}">
   				 영업중
				</c:if>
				<c:if test="${vo.r_state eq '3'}">
   				 영업마감
				</c:if>				
				</td>
			</tr>
			<tr>
				<td>최소주문금액</td>
				<td>${vo.r_minCost }</td>
			</tr>
			<tr>
				<td>배달료</td>
				<td>${vo.r_delCost }</td>
			</tr>
			<tr>
				<td>사진</td>
				<td><img alt="대표사진" id="r_img" src="../resources/img/${vo.r_img }" style="width: 200px; height:200px;"></td>
			</tr>
			<tr>
				<td>공지사항</td>
				<td>${vo.r_info }</td>
			</tr>
			<tr>
				<td>배달소요시간</td>
				<td>최소${vo.r_delmin }분~최대${vo.r_delmax }분</td>
			</tr>
			<tr>
				<td colspan="4" style="text-align: right;">
					<a href="${cp }/" style="text-decoration-line: none; color: #F6416C; position: absolute; left: 370px;">Home</a>
					<a href="${cp }/restaurant/infoupdate"style="text-decoration-line: none; color: #F6416C;">수정</a> 
				</td>
			</tr>
			</c:forEach>
		</table>
	</form:form>
</div>




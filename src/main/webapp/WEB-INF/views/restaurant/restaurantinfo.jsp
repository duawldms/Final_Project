<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#wrap {
	text-align: center;
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
	border-bottom: 2px solid #00B8A9;
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

<h1 style="text-align: center; padding-bottom: 50px; color: #00B8A9">매장 설명&공지</h1>


<div class="wrap">
	<table class="restaurantinfo">

		<tr>
			<td id="col">소개&공지</td>
		</tr>
		<c:forEach var="vo" items="${list }">
			<tr>
				<td>${vo.r_info }</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="3" id="img" ><img src="" id="r_img"></td>
		</tr>

		<tr>
			<td colspan="4" style="text-align: right;">
			<a href="${cp }/" style="text-decoration-line : none; color: #F6416C; position: absolute; left:370px;">Home</a>
			<a href="${cp }/infoupdate" style="text-decoration-line : none; color: #F6416C;">수정</a>			
			<a href="" style="text-decoration-line : none; color: #F6416C;">삭제</a>
			</td>
		</tr>
	</table>

</div>
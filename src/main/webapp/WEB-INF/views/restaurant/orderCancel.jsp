<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.order_cancel_table {
    	margin: auto;
    	margin-bottom: 50px;
    	width: 930px;
	}
	
	.order_cancel_table th {
		text-align: center;
	    background-color: #7bcfbb;
	    height: 50px;
	}
	
	.order_cancel_table td {
		text-align: center;
	}
	
	.order_cancel_title {
		text-align: center;
	}
	
	.order_cancel_title h3 {
		padding: 10px;
	}
</style>
<div class="order_cancel_wrap">
	<div class="order_cancel_title">
		<h3>주문 취소 내역</h3>
	</div>
	<form:form>
		<table class="order_cancel_table">
	 		<colgroup>
	 			<col width="25%">
	 			<col width="25%">
	 			<col width="25%">
	 			<col width="25%">
	 		</colgroup>
	 		<thead>
	 			<tr>
	 				<th scope="col">주문 번호</th>
	 				<th scope="col">구매자</th>
	 				<th scope="col">주문 내역</th>
	 				<th scope="col">가격</th>
	 			</tr>
	 		</thead>
	 		<tbody>
	 			<c:forEach var="vo" items="${requestScope.list2 }">
				<tr>
					<td>${vo.or_num }</td>
					<td>${vo.ui_id }</td>
						<td>
					<c:forEach var="vo2" items="${requestScope.list }">
							${vo.food_name }
							${vo2.fo_name }
					</c:forEach>
						</td>
					<td>${vo.or_totalcost }</td>
				</tr>
	 			</c:forEach>
	 		</tbody>
	 	</table>
	</form:form>
</div>
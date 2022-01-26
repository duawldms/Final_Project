<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#wrap {
	text-align: center;
}

#saleslist {
	margin: auto;
	font-family: fantasy;
	font-size: 18px;
	width: 1200px;
	border-collapse: collapse;
	text-align: center;
}

#saleslist th {
	border-collapse: collapse;
	font-size: 18px;
	font-weight: normal;
	color: #F6416C;
	padding: 10px 8px;
	border-bottom: 2px solid #00B8A9;
}

#saleslist td {
	color: #F6416C;
	padding: 9px 8px 0px 8px;
	border-collapse: collapse;
}
</style>
</head>
<body>
	<div class="wrap">
		<table id="saleslist">
			<thead>
				<tr>
					<th scope="col">날짜</th>
					<th scope="col">회원ID</th>
					<th scope="col">매출금액</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>날짜</td>
					<td>id</td>
					<td>10000</td>
				</tr>
				<tr>
					<td>페이지합계</td>
					<td>======></td>
					<td>10000원</td>
				</tr>
			</tbody>
		</table>
		<h3 style="text-align: center; padding-bottom: 50px; color: #00B8A9">일별 매출조회</h3>
		<table id="saleslist">
			<thead>
				<tr>
					<th scope="col">일자
					<input type="date" name="Daily_date" min="1900-01-01" max="2099-2-24"><br>
					</th>
					<th scope="col">총매출</th>
				</tr>
			</thead>
		</table>
		<h3 style="text-align: center; padding-bottom: 50px; color: #00B8A9">월별 매출조회</h3>
		<table id="saleslist">
			<thead>
				<tr>
					<th scope="col">일자
					<input type="date" name="Month_date" min="1900-01-01" max="2099-2-24"><br>
					</th>
					<th scope="col">총매출</th>
				</tr>
			</thead>
		</table>
		<h3 style="text-align: center; padding-bottom: 50px; color: #00B8A9">년도별 매출조회</h3>
		<table id="saleslist">
			<thead>
				<tr>
					<th scope="col">일자
					<input type="date" name="Year_date" min="1900-01-01" max="2099-2-24"><br>
					</th>
					<th scope="col">총매출</th>
				</tr>
			</thead>
		</table>
	</div>
</body>
</html>
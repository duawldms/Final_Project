<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	$("#items1").val("name").prop("selected",true);
});

</script>
<style type="text/css">
#wrap {
	text-align: center;
}
#infoupdate {
	margin: auto;
	font-family: fantasy;
	font-size: 18px;
	width: 1200px;
	border-collapse: collapse;
	text-align: center;
}
#infoupdate input {
	border-collapse: collapse;
	font-size: 18px;
	font-weight: normal;
	color: #F6416C;
	padding: 10px 8px;
	border-bottom: 2px solid #7bcfbb;
}
#infoupdate textarea {
	border-collapse: collapse;
	font-size: 18px;
	font-weight: normal;
	color: #F6416C;
	padding: 10px 8px;
	border-bottom: 2px solid #7bcfbb;
}
#statusoption {
	margin: auto;
	font-family: fantasy;
	font-size: 18px;
	width: 240px;
	border-collapse: collapse;
	text-align: center;
}
#statusoption td {
	border-collapse: collapse;
	font-size: 18px;
	font-weight: normal;
	color: #F6416C;
	padding: 10px 8px;
	border-bottom: 2px solid #7bcfbb;
}
</style>
</head>
<body>
<div class="wrap">
	<h1 style="text-align: center; padding-bottom: 50px; color: #7bcfbb">공지&소개 등록</h1>
	<form:form action="${cp }/restaurant/restaurantinfo" method="post" id="infoupdate" enctype="multipart/form-data" acceptCharset="utf-8">
		<input type="hidden" name="r_id" value="${vo.r_id }">
		<h3 style="color: #F6416C">매장명</h3>
		<input type="text" name="r_name">
		<h3 style="color: #F6416C">카테고리</h3>
		<input type="text" name="cg_name">
		<h3 style="text-align: center; padding-bottom: 50px; color: #F6416C;">배달예상시간</h3>
				<input type="number" min="25" max="60" step="5" name="r_delmin" id="r_delmin">분~
				<input type="number" min="45" max="90" step="5" name="r_delmax" id="r_delmax">분
	<table id="statusoption">
	    <tr>
			<td colspan="2">
				<h2 style="text-align: center; padding-bottom: 50px; color: #F6416C">매장상태</h2>
			</td>
	    </tr>
	    <tr>
			<td>
				<select name="items1" id="items1">
					<option value="2" id="r_state">영업중</option>
					<option value="3" id="r_state">영업마감</option>
				</select>
			</td>
	    </tr>
    </table>
		<h3 style="color: #F6416C">소개&공지사항</h3>
		<textarea rows="5" cols="30" name="r_info"></textarea><br>
		<h3 style="color: #F6416C">대표사진</h3>
		<input type="file" id="r_img" name="file1"><br>
		<h3 style="color: #F6416C">최소주문가격</h3>
		<input type="text" name="r_minCost">
		<h3 style="color: #F6416C">배달가격</h3>
		<input type="text" name="r_delCost">
		<input type="submit" value="등록" id="btn"><br>
	</form:form>
	</div>
</body>
</html>
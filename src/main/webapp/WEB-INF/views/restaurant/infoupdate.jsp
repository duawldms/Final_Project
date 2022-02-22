<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#wrap {
	text-align: center;
	width: 70%;
    height: 750px;
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
#infoupdate select {
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
	<form:form action="${cp }/restaurant/infoupdate" method="post" id="infoupdate" enctype="multipart/form-data" acceptCharset="utf-8" name="frm">
			<input type="hidden" name="r_id" value="${vo.r_id }">
		<h3 style="color: #F6416C">매장명</h3>
			<input type="text" name="r_name" value="${vo.r_name }" style="CURSOR:hand;" title="매장명을 입력해주세요!!">
		<h3 style="color: #F6416C">카테고리</h3>
		<%-- <input type="text" name="cg_name" value="${vo.cg_name }" style="CURSOR:hand;" title="등록할 카테고리를 입력해주세요"> --%>
			<select id="cg_name" name="cg_name" style="CURSOR:hand;" title="등록할 카테고리를 선택해주세요!!">
					<option>${vo.cg_name }</option>
					<c:forEach var="vo" items="${requestScope.list }">
						<option>${vo.cg_name }</option>
					</c:forEach>
			</select>
		<h3 style="text-align: center; padding-bottom: 50px; color: #F6416C;">배달예상시간</h3>
				<input type="number" min="25" max="60" step="5" name="r_delmin" id="r_delmin" value="${vo.r_delmin }" style="CURSOR:hand;" title="배달 최소시간을 선택해주세요!!">분~
				<input type="number" min="45" max="90" step="5" name="r_delmax" id="r_delmax" value="${vo.r_delmax }" style="CURSOR:hand;" title="배달 최대시간을 선택해주세요!!">분
	<table id="statusoption">
	    <tr>
			<td colspan="2">
				<h2 style="text-align: center; padding-bottom: 50px; color: #F6416C" name="state">매장상태</h2>
			</td>
	    </tr>
	    <tr>
			<td>
				<select name="r_state" id="r_state" style="CURSOR:hand;" title="매장상태를 선택해주세요!!">
					<option value="2" >영업중</option>
					<option value="3" >영업마감</option>
				</select>
			</td>
	    </tr>
    </table>
		<h3 style="color: #F6416C">소개&공지사항</h3>
		<textarea rows="5" cols="30" name="r_info" style="CURSOR:hand;" title="소개&공지를 입력해주세요!!">${vo.r_info }</textarea><br>
		<h3 style="color: #F6416C">대표사진</h3>
		<input type="file" id="r_img" name="file1"  ><img alt="대표사진" id="r_img" src="../resources/img/${vo.r_img }" style="width: 200px; height:200px;"><br>
		<h3 style="color: #F6416C">최소주문가격</h3>
		<input type="text" name="r_minCost" value="${vo.r_minCost }" style="CURSOR:hand;" title="최소 주문가격을 입력해주세요!!">
		<h3 style="color: #F6416C">배달가격</h3>
		<input type="text" name="r_delCost" value="${vo.r_delCost }" style="CURSOR:hand;" title="배달료를 입력해주세요!!">
		<input type="submit" value="수정완료" id="btn" onblur="infoCheck()"><br>
		<!-- <button type="submit">등록</button> -->
	</form:form>
	</div>
</body>
<script type="text/javascript">
/* $(document).ready(function(){
	$("#changeTest").change(function(){
		console.log("값변경테스트: " + $(this).val());
		$("#btn").val($(this).val());

	});
 }); */
/*  function infoCheck(){
	 if($("#r_state").val()==""){
		 alert("가게상태를 확인해주세요");
		 r_state.focus();
		 return false;;
	 }
 } */


</script>
</html>
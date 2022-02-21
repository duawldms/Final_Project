<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet" type="text/css" href="${cp }/resources/css/restaurant.css">
<style type="text/css">
    input[type=submit] {
	width: 210px;
	background-color:#F6416C;
	color: white;
	padding: 10px 16px;
	margin: 8px 0;
	border: 2px solid white;
	border-radius: 4px;
	cursor: pointer;
	MARGIN: auto;
    DISPLAY: BLOCK;
}
</style>
<script type="text/javascript">
	function imageView(e) {
		var reader = new FileReader();
		reader.onload = function(e) {
			let img = document.getElementById("cg_photo");
			img.src = e.target.result;
			img.style.display = 'block';
		}
		reader.readAsDataURL(e.target.files[0]);
	}
</script>
<div class="menuadd_wrap">
	<div class="menuadd_title">
		<h3>카테고리수정</h3>
	</div>
	<form:form method="post" action="${cp }/category/modify" enctype="multipart/form-data" acceptCharset="utf-8" >
		<table class="menuadd_table">
		<tr style="border-bottom: 3px solid #49505796;">
				<td class="menuadd_td1">카테고리명</td>
				<td class="menuadd_td2">
				<input type="text" name="cg_name" id="cg_name" value="${vo.cg_name}" readonly="readonly" >
				</td>
		</tr>
		<tr>
				<td class="menuadd_td1">사진</td>
				<td class="menuadd_td2">
					<img src="${cp }/resources/img/${vo.cg_photo}"><br>
					수정할파일
					<input type="file" id="file1" name="file1" onchange="imageView(event)">
					<br>
					<img style="width: 200px; height: 200px; margin-top: 5px; display: none;" id="cg_photo" src="">
				</td>
			</tr>
		</table>
		<input type="submit" class="btnJoin2" value="수정완료">
	</form:form>

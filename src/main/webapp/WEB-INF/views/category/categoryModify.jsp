<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
	<form:form method="post" action="${cp }/category/modify" enctype="multipart/form-data" acceptCharset="utf-8" >
		카데고리명<br>
		<input type="text" name="cg_name" id="cg_name" value="${vo.cg_name}" >
		<br>
		카테고리이미지<br>
		<img src="${cp }/resources/img/${vo.cg_photo}"><br>
		수정할 파일<br>
		<input type="file" name="file1" id="file1" onchange="imageView(event)"><br><br>
		<img style="width: 200px; height: 200px; display: none;" id="cg_photo">
		<input type="submit" value="수정완료">
		</form:form>

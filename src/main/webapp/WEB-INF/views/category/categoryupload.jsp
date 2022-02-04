<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript">
	$(function() {
		$("#frm").submit(function() {
			if ($("#cg_name").val() == "") {
				$("#cg_name").focus();
				alert("카테고리명을 입력하세요.");
				return false;
			}
			if ($("#file1").val() == "") {
				$("#file1").focus();
				alert("카테고리사진을 등록해주세요.");
				return false;
			}
		});
	});
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
<form:form method="post" action="${cp }/category/upload" id = "frm" enctype="multipart/form-data" acceptCharset="utf-8">
<h1>카테고리등록</h1>
	카테고리명<br>
	<input type="text" name="cg_name" id="cg_name"><br><br>
	카테고리사진<br>
	<input type="file" name="file1" id="file1" onchange="imageView(event)"><br><br>
	<img style="width: 200px; height: 200px; display: none;" id="cg_photo">
	<input type="submit" value="카테고리등록">
</form:form>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${cp }/resources/css/restaurant.css">
<!-- ajax 통신을 위한 meta tag -->
<meta id="_csrf" content="${_csrf.token}">
<meta id="_csrf_header" content="${_csrf.headerName}">
<style>
	.seller-del-wrap {
		border: 4px solid #7bcfbb;
		width: 600px;
    	margin: auto;
    	padding: 50px;
	    padding-top: 50px;
	    margin-top: 100px;
	    margin-bottom: 100px;
	}
	
	.seller-del-title {
		margin-bottom: 30px;
	}
	
	.seller-del-title h2 {
		text-align: center;
	}
	
	.seller-del-wrap h4 {
		color: blue;
	}
	
	.del-info {
		width: auto;
    	height: auto;
	    background-color: #F2F2F2;
	    border: 1px solid #E6E6E6;
	}
	
	.del-info ul li {
		list-style-type: none;
	}
	
	.del-btn {
		text-align: center;
   	 	margin: 30px;
	}
	
	.seller-del-table {
		border: 1px solid #E6E6E6;
	    margin: auto;
	    margin-top: 40px;
	}
	
	.seller-del-table th {
		background-color: #F2F2F2;
    	width: 100px;
    	text-align: center;
	}
	
	.seller-del-table td {
		padding: 10px;
		border-bottom: none;
	}
</style>
<div class="seller-del-wrap">
	<div class="seller-del-title">
		<h2>회원 탈퇴</h2>
	</div>
	<h4>* 유의사항</h4>
	<div class="del-info">
		<ul>
			<li>- 삭제된 정보는 복구할 수 없습니다.</li>
			<li>- 탈퇴한 계정을 재사용 할 수 없습니다.</li>
			<li>- 탈퇴 후 작성한 질문, 밥변은 수정/삭제할 수 없습니다.</li>
		</ul>
	</div>
	<table class="seller-del-table">
		<tr style="border-bottom: 1px solid #E6E6E6;">
			<th>아이디</th>
			<td>${requestScope.r_id }</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="r_pwd" id="r_pwd"></td>
		</tr>
	</table>
	<div class="del-btn">
		<input type="button" class="btn3" value="회원탈퇴" onclick="sellerDel()">
	</div>
</div>
<script>
	var xhr = null;
	
	function sellerDel() {
		let r_pwd = document.getElementById("r_pwd");
		
		if (r_pwd.value == '') {
			alert("비밀번호를 입력해주세요.");
			r_pwd.focus();
			return;
		}
		
		let params = "r_pwd=" + r_pwd.value;
		let token = document.getElementById("_csrf").getAttribute("content");
		let token_header = document.getElementById("_csrf_header").getAttribute("content");
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				let data = xhr.responseText;
				let json = JSON.parse(data);
				
				if (json.result == 'success') {
					if (confirm("정말 탈퇴하시겠습니까?")) {
						location.href="${cp}/restaurant/delete";
					} else {
						alert("탈퇴가 취소되었습니다.");
						return;						
					}
				} else {
					let pwd_err = document.getElementById("pwd_err");
					pwd_err.innerText = "비밀번호가 일치하지 않습니다.";					
				}
			}
		}
		let url = "${cp}/sellerPwdCheck";
		xhr.open('post', url, true);
		xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
		xhr.setRequestHeader(token_header, token);
		xhr.send(params);
	}
</script>
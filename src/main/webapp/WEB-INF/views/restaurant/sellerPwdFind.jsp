<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${cp }/resources/css/restaurant.css">
<meta id="_csrf" content="${_csrf.token}">
<meta id="_csrf_header" content="${_csrf.headerName}">
<style>
	.seller-pwd-find-wrap {
		border: 4px solid #7bcfbb;
	    width: 415px;
	    margin: auto;
	    /* height: 300px; */
	    padding: 50px;
	    padding-top: 50px;
	    margin-top: 210px;
    	margin-bottom: 210px;     
   } 
   
   .seller-pwd-info {
   		margin: 20px 0px 20px 0px;
   		text-align: center;
   }
   
   .pwd-find-div {
   		text-align: center;
   }
</style>
<div class="seller-pwd-find-wrap">
	<h2 style="text-align: center;">비밀번호 찾기</h2>
	<div class="seller-pwd-info">
		<label>아이디</label>
		<input type="text" id="r_id" name="r_id">
		<br>
		<label>이메일</label> 
		<input type="text" id="r_email" name="r_email">
	</div>
	<div class="pwd-find-div">
		<input type="button" id="pwd-find-a" class="btn3" value="비밀번호 발급" onclick="pwdFind()">
	</div>
</div>
<script>
	function pwdFind() {
		let r_id = document.getElementById("r_id");
		let r_email = document.getElementById("r_email");
		let login_btn = document.querySelector(".pwd-find-div");
		let token = document.getElementById("_csrf").getAttribute("content");
		let token_header = document.getElementById("_csrf_header").getAttribute("content");
		
		if (r_id.value == '') {
			alert("아이디를 입력해 주세요.");
			r_id.focus();
			return;
		}
		
		if (r_email.value == '') {
			alert("이메일을 입력해 주세요.");
			r_email.focus();
			return;
		}
		
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				let data = xhr.responseText;
				let json = JSON.parse(data);
				
				if (json.result == 'success') {
					alert("임시 비밀번호가 발급되었습니다.\n메일을 확인해주세요.");
					login_btn.innerHTML = "";
					login_btn.innerHTML += `<input type="button" id="pwd-find-a" class="btn3" value="비밀번호 재발급" onclick="pwdFind()"> <input type='button' value='로그인' class='btn3' onclick='location.href="${cp}/loginRestaurant"'>`;
				} else {
					alert("아이디 또는 이메일이 일치하지 않습니다.");
				}
			}
		}
		let url = "${cp}/sellerPwdFind";
		let params = "r_email=" + r_email.value + "&r_id=" + r_id.value;
		xhr.open('post', url, true);
		xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
		xhr.setRequestHeader(token_header, token);
		xhr.send(params);
	}
</script>
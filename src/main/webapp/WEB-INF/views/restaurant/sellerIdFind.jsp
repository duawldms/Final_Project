<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${cp }/resources/css/restaurant.css">
<meta id="_csrf" content="${_csrf.token}">
<meta id="_csrf_header" content="${_csrf.headerName}">
<style>
	#b_r_id {
		color: blue;
	}
	
	.id-find-wrap {
		border: 4px solid #7bcfbb;
	    width: 475px;
	    margin: auto;
	    /* height: 300px; */
	    padding: 50px;
	    padding-top: 50px;
	    margin-top: 210px;
    	margin-bottom: 210px;     
   } 
   
   .id-find {
   		text-align: center;
   }
   .r-email-info {
   		text-align: center;
   		margin: 20px;
   }
   
   #id-find-text {
   		text-align: center;
   }
   
   .r-pwd-find {
   		text-align: center;
   		    margin: 15px;
   }
</style>
<div class="id-find-wrap">
	<h2 style="text-align: center;">아이디 찾기</h2>
	<div>
		<span id="id-find-text">아이디는 가입하신 이메일을 통해 찾을 수 있습니다.</span>
		<br>
		<div class="id-find">
			<div class="r-email-info">
				<label>이메일</label>
				<input type="text" name="r_email" id="r_email">
				<span id="id_result"></span>
				<br>
				<input type="button" class="btn3" value="아이디 찾기" onclick="idFind()">
			</div>
		</div>
		<div class="r-pwd-find">
			<a href="${cp }/sellerPwdFind">비밀번호 찾기</a>
		</div>
	</div>
</div>
<script>
	var xhr = null;
	
	function idFind() {
		let r_email = document.getElementById("r_email");
		let token = document.getElementById("_csrf").getAttribute("content");
		let token_header = document.getElementById("_csrf_header").getAttribute("content");
		
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
				let id_result = document.getElementById("id_result");
				let id_find = document.querySelector(".id-find");
				if (json.result == 'success') {
					id_find.innerHTML = "";
					id_find.innerHTML = "<br>회원님의 아이디는 <b id='b_r_id'>" + json.r_id + "</b>입니다.<br>"
										+ `<input type='button' value='로그인' class='btn3' onclick='location.href="${cp}/loginRestaurant"'>`;
				} else {
					id_result.innerHTML = "<br>등록한 아이디가 존재하지 않습니다."
				}
			}
		}
		let url = "${cp}/sellerIdFind";
		let params = "r_email=" + r_email.value;
		xhr.open('post', url, true);
		xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
		xhr.setRequestHeader(token_header, token);
		xhr.send(params);
	}
</script>


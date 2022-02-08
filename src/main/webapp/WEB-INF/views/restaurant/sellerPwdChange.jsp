<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- ajax 통신을 위한 meta tag -->
<meta id="_csrf" content="${_csrf.token}">
<meta id="_csrf_header" content="${_csrf.headerName}">
<style>
	.pwd_change_wrap {
		border: 4px solid #7bcfbb;
	    width: 425px;
	    margin: auto;
	    padding: 10px 20px 10px 20px;
	    margin-top: 200px;
	    margin-bottom: 200px;      
   } 
   
   .check_btn_div {
   		text-align: center;
   		padding: 10px;
   }
   
   #pwd_check_btn {
	    color:white; 
	    height: 35px;
	    width: 150px;
	    background-color: #F6416C;   
	    border: 2px solid white;
    }
    
    #pwd_check_btn:hover { 
	    background-color: white;
	    color: black;
	    border: 2px solid #F6416C;
    }
    
    .pwd_input {
    	margin: 5px 0px 10px 0px;
    }
    
    #r_id {
    	color: skyblue;
    }
    
    .pwd_change_title {
    	text-align: center;
    	padding: 10px;
    }
    
    input[type=password] {
    	float: right;
    }
    
    .pwd_change_center {
    	width: 320px;
    	margin: auto;
    }
</style>
<div class="pwd_change_wrap">
	<form:form method="post" id="pwd_change_form" action="${cp }/restaurant/pwdChange">
		<div class="pwd_change_title">
			<h4>비밀번호 변경</h4>
		</div>
		<div class="pwd_change_center">
			<label>현재 비밀번호</label>
			<input type="password">
			<br>
			<label>새 비밀번호</label>
			<input type="password" name="">
			<br>
			<label>새 비밀번호 확인</label>
			<input type="password">
		</div>
		<div class="check_btn_div">
			<input type="button" id="pwd_check_btn" value="비밀번호 변경" onclick="pwdCheck()">
		</div>
	</form:form>
</div>
<script>
	var xhr = null;
	
	function pwdCheck() {
		let r_pwd = document.getElementById("r_pwd");
		let params = "r_pwd=" + r_pwd.value;
		let token = document.getElementById("_csrf").getAttribute("content");
		let token_header = document.getElementById("_csrf_header").getAttribute("content");
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				let data = xhr.responseText;
				let json = JSON.parse(data);
				
				if (json.result == 'success') {
					document.getElementById("pwd_change_form").submit();
				} else {
					let pwd_err = document.getElementById("pwd_err");
					pwd_err.innerText = "비밀번호가 틀렸습니다.";					
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
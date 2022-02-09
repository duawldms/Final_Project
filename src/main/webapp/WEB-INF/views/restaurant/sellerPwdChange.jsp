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
   
   .pwd_change_th {
		background-color: #F2F2F2;
		text-align: center;
		padding: 10px;
		border-bottom: 1px solid #BDBDBD;
		font-weight: bold;
	}
	
	.pwd_change_td {
		padding: 5px;
		border-bottom: 1px solid #BDBDBD;
		font-weight: bold;
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
    
    .pwd_err_div {
    	text-align: center;
    }
</style>
<div class="pwd_change_wrap">
	<div class="pwd_change_title">
		<h4>비밀번호 변경</h4>
	</div>
	<form:form method="post" id="pwd_change_form" action="${cp }/restaurant/pwdChange">
		<table>
			<tr style="border-top: 1px solid #BDBDBD;">
				<th class="pwd_change_th">현재 비밀번호</th>
				<td class="pwd_change_td">
					<input type="password" id="use_r_pwd">
					<div id="use_r_pwd_err" class="pwd_err_div" style="font-size: 0.8em;"></div>
				</td>
			</tr>
			<tr>
				<th class="pwd_change_th">새 비밀번호</th>
				<td class="pwd_change_td">
					<input type="password" id="r_pwd" name="r_pwd">
					<div id="r_pwd_err" class="pwd_err_div" style="font-size: 0.8em;"></div>
				</td>
			</tr>
			<tr>
				<th class="pwd_change_th">새 비밀번호 확인</th>
				<td class="pwd_change_td">
					<input type="password" id="r_pwd_check" onblur="pwdCheck()">
					<div id="r_pwd_check_err" class="pwd_err_div" style="font-size: 0.8em;"></div>
				</td>
			</tr>
		</table>
		<div class="check_btn_div">
			<input type="button" id="pwd_check_btn" value="비밀번호 변경" onclick="pwdChange()">
		</div>
	</form:form>
</div>
<script>
	var xhr = null;
	
	// 비밀번호 확인
	function pwdCheck() {
		let r_pwd = document.getElementById("r_pwd");
		let r_pwd_check = document.getElementById("r_pwd_check");
		let pwdCheckResult = document.getElementById("r_pwd_check_err");
		if (r_pwd.value != r_pwd_check.value) {
			pwdCheckResult.style.color = "red";
			pwdCheckResult.innerText = "비밀번호가 일치하지 않습니다."
		} else if (r_pwd.value != '' && r_pwd_check.value != ''
				&& r_pwd.value === r_pwd_check.value) {
			pwdCheckResult.style.color = "blue";
			pwdCheckResult.innerText = "비밀번호가 서로 일치합니다.";
		}
	}
	
	function pwdChange() {
		let use_r_pwd = document.getElementById("use_r_pwd");
		let r_pwd = document.getElementById("r_pwd");
		let r_pwd_check = document.getElementById("r_pwd_check");
		let params = "r_pwd=" + use_r_pwd.value;
		let token = document.getElementById("_csrf").getAttribute("content");
		let token_header = document.getElementById("_csrf_header").getAttribute("content");
		xhr = new XMLHttpRequest();
		
		if (use_r_pwd.value == '') {
			document.getElementById("use_r_pwd_err").style.color = "red";
			document.getElementById("use_r_pwd_err").innerText = "비밀번호를 입력해 주세요.";
			r_pwd.focus();
			return;
		}
		
		if (r_pwd.value == '') {
			document.getElementById("r_pwd_err").innerText = "새 비밀번호를 입력해 주세요.";
			r_pwd.focus();
			return;
		}
		
		if (r_pwd_check.value == '') {
			document.getElementById("r_pwd_check_err").innerText = "새 비밀번호를 확인해 주세요.";
			r_pwd_check.focus();
			return;
		}
		
		if (r_pwd.value != r_pwd_check.value) {
			document.getElementById("r_pwd_check_err").style.color = "red";
			document.getElementById("r_pwd_check_err").innerText = "비밀번호가 일치하지 않습니다.";
			r_pwd.focus();
			return;
		}
		
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				let data = xhr.responseText;
				let json = JSON.parse(data);
				
				if (json.result == 'success') {
					alert("비밀번호 변경이 완료되었습니다. \n다시 로그인해 주세요.");
					document.getElementById("pwd_change_form").submit();
				} else {
					let pwd_err = document.getElementById("use_r_pwd_err");
					pwd_err.style.color = "red";
					pwd_err.innerText = "비밀번호를 확인해 주세요.";					
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
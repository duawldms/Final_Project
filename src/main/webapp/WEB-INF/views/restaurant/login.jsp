<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<style>
	.restaurant_login_wrap {
		text-align: center;
		border: 4px solid #7bcfbb;
		width: 400px;
		margin: auto;
		margin-top:200px;
		margin-bottom:200px;  
		padding: 15px;
	}
	.login_btn_div {
		margin: 10px;
	}
	#login_btn {
		width: 80px;
		height: 30px;        
		color: #7bcfbb;
		background-color: white;  
		border-radius: 4px;
		border-color: #7bcfbb;
		font-size: 20px;
		cursor: pointer;
	}
	
	#login_btn {
	    color:white; 
	    height: 35px;
	    width: 150px;
	    background-color: #F6416C;   
	    border: 2px solid white;
    }
    #login_btn:hover { 
	    background-color: white;
	    color: black;
	    border: 2px solid #F6416C;
    }
	
	label {
		margin-top: 0.5rem;
	}
</style>
<div>
	<div class="restaurant_login_wrap">
		<h1>판매자 로그인</h1>
		<form:form method="post" action="${cp }/loginuser">
			<div class="login-group">
				<label>아이디</label>
				<br>
				<input type="text" name="username">
			</div>
			<div class="login-group">
				<label>비밀번호</label>
				<br>
				<input type="password" name="password">
			</div>
			<div class="login_btn_div">
				<input type="submit" id="login_btn" value="로그인">
			</div>
			<div>${requestScope.errMsg }</div>
			<div>
				<label>로그인 유지</label>
				<input type="checkbox" name="remember-me" id="rememberMe">
			</div>
			<div>
				<a href="${cp }/sellerInsert">회원가입</a> / <a href="${cp }/sellerIdFind">아이디 찾기</a>
			</div>
		</form:form>
	</div>
</div>
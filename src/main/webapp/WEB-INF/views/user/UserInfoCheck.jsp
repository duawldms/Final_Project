<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<style type="text/css">
   #box {
	text-align: center;
	border: 4px solid #7bcfbb;
	width: 400px;
	margin: auto;      
	height:300px; 
	padding:45px;   
	padding-top:50px;      
	margin-top:125px;          
   } 
   .btn3 {
    color:white; 
    height: 35px;
    width: 150px;
    background-color: #F6416C;   
    border: 2px solid white;
    }
    .btn3:hover { 
    background-color: white;
    color: black;
    border: 2px solid #F6416C;
    } 
</style>
<script type="text/javascript">
	$(function(){
		$("#btn").click(function(){
			let ui_id=$("input[name='ui_id']").val();
	  		let ui_pwd=$("input[name='ui_pwd']").val();
			location.href="/project/userinfo?ui_id=" + ui_id + "&ui_pwd=" + ui_pwd;
		});
	});
</script>

<div id="box"> 
	<h4>회원 비밀번호를</h4>    
	<h4> 한번 더 입력 해 주세요.</h4><br>
	<input type="hidden" name="ui_id" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">
	<input type="password" name="ui_pwd"><br><br>  
	<input type="button" value="확인" id="btn" class="btn3">  
</div>

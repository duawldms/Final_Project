<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">

	#resultbox{
	text-align: center;
	border: 4px solid #7bcfbb;
	width: 400px;
	margin: auto;
	margin-top:200px;
	margin-bottom:200px;  
	padding: 35px;  
	height:300px;   
	font-size: 25x;                                         
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
<div id="resultbox">
입력하신 비밀번호가 <br> 일치하지 않습니다.<br>      
다시 확인 해 주세요.<br><br>       
<a href="${cp }/userinfocheck" class="btn3">닫기</a>
</div>

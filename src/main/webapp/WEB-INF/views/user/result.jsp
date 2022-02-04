<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	font-size: 25px;                 
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
     .btn4 {
    color:#F6416C;  
    height: 35px;
    width: 150px;
    background-color: white;   
    border: 2px solid #F6416C;
    }
    .btn4:hover { 
    background-color: #F6416C;       
    color: black;
    border: 2px solid white;
    } 
	
</style>
<div id="resultbox">
${result }
<p></p>
 <a href="${cp}/loginuser" class="btn3">로그인</a>    <a href="${cp}/" class="btn4">주문하러가기</a> 
</div>




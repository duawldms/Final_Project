<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">

	#resultbox{
	text-align: center;
	border: 4px solid #7bcfbb;
	width: 450px;        
	margin: auto;
	margin-top:200px;  
	margin-bottom:200px;  
	padding: 35px;  
	padding-top:100px;      
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
${result } <br><br>

<input type="button" class="btn3" value="내 정보" id="info"> | <input type="button" class="btn4" value="홈으로" id="home">
</div>
<script type="text/javascript">
	$(function(){
		$("#info").click(function(){
			location.href="${cp }/userinfocheck?ui_id=${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}";
		});
		$("#home").click(function(){
			location.href="${cp}/";
		});
	});

</script>

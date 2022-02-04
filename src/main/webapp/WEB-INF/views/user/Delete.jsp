<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<style type="text/css">
 	#box{
 	position:center;
 	padding:45px;                   
 	margin:100px; 
 	text-align: center;
 	} 
 	#inserttable
 	{
 	height: 200px;
    width: 600px;  
    border-top: 3px solid black;
    margin-right: auto;
    margin-left: auto;
 	
 	}
 	td
 	{
    border-bottom: 1px dotted black;
    }
    .col1 {
    background-color: #7bcfbb;
    padding: 10px;
    text-align: center;
    font-weight: bold;
    font-size: 1.2  em;  
    }   
 
    .col2 {
    text-align: left;
    padding: 5px;
    }
     .useridbtn {    
    height: 25px;
    width: 80px;
    color: white;
    background-color: black;
    border-color: black;
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
    color: white;
    border: 2px solid white;      
    } 
    .num{
    color: red;
    }
</style>
<script>
$(function(){
	$("form").submit(function(){
		let ui_pwd=$("input[name='ui_pwd']").val();
		if(ui_pwd==''){
			alert("비밀번호를 입력해 주세요");
			return false;  
		}
	});
});

</script>
<div id="box">
<form:form method="post" action="${cp }/delete">
<h2>회원 탈퇴하기</h2><br><br>
<table id="inserttable">
	<tr>
		<td class="col1">아이디</td>
		<td class="col2"><input type="text" name="ui_id" value="${vo.ui_id }" readonly="readonly"></td>
	</tr>
	<tr>
		<td class="col1">이름</td>
		<td class="col2"><input type="text" name="ui_name" value="${vo.ui_name }" readonly="readonly" ></td>
	</tr>
	<tr>
		<td class="col1">이메일</td>
		<td class="col2"><input type="text" name="ui_email" value="${vo.ui_email }" readonly="readonly"></td>
	</tr>
	<tr>
		<td class="col1">비밀번호</td>
		<td class="col2"><input type="password" name="ui_pwd" id="ui_pwd" placeholder="비밀번호를 입력해 주세요"></td>
	</tr>
</table><br><br>   
	<span style="color:red">탈퇴하시면 모든 정보가 사라집니다.</span><br><br>   
	<input type="submit" value="탈퇴하기" class="btn3">
	 <input type="button" value="취소" id="btn2" class="btn4">   
</form:form>
</div>
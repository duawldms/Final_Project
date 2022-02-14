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
 	height: 150px;  
    width: 500px;   
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
<script type="text/javascript">
	$(function(){
		$("form").submit(function(){
			let pwd=$("input[name='ui_pwd']").val();
			let pwdchk=$("input[name='ui_pwdchk']").val();
			if(pwd==''){
				alert("변경할 비밀번호를 입력해주세요");
				$("input[name='ui_pwd']").focus();
				return false;
			}
			if(pwdchk==''){
				alert("변경할 비밀번호 재확인을 입력해주세요");
				$("input[name='ui_pwdchk']").focus();
				return false;
			}
			if(pwd.length < 5 || pwd.length > 10) {
		          alert('비밀번호는 5 ~ 10자리로 입력이 가능합니다.');
		      	  $("input[name='ui_pwd']").focus();
		          return false;
		      }
			 if($("input[name='ui_pwd']").val()!=$("input[name='ui_pwdchk']").val()){
               alert("비밀번호가 일치하지 않습니다.")
               return false;
			}
			
		});
		$("#btn2").click(function(){
			location.href="${cp}/usermypage";
		});
	});


</script>
<div id="box">
<form:form method="post" action="${cp }/changepwd">
<h2>회원 비밀번호 변경</h2><br><br>
<table id="inserttable">    
	<tr>
		<td class="col1">변경할 비밀번호</td>
		<td class="col2"><input type="password" name="ui_pwd"></td>
	</tr>
	<tr>
		<td class="col1">변경할 비밀번호 재확인</td>
		<td class="col2">
		<input type="password" name="ui_pwdchk">
		<span></span>
		</td>
	</tr>
</table><br><br>   
 <input type="hidden" name="ui_id" value="${ui_id }">
 <input type="submit" value="변경하기" id="btn" class="btn3">
</form:form>
</div>
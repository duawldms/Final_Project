<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<style type="text/css">
/*
#box {
	text-align: center;
	border: 4px solid #7bcfbb;
	width: 400px;
	margin: auto;
	margin-top:200px;
	margin-bottom:200px;  
	padding: 35px;               
}
#btn { 
	width: 100px;
 	height: 30px;        
	color: #7bcfbb;
	background-color: white;  
	border-radius: 4px;
	border-color: #7bcfbb;
	font-size: 12px;       
	cursor: pointer;
}
*/
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
			 if($("input[name='ui_pwd']").val()!=$("input[name='ui_pwdchk']").val()){
               alert("비밀번호가 일치하지 않습니다.")
               return false;
			}
			
		});
	});


</script>
<div id="box">
<form:form method="post" action="${cp }/changepwd">
<h2>회원 비밀번호 변경</h2>
 변경할 비밀번호<br>
 <input type="password" name="ui_pwd"><br>
 변경할 비밀번호 재확인<br>
 <input type="password" name="ui_pwdchk">
 <span></span><br>
 <input type="hidden" name="ui_id" value="${ui_id }">
 <input type="submit" value="변경하기" id="btn">
</form:form>
</div>
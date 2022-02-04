<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">

#searchbox {
	text-align: center;
	border: 4px solid #7bcfbb;
	width: 400px;
	margin: auto;
	margin-top:200px;
	margin-bottom:200px;  
	padding: 35px;               
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
			let ui_email=$("input[name='ui_email']").val();
			$.ajax({
				url:"/project/finduserpwd",
				dataType:'json',
				data:{"ui_id":ui_id,"ui_email":ui_email},
				success:function(data){
					if(data==true){
						alert("임시 비밀번호가 발급되었습니다.메일함을 확인해 주세요");
						console.log(data);
					}else{
						alert("아이디 또는 이메일을 정확하게 입력해 주세요");
						console.log(data);
				}
		   	}
		});
	});
});
</script>  
<div id="searchbox">
<form action="${cp}/finduserpwd" method="post">
	<h2>임시 비밀번호 발급</h2><br>    
	아이디<br>
	<input type="text" name="ui_id"><br>
	이메일<br>
	<input type="email" name="ui_email"><br><br>
	<input type="button" value="비밀번호 발급" id="btn" class="btn3"><br><br>   
	<a href="${cp }/loginuser">로그인</a> | <a href="${cp }/insertuser">회원가입</a>  
</form>
</div>
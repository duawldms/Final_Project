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
#searchbtn { 
	width: 80px;
	height: 30px;        
	color: #7bcfbb;
	background-color: white;  
	border-radius: 4px;
	border-color: #7bcfbb;
	font-size: 20px;
	cursor: pointer;
}
</style>
<script type="text/javascript">
	$(function(){
		$("#searchbtn").click(function(){
			let ui_name=$("input[name='ui_name']").val();
			let ui_phone=$("input[name='ui_phone']").val();
			$.ajax({
				url:'/project/searchid?ui_name=' + ui_name + '&ui_phone=' + ui_phone,
				dataType:'json',
				success:function(data){
					if(data.result==true){
						$("#result").html("아이디:" + data.ui_id);
					}else if(ui_name==''){
						$("#result").html("이름 및 휴대폰번호를 입력해 주세요");
					}else{
						$("#result").html("해당 정보를 가진 아이디를 찾을 수 없습니다.");
					}
				}
			});
		});
	});


</script>
<div id="searchbox">
<h2>회원 아이디 찾기</h2>
	<form action="${cp }/serchid" method="post">
		이름<br>
		<input type="text" name="ui_name"><br>
		핸드폰 번호<br>
		<input type="text" name="ui_phone"><br><br>  
		<input type="button" value="조회" id="searchbtn"><br><br>  
		<span id="result"></span>
		<span></span>	
	</form>
</div>
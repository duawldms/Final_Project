<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/project/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(function(){
		$("#btn").click(function(){
		let ui_id=$("#ui_id").val();
		console.log(ui_id);
		$.ajax({
			url:'/project/checkid',
			data:{"ui_id":ui_id},
			dataType:'json',
			success:function(data){ 
			if(data.using==true){
				$("#idresult").html("사용중인 아이디입니다.");
			}else{
				$("#idresult").html("해당아이디는 사용하실 수 있습니다.");
			}
		  }
		});
	  });
	});
</script>
</head>
<body>
	<form method="post" action="${cp }/insertuser">
		아이디<br>
		<input type="text" name="ui_id" id="ui_id">
		<input type="button" value="아이디 검사" id="btn">
		<span id="idresult"></span>
		<br>
		비밀번호<br>
		<input type="password" name="ui_pwd"><br>
		비밀번호 확인<br><!-- ui_pwd와 같은지 검사할것 -->
		<input type="password" name="ui_pwdchk"><br>
		이름<br>
		<input type="text" name="ui_name"><br>
		이메일<br><!-- 이메일 연동 구현(추가사항) -->
		<input type="text" name="ui_email"><br>
		전화번호<br>
		<input type="text" name="ui_phone"><br>
		주소<br> <!-- 우편번호//api??? -->
		<input type="text" name="ui_regdate"><br>
		<input type="submit" value="가입">
	</form>
</body>
</html>
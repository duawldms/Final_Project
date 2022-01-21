<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    

<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/project/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
    //아이디 중복확인
	$(function(){
		$("#useridbtn").click(function(){
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
		$("#usernicknamebtn").click(function(){
			let ua_nickname=$("#ua_nickname").val();
			console.log(ua_nickname);
			$.ajax({
				url:'/project/checknickname',
				data:{"ua_nickname":ua_nickname},
				dataType:'json', 
				success:function(data){    
				if(data.using==true){ 
					$("#nicknameresult").html("사용중인 닉네임입니다.");
				}else{
					$("#nicknameresult").html("해당닉네임은 사용하실 수 있습니다.");
				}
			  }
			});
			
		  });
  /*
	//필수값 확인 
	$("form").submit(function(){
		let ui_id=$("input[name='ui_id']").val();
		console.log(ui_id);
		if(ui_id==''){
			$("input[name=='ui_id']").next().html("아이디를 입력하세요");
			return false;
		}
		let ui_pwd=$("input[name='ui_pwd']").val();
		if(ui_pwd==''){
			$("input[name=='ui_pwd']").next().html("비밀번호를 입력하세요");
			return false;
		}
		let ui_email=$("input[name='ui_email']").val();
		if(ui_email==''){
			$("input[name=='ui_email']").next().html("이메일을 입력하세요");
			return false;
		}
		let ui_addr=$("input[name='ui_addr']").val();
		if(ui_addr==''){
			$("input[name=='ui_addr']").next().html("주소를 입력하세요");
			return false;
		}
		let ui_phone=$("input[name='ui_phone']").val();
		if(ui_phone==''){
			$("input[name=='ui_phone']").next().html("전화번호를 입력하세요");
			return false;
		}
	});
		*/
		
});
</script>
</head>
<body>
	<form:form method="post" action="${cp }/insertuser">
		아이디<br>
		<input type="text" name="ui_id" id="ui_id">
		<input type="button" value="아이디 검사" id="useridbtn">
		<span id="idresult"></span>
		<br>
		닉네임<br>
		<input type="text" name="ua_nickname" id="ua_nickname">
		<input type="button" value="닉네임 검사" id="usernicknamebtn">
		<span id="nicknameresult"></span><br> 
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
		<!-- useraddr//추가사항-api /입력값과 같으면 값 얻어와서 뿌려주기(추가사항)-->
		주소<br> 
		<input type="text" name="ua_addr"><br>
		배송받을 사람<br> 
		<input type="text" name="ua_name"><br>
		배송받을 전화번호<br> 
		<input type="text" name="ua_phone"><br>
		<input type="submit" value="가입">
	</form:form>
</body>
</html>
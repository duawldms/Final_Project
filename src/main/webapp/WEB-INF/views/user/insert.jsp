<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    

<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 



</style>
<script type="text/javascript" src="/project/resources/js/jquery-3.6.0.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
var themeObj = {
		   bgColor: "#162525", //바탕 배경색
		   searchBgColor: "#162525", //검색창 배경색
		   contentBgColor: "#162525", //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
		   pageBgColor: "#162525", //페이지 배경색
		   textColor: "#FFFFFF", //기본 글자색
		   queryTextColor: "#FFFFFF", //검색창 글자색
		   outlineColor: "#444444" //테두리
		};
    //아이디 중복확인
	$(function(){
		document.getElementById("addr-addon").addEventListener('click',function(){
			new daum.Postcode({
		        oncomplete: function(data) {
		    	   	document.getElementById("ua_addr").value = data.address; // 주소 넣기
		        	document.getElementById("ua_addrdetail").placeholder = "상세주소를 입력하세요";
		        	document.getElementById("ua_addrdetail").focus();
		        },
		        theme:themeObj
			 }).open({
				q:document.getElementById("ua_addr").value
			 });
		});
		$("#useridbtn").click(function(){
		let ui_id=$("#ui_id").val();
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
		//닉네임 중복 확인 
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
  	$("form").submit(function(){
  		let ui_id=$("input[name='ui_id']").val();
	  		if(ui_id==''){
		  		alert("아이디를 입력해 주세요");
		  		return false;
	  		}
	  	let ua_nickname=$("input[name='ua_nickname']").val();
		  if(ua_nickname==''){
			  alert("닉네임을 입력해 주세요");
			  return false;
		  	}
		let ui_pwd=$("input[name='ui_pwd']").val();
		let ui_pwdchk=$("input[name='ui_pwdchk']").val();
		 if(ui_pwd==''){
			  $("input[name='ui_pwd']").next().html("비밀번호를 입력해 주세요");
			 return false;
	     }
		 if(ui_pwdchk==''){
			  $("input[name='ui_pwdchk']").next().html("비밀번호를 입력해 주세요");
			 return false;
	     }
		 if($("input[name='ui_pwd']").val()!=$("input[name='ui_pwdchk']").val()){
				$("input[name='ui_pwdchk']").next().html("비밀번호를 올바르게 입력해주세요");
				 return false;
		}
		let ui_name=$("input[name='ui_name']").val();
		  if(ui_name==''){
			 $("input[name='ui_name']").next().html("이름을 입력해 주세요");
			return false;
		 }
	    let ui_email=$("input[name='ui_email']").val();
		  if(ui_email==''){
			$("input[name='ui_email']").next().html("이메일을 입력해 주세요");
		    return false;
	    }
	    let ui_phone=$("input[name='ui_phone']").val();
		  if(ui_phone==''){
			$("input[name='ui_phone']").next().html("전화번호를 입력해 주세요");
		    return false;
	    }
	   let ua_addr=$("input[name='ua_addr']").val();
		  if(ua_addr==''){
			$("input[name='ua_addr']").next().html("주소를 입력해 주세요");
		    return false;
		}
	   let ua_name=$("input[name='ua_name']").val();
		  if(ua_name==''){
			$("input[name='ua_name']").next().html("배송받을분의 성함을 입력해 주세요");
		    return false;
	    }
	   let ua_phone=$("input[name='ua_phone']").val();
		  if(ua_phone==''){
			$("input[name='ua_phone']").next().html("배송받을 전화번호를 입력해 주세요");
		    return false;
	    }
  
  	});
		
});
</script>
</head>
<body>
	<form:form method="post" action="${cp }/insertuser">
		아이디<br>
		<input type="text" name="ui_id" id="ui_id"><br>
		<input type="button" value="아이디 검사" id="useridbtn">
		<span id="idresult"></span>
		<br>
		닉네임<br>
		<input type="text" name="ua_nickname" id="ua_nickname"><br>
		<input type="button" value="닉네임 검사" id="usernicknamebtn">
		<span id="nicknameresult"></span><br> 
		비밀번호<br>
		<input type="password" name="ui_pwd"><span></span><br>
		비밀번호 확인<br><!-- ui_pwd와 같은지 검사할것 -->
		<input type="password" name="ui_pwdchk"><span></span><br>
		이름<br>
		<input type="text" name="ui_name"><span></span><br>
		이메일<br><!-- 이메일 연동 구현(추가사항) -->
		<input type="text" name="ui_email"><span></span><br>
		전화번호<br>
		<input type="text" name="ui_phone"><span></span><br>
		<!-- useraddr//추가사항-api /입력값과 같으면 얻어와서 뿌려주기(추가사항)-->
		<!-- 입력값과 같으면 불러오기 기능(추가) -->
		<input type="text" class="form-control col-6" id="ua_addr" placeholder="배달받을 간단한 주소를 입력해주세요!">
		<input type="text" class="form-control col-4 place" id="ua_addrdetail" aria-describedby="addr-addon">
		<button class="btn btn-outline-secondary" type="button" id="addr-addon">검색</button>
		배송받을 사람<br> 
		<input type="text" name="ua_name"><span></span><br>
		배송받을 전화번호<br> 
		<input type="text" name="ua_phone"><span></span><br>
		<input type="submit" value="가입">
	</form:form>

</body>
</html>
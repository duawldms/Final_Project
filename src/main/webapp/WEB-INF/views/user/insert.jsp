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
	$(function(){
		document.getElementById("addr-addon").addEventListener('click',function(){
			new daum.Postcode({
		        oncomplete: function(data) {
		    	   	document.getElementById("ua_addr").value = data.address; // 주소 넣기
		        	document.getElementById("ua_addr").placeholder = "상세주소를 입력하세요";
		        	document.getElementById("ua_addr").focus();
		        },
		        theme:themeObj
			 }).open({
				q:document.getElementById("ua_addr").value
			 });
		});
	    //아이디 중복확인
		$("#useridbtn").click(function(){
		let ui_id=$("#ui_id").val();
		$.ajax({
			url:'/project/checkid',
			data:{"ui_id":ui_id},
			dataType:'json', 
			success:function(data){    
			if(data.using==true){ 
				$("#idresult").html("사용중인 아이디입니다.");
				$("input[name='idChk']").prop("value","N");
			}else if(ui_id==''){
				$("#idresult").html("아이디를 입력해 주세요.");
			}else{
				$("#idresult").html("해당아이디는 사용하실 수 있습니다.");
				$("input[name='idChk']").prop("value","Y");
			}
		  }
		});
	  });
		
  	$("form").submit(function(){
  		let idChk=$("input[name='idChk']").val();
  		let ui_id=$("input[name='ui_id']").val();
  		let ui_pwd=$("input[name='ui_pwd']").val();
		let ui_pwdchk=$("input[name='ui_pwdchk']").val();
		let ui_name=$("input[name='ui_name']").val();
		let ui_email=$("input[name='ui_email']").val();
	    let ui_phone=$("input[name='ui_phone']").val();
		let ua_addr=$("input[name='ua_addr']").val();    
		
  		if(idChk=='N'){
  			alert("id중복확인을 해 주세요");
  			return false;
  		}
	  		if(ui_id==''){
		  		alert("아이디를 입력해 주세요");
		  		return false;
	  	}
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
		  if(ui_name==''){
			 $("input[name='ui_name']").next().html("이름을 입력해 주세요");
			return false;
		 }
		  if(ui_email==''){
			$("input[name='ui_email']").next().html("이메일을 입력해 주세요");
		    return false;
	    }
		  if(ui_phone==''){
			$("input[name='ui_phone']").next().html("전화번호를 입력해 주세요");
		    return false;
	    }
		  if(ua_addr==''){
			$("input[name='ua_addr']").next().html("주소를 입력해 주세요");
		    return false;
		}   
  	});	
});
</script>
</head>
<body>
	<form:form method="post" action="${cp }/insertuser">
	<h2>기본정보</h2>
		아이디<br>
		<input type="text" name="ui_id" id="ui_id"><br>
		<input type="hidden" id="idChk" value="N" name="idChk">
		<input type="button" value="아이디 검사" id="useridbtn" name="useridbtn">
		<span id="idresult"></span>
		<br>
		비밀번호<br>
		<input type="password" name="ui_pwd"><span></span><br>
		비밀번호 확인<br>
		<input type="password" name="ui_pwdchk"><span></span><br>
		이름<br>
		<input type="text" name="ui_name"><span></span><br>
		이메일<br><!-- 이메일 연동 구현(추가사항) -->
		<input type="text" name="ui_email"><span></span><br>
		전화번호<br>
		<input type="text" name="ui_phone"><span></span><br>
		배송받을 주소<br>
		<input type="text" class="form-control col-6" id="ua_addr" name="ua_addr" placeholder="배달받을 간단한 주소를 입력해주세요!">
		<input type="text" class="form-control col-4 place" id="ua_addr" name="ua_addr" aria-describedby="addr-addon">
		<button class="btn btn-outline-secondary" type="button" id="addr-addon">검색</button><br> 
		
		<input type="submit" value="가입">
	</form:form>

</body>
</html>
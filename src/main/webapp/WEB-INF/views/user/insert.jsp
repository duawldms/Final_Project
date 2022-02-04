<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<style type="text/css">
 	#box{
 	
 	text-align:center;
 	position:center;
 	padding:55px;          
 	margin:10px; 
 	
 	}  
 	#useridbtn #chkpwd #insert{    
 	
 	width: 100px;
 	height: 30px;        
	color: #7bcfbb;
	background-color: white;  
	border-radius: 4px;
	border-color: #7bcfbb;
	font-size: 12px;       
	cursor: pointer;  
 	
 	}
</style>
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
		
		 var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			
	  		if(idChk=='N'){
	  			alert("id중복확인을 해 주세요");
	  			return false;
	  		}
		  		if(ui_id==''){
			  		alert("아이디를 입력해 주세요");
			  		$("input[name='ui_id']").focus();
			  		return false;
		  	}
			 if(ui_pwd==''){
				  alert("비밀번호를 입력해 주세요.");
				  $("input[name='ui_pwd']").focus();
				 return false;
		     }
			 if(ui_pwdchk==''){
				  alert("비밀번호 확인란을 입력해 주세요.");
				  $("input[name='ui_pwdchk']").focus();
				  return false;
		     }
			 if($("input[name='ui_pwd']").val()!=$("input[name='ui_pwdchk']").val()){
				 alert("비밀번호를 올바르게 입력해주세요");
					return false;
			}
			  if(ui_name==''){
				  alert("이름을 입력해 주세요.");
				  $("input[name='ui_name']").focus();
				return false;
			 }
			  if(ui_email==''){
				  alert("이메일을 입력해 주세요.");
				  $("input[name='ui_email']").focus();
			    return false;
		    }
			  if(!email_rule.test(ui_email)){
			      alert("이메일을 형식에 맞게 입력해주세요.");
			    return false;
			  }
			  
			  if(ui_phone==''){
				  alert("전화번호를 입력해 주세요.");
				  $("input[name='ui_phone']").focus();
			    return false;
		    }
			  if(ua_addr==''){
				  alert("주소를 입력해 주세요.");
				  $("input[name='ua_addr']").focus();
			    return false;
		}   
  	});	
});
</script>
<div id="box">
	<form:form method="post" action="${cp }/insertuser">      
	<h2>배달요기이츠 회원가입</h2>
		아이디<br>
		<input type="text" name="ui_id" id="ui_id"><br>   
		<input type="button" value="중복검사" id="useridbtn" name="useridbtn"><br> 
		<input type="hidden" id="idChk" value="N" name="idChk">      
		<span id="idresult"></span>
		<br>
		비밀번호<br>
		<input type="password" name="ui_pwd"><span></span><br>
		비밀번호 확인<br>
		<input type="password" name="ui_pwdchk"><span id="chkpwd"></span><br>
		이름<br>
		<input type="text" name="ui_name"><span></span><br>
		이메일<br><!-- 이메일 연동 구현(추가사항) -->
		<input type="text" name="ui_email"><span></span><br>
		<span style="color:red;">비밀번호 발급 및 개인정보 확인을 위해 정확한 이메일을 입력 해 주세요</span><br>
		전화번호<br>
		<input type="text" name="ui_phone"><span></span><br>
		배송받을 주소<br>
		<input type="text" id="ua_addr" name="ua_addr" placeholder="배달받을 간단한 주소를 입력해주세요!" style="width:400px; "><br>  
		<input type="text"  id="ua_addr" name="ua_addr" aria-describedby="addr-addon" style="width:500px;  "> 
		<button  type="button" id="addr-addon">검색</button><br> 
		
		<input type="submit" value="가입" id="insert">
	</form:form>
</div>
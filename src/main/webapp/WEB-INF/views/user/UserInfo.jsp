<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

$(function(){
	var addr="${vo.ua_addr}"; 
	var afteraddr=addr.split(',');  
	var afteraddr1=afteraddr[0];
	var afteraddr2=afteraddr[1];  
	console.log(("${vo.ua_addr}".split(','))[0]);   
	console.log(afteraddr2);   
	$("input[id='ua_addr1']").attr('value',afteraddr1);    
	$("input[id='ua_addr2']").attr('value',afteraddr2);   
});
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
		    	   	document.getElementsByName("ua_addr")[0].value = data.address; // 주소 넣기
		        	document.getElementsByName("ua_addr")[1].placeholder = "상세주소를 입력하세요";
		        	document.getElementsByName("ua_addr")[0].focus();
		        },
		        theme:themeObj
			 }).open({
				q:document.getElemetnsByName("ua_addr").value
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
		//let ua_addr=$("input[name='ua_addr']").val();    
		
		 var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			
			 if(ui_pwd==''){
				  //$("input[name='ui_pwd']").next().html("비밀번호를 입력해 주세요");
				  alert("비밀번호를 입력해 주세요.");
				  $("input[name='ui_pwd']").focus();
				 return false;
		     }
			 if(ui_pwdchk==''){
				  //$("input[name='ui_pwdchk']").next().html("비밀번호를 입력해 주세요");
				  alert("비밀번호 확인란을 입력해 주세요.");
				  $("input[name='ui_pwdchk']").focus();
				  return false;
		     }
			 if($("input[name='ui_pwd']").val()!=$("input[name='ui_pwdchk']").val()){
					$("input[name='ui_pwdchk']").next().html("비밀번호를 올바르게 입력해주세요");
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
			  /*
			  if(ua_addr==''){
			  alert("주소를 입력해 주세요.");
			  $("input[name='ua_addr']").focus();
		    return false;
	         }   
		*/
			  
  	});	
});
</script>
<form:form method="post" action="${cp }/userupdate">
<h2>기본정보</h2>
		아이디<br>
		<input type="text" name="ui_id" id="ui_id" value="${vo.ui_id }" readonly="readonly"><br>
		<input type="hidden" name="ui_pwd" value="${vo.ui_pwd }"><span></span>
		<input type="hidden" name="ui_pwdchk" value="${vo.ui_pwd }"><span></span>
		이름<br>
		<input type="text" name="ui_name" value="${vo.ui_name }"><span></span><br>
		이메일<br>
		<input type="text" name="ui_email" value="${vo.ui_email }"><span></span><br>
		<span>비밀번호 발급 및 개인정보 확인을 위해 정확한 이메일을 입력 해 주세요</span><br>
		전화번호<br>
		<input type="text" name="ui_phone" value="${vo.ui_phone }"><span></span><br>       
		배송받을 주소<br>
		<input type="text" class="form-control col-6" id="ua_addr1" name="ua_addr" placeholder="배달받을 간단한 주소를 입력해주세요!">
		<input type="text" class="form-control col-4 place" id="ua_addr2" name="ua_addr" aria-describedby="addr-addon">     
		<button class="btn btn-outline-secondary" type="button" id="addr-addon">검색</button><br>   
		<input type="submit" value="수정">  
		</form:form> 
	    <a href="${cp }/changepwd?ui_id=${vo.ui_name}$ui_pwd=${vo.ui_pwd }">비밀번호 변경하기</a>
		
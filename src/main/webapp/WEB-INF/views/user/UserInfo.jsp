<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
 	#box{
 	position:center;
 	padding:45px;                   
 	margin:100px; 
 	} 
 	#form{
 	margin:auto;
 	text-align: center;  
 	position:center;      
 	} 
 	
 	#inserttable
 	{
 	height: 300px;
    width: 900px;
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
    .num{
    color: red;
    }
</style>
<script type="text/javascript">

$(function(){
	var addr="${vo.ua_addr}"; 
	var afteraddr=addr.split(',');  
	var afteraddr1=afteraddr[0];
	var afteraddr2=afteraddr[1];   
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
	    	   	document.getElementById("ua_addr1").value = data.address; // 주소 넣기
	        	document.getElementById("ua_addr2").placeholder = "상세주소를 입력하세요";
	        	document.getElementById("ua_addr1").focus();
	        },
	        theme:themeObj
		 }).open({
			q:document.getElementById("ua_addr1").value
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
			  
  	});	
});
</script>
<div id="box">
<form:form method="post" action="${cp }/userupdate" id="form">
<h2>기본정보</h2>
<table  id="inserttable"> 
	<tr>
		<td  class="col1">아이디</td>
		<td class="col2">
		<input type="text" name="ui_id" id="ui_id" value="${vo.ui_id }" readonly="readonly">
		<input type="hidden" name="ui_pwd" value="${vo.ui_pwd }">
		<input type="hidden" name="ui_pwdchk" value="${vo.ui_pwd }">
		</td>
	</tr>
	<tr>
		<td class="col1">이름</td>
		<td class="col2"><input type="text" name="ui_name" value="${vo.ui_name }"><span></span></td>
	</tr>
	<tr>
		<td class="col1">이메일</td>
		<td class="col2">
		<input type="text" name="ui_email" value="${vo.ui_email }">
		<span>비밀번호 발급 및 개인정보 확인을 위해 정확한 이메일을 입력 해 주세요</span>
		</td>
	</tr>
	<tr>
		<td class="col1">전화번호</td>
		<td class="col2"><input type="text" name="ui_phone" value="${vo.ui_phone }"><span></span></td>
	</tr>
    <tr>
	    <td class="col1">기본 배송지</td>
		<td class="col2">
		<input type="text" id="ua_addr1" name="ua_addr" placeholder="배달받을 간단한 주소를 입력해주세요!" style="width:400px; ">
		<button  type="button" id="addr-addon" class="useridbtn">검색</button> <br> 
		<input type="text"  id="ua_addr2" name="ua_addr" aria-describedby="addr-addon" style="width:500px;" placeholder="상세주소를 입력해 주세요"> 
		</td>
    </tr>  
    <tr>
		<td class="col1">비밀번호</td>
		<td class="col2">   
		<a href="${cp }/changepwd?ui_id=${vo.ui_id}">비밀번호 변경하기</a>
		</td>
	</tr>
</table><br><br>   
<input type="submit" value="수정" class="btn3">
</form:form> 
</div>		
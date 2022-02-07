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
	$(function(){
			var addr="${vo.ua_addr}"; 
			var afteraddr=addr.split(',');  
			var afteraddr1=afteraddr[0];
			var afteraddr2=afteraddr[1];   
			$("input[id='ua_addr1']").attr('value',afteraddr1);    
			$("input[id='ua_addr2']").attr('value',afteraddr2);   
		});
		
  	$("form").submit(function(){
		let ua_name=$("input[name='ua_name']").val();
	    let ua_phone=$("input[name='ua_phone']").val();
	    let ua_addr=$("input[id='ua_addr1']").val();
	    let ua_addrdetail=$("input[id='ua_addr2']").val();
	    let ua_nickname=$("input[name='ua_nickname']").val();
		    if(ua_nickname==''){
				  alert("배송지 명칭을 입력해 주세요.");
				  $("input[name='ua_nickname']").focus();
				return false;
			 }
	    
			  if(ui_name==''){
				  alert("이름을 입력해 주세요.");
				  $("input[name='ui_name']").focus();
				return false;
			 }
			  if(ui_phone==''){
				  alert("전화번호를 입력해 주세요.");
				  $("input[name='ui_phone']").focus();
			    return false;
		    }
			  if(ui_addr==''){
				  alert("주소를 입력해 주세요");
				  $("input[id='ui_addr1']").focus();
			    return false;
		    }
			  if(ui_addrdetail==''){
				  alert("상세주소를 입력해 주세요");
				  $("input[id='ui_addrdetail']").focus();
			    return false;
		    }
			  
  	});	
});
</script>
<div id="box">
<form:form method="post" action="${cp }/useraddrupdate" id="form">
<h2>배송지 수정</h2>
<table  id="inserttable"> 
    <tr>
		<td class="col1">배송지 명칭</td>
		<td class="col2"><input type="text" name="ua_nickname" value="${vo.ua_nickname }"></td>
	</tr>
	<tr>
		<td class="col1">배송받을 분</td>
		<td class="col2"><input type="text" name="ua_name" value="${vo.ua_name }"></td>
	</tr>
	<tr>
		<td class="col1">전화번호</td>
		<td class="col2"><input type="text" name="ua_phone" value="${vo.ua_phone }">
		<input type="hidden" name="ua_num" value="${vo.ua_num }">
		<input type="hidden" name="ui_id" value="${vo.ui_id }">
		</td>
	</tr>
    <tr>
	    <td class="col1">배송받을 주소</td>
		<td class="col2">
		<input type="text" id="ua_addr1" name="ua_addr" placeholder="배달받을 간단한 주소를 입력해주세요!" style="width:400px; ">
		<button  type="button" id="addr-addon" class="useridbtn">검색</button> <br> 
		<input type="text"  id="ua_addr2" name="ua_addr" aria-describedby="addr-addon" style="width:500px;" placeholder="상세주소를 입력해 주세요"> 
		</td>
    </tr>  
</table><br><br>   
<input type="submit" value="수정" class="btn3">
</form:form> 
</div>	
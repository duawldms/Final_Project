<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
 	#box{
 	position:center;
 	padding:45px;                   
 	margin:100px; 
 	text-align: center;       
 	} 
 	#form{
 	margin:auto;
 	text-align: center;  
 	position:center;      
 	} 
 	
 	#inserttable
 	{
 	height: 200px;       
    width: 10 00px;
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
<div id="box">
<h2>배송지정보</h2><br><br>    
<table  id="inserttable"> 
	<tr>
	   <th  class="col1">배송지 이름</th>
	   <th  class="col1">주소</th>
	   <th  class="col1">받는분</th>
	   <th  class="col1">전화번호</th>
	   <th  class="col1">수정</th>
	   <th  class="col1">삭제</th>   
	   
	</tr>
	<c:forEach var="vo" items="${vo }" >
	<tr>
		<td class="col2">${vo.ua_nickname }</td>
		<td class="col2">${vo.ua_addr }</td>
		<td class="col2">${vo.ua_name }</td>
		<td class="col2">${vo.ua_phone }</td>  
		<td class="col2"><a href="${cp }/useraddrupdate?ua_num=${vo.ua_num}">수정하기</a></td>
		<c:choose>
			<c:when test="${vo.ua_nickname eq '기본배송지' }">
				<td class="col2"></td>		
			</c:when>
			<c:when test="${vo.ua_nickname ne '기본배송지' }">
			  <td class="col2"><a href="${cp }/useraddrdelete?ua_num=${vo.ua_num}">삭제하기</a></td>		
			</c:when>
		</c:choose>
	</tr> 
	</c:forEach>
</table><br><br>  
	<a href="${cp }/useraddrinsert">추가하기</a>
</div>	

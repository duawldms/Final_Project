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
 	height: 150px;          
    width: 1000px;        
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
<h2>배달 내역</h2><br><br>    
<table  id="inserttable"> 
	<tr>
	
	   <th  class="col1">가게</th>
	   <th  class="col1">주문상태</th>
	   <th  class="col1">주문일시</th>
	   <th  class="col1">도착예상시간</th>
	   <th  class="col1">음식명</th>
	   <th  class="col1">옵션</th>
	   <th  class="col1">총가격</th>  
	   <th  class="col1">요청사항</th>
	   <th  class="col1">주문내역삭제</th>
	</tr>
	<tr>
		<td class="col2">${vo.r_name }</td>                
		<c:choose>
		<c:when test="${vo.or_status eq '1'}">
		 <td class="col2">주문완료</td>  
		</c:when>
	    <c:when test="${vo.or_status eq '2'}">
		 <td class="col2">조리중</td>  
		</c:when>
		<c:when test="${vo.or_status eq '3'}">
		 <td class="col2">배달중</td>  
		</c:when>
		<c:when test="${vo.or_status eq '4'}">
		 <td class="col2">배달완료</td>  
		</c:when>   
	</c:choose>
        <td class="col2">${vo.or_regdate }</td>
	    <td class="col2">${vo.or_deltime }</td>
		<td class="col2">${vo.food_name }(${vo.food_cost }원) </td>
		<td class="col2">${vo.fo_name }(${vo.fo_cost }원) </td>   
		<td class="col2">${vo.or_totalcost }원</td>     
		<td class="col2">${vo.or_request }</td>  
		<td class="col2"><a href="${cp }/deliveryupdate?or_num=${vo.or_num}&ui_id=${vo.ui_id}">삭제하기</a></td>
	</tr> 
</table>
</div>	
<script type="text/javascript">


</script>
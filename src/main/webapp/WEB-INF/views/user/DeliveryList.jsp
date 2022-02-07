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
<h2>배달 내역</h2><br><br>    
<table  id="inserttable"> 
	<tr>
	   <th  class="col1">배달 상태</th>
	   <th  class="col1">가게</th>
	   <th  class="col1">배달음식</th>
	   <th  class="col1">총 가격</th>
	   <th  class="col1">배달 날짜</th>
	   <th  class="col1">상세내역</th>
	   <th  class="col1">배달내역삭제</th>
	</tr>
	<c:forEach var="vo" items="${vo }"> 
	<tr>
		<td class="col2" id="status">${vo.or_status }</td> 
		<td class="col2">${vo.r_name }</td>                
		<td class="col2">${vo.food_name }</td>
		<td class="col2">${vo.or_totalcost }</td>  
		<td class="col2">${vo.or_regdate }</td>  
		<td class="col2"><a href="${cp }/deliverydetail?or_num=${vo.or_num}&ui_id=${vo.ui_id}&or_num=${or_num}">상세내역</a></td>
		<!-- 매출과는 상관없이 리스트에서만 보이지 않게 수정하기 -->
		<td class="col2"><a href="${cp }/deliverydelete?od_num=${vo.od_num}&ui_id=${vo.ui_id}">삭제하기</a></td>
	</tr> 
	</c:forEach>
</table>
</div>	
<script type="text/javascript">
  
</script>

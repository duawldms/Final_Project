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
 	padding-bottom:150px;        
 	} 
 	#form{
 	margin:auto;
 	text-align: center;  
 	position:center;      
 	} 
 	
 	#inserttable
 	{
 	height: 200px;       
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
    .rimg{
    width:100px;
    height:100px;     
    }
    

</style>    
<div id="box">
<h2>리뷰 관리</h2><br><br>    
<table  id="inserttable"> 
	<tr>
	   <th  class="col1">배달날짜</th>
	   <th  class="col1">주문한 가게</th>
	   <th  class="col1">주문한 음식</th>
	   <th  class="col1">리뷰쓰기</th>
	</tr>     

	<h5>작성가능한 리뷰</h5>    
	<c:forEach var="vo" items="${requestScope.before}"  >      
		<tr>
		<td class="col2">${vo.or_regdate }</td>    
		<td class="col2"><img src="${cp}/resources/img/${vo.r_img}" class="rimg"><br>${vo.r_name }</td>   
		<c:choose>
			<c:when test="${vo.count eq '1' }">  
				<td class="col2">${vo.food_name } </td>      
			</c:when>
			<c:when test="${vo.count > '1' }">
				<td class="col2">${vo.food_name }외 ${vo.count-1 }개 </td>     
			</c:when>
		</c:choose>           
		<td class="col2"><a href="${cp }/review/write?or_num=${vo.or_num}">리뷰쓰기</a></td>
		</tr> 
	</c:forEach>
	
</table><br><br>  
<table  id="inserttable"> 
	<tr>
	   <th  class="col1">배달날짜</th>
	   <th  class="col1">주문한 가게</th>
	   <th  class="col1">주문한 음식</th>
	   <th  class="col1">리뷰보기</th>
	</tr>     

	<h5>작성한 리뷰</h5>    
	<c:forEach var="vo" items="${requestScope.after}"  >      
		<tr>
		<td class="col2">${vo.or_regdate }</td>    
		<td class="col2"><img src="${cp}/resources/img/${vo.r_img}" class="rimg"><br>${vo.r_name }</td>   
		<c:choose>
			<c:when test="${vo.count eq '1' }">  
				<td class="col2">${vo.food_name } </td>      
			</c:when>
			<c:when test="${vo.count > '1' }">
				<td class="col2">${vo.food_name }외 ${vo.count-1 }개 </td>     
			</c:when>
		</c:choose>           
		<td class="col2"><a href="${cp }/reviewList?re_num=${vo.re_num}">작성한 리뷰보기</a></td>
		</tr> 
	</c:forEach>
	
</table>
</div>

	

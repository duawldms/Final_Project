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
<h2>배달 내역</h2><br><br>    
<table  id="inserttable"> 
	<tr>
	   <th  class="col1">배달 상태</th>
	   <th  class="col1">가게</th>
	   <th  class="col1">배달음식</th>
	   <th  class="col1">총 가격</th>  
	   <th  class="col1">주문날짜</th>
	   <th  class="col1">상세내역</th>
	   <th  class="col1">배달내역삭제</th>
	</tr>     

	<c:forEach var="vo" items="${aa }"  >          
		<tr>  
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
			<c:when test="${vo.or_status eq '5'}">
			 <td class="col2">주문취소</td>  
			</c:when>  
		</c:choose>    
			<td class="col2"><img src="${cp}/resources/img/${vo.r_img}" class="rimg"><br>${vo.r_name }</td>   
		<c:choose>
			<c:when test="${vo.count eq '1' }">  
				<td class="col2">${vo.food_name } </td>      
			</c:when>
			<c:when test="${vo.count > '1' }">
				<td class="col2">${vo.food_name }외 ${vo.count-1 }개 </td>     
			</c:when>
		</c:choose>        
			<td class="col2">${vo.or_totalcost }</td>  
			<td class="col2">${vo.or_regdate }</td>    
			<td class="col2"><a href="${cp }/user/deliverydetail?or_num=${vo.or_num}&ui_id=${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">상세내역</a></td>
			<td class="col2"><a href="${cp }/deliveryupdate?or_num=${vo.or_num}&ui_id=${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">삭제하기</a></td>
		</tr> 
		</c:forEach>
</table><br>   
<div>
	<c:if test="${pu.startPageNum>5 }"><a href="${cp}/userdelivery?pageNum=${pu.startPageNum-1}">[이전페이지]</a></c:if>
	<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
		<c:choose>   
			<c:when test="${i==param.pageNum }">
				<a href="${cp }/userdelivery?pageNum=${i}&field=${field}&keyword=${keyword}&ui_id=${ui_id}">
				<span style='color:blue'>${i}</span>
				</a>
			</c:when>
			<c:otherwise>
				<a href="${cp }/userdelivery?pageNum=${i}&field=${field}&keyword=${keyword}&ui_id=${ui_id}">
				<span style='color:red'>${i}</span>
				</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${pu.endPageNum<pu.totalPageCount }"><a href="${cp }/userdelivery?pageNum=${pu.endPageNum+1}">[다음페이지]</a></c:if>
</div>  
<!-- 검색 -->
<div>
	<form:form method="post" action="${cp }/userdelivery">       
		<select name="field">
			<option value="b.r_name"<c:if test="${ field=='b.r_name'}">selected</c:if>>가게이름</option>
			<option value="b.food_name"<c:if test="${ field=='b.food_name'}">selected</c:if>>메뉴</option>
		</select>
			<input type="text" name="keyword" value="${keyword }">
			<input type="hidden" name="ui_id" value="${ui_id }">
			<input type="submit" value="검색"><br> 
	</form:form>
<a href="${cp }/userdelivery?ui_id=${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">전체목록 보기</a>  
</div>
</div>	    
<script type="text/javascript">
  
</script>

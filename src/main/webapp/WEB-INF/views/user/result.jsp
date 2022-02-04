<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
	#resultbox{width:400px;height:200px;border: solid 1px;align-items: center;border: solid 3px;border-color: #7bcfbb;
	           margin:10px;display: inline-block;text-align: center;}  

</style>

<div id="resultbox">
${result }
<p></p>
 <a href="${cp}/loginuser">로그인</a> | <a href="${cp}/">주문하러가기</a> | <a href="${cp}/">홈으로</a>
</div>




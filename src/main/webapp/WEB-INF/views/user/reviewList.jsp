<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<link rel="stylesheet" type="text/css" href="${cp }/resources/css/restaurant.css">
<div class="menuadd_wrap">
	<div class="menuadd_title">
		<h3>내가쓴리뷰</h3>
	</div>
	<form:form method="post" id="reviewForm" action="${cp }/reviewList" enctype="multipart/form-data" acceptCharset="utf-8">
		<table class="menuadd_table">
			<tr style="border-top: 3px solid #49505796;">
				<td class="menuadd_td1">별점평가</td>
				<td class="menuadd_td2">
					<c:forEach begin="1" end="${vo.re_hit}" step="1">
					<img src="${cp }/resources/img/star.png" style="width: 40px;height:32px;">
					</c:forEach>
				</td>
			</tr>
			<tr style="border-bottom: 3px solid #49505796;">
				<td class="menuadd_td1">리뷰작성</td>
				<td class="menuadd_td2">
					<textarea cols="30" rows="5" style="resize: none" name="re_content" id="re_content" readonly="readonly">${vo.re_content}</textarea>
				</td>
			</tr>
			<tr>
				<td class="menuadd_td1">사진</td>
				<td class="menuadd_td2">
				<img src="${cp }/resources/img/${vo.rp_photo}"><br>	
					<br>
					<img style="width: 200px; height: 200px; margin-top: 5px; display: none;" id="re_photo" src="">
				</td>
			</tr>
		</table>
		<input type="hidden" id="ui_id" name="ui_id" value="${requestScope.ui_id }">
		<input type="hidden" id="or_num" name="or_num" value="${or_num}" >
		<div class="menuadd_btn_div">
			<input type="submit" class="btn3" value="리뷰등록" onclick="review()">
		</div>
	</form:form>
</div>
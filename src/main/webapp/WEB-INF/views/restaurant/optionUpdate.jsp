<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" type="text/css" href="${cp }/resources/css/restaurant.css">
<style>
	/* .side_update_wrap {
		padding: 50px;
	    border: 3px solid #7bcfbb;
	    margin: auto;
	    width: auto;
	    margin-bottom: 50px;
	    margin-top: 50px;
	    padding: 50px;
	} */
	
	.side_update_title {
		text-align: center;
	}
	
	.side_update_title h2 {
		padding: 10px;
	}
	
	.side_update_table {
		margin: auto;
	}

	.side_update_td1 {
		background-color: #F2F2F2;
		text-align: center;
		padding: 10px;
		border-bottom: 1px solid #BDBDBD;
		font-weight: bold;
	}
	
	.side_update_td2 {
		padding: 5px;
		border-bottom: 1px solid #BDBDBD;
		font-weight: bold;
	}
	
	.side_update_btn_div {
		text-align: center;
		padding: 25px;
	}
</style>
<div class="side_update_wrap">
	<div class="side_update_title">
		<h2>사이드 메뉴 수정</h2>
	</div>
	<form:form id="sideUpdateForm" method="post">
		<table class="side_update_table">
			<tr>
				<td class="side_update_td1">옵션명</td>
				<td class="side_update_td2">
					<input type="text" id="fo_name" name="fo_name" placeholder="음식 이름" value="${requestScope.vo.fo_name }">
				</td>
			</tr>
			<tr>
				<td class="side_update_td1">가격</td>
				<td class="side_update_td2">
					<input type="text" id="fo_cost" name="fo_cost" value="${requestScope.vo.fo_cost }">
				</td>
			</tr>
		</table>
		<input type="hidden" id="food_num" name="food_num" value="${requestScope.vo.food_num }">
		<input type="hidden" id="fo_num" name="fo_num" value="${requestScope.vo.fo_num }">
		<div class="side_update_btn_div">
			<input type="submit" class="btn3" value="수정" onclick="sideUpdate()">
		</div>
	</form:form>
</div>
<script>
	function sideUpdate() {
	    window.opener.name = "optionEdit"; // 부모창의 이름 설정
	    document.getElementById("sideUpdateForm").target = "${cp}/restaurant/optionEdit"; // 타켓을 부모창으로 설정
	    document.getElementById("sideUpdateForm").action = "${cp}/restaurant/optionUpdate";
	    document.getElementById("sideUpdateForm").method = "post";
	    document.getElementById("sideUpdateForm").submit();
	    self.close();
	}	
</script>
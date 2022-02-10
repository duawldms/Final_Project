<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="${cp }/resources/css/restaurant.css">
<div class="option_edit_wrep">
	<!-- <div class="side_search">
		<input type="text" id="food_search" name="food_search" placeholder="음식명 검색">
		<input type="button" value="검색" onclick="foodSearch()"> 
	</div> -->
	<div class="option_edit_title">
		<h3>사이드 메뉴 수정</h3>
	</div>
	<div class="option_list">
		<table class="option_edit_table">
	 		<colgroup>
	 			<col width="25%">
	 			<col width="25%">
	 			<col width="25%">
	 			<col width="25%">
	 		</colgroup>
	 		<thead>
	 			<tr>
	 				<th scope="col">카테고리명</th>
	 				<th scope="col">식품명</th>
	 				<th scope="col">가격</th>
	 				<th scope="col">옵션</th>
	 			</tr>
	 		</thead>
	 		<tbody>
	 			<c:if test="${empty requestScope.list}">
		 			<tr>
		 				<td id="data_empty_td" colspan="4">데이터가 존재하지 않습니다.</td>
		 			</tr>
		 		</c:if>
		 		<c:forEach var="vo" items="${requestScope.list }">
		 			<tr>
		 				<td>
		 					<b>${vo.fo_category }</b>
		 				</td>
			 			<td>
			 				<b>${vo.fo_name }</b>
			 			</td>
			 			<td>
			 				<b>${vo.fo_cost }원</b>
			 			</td>
			 			<td>
			 				<div class="option_modify_div">
								<div class="option_modify" onclick="sidePopup(${vo.fo_num})">
									<b>수정</b>
								</div>
								<div class="option_modify" onclick="popup_open_btn(${vo.fo_num}, ${vo.food_num })">
									<b>삭제</b>
								</div>
				 			</div>
			 			</td>
		 			</tr>
				</c:forEach>
	 		</tbody>
	 	</table>
	</div>
</div>
<div id="my_modal">
	<div class="modal_top">
		<span id="modal_info">옵션 삭제</span>
		<span id="close" class="modal_close_btn">&times;</span>
	</div>
	<div class="modal_center">
		정말 삭제하시겠습니까?
	</div>
    <div class="modal_bottom">
	    <input type="button" value="예" class="agree_btn">
	    <input type="button" value="아니오" class="cancel_btn">
    </div>
</div>
<script>
	function sidePopup(fo_num) {
		var url = "${cp }/restaurant/optionUpdate?fo_num=" + fo_num;
		var name = "sideAdd";
		var option = "width = 300, height = 280, top = 300, left = 800";
		window.open(url, name, option);
	}

	function modal(id, fo_num, food_num) {
	    var zIndex = 9999;
	    var modal = document.getElementById(id);
	
	    // 모달 div 뒤에 흐릿한 배경
	    var bg = document.createElement('div');
	    bg.setStyle({
	        position: 'fixed',
	        zIndex: zIndex,
	        left: '0px',
	        top: '0px',
	        width: '100%',
	        height: '100%',
	        overflow: 'auto',
	        // 레이어 색 변경
	        backgroundColor: 'rgba(0,0,0,0.4)'
	    });
	    document.body.append(bg);
	
	    // 닫기 버튼 처리, 흐릿한 레이어와 모달 div 제거
	    modal.querySelector('.modal_close_btn').addEventListener('click', function() {
	        bg.remove();
	        modal.style.display = 'none';
	    });
	    
	    modal.querySelector('.cancel_btn').addEventListener('click', function() {
	        bg.remove();
	        modal.style.display = 'none';
	    });
	    
	    modal.querySelector('.agree_btn').addEventListener('click', function() {
	    	location.href = "${cp }/restaurant/optionDelete?fo_num=" + fo_num + "&food_num=" + food_num;
	    });
	    
	
	    modal.setStyle({
	        position: 'fixed',
	        display: 'block',
	        boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',
	
	        // 시꺼먼 레이어 보다 한칸 위에 보이기
	        zIndex: zIndex + 1,
	
	        // div center 정렬
	        top: '50%',
	        left: '50%',
	        transform: 'translate(-50%, -50%)',
	        msTransform: 'translate(-50%, -50%)',
	        webkitTransform: 'translate(-50%, -50%)'
	    });
	}
	
	// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
	Element.prototype.setStyle = function(styles) {
	    for (var k in styles) this.style[k] = styles[k];
	    return this;
	};
	
	function popup_open_btn(fo_num, food_num) {
		modal('my_modal', fo_num, food_num);
	}
</script>
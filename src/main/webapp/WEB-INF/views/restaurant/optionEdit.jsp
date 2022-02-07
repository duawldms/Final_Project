<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="${cp }/resources/css/restaurant.css">
<style>
	.option_edit_title {
		text-align: center;
		margin-top: 1%;
	}
	
	.food_edit_wrep {
		width: 90%;
		height: auto;
		overflow:hidden;
		margin: auto;
	}
	
	.option_info {
		width: 50%;
		float: left;
		padding: 20px;
	}
	
	.option_list {
		margin-top: 2%;
	}
	
	.option_modify_wrap {
		width: 50%;
		float: right;
	}
	
	.option_edit {
		width: 300px;
	    height: 90px;
	    margin-left: 5%;
	    margin-bottom: 2%;
	    float: left;
	    text-align: center;
	    border: skyblue solid 1px;
	} 
	
	.option_modify {
		display: flex;
    	align-items: center;
    	justify-content: center;
		height: 45px;
		cursor: pointer;
	}
	
	.option_modify:hover {
		background-color: #E0E0E0;
	}
	
</style>
<div class="food_edit_wrep">
	<!-- <div class="side_search">
		<input type="text" id="food_search" name="food_search" placeholder="음식명 검색">
		<input type="button" value="검색" onclick="foodSearch()"> 
	</div> -->
	<div class="option_edit_title">
		<h2>사이드 메뉴 수정</h2>
	</div>
	<div class="option_list">
		<c:forEach var="vo" items="${requestScope.list }">
			<div class="option_edit">
				<div class="option_info">
					<span>${vo.fo_name }</span>
					<br>
					<span>${vo.fo_cost } 원</span>
				</div>
				<div class="option_modify_wrap">
					<div class="option_modify" onclick="location.href='${cp }/restaurant/optionUpdate?fo_num=${vo.fo_num}'">
						<b>수정</b>
					</div>
					<div class="option_modify" onclick="${cp }/restaurant/optionDelete?fo_num=${vo.fo_num}&food_num=${vo.food_num}">
						<b>삭제</b>
					</div>
					<%-- <div class="option_modify" onclick="${cp}/">
						<b>품절</b>
					</div> --%>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
<div id="my_modal">
	<div class="modal_top">
		<span id="modal_info"></span>
		<span id="close" class="modal_close_btn">&times;</span>
	</div>
	<div class="modal_center">
	</div>
    <div class="modal_bottom">
	    <input type="button" value="예" class="agree_btn">
	    <input type="button" value="아니오" class="cancel_btn">
    </div>
</div>
<script>
	function modal(id, food_num, status) {
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
	    if (status == 2) {
		    modal.querySelector('.agree_btn').addEventListener('click', function() {
		    	location.href = '${cp}/restaurant/foodDelete?food_num=' + food_num;
		    });
	    } else if (status == 0 || status == 1) {
	    	modal.querySelector('.agree_btn').addEventListener('click', function() {
		    	location.href = '${cp}/restaurant/foodSoldOut?food_num=' + food_num + "&food_status=" + status;
		    });
	    }
	    
	
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
	
	function popup_open_btn(food_num, status) {
		let modal_center = document.querySelector(".modal_center");
		let modal_info = document.getElementById("modal_info");
		if (status == 0) {
			modal_info.innerText = "메뉴 품절";
			modal_center.innerText = "정말 품절 처리하시겠습니까?";
		} else if (status == 1) {
			modal_info.innerText = "품절 취소";
			modal_center.innerText = "품절을 취소하시겠습니까?";
		} else if (status == 2) {
			modal_info.innerText = "메뉴 삭제";
			modal_center.innerText = "정말 삭제하시겠습니까?";
		} 
		modal('my_modal', food_num, status);
	}
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="${cp }/resources/css/restaurant.css">
<div class="food_edit_wrap">
	<!-- <div class="side_search">
		<input type="text" id="food_search" name="food_search" placeholder="음식명 검색">
		<input type="button" value="검색" onclick="foodSearch()"> 
	</div> -->
	<div class="food_edit_title">
		<h2>메뉴 수정</h2>
	</div>
	<div class="list">
	 	<%-- <div class="food_list" style="cursor: pointer;" onclick="location.href='${cp}/restaurant/optionAdd?food_num=${vo.food_num}'"> --%>
	 	<table class="food_edit_table">
	 		<colgroup>
	 			<col width="20%">
	 			<col width="20%">
	 			<col width="20%">
	 			<col width="20%">
	 			<col width="20%">
	 		</colgroup>
	 		<thead>
	 			<tr>
	 				<th scope="col">이미지</th>
	 				<th scope="col">식품명</th>
	 				<th scope="col">가격</th>
	 				<th scope="col">설명</th>
	 				<th scope="col">옵션</th>
	 			</tr>
	 		</thead>
	 		<tbody>
	 			<c:if test="${empty requestScope.menuList}">
		 			<tr>
		 				<td id="data_empty_td" colspan="5">데이터가 존재하지 않습니다.</td>
		 			</tr>
		 		</c:if>
		 		<c:forEach var="vo" items="${requestScope.menuList }">
		 			<tr>
			 			<td>
			 				<div <c:if test="${vo.food_status == 1}">class="soldout_wrap"</c:if>>
				 				<c:if test="${vo.food_status == 1}">
					 				<div class="soldout_text">
					 					<h3>품절</h3>
					 				</div>
				 				</c:if>
				 				<div class="soldout_image">
									<img alt="음식 메뉴" id="food_edit_img" src="../resources/img/${vo.food_img }">
				 				</div>
		 					</div>
			 			</td>
			 			<td>
			 				<b>${vo.food_name }</b>
			 			</td>
			 			<td>
			 				<b>${vo.food_cost }원</b>
			 			</td>
			 			<td>
		 					<c:if test="${vo.food_info != null }">
		 						<b>${vo.food_info }</b>
		 					</c:if>
			 			</td>
			 			<td>
			 				<div class="food_modify">
								<div class="modify" onclick="location.href='${cp}/restaurant/foodUpdate?food_num=${vo.food_num }'">
									<b>메뉴 수정</b>
								</div>
								<div class="modify" onclick="location.href='${cp}/restaurant/optionEdit?food_num=${vo.food_num }'">
									<b>옵션 수정</b>
								</div>
								<div class="modify" onclick="popup_open_btn(${vo.food_num}, 2)">
									<b>삭제</b>
								</div>
								<div class="modify" onclick="popup_open_btn(${vo.food_num}, ${vo.food_status })">
									<c:choose>
										<c:when test="${vo.food_status == 1}">
											<b>품절 취소</b>
										</c:when>
										<c:otherwise>
											<b>품절</b>
										</c:otherwise>
									</c:choose>
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
		<span id="modal_info"></span>
		<span id="close" class="modal_close_btn">&times;</span>
	</div>
	<div class="modal_center">
	    <!-- 정말 삭제하시겠습니까? -->
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
	
	/* function foodSearch() {
		var xhr = null;
		let food_search = document.getElementById("food_search");
		url = "${cp}/restaurant/foodSearch?food_search=" + food_search.value;
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				let div = document.querySelector(".list");
				div.innerHTML = "";
				
				let data = xhr.responseText;
				let json = JSON.parse(data);
				let childDiv = document.createElement("div");
				for (let i = 0; i < json.length; i++) {
					div.innerHTML += "<div class='food_edit'>"
								+ "<div class='food_info'>"
								+ "<img id='food_img' src='../resources/img/" + json[i].food_img + "'><br>"
								+ "<b>" + json[i].food_name + "</b><br>"
								+ "<b>" + json[i].food_cost + "원</b></div>";
				}
				<div class="food_edit">
		 		<div class="food_info">
		 			<div <c:if test="${vo.food_status == 1}">class="soldout_wrap"</c:if>>
		 				<c:if test="${vo.food_status == 1}">
			 				<div class="soldout_text">
			 					<h3>품절</h3>
			 				</div>
		 				</c:if>
		 				<div class="soldout_image">
							<img alt="음식 메뉴" id="food_edit_img" src="../resources/img/${vo.food_img }">
		 				</div>
		 			</div>
					<div class="name_cost">
						<b>${vo.food_name }</b>
						<br>
						<b>${vo.food_cost }원</b>
					</div>
		 		</div>
		 		<div class="food_modify">
					<div class="modify" onclick="location.href='${cp}/restaurant/foodUpdate?food_num=${vo.food_num }'">
						<b>메뉴 수정</b>
					</div>
					<div class="modify" onclick="location.href='${cp}/restaurant/optionEdit?food_num=${vo.food_num }'">
						<b>옵션 수정</b>
					</div>
					<div class="modify" onclick="popup_open_btn(${vo.food_num}, 2)">
						<b>삭제</b>
					</div>
					<div class="modify" onclick="popup_open_btn(${vo.food_num}, ${vo.food_status })">
						<c:choose>
							<c:when test="${vo.food_status == 1}">
								<b>품절 취소</b>
							</c:when>
							<c:otherwise>
								<b>품절</b>
							</c:otherwise>
						</c:choose>
					</div>
		 		</div>
			</div>
			}	
		}
		xhr.open('get', url, true);
		xhr.send();
	} */
</script>
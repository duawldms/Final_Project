<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0b89a8c65d42f06fcb2f0dd87d520b67&libraries=services"></script>
<link rel="stylesheet" type="text/css" href="${cp }/resources/css/restaurant.css">
<c:set var="req" value="${requestScope }"/>
<div>
	<div class="seller_update_title">
		<h3>판매자 정보 수정</h3>
	</div>
	<form:form method="post" id="sellerUpdateForm" action="${cp }/restaurant/sellerUpdate" enctype="multipart/form-data" acceptCharset="utf-8">
		<table class="update_table">
			<tr style="border-top: 3px solid #49505796;">
				<td class="update_td1">매장명</td>
				<td class="update_td2">
					<input type="text" id="r_name" name="r_name" onblur="commonCheck(event)" value="${req.vo.r_name }">
					<span id="r_nameResult"></span>
				</td>
			</tr>
			<tr>
				<td class="update_td1">카테고리</td>
				<td class="update_td2">
					<input type="text" id="cg_name" name="cg_name" placeholder="예)족발/보쌈"
						 onblur="commonCheck(event)" value="${req.vo.cg_name }">
					<span id="cg_nameResult"></span>
				</td>
			</tr>
			<tr>
				<td class="update_td1">주소</td>
				<td class="update_td2">
					<div class="restaurant_addr">
						<div class="sample6_address_div">
							<input type="text" id="sample6_address" readonly="readonly" value="${req.addr1 }"> 
							<input type="button" id="addr_btn_2" onclick="sample6_execDaumPostcode()" value="주소 검색">
							<span id="sample6_addressResult"></span> 
						</div>
						<div class="sample6_detailAddress_div">
							<input type="text" id="sample6_detailAddress" placeholder="상세주소" onblur="commonCheck(event)" value="${req.addr2 }">
							<input type="hidden" id="r_addr" name="r_addr"> 
							<span id="sample6_detailAddressResult"></span>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td class="update_td1">최소 주문금액</td>
				<td class="update_td2">
					<input type="text" id="r_minCost" name="r_minCost" value="${req.vo.r_minCost}" onblur="commonCheck(event)">
					<span id="r_minCostResult"></span>
				</td>
			</tr>
			<tr>
				<td class="update_td1">배달비</td>
				<td class="update_td2">
					<input type="text" id="r_delCost" name="r_delCost" value="${req.vo.r_delCost}" onblur="commonCheck(event)">
					<span id="r_delCostResult"></span>
				</td>
			</tr>
			<tr>
				<td class="update_td1">이미지 등록</td>
				<td class="update_td2">
					<input type="file" id="r_img" name="file1" onchange="imageView(event)">
					<br>
					<img style="width: 200px; height: 200px; margin-top: 5px;" id="food_img" src="../resources/img/${req.vo.r_img }">
				</td>
			</tr>
			<tr style="border-bottom: 3px solid #49505796;">
				<td class="update_td1">매장 정보</td>
				<td class="update_td2">
					<textarea rows="5" cols="40" id="r_info" name="r_info" style="resize: none;" onblur="commonCheck(event)">${req.vo.r_info }</textarea>
					<span id="r_infoResult"></span>
				</td>
			</tr>
		</table>
		<input type="hidden" name="r_coordx" id="r_coordx" value="${req.vo.r_coordx }">
		<input type="hidden" name="r_coordy" id="r_coordy" value="${req.vo.r_coordy }">
		<div class="seller_update_btn_div">
			<input type="button" class="btn3" id="seller_update_btn" value="수정" onclick="sellerUpdate()">
		</div>
	</form:form>
</div>
<script>
	// 이미지 미리보기
	function imageView(e) {
		var reader = new FileReader();
		
		reader.onload = function(e) {
			let food_img = document.getElementById("food_img");
			food_img.src = e.target.result;
		}
		// readAsDataURL 파일을 데이터 URL로 만들기
		reader.readAsDataURL(e.target.files[0]);
	}
	// 이미지 미리보기 end
	
	// 모든 span 값 초기화
	function commonCheck(e) {
		if (e.target.value != "") {
			let id = e.target.id + "Result";
			let span = document.getElementById("" + id);
			span.innerText = "";
		}
	}
	// 모든 span 값 초기화 end

	function sellerUpdate() {
		let r_name = document.getElementById("r_name");
		let cg_name = document.getElementById("cg_name");
		let addr1 = document.getElementById("sample6_address");
		let addr2 = document.getElementById("sample6_detailAddress");
		let r_minCost = document.getElementById("r_minCost");
		let r_delCost = document.getElementById("r_delCost");
		let r_img = document.getElementById("r_img");
		let r_info = document.getElementById("r_info");
		
		if (r_name.value == '') {
			document.getElementById("r_nameResult").innerText = "매장명을 입력해 주세요.";
			r_name.focus();
			return;
		}
		if (cg_name.value == '') {
			document.getElementById("cg_nameResult").innerText = "카테고리를 입력해 주세요.";
			cg_name.focus();
			return;
		}
		if (addr1.value == '') {
			document.getElementById("sample6_addressResult").innerHTML = "주소를 입력해 주세요.<br>";
			addr1.focus();
			return;
		} else {
			document.getElementById("sample6_addressResult").innerText = "";
		}
		if (addr2.value == '') {
			document.getElementById("sample6_detailAddressResult").innerHTML = "상세 주소를 입력해 주세요.<br>";
			addr2.focus();
			return;
		} else {
			document.getElementById("sample6_detailAddressResult").innerText = "";
		}
		// 주소 + 상세 주소 합쳐서 보내기
		let r_addr = document.getElementById("r_addr");
		r_addr.value = addr1.value + ", " + addr2.value;

		if (r_minCost.value == '') {
			document.getElementById("r_minCostResult").innerText = "최소 주문 금액을 입력해 주세요.";
			r_minCost.focus();
			return;
		}
		if (r_delCost.value == '') {
			document.getElementById("r_delCostResult").innerText = "배달비를 입력해 주세요";
			r_delCost.focus();
			return;
		}
		if (r_info.value == '') {
			document.getElementById("r_infoResult").innerHTML = "<br>매장 소개를 입력해 주세요";
			r_info.focus();
			return;
		}
		
		document.getElementById("sellerUpdateForm").submit();
	}
	
	// 주소 api
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							//document.getElementById("sample6_extraAddress").value = extraAddr;

						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						//document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
						let addr1 = document.getElementById("sample6_address");
						
						// 주소로 좌표를 검색합니다
						var geocoder = new kakao.maps.services.Geocoder();
						geocoder.addressSearch(addr1.value, function(result, status) {
						
							// 정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {
								var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
								r_coordx.value = result[0].x;
								r_coordy.value = result[0].y;
							}
						});
					}
				}).open();
		
	}
	// 주소 api 끝
</script>
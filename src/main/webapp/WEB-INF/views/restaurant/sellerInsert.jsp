<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<div>
	<h1>판매자 가입</h1>
	<form:form method="post" id="restaurantForm" action="${cp }/sellerInsert" enctype="multipart/form-data" acceptCharset="utf-8">
		<input type="text" id="r_id" name="r_id" placeholder="아이디"
			onblur="idCheck()">
		<span id="r_idResult"></span>
		<br>
		<input type="password" id="r_pwd" name="r_pwd" placeholder="비밀번호"
			onblur="commonCheck(event)">
		<span id="r_pwdResult"></span>
		<br>
		<input type="password" id="r_pwd_check" name="r_pwd_check"
			placeholder="비밀번호 확인" onblur="pwdCheck()">
		<span id="r_pwd_checkResult"></span>
		<br>
		<input type="text" id="r_name" name="r_name" placeholder="매장명"
			onblur="commonCheck(event)">
		<span id="r_nameResult"></span>
		<br>
		<input type="text" id="cg_name" name="cg_name" placeholder="카테고리"
			onblur="commonCheck(event)">
		<span id="cg_nameResult"></span>
		<br>
		<div class="restaurant_addr">
			<input type="text" id="sample6_address" placeholder="주소"> 
			<input type="button" onclick="sample6_execDaumPostcode()" value="주소 검색">
			<br> 
			<span id="sample6_addressResult"></span> 
			<input type="text" id="sample6_detailAddress" placeholder="상세주소" onblur="commonCheck(event)">
			 <input type="hidden" id="r_addr" name="r_addr"> 
			 <span id="sample6_detailAddressResult"></span>
		</div>
		<input type="text" id="r_minCost" name="r_minCost"
			placeholder="최소 주문금액" onblur="commonCheck(event)">
		<span id="r_minCostResult"></span>
		<br>
		<input type="text" id="r_delCost" name="r_delCost" placeholder="배달비"
			onblur="commonCheck(event)">
		<span id="r_delCostResult"></span>
		<br>
		<input type="file" id="r_img" name="file1" onchange="imageView(event)">
		<br>
		<img style="width: 200px; height: 200px; display: none;" id="food_img" src="">
		<textarea rows="5" cols="40" id="r_info" name="r_info"
			placeholder="매장 소개" style="resize: none;" onblur="commonCheck(event)"></textarea>
		<span id="r_infoResult"></span>
		<br>
		<input type="button" value="가입" onclick="sellerInsert()">
	</form:form>
</div>
<script>
	var xhr = null;
	var idCheckFlag = false;
	// 아이디 중복 체크
	function idCheck() {
		let r_id = document.getElementById("r_id");
		let idCheckResult = document.getElementById("r_idResult");
		if (r_id.value == '') {
			idCheckResult.innerText = "아이디를 입력해 주세요.";
			return;
		}
		let url = "${cp}/restaurantIdCheck?id=" + r_id.value;
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				let data = xhr.responseText;
				let json = JSON.parse(data);

				if (json.result == 'success') {
					idCheckResult.innerText = "사용 가능한 아이디입니다.";
					idCheckFlag = true;
				} else {
					idCheckResult.innerText = "이미 사용중인 아이디입니다.";
					idCheckFlag = false;
				}
			}
		}
		xhr.open('get', url, true);
		xhr.send();
	}
	// 아이디 중복 체크 end
	
	// 이미지 미리보기
	function imageView(e) {
		var reader = new FileReader();
		
		reader.onload = function(e) {
			let food_img = document.getElementById("food_img");
			food_img.src = e.target.result;
			food_img.style.display = 'block';
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

	// 비밀번호 확인
	function pwdCheck() {
		let r_pwd = document.getElementById("r_pwd");
		let r_pwd_check = document.getElementById("r_pwd_check");
		let pwdCheckResult = document.getElementById("r_pwd_checkResult");
		if (r_pwd.value != r_pwd_check.value) {
			pwdCheckResult.innerText = "두 비밀번호가 일치하지 않습니다."
		} else if (r_pwd.value != '' && r_pwd_check.value != ''
				&& r_pwd.value === r_pwd_check.value) {
			pwdCheckResult.innerText = "두 비밀번호가 일치합니다.";
		}
	}
	// 비밀번호 확인 end

	// 가입
	function sellerInsert() {
		let r_id = document.getElementById("r_id");
		let r_pwd = document.getElementById("r_pwd");
		let r_pwd_check = document.getElementById("r_pwd_check");
		let r_name = document.getElementById("r_name");
		let cg_name = document.getElementById("cg_name");
		let addr1 = document.getElementById("sample6_address");
		let addr2 = document.getElementById("sample6_detailAddress");
		let r_minCost = document.getElementById("r_minCost");
		let r_delCost = document.getElementById("r_delCost");
		let r_img = document.getElementById("r_img");
		let r_info = document.getElementById("r_info");

		if (r_id.value == '') {
			document.getElementById("r_idResult").innerText = "아이디를 입력해 주세요.";
			r_id.focus();
			return;
		}
		if (r_pwd.value == '') {
			document.getElementById("r_pwdResult").innerText = "비밀번호를 입력해 주세요.";
			r_pwd.focus();
			return;
		}
		if (r_pwd_check.value == '') {
			document.getElementById("r_pwd_checkResult").innerText = "비밀번호를 확인해 주세요.";
			r_pwd_check.focus();
			return;
		}
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
		r_addr.value = addr1.value + " " + addr2.value;

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
		if (r_pwd.value != r_pwd_check.value) {
			alert("비밀번호를 확인해주세요.");
			r_pwd.focuse();
			return;
		}
		if (idCheckFlag == false) {
			alert("아이디를 확인해주세요.");
			r_id.focuse();
			return;
		}

		document.getElementById("restaurantForm").submit();
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
					}
				}).open();
	}
	// 주소 api 끝
</script>
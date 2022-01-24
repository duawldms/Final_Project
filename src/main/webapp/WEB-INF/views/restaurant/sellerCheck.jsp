<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/project/resources/js/jquery-3.6.0.js"></script>
</head>
<body>
	<label>전화번호</label>
	<br>
	<input type="text" name="r_phone">
	<br>
	<label>사업자 번호</label>
	<br>
	<input type="text" name="" id="b_no" maxlength="12">
	<br>
	<input type="button" value="회원가입" id="checkBtn">
	<script type="text/javascript">
		$("#checkBtn").on("click", function() {
			let no = $("#b_no").val();
			// 사업자번호 - 제거
			let b_no= no.replaceAll('-', '');
			
			var servicekey = "bGfLgGCp3cWfKWl4%2FmMmE9CQxkSj9Ciq04PM8po8PZ%2BvfANEjZSFPR7ZVMEvEK%2FCnx2%2BCjldjkqcDdMJNQvWXw%3D%3D&returnType=XML";
			
			var data = {
		    	"b_no": b_no // 사업자번호 "xxxxxxx" 로 조회 시,
			}; 
			
			$.ajax({
				url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=" + servicekey + "&returnType=XML",  // serviceKey 값을 xxxxxx에 입력
				type: "POST",
				data: JSON.stringify(data), // json 을 string으로 변환하여 전송
				dataType: "JSON",
				contentType: "application/json",
				accept: "application/json",
				success: function(result) {
				console.log(result);
				},
				error: function(result) {
					console.log(result.responseText); //responseText의 에러메세지 확인
				}
			});
		});
	</script>
</body>
</html>
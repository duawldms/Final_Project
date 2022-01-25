<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/project/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(function(){
		$("#searchbtn").click(function(){
			let ui_name=$("input[name='ui_name']").val();
			let ui_phone=$("input[name='ui_phone']").val();
			$.ajax({
				url:'/project/searchid?ui_name=' + ui_name + '&ui_phone=' + ui_phone,
				dataType:'json',
				success:function(data){
					if(data.result==true){
						$("#result").html("아이디:" + data.ui_id);
					}else{
						$("#result").html("해당 정보를 가진 아이디를 찾을 수 없습니다.");
					}
				}
			});
		});
	});


</script>
</head>
<body>

<h2>회원 아이디 찾기</h2>
	<form action="${cp }/serchid" method="post">
		이름<br>
		<input type="text" name="ui_name"><br>
		핸드폰 번호<br>
		<input type="text" name="ui_phone"><br>
		<input type="button" value="조회" id="searchbtn"><br>
		<span id="result"></span>
		<span></span>	
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<style>
* {
	font-size: 16x;
	font-family: consolas, sans-serif;
}

h1 {
	text-align: center;
	
}

p {
	text-align: center;
	font-size: 16px;
}
#insert1{
	margin-top:130px;
}
#form{
	text-align:center;
}

.input-group {
    margin-top: 1em;
    margin-bottom: 1em;
}

 .col-sm-3{
 margin-left:430px;
 }

.login-box {
    line-height: 2.3em;
    font-size: 1em;
    color: #aaa;
    margin-top: 1em;
    margin-bottom: 1em;
    padding-top: 0.5em;
    padding-bottom: 0.5em;
}



</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css"
	rel="stylesheet">
<script type="text/javascript">
	function doOpenCheck(chk) {
		var obj = document.getElementsByName("admin_lv");
		for (var i = 0; i < obj.length; i++) {
			if (obj[i] != chk) {
				obj[i].checked = false;
			}
		}
	}
</script>

</head>
<body>
	<div class="container" id="insert1">
	<h1 style="color:#337ab7;">관리자생성관리</h1>
	<br>
	<div id="form">
		<div class="row">
			<div class="col-sm-3">
				<div class="login-box well">
					<form:form method="post" action="${cp }/insertadmin">
						<legend>관리자생성</legend>
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-user" style="color:#9CEBFF;"></i></span>
								<input type="text" id="admin_id" name="admin_id"
									placeholder="아이디 입력하세요" class="form-control" />
							</div>
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-lock" style="color:#9CEBFF;"></i></span>
								<input type="password" id="admin_pwd" name="admin_pwd"
									placeholder="비밀번호 입력하세요" class="form-control" />
							</div>
							<div class="input-group">
								<i class="fa fa-heart" style="color:red; margin-left:51px;"></i>&nbsp;
									<label><input type="checkbox" name="admin_lv" value="1"
										onclick="doOpenCheck(this);">1</label> &nbsp; <label><input
										type="checkbox" name="admin_lv" value="2"
										onclick="doOpenCheck(this);">2</label>
						</div>
						<button type="submit" id="login-submit" class="btn btn-default btn-block"/>계정 생성</button>
						<input type="button" onclick="location.href='${cp }/admin/adminpage'" class="btn btn-default btn-block" value="관리자 메인으로 돌아가기"> 
				</form:form>
			</div>
			</div>
			</div>
			</div>
</div>
			<br>
			<div class="elementor-widget-container">
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<p>
						[${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}님
						반갑습니다:)] <a href="#"
							onclick="document.getElementById('admin_logout').submit();">로그아웃</a>
						| 쿠팡요기이츠 메인화면으로 돌아가시려면 <strong><a href="${cp }/"
							style="color: #D811FF">여기</a></strong>를 클릭해 주세요!
					</p>
					<form:form id="admin_logout" method="post" action="${cp }/logout">
					</form:form>
				</sec:authorize>
			</div>
	</body>
			</html>
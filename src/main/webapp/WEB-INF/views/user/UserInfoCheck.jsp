<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    

<script type="text/javascript">
	$(function(){
		$("#btn").click(function(){
			let ui_id=$("input[name='ui_id']").val();
	  		let ui_pwd=$("input[name='ui_pwd']").val();
			location.href="/project/userinfo?ui_id=" + ui_id + "&ui_pwd=" + ui_pwd;
		});
	});
</script>

<div>
	회원 비밀번호를 한번 더 입력 해 주세요.
	<input type="hidden" name="ui_id" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">
	<input type="password" name="ui_pwd"><br>
	<input type="button" value="확인" id="btn">
</div>

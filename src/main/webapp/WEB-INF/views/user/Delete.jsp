<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<script>
$(function(){
	$("form").submit(function(){
		let ui_pwd=$("input[name='ui_pwd']").val();
		if(ui_pwd==''){
			alert("비밀번호를 입력해 주세요");
			return false;  
		}
	});
});

</script>
<form:form method="post" action="${cp }/delete">
<h2>회원 탈퇴하기</h2>
	아이디<br>
	<input type="text" name="ui_id" value="${vo.ui_id }" readonly="readonly"><br>
	이름<br>
	<input type="text" name="ui_name" value="${vo.ui_name }" readonly="readonly" ><br>
	이메일<br>
	<input type="text" name="ui_email" value="${vo.ui_email }" readonly="readonly"><br>
	비밀번호<br>    
	<input type="password" name="ui_pwd" id="ui_pwd" placeholder="비밀번호를 입력해 주세요"><br>
	<span>탈퇴하시면 모든 정보가 사라집니다.</span><br>
	<input type="submit" value="탈퇴하기">
</form:form>
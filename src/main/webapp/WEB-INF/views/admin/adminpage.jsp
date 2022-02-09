<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
</head>
<body>
	<div class="elementor-widget-container" >
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<span>[${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}님
				반갑습니다.]</span>
			<span class="elementor-icon-list-text"><a href="#"
				onclick="document.getElementById('admin_logout').submit();">로그아웃</a></span>
			<form:form id="admin_logout" method="post" action="${cp }/logout">
			</form:form>
		</sec:authorize>
	</div>
	<div class="middle">
		<h1>관리자 페이지</h1>
		<hr color=black>
		<p>배달요기이츠</p>
	</div>
	<div class="container">
		<div class="panel-group" id="accordion">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapse1"><strong>관리자</strong></a>
					</h4>
				</div>
				<div id="collapse1" class="panel-collapse collapse in">
					<div class="panel-body">
						<c:choose>
							<c:when test="${n==1 }">
								<li><a href="${cp }/insertadmin">관리자 생성 관리</a></li>
							</c:when>
							<c:otherwise>
								<a>1레벨 관리자만 접근 가능 합니다</a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapse2"><strong>사용자</strong></a>
					</h4>
				</div>
				<div id="collapse2" class="panel-collapse collapse">
					<div class="panel-body">
						<ul>
							<li><a href="${cp }/admin/reviewchk/list">리뷰 관리</a></li>
							<li><a href="${cp }/admin/refund/list">환불 관리</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapse3"><strong>판매자</strong></a>
					</h4>
				</div>
				<div id="collapse3" class="panel-collapse collapse">
					<div class="panel-body">
						<ul>
							<li><a href="${cp }/admin/permission/list">신규판매자 가입승인 관리</a></li>
							<li><a href="${cp }/admin/discount/list">매출우수매장 수수료감면 관리</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<p>쿠팡요기이츠 메인화면으로 돌아가시려면 <strong><a href="${cp }/">여기</a></strong>를 클릭해 주세요!</p>
</body>
</html>
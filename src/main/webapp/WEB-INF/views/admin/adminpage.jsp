<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<style>
	h1 { text-align: center; }
    p { text-align: center; }
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
</head>
<body>
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
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse1"><strong>관리자</strong></a>
        </h4>
      </div>
      <div id="collapse1" class="panel-collapse collapse in">
        <div class="panel-body">
		<ul>
			<li>관리자 생성 관리</li>
		</ul>
		</div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse2"><strong>사용자</strong></a>
        </h4>
      </div>
      <div id="collapse2" class="panel-collapse collapse">
        <div class="panel-body">
        <ul>
			<li><a href="${cp }/admin/reviewchk/list">리뷰 관리</a></li>
            <li><a href="${cp }/admin/complain/list">컴플레인 관리</a></li>
		</ul>
        </div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse3"><strong>판매자</strong></a>
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
</body>
</html>
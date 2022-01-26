<style>
	h1{text-align:center}
    ul {width: 360px; margin-left: auto; margin-right: auto; }
	p{text-align:center}
</style>
<div class="page-header">
	<h1>관리자 페이지</h1>
</div>
<ul class="nav nav-pills">
	<li><a href="/admin/reviewchk">리뷰 관리</a>
	<li><a href="/admin/badaccount">불량계정 관리</a>
	<li><a href="/admin/complain">컴플레이션 관리</a>
</ul>
<br>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>detail.jsp</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
 // $(document).ready(()=>{
 	// $("#list").click(()=>{
 	//	 location.href="<c:url value='/list.do'/>";
 	// });
 // });
  </script>
</head>
<body>
<div class="container">
  <div class="panel panel-default">
    <div class="panel-heading"></div>
    <div class="panel-body">
         <div class="form-group">
		    <label>주문번호</label>
		    <input type="text" class="form-control" id="idx" name="idx" value="${vo.or_num}" readonly="readonly">
		 </div> 
		  <div class="form-group">
		    <label>내용</label>
		    <textarea class="form-control" rows="3" name="contents" readonly="readonly">${vo.re_content}</textarea>
		  </div>
		  
		  <button id="list" class="btn btn-info">List</button>
    </div>
    <div class="panel-footer"></div>
  </div>
</div>
<p>쿠팡요기이츠 관리자페이지 입니다</p>
</body>
</html>
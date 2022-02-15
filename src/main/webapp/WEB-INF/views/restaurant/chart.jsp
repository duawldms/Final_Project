<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
select::-ms-expand { 
	display: none;
}
.select {
  -o-appearance: none;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
}
.select {
  { ... }
  width: 150px;
  height: 35px;
  background-size: 20px;
  padding: 5px 30px 5px 10px;
  border-radius: 4px;
  outline: 0 none;
}
.select option {
  background: black;
  color: #fff;
  padding: 3px 0;
}
#wrap {
	text-align: center;
}
#saleslist {
	margin: auto;
	font-family: fantasy;
	font-size: 18px;
	width: 1200px;
	border-collapse: collapse;
	text-align: center;
}
</style>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

google.charts.load('current', {packages: ['corechart', 'bar']});



	$(document).ready(function(){
		//ajaxData();
		$('#addBtn').hide();
		
		var now = new Date();	// 현재 날짜 및 시간
		var year = now.getFullYear();	// 연도
		$("year").val(year);
	});
	
		
		function frawChart2(sales_data){
			
			console.log(sales_data);
	        var data = new google.visualization.DataTable();
	        
	        data.addColumn("string", "일");
	        data.addColumn("number", "매출액");
	        for (var i = 0; i < sales_data.length; i++) {
	        	//console.log(sales_data[i].DAY_SALES);
	        	//console.log(sales_data[i].SUM);
	        	var sales_day = sales_data[i].sales_day;
	        	var sales_month = sales_data[i].sales_month;
	        	var sales_year = sales_data[i].sales_year;
	        	//console.log(sales_day);
		        data.addRows([[sales_day, sales_data[i].or_totalcost]])

	        }

	        // Set chart options
	       var chartOptions = {
    scales: {
        xAxes: [
            {
                ticks: {
                    beginAtZero: true
                },
                scaleLabel: {
                    display: true,
                    labelString: "x축 텍스트",
                    fontColor: "red"
                },
                stacked: true
            }
        ],
        yAxes: [
            {
                scaleLabel: {
                    display: true,
                    labelString: "y축 텍스트",
                    fontColor: "green"
                },
                ticks: {
                    // max: 7000,
                    min: 0,
                    // stepSize: 1000,
                    autoSkip: true
                },
                stacked: true
            }
        ]
    },
    responsive: true
};

	        // Instantiate and draw our chart, passing in some options.
	        var chart = new google.visualization.ColumnChart(document.getElementById('chart1'));
	        chart.draw(data);
	        
	        
	}
		
		function ajax_sales() {
			var gbn = $("#gbn").val();
			var s_date = $("#s_date").val();
			var e_date = $("#e_date").val();
			if(gbn =="day"){
				if(s_date==""){
					alert('시작일자를 입력해주세요')
					$("#s_date").focus();
				}else if(e_date==""){
					alert('종료일자를 입력해주세요')
					$("#e_date").focus();
				}
				
			}else if(gbn =="month"){
				if(s_date==""){
					alert('시작일자를 입력해주세요')
					$("#s_data").focus();
				}else if(e_date==""){
					alert('종료일자를 입력해주세요')
					$("#e_date").focus();
				}
			}else if(gbn =="year"){
				if(s_date==""){
					alert('시작일자를 입력해주세요')
					$("#s_data").focus();
				}else if(e_date==""){
					alert('종료일자를 입력해주세요')
					$("#e_date").focus();
				}
			}
			
			$.ajax({
				url:"${cp}/restaurant/sales_chart",
				data:{
					gbn : gbn,
					s_date:s_date,
					e_date:e_date
				},
				dataType:"json",
				success:function(data){
					frawChart2(data.list);


				}
			});
		}
		function ajax_excel(){
			var gbn = $("#gbn").val();
			var s_date = $("#s_date").val();
			var e_date = $("#e_date").val();
			$.ajax({
				url:"${cp}/restaurant/excel",
				data:{
					gbn : gbn,
					s_date:s_date,
					e_date:e_date
				},
				dataType:"json",
				success:function(data){


				}
			});
		}
    
</script>	
</head>

<body>
<div class="wrap">
	

			<div id="chart1"></div>
			<div>
			 <form action="${cp }/restaurant/excel?r_id=${vo.r_id}" method="get">
			조회 : 
			<select id="gbn" name="gbn" class="select">
				<option disabled selected>선택</option>
				<option value="day">일</option>
				<option value="month">월</option>
				<option value="year">년</option>
			</select>
<!-- 		<form id="excelForm" name="excelForm" method="post" action="${cp }/restaurant/excel?r_id=${vo.r_id}">
			<input type="text" name="fileName">
			<input type="submit" value="xlsx파일로 받기">
			</form>
-->			
 
      	<input type="date" id="s_date" name="s_date"> ~ <input type="date" id="e_date" name="e_date">
           <input type="submit" value="다운로드" >
           
			<input type="button" value="검색" onclick="ajax_sales()">
            <!-- <button type="button" onclick="ajax_excel()">Excel</button>-->
        </form>
    </div>

		
			
</div>	
</body>
</html>

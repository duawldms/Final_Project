<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    
</script>	
</head>

<body>
<div class="wrap">
	<form:form action="${cp }/restaurant/chart?r_id=${vo.r_id}" method="get" id="selectChart" enctype="multipart/form-data" acceptCharset="utf-8">
	</form:form>
</div>	
			<div id="chart1"></div>
			조회 : 
			<select id="gbn">
				<option value="day">일</option>
				<option value="month">월</option>
				<option value="year">년</option>
			</select>
			
			<input type="date" id="s_date"> ~ <input type="date" id="e_date">
			<input type="button" value="검색" onclick="ajax_sales()">
</body>
</html>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#wrap {
	text-align: center;
	width: 70%;
    height: 750px;
/*     margin: auto; */
}

#selectBox {
	margin: auto;
	font-family: fantasy;
	font-size: 18px;
	width: 1200px;
	border-collapse: collapse;
	text-align: center;
}

select::-ms-expand {
	display: none;
}

.select {
	-o-appearance: none;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
}

.select { { ...	}
width:150px; 
height: 35px;  
background-size:20px;  
padding:5px 30px 5px 10px;  
border-radius: 4px;  
outline : 0 
none;

}
.select option {
	background: #7bcfbb;
	color: #F6416C;
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

input[type="date"] {
	position: relative;
	min-height: 30px padding: 10px 12px border: 1px solid #ddd;
	font-size: 20px;
}
</style>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

google.charts.load('current', {packages: ['corechart', 'bar']});

	$(document).ready(function() {
		//ajaxData();
		$('#addBtn').hide();

		var now = new Date(); // 현재 날짜 및 시간
		var year = now.getFullYear(); // 연도
		$("year").val(year);
	});

	function frawChart2(sales_data) {

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
			data.addRows([ [ sales_day, sales_data[i].or_totalcost ] ])

		}

		// Set chart options
		var chartOptions = {
			scales : {
				xAxes : [ {
					ticks : {
						beginAtZero : true
					},
					scaleLabel : {
						display : true,
						labelString : "x축 텍스트",
						fontColor : "red"
					},
					stacked : true
				} ],
				yAxes : [ {
					scaleLabel : {
						display : true,
						labelString : "y축 텍스트",
						fontColor : "green"
					},
					ticks : {
						// max: 7000,
						min : 0,
						// stepSize: 1000,
						autoSkip : true
					},
					stacked : true
				} ]
			},
			responsive : true
		};

		// Instantiate and draw our chart, passing in some options.
		var chart = new google.visualization.ColumnChart(document
				.getElementById('chart1'));
		chart.draw(data);

	}

	function ajax_sales() {
		var gbn = $("#gbn").val();
		var s_date = $("#s_date").val();
		var e_date = $("#e_date").val();
		if (gbn == "day") {
			if (s_date == "") {
				alert('시작일자를 입력해주세요')
				$("#s_date").focus();
			} else if (e_date == "") {
				alert('종료일자를 입력해주세요')
				$("#e_date").focus();
			}

		} else if (gbn == "month") {
			if (s_date == "") {
				alert('시작일자를 입력해주세요')
				$("#s_data").focus();
			} else if (e_date == "") {
				alert('종료일자를 입력해주세요')
				$("#e_date").focus();
			}
		} else if (gbn == "year") {
			if (s_date == "") {
				alert('시작일자를 입력해주세요')
				$("#s_data").focus();
			} else if (e_date == "") {
				alert('종료일자를 입력해주세요')
				$("#e_date").focus();
			}
		}

		$.ajax({
			url : "${cp}/restaurant/sales_chart",
			data : {
				gbn : gbn,
				s_date : s_date,
				e_date : e_date
			},
			dataType : "json",
			success : function(data) {
				frawChart2(data.list);

			}
		});
	}
	function ajax_excel() {
		var gbn = $("#gbn").val();
		var s_date = $("#s_date").val();
		var e_date = $("#e_date").val();
		$.ajax({
			url : "${cp}/restaurant/excel",
			data : {
				gbn : gbn,
				s_date : s_date,
				e_date : e_date
			},
			dataType : "json",
			success : function(data) {

			}
		});
	}
</script>
</head>

<body>
	<div class="wrap" id="wrap">


		<div id="chart1"></div>
		<div>
			<form action="${cp }/restaurant/excel?r_id=${vo.r_id}" method="get" id="selectBox">
				<h1 style="text-align: center; padding-bottom: 50px; color: #7bcfbb">${vo.r_id }님의 매출을 확인하세요</h1>

				<select id="gbn" name="gbn" class="select" style="color: #F6416C" style="CURSOR:hand;" title="원하시는 일/월/년 을 선택해주세요">
					<option disabled selected>일별/월별/년도 선택해주세요</option>
					<option value="day">일별</option>
					<option value="month">월별</option>
					<option value="year">년도별</option>
				</select><br><br>
				<!-- 		<form id="excelForm" name="excelForm" method="post" action="${cp }/restaurant/excel?r_id=${vo.r_id}">
			<input type="text" name="fileName">
			<input type="submit" value="xlsx파일로 받기">
			</form>
-->

				<input type="date" id="s_date" name="s_date" style="color: #F6416C" style="CURSOR:hand;" title="원하시는 시작날짜를 선택하세요"> ~ <input type="date" id="e_date" name="e_date" style="color: #F6416C" style="CURSOR:hand;" title="원하시는 마지막날짜 선택하세요">
				<input type="button" value="검색" onclick="ajax_sales()" class="btn btn-success" style="CURSOR:hand;" title="검색을 눌러주세요"><br><br>
				<h5 style="color: #7bcfbb">매출액 엑셀파일 다운로드</h5>
				<input type="submit" value="다운로드" class="btn btn-danger" style="CURSOR:hand;" title="지금 보시는 그래프를 엑셀파일로 다운로드"><br>


				<!-- <button type="button" onclick="ajax_excel()">Excel</button>-->
			</form>
		</div>



	</div>
</body>
</html>

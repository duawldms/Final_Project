<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<style type="text/css">   
	#wrap{
		margin:0px; 
		padding: 0px; 
		text-align: center;
		margin-top: 50px;
	}
	#saller1{
	float:left;
	width:330px;    
	height:30px;                    
	}     
	.seller-my {
			display: table;
		    margin: 0 auto;
		    width: 100%;
		    height: 720px;
		    text-align: center;
		}
	
	.seller-info {     
    	height: 100%;
    	width : 500px;          
	    display: table-cell;   
	      
	}
	
	.seller-edit {
		border: 1px solid #D8D8D8;
	    height: 25%;
	    width: 25%;
	    display: inline-block;
	    margin: 5px;
	    cursor: pointer;
	    padding: 25px;
	}
	
	.seller-edit:hover {
		background-color: #E0E0E0;
	}
	
	.seller-edit img {     
		width: 100px;
		height: 100px;
		max-width:100%; max-height:100%;
            vertical-align:middle;
	}
	
	</style>

<div id="wrap">
	<div class="seller-my">
	<div class="seller-info">   
		<div class="seller-edit" onclick="location.href='${cp }/userdelivery'"><img src="${cp }/resources/img/foodall.png"><br>배달내역</div>	
				<div class="seller-edit" onclick="location.href='${cp }/userreview'"><img src="${cp }/resources/img/shop.png"><br>리뷰관리</div>	<br>       
		<div class="seller-edit" onclick="location.href='${cp }/userinfocheck'"><img src="${cp }/resources/img/password.png"><br>기본정보</div>      	
		<div class="seller-edit" onclick="location.href='${cp }/userdelete'"><img src="${cp }/resources/img/deleteimg.png"><br>회원탈퇴</div>	

		</div>
	</div> 
</div>


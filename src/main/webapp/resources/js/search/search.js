let category="";
function changeAddr(selected,category){
	$.ajax({
		url:"${cp}/user/addrDetail?ua_nickname="+selected,
		dataType:"json",
		success:function(data){
			$("#place").prop("value",data.vo.ua_addr);
			let coordx="";
			let coordy="";
			var geocoder = new kakao.maps.services.Geocoder();
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(data.vo.ua_addr, function(result, status) {
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
			    	 coordx=result[0].x;
			    	 coordy=result[0].y;
			    	 $.ajax({
							url:"${cp}/user/search",
							data:{
								pageNum:"${pu.pageNum}",
								cg_name:category,
								field:"${field}",
								keyword:"${keyword}",
								user_coordx:coordx,
								user_coordy:coordy
							},
							dataType:"json",
							success:function(data){
								console.log(data); // 데이터 받아오는지 체크
								let seller="";
								$("#restau").empty();
								$("#paging").empty();
								for(let i=0;i<data.listvo.length;i++){
									seller+="<div class='container restaurant'>";
									seller+="<h5>"+data.listvo[i].r_name+"</h5>";
									seller+="<img src='${cp}/resources/img/"+data.listvo[i].r_img+"' class='resimg'>";
									seller+="</div>";
								}
								$("#restau").append(seller);
								let page="";
								let keyword="";
									//$("#keyword").val();
								console.log("count:"+data.pu.totalPageCount);
								for(let i=1;i<=data.pu.totalPageCount;i++){
									if(i==1){
										page="<a href='javascript:paging("+i+","+data.user_coordx+","+data.user_coordy+")'><span style='color:blue'>"
												+i+"</span></a>&nbsp";
									}else{
										page="<a href='javascript:paging("+i+","+data.user_coordx+","+data.user_coordy+")'><span style='color:blue'>"
												+i+"</span></a>&nbsp";
									}
									console.log("page:"+keyword);
									$("#paging").append(page);
								}
							}
						});
			     }
			});
		}
	});
}
function paging(pageNum,category,user_coordx,user_coordy){
	$.ajax({
		url:"${cp}/user/search",
		data:{
			pageNum:pageNum,
			//keyword:keyword,
			category:category,
			user_coordx:user_coordx,
			user_coordy:user_coordy
		},
		dataType:"json",
		success:function(data){
			console.log(data); // 데이터 받아오는지 체크
			let seller="";
			$("#restau").empty();
			$("#paging").empty();
			for(let i=0;i<data.listvo.length;i++){
				seller+="<div class='container restaurant'>";
				seller+="<h5>"+data.listvo[i].r_name+"</h5>";
				seller+="<img src='${cp}/resources/img/"+data.listvo[i].r_img+"' class='resimg'>";
				seller+="</div>";
			}
			$("#restau").append(seller);
			let page="";
			let keyword="";
				//$("#keyword").val();
			console.log("count:"+data.pu.totalPageCount);
			for(let i=1;i<=data.pu.totalPageCount;i++){
				if(pageNum==i){
					page="<a href='javascript:paging("+i+","+data.user_coordx+","+data.user_coordy+")'><span style='color:blue'>"
					+i+"</span></a>&nbsp";
				}else{
					page="<a href='javascript:paging("+i+","+data.user_coordx+","+data.user_coordy+")'><span style='color:blue'>"
					+i+"</span></a>&nbsp";
				}
				console.log("page:"+page);
				$("#paging").append(page);
			}
		}
	});
}
var themeObj = {
	   bgColor: "#162525", //바탕 배경색
	   searchBgColor: "#162525", //검색창 배경색
	   contentBgColor: "#162525", //본문 배경색(검색결과,결과없음,첫화면,검색 서제스트)
	   pageBgColor: "#162525", //페이지 배경색
	   textColor: "#FFFFFF", //기본 글자색
	   queryTextColor: "#FFFFFF", //검색창 글자색
	   //postcodeTextColor: "", //우편번호 글자색
	   //emphTextColor: "", //강조 글자색
	   outlineColor: "#444444" //테두리 
	};
window.onload = function(){
	category=$("category").val();
	console.log(category);
	let detail=document.getElementById("placeDetail");
	$.ajax({
		url:"${cp}/user/addrDetail?ua_nickname=기본배송지",
		
		dataType:"json",
		success:function(data){
			$("#place").prop("value",data.vo.ua_addr);
			let coordx="";
			let coordy="";
			var geocoder = new kakao.maps.services.Geocoder();
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(data.vo.ua_addr, function(result, status) {
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
			    	 coordx=result[0].x;
			    	 coordy=result[0].y;
			    	 $.ajax({
							url:"${cp}/user/search",
							data:{
								pageNum:"${pu.pageNum}",
								field:"${field}",
								keyword:"${keyword}",
								cg_name:category,
								user_coordx:coordx,
								user_coordy:coordy
							},
							dataType:"json",
							success:function(data){
								console.log(data);
								let seller="";
								$("#restau").empty();
								$("#paging").empty();
								for(let i=0;i<data.listvo.length;i++){
									seller+="<div class='container restaurant'>";
									seller+="<h5>"+data.listvo[i].r_name+"</h5>";
									seller+="<img src='${cp}/resources/img/"+data.listvo[i].r_img+"' class='resimg'>";
									seller+="</div>";
								}
								let page="";
								let keyword="";
									//$("#keyword").val();
								$("#restau").append(seller);
								for(let i=1;i<=data.pu.totalPageCount;i++){
									if(i==1){
										page="<a href='javascript:paging("+i+","+data.user_coordx+","+data.user_coordy+")'><span style='color:blue'>"
												+i+"</span></a>&nbsp";
									}else{
										page="<a href='javascript:paging("+i+","+data.user_coordx+","+data.user_coordy+")'><span style='color:blue'>"
												+i+"</span></a>&nbsp";
									}
									console.log("page:"+page);
									$("#paging").append(page);
								}
							}
						});
			     }
			});
		}
	});
	if(detail!=null){
		detail.disabled=true;
		document.getElementById("addr-addon").addEventListener('click',function(){
			new daum.Postcode({
		        oncomplete: function(data) {
		    	   	document.getElementById("place").value = data.address; // 주소 넣기
		    	   	detail.disabled=false;
		    	   	detail.placeholder = "상세주소를 입력하세요";
		    	   	detail.focus();
		        },
		        theme:themeObj
			 }).open({
				q:document.getElementById("place").value
			 });
		});
	}
	
}
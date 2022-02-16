<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배달요기이츠</title>
<head>
<link rel='stylesheet' id='elementor-frontend-css' 
href='https://www.coupangeats.com/wp-content/plugins/elementor/assets/css/frontend-lite.min.css?ver=3.5.3' type='text/css' media='all' />
<link rel="stylesheet" type="text/css" href="${cp }/resources/css/common.css?ver=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="${cp }/resources/js/jquery-3.6.0.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.2/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<link rel="stylesheet" type="text/css" href="${cp }/resources/css/layout.css">
<link rel='stylesheet' id='rocket-font-css'
	href='//cdn.jsdelivr.net/font-notosans-kr/1.0.0-v1004/NotoSansKR-2350.css?ver=5.8.2' type='text/css' media='all' />
	
<body>
<body class="home page-template page-template-elementor_header_footer page page-id-308 wp-custom-logo ehf-header ehf-footer ehf-template-neve ehf-stylesheet-neve  nv-blog-grid nv-sidebar-full-width menu_sidebar_slide_left elementor-default elementor-template-full-width elementor-kit-31 elementor-page elementor-page-308"
	id="neve_body">
	<div class="wrapper">
		<header class="header" role="banner" next-page-hide>
			<div data-elementor-type="wp-post" data-elementor-id="919"
				class="elementor elementor-919" data-elementor-settings="[]">
				<div class="elementor-section-wrap">
					<section
						class="elementor-section elementor-top-section elementor-element elementor-element-70841d41 elementor-section-stretched elementor-reverse-mobile elementor-section-boxed elementor-section-height-default elementor-section-height-default"
						data-id="70841d41" data-element_type="section"
						data-settings="{&quot;stretch_section&quot;:&quot;section-stretched&quot;,&quot;background_background&quot;:&quot;classic&quot;}">
						<div class="elementor-container elementor-column-gap-default">
							<div
								class="elementor-column elementor-col-33 elementor-top-column elementor-element elementor-element-11e3cfa"
								data-id="11e3cfa" data-element_type="column">
								<div class="elementor-widget-wrap elementor-element-populated">

								</div>
							</div>
							<div
								class="elementor-column elementor-col-33 elementor-top-column elementor-element elementor-element-77a26d79"
								data-id="77a26d79" data-element_type="column">
								<div class="elementor-widget-wrap elementor-element-populated">
									<div
										class="elementor-element elementor-element-792c50bd elementor-widget elementor-widget-site-logo"
										data-id="792c50bd" data-element_type="widget"
										data-settings="{&quot;width&quot;:{&quot;unit&quot;:&quot;px&quot;,&quot;size&quot;:163,&quot;sizes&quot;:[]},&quot;caption_space&quot;:{&quot;unit&quot;:&quot;px&quot;,&quot;size&quot;:&quot;&quot;,&quot;sizes&quot;:[]},&quot;align_mobile&quot;:&quot;center&quot;,&quot;width_mobile&quot;:{&quot;unit&quot;:&quot;px&quot;,&quot;size&quot;:1000,&quot;sizes&quot;:[]},&quot;align_tablet&quot;:&quot;center&quot;,&quot;width_tablet&quot;:{&quot;unit&quot;:&quot;%&quot;,&quot;size&quot;:94,&quot;sizes&quot;:[]},&quot;space_mobile&quot;:{&quot;unit&quot;:&quot;%&quot;,&quot;size&quot;:100,&quot;sizes&quot;:[]},&quot;image_border_radius_mobile&quot;:{&quot;unit&quot;:&quot;px&quot;,&quot;top&quot;:&quot;0&quot;,&quot;right&quot;:&quot;0&quot;,&quot;bottom&quot;:&quot;0&quot;,&quot;left&quot;:&quot;0&quot;,&quot;isLinked&quot;:true},&quot;caption_space_mobile&quot;:{&quot;unit&quot;:&quot;px&quot;,&quot;size&quot;:0,&quot;sizes&quot;:[]},&quot;align&quot;:&quot;center&quot;,&quot;space&quot;:{&quot;unit&quot;:&quot;%&quot;,&quot;size&quot;:&quot;&quot;,&quot;sizes&quot;:[]},&quot;space_tablet&quot;:{&quot;unit&quot;:&quot;%&quot;,&quot;size&quot;:&quot;&quot;,&quot;sizes&quot;:[]},&quot;image_border_radius&quot;:{&quot;unit&quot;:&quot;px&quot;,&quot;top&quot;:&quot;&quot;,&quot;right&quot;:&quot;&quot;,&quot;bottom&quot;:&quot;&quot;,&quot;left&quot;:&quot;&quot;,&quot;isLinked&quot;:true},&quot;image_border_radius_tablet&quot;:{&quot;unit&quot;:&quot;px&quot;,&quot;top&quot;:&quot;&quot;,&quot;right&quot;:&quot;&quot;,&quot;bottom&quot;:&quot;&quot;,&quot;left&quot;:&quot;&quot;,&quot;isLinked&quot;:true},&quot;caption_padding&quot;:{&quot;unit&quot;:&quot;px&quot;,&quot;top&quot;:&quot;&quot;,&quot;right&quot;:&quot;&quot;,&quot;bottom&quot;:&quot;&quot;,&quot;left&quot;:&quot;&quot;,&quot;isLinked&quot;:true},&quot;caption_padding_tablet&quot;:{&quot;unit&quot;:&quot;px&quot;,&quot;top&quot;:&quot;&quot;,&quot;right&quot;:&quot;&quot;,&quot;bottom&quot;:&quot;&quot;,&quot;left&quot;:&quot;&quot;,&quot;isLinked&quot;:true},&quot;caption_padding_mobile&quot;:{&quot;unit&quot;:&quot;px&quot;,&quot;top&quot;:&quot;&quot;,&quot;right&quot;:&quot;&quot;,&quot;bottom&quot;:&quot;&quot;,&quot;left&quot;:&quot;&quot;,&quot;isLinked&quot;:true},&quot;caption_space_tablet&quot;:{&quot;unit&quot;:&quot;px&quot;,&quot;size&quot;:&quot;&quot;,&quot;sizes&quot;:[]}}"
										data-widget_type="site-logo.default">
										<div class="elementor-widget-container">
											<div class="hfe-site-logo">
												<a data-elementor-open-lightbox=""
													class='elementor-clickable'
													href="${cp }/">
													<div class="hfe-site-logo-set">
														<div class="hfe-site-logo-container">
															<img class="hfe-site-logo-img elementor-animation-"
																src="https://www.coupangeats.com/wp-content/uploads/2021/10/white-solid-300x52.png"
																alt="white solid" />
														</div>
													</div>
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						<div class="elementor-column elementor-col-33 elementor-top-column elementor-element elementor-element-33b3b070" data-id="33b3b070" data-element_type="column">
			<div class="elementor-widget-wrap elementor-element-populated">
								<div class="elementor-element elementor-element-676f6ea9 elementor-icon-list--layout-inline elementor-list-item-link-inline elementor-align-right elementor-mobile-align-center elementor-widget elementor-widget-icon-list" data-id="676f6ea9" data-element_type="widget" data-widget_type="icon-list.default">
				<div class="elementor-widget-container">
			<style>/*! elementor - v3.5.3 - 28-12-2021 */
.elementor-widget.elementor-icon-list--layout-inline .elementor-widget-container{overflow:hidden}.elementor-widget .elementor-icon-list-items.elementor-inline-items{margin-right:-8px;margin-left:-8px}.elementor-widget .elementor-icon-list-items.elementor-inline-items .elementor-icon-list-item{margin-right:8px;margin-left:8px}.elementor-widget .elementor-icon-list-items.elementor-inline-items .elementor-icon-list-item:after{width:auto;left:auto;right:auto;position:relative;height:100%;border-top:0;border-bottom:0;border-right:0;border-left-width:1px;border-style:solid;right:-8px}.elementor-widget .elementor-icon-list-items{list-style-type:none;margin:0;padding:0}.elementor-widget .elementor-icon-list-item{margin:0;padding:0;position:relative}.elementor-widget .elementor-icon-list-item:after{position:absolute;bottom:0;width:100%}.elementor-widget .elementor-icon-list-item,.elementor-widget .elementor-icon-list-item a{display:-webkit-box;display:-ms-flexbox;display:flex;-webkit-box-align:center;-ms-flex-align:center;align-items:center;font-size:inherit}.elementor-widget .elementor-icon-list-icon+.elementor-icon-list-text{-ms-flex-item-align:center;align-self:center;padding-left:5px}.elementor-widget .elementor-icon-list-icon{display:-webkit-box;display:-ms-flexbox;display:flex}.elementor-widget .elementor-icon-list-icon svg{width:var(--e-icon-list-icon-size,1em);height:var(--e-icon-list-icon-size,1em)}.elementor-widget .elementor-icon-list-icon i{width:1.25em;font-size:var(--e-icon-list-icon-size)}.elementor-widget.elementor-widget-icon-list .elementor-icon-list-icon{text-align:var(--e-icon-list-icon-align)}.elementor-widget.elementor-widget-icon-list .elementor-icon-list-icon svg{margin:var(--e-icon-list-icon-margin,0 calc(var(--e-icon-list-icon-size, 1em) * .25) 0 0)}.elementor-widget.elementor-list-item-link-full_width a{width:100%}.elementor-widget.elementor-align-center .elementor-icon-list-item,.elementor-widget.elementor-align-center .elementor-icon-list-item a{-webkit-box-pack:center;-ms-flex-pack:center;justify-content:center}.elementor-widget.elementor-align-center .elementor-icon-list-item:after{margin:auto}.elementor-widget.elementor-align-center .elementor-inline-items{-webkit-box-pack:center;-ms-flex-pack:center;justify-content:center}.elementor-widget.elementor-align-left .elementor-icon-list-item,.elementor-widget.elementor-align-left .elementor-icon-list-item a{-webkit-box-pack:start;-ms-flex-pack:start;justify-content:flex-start;text-align:left}.elementor-widget.elementor-align-left .elementor-inline-items{-webkit-box-pack:start;-ms-flex-pack:start;justify-content:flex-start}.elementor-widget.elementor-align-right .elementor-icon-list-item,.elementor-widget.elementor-align-right .elementor-icon-list-item a{-webkit-box-pack:end;-ms-flex-pack:end;justify-content:flex-end;text-align:right}.elementor-widget.elementor-align-right .elementor-icon-list-items{-webkit-box-pack:end;-ms-flex-pack:end;justify-content:flex-end}.elementor-widget:not(.elementor-align-right) .elementor-icon-list-item:after{left:0}.elementor-widget:not(.elementor-align-left) .elementor-icon-list-item:after{right:0}@media (max-width:1024px){.elementor-widget.elementor-tablet-align-center .elementor-icon-list-item,.elementor-widget.elementor-tablet-align-center .elementor-icon-list-item a,.elementor-widget.elementor-tablet-align-center .elementor-icon-list-items{-webkit-box-pack:center;-ms-flex-pack:center;justify-content:center}.elementor-widget.elementor-tablet-align-center .elementor-icon-list-item:after{margin:auto}.elementor-widget.elementor-tablet-align-left .elementor-icon-list-items{-webkit-box-pack:start;-ms-flex-pack:start;justify-content:flex-start}.elementor-widget.elementor-tablet-align-left .elementor-icon-list-item,.elementor-widget.elementor-tablet-align-left .elementor-icon-list-item a{-webkit-box-pack:start;-ms-flex-pack:start;justify-content:flex-start;text-align:left}.elementor-widget.elementor-tablet-align-right .elementor-icon-list-items{-webkit-box-pack:end;-ms-flex-pack:end;justify-content:flex-end}.elementor-widget.elementor-tablet-align-right .elementor-icon-list-item,.elementor-widget.elementor-tablet-align-right .elementor-icon-list-item a{-webkit-box-pack:end;-ms-flex-pack:end;justify-content:flex-end;text-align:right}.elementor-widget:not(.elementor-tablet-align-right) .elementor-icon-list-item:after{left:0}.elementor-widget:not(.elementor-tablet-align-left) .elementor-icon-list-item:after{right:0}}@media (max-width:767px){.elementor-widget.elementor-mobile-align-center .elementor-icon-list-item,.elementor-widget.elementor-mobile-align-center .elementor-icon-list-item a,.elementor-widget.elementor-mobile-align-center .elementor-icon-list-items{-webkit-box-pack:center;-ms-flex-pack:center;justify-content:center}.elementor-widget.elementor-mobile-align-center .elementor-icon-list-item:after{margin:auto}.elementor-widget.elementor-mobile-align-left .elementor-icon-list-items{-webkit-box-pack:start;-ms-flex-pack:start;justify-content:flex-start}.elementor-widget.elementor-mobile-align-left .elementor-icon-list-item,.elementor-widget.elementor-mobile-align-left .elementor-icon-list-item a{-webkit-box-pack:start;-ms-flex-pack:start;justify-content:flex-start;text-align:left}.elementor-widget.elementor-mobile-align-right .elementor-icon-list-items{-webkit-box-pack:end;-ms-flex-pack:end;justify-content:flex-end}.elementor-widget.elementor-mobile-align-right .elementor-icon-list-item,.elementor-widget.elementor-mobile-align-right .elementor-icon-list-item a{-webkit-box-pack:end;-ms-flex-pack:end;justify-content:flex-end;text-align:right}.elementor-widget:not(.elementor-mobile-align-right) .elementor-icon-list-item:after{left:0}.elementor-widget:not(.elementor-mobile-align-left) .elementor-icon-list-item:after{right:0}}</style>		<ul class="elementor-icon-list-items elementor-inline-items">
				<!-- 권한이 없는 사용자 처리 -->
				<sec:authorize access="isAnonymous()">
						<li class="elementor-icon-list-item elementor-inline-item">
							<span class="elementor-icon-list-text"><a href="${cp }/loginuser" style="color:white;text-decoration:none;">로그인</a></span>
						</li>
				</sec:authorize>
				<!-- 권한이 있는 사용자 처리 -->
				<sec:authorize access="hasRole('ROLE_USER')">
					<span>[${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}님 반갑습니다.]</span>
					<li class="elementor-icon-list-item elementor-inline-item">
						<span class="elementor-icon-list-text"><a href="javascript:showcart()" style="color:white;text-decoration:none;">주문표</a></span>
					</li>
					<button type="button" id="call" class="btn btn-outline-dark btn-sm" style="padding:0px;color:white;position:absolute;left:-35px;">
						<img src="${cp }/resources/img/ring.png" style="width:20px;height:21px">
						<span class="badge badge-light" id="alarmbadge" style="border-radius:0.5rem;top:-10px;left:-10px;font-size:50%;background-color: #FF9090;"></span>
						<span class="sr-only">unread messages</span>
					</button>
					<div style="display:none;position:absolute;z-index:99;top:30px;left:-40px" id="Alarmlist" data-bs-toggle="tooltip" data-bs-placement="top" title="클릭하면 알람이 삭제됩니다">
						
					</div>
					<div class="toast-container position-absolute p-3" style="z-index:99">
					<div id="toast" class="toast hide" role="alert" aria-live="assertive" aria-atomic="true" data-delay="2000">
						<div class="toast-header" id="toasthead"></div>
						<div class="toast-body" id="toastbody" style="text-align:left"></div>
					</div>
					</div>
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6cda1d2e6578e00f2f149b8981a3cb1f&libraries=services"></script>
					<script>
						var stompClient = null;
						$(function(){
							getAlarm();
							let cart="${param.cart}";
							if(cart=='empty'){
								alert('주문표에 있는 메뉴가 없습니다.');
							}
							$("#call").click(function(){
								$("#Alarmlist").toggle();
								//stompClient.send("/app/order", {}, JSON.stringify({'or_num': 322}));
							});
							connect();
						});
						function getAlarm(){
							$.ajax({
								url:"${cp}/user/getAlarm",
								dataType:"json",
								success:function(data){
									let alarm="";
									let alarmcount=0;
									if(data.result=='success'){
										alarm+="<div class='list-group'>";
										alarm+='<a href="#" class="list-group-item list-group-item-action disabled" tabindex="-1" aria-disabled="true"';
										alarm+=' style="padding:0.2rem 0.8rem;text-align:center">주문목록</a>';
										for(let i=0;i<data.list.length;i++){
											//alarm+="<span class='d-inline-block' tabindex='0' data-bs-toggle='popover' data-bs-trigger='hover focus' data-bs-content='상세내역을 보려면 클릭하세요'>"
											alarm+="<a href='javascript:testtest()' class='list-group-item list-group-item-action' style='padding:0.4rem 0.8rem;'>";
											alarm+="주문번호:"+data.list[i].or_num+"</a>";
											alarmcount++;
										}
										alarm+="</div>";
										$("#Alarmlist").html(alarm);
										if(alarmcount==0){
											$("#alarmbadge").html();
											console.log('count=0');
										}else{
											$("#alarmbadge").html(alarmcount);
											console.log('count!=0');
										}
									}
								}
							});
						}
						function testtest(){
							stompClient.send("/app/order", {}, JSON.stringify({'or_num':322}));
						}
						function connect() {
						    var socket = new SockJS('/project/stomp');
						    stompClient = Stomp.over(socket);
						    stompClient.connect({}, function (frame) {
				    				stompClient.subscribe('/topic/${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}', function (greeting) {
				    					let or_num=JSON.parse(greeting.body).or_num;
				    					let deltime=JSON.parse(greeting.body).deltime;
				    					$.ajax({
							    			url:"${cp}/user/saveAlarm",
							    			data:{
							    				or_num:or_num,
							    				deltime:deltime
							    			},
							    			dataType:"json",
							    			success:function(data){
							    				if(data.result='success'){
							    					let ovo=data.ovo;
							    					console.log(ovo);
							    					if(ovo.or_status==2){
							    						$("#toasthead").html("<strong>고객님의 주문이 접수되었습니다!</strong>");
							    						$("#toastbody").html("고객님의 소중한 주문이 정상 접수되어, " + ovo.or_deltime+"분 내외로 도착할 예정입니다.");
							    						$("#toast").prop('class','toast show');;
							    						setTimeout(function(){
							    							$("#toast").prop('class','toast hide');
							    						},2500);
							    					}else if(ovo.or_status==3){
							    						$("#toasthead").html("<strong>주문하신 음식의 배달이 시작되었습니다!</strong>");
							    						$("#toastbody").html("배달주소 : " + ovo.or_addr);
							    						$("#toast").prop('class','toast show');;
							    						setTimeout(function(){
							    							$("#toast").prop('class','toast hide');
							    						},2500);
							    					}else if(ovo.or_status==4){
							    						$("#toasthead").html("<strong>주문하신 음식이 도착했습니다!</strong>");
							    						$("#toastbody").html("맛있게 드시고 다음에도 주문해주세요~");
							    						$("#toast").prop('class','toast show');;
							    						setTimeout(function(){
							    							$("#toast").prop('class','toast hide');
							    						},2500);
							    					}
							    					getAlarm();
							    				}else{
							    					console.log('fail');
							    				}
							    			}
							    		});
				    				});
						        console.log('Connected: ' + frame);
						    });
						}
						function showcart(){
							let checkcart="${detail}";
							let coordx="";
							let coordy="";
							if(checkcart=='' || checkcart==null){
								checkcart='none';
							}
							if(checkcart=='true'){
								$("#cartlist").toggle();
							}else{
								location.href="${cp}/searchDetail";
							}
						}
					</script>
					<li class="elementor-icon-list-item elementor-inline-item">
						<span class="elementor-icon-list-text"><a href="${cp }/user/usermypage" style="color:white;text-decoration:none;">My Page</a></span>
					</li>
					<li class="elementor-icon-list-item elementor-inline-item">
						<span class="elementor-icon-list-text"><a href="#" onclick="document.getElementById('user_logout').submit();" style="color:white;text-decoration:none;">로그아웃</a></span>
						<form:form id="user_logout" method="post" action="${cp }/logout">
						</form:form>
					</li> 
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_RESTAURANT')">
					<button type="button" id="call" class="btn btn-outline-dark btn-sm" style="padding:0px;color:white;position:absolute;left:180px;top:1px;">
						<img src="${cp }/resources/img/ring.png" style="width:20px;height:21px">
						<span class="badge badge-light" id="alarmbadge" style="border-radius:0.5rem;top:-10px;left:-10px;font-size:50%;background-color: #FF9090;">1</span>
						<span class="sr-only">unread messages</span>
					</button>
					<div style="display:none;position:absolute;z-index:99;top:30px;left:175px;width: 270px;" id="Alarmlist" data-bs-toggle="tooltip" data-bs-placement="top" title="클릭하면 알람이 삭제됩니다">
						<div class='list-group' id="Alarmlist">
							<a href="#" class="list-group-item list-group-item-action disabled" tabindex="-1" aria-disabled="true"
									style="padding:0.2rem 0.8rem;text-align:center">주문목록</a>
							
						</div>
					</div>
					<li class="elementor-icon-list-item elementor-inline-item">
						<span class="elementor-icon-list-text"><a href="${cp }/restaurant/sallermypage" style="color:white;text-decoration:none;">My Page</a></span>
					</li>
					<li class="elementor-icon-list-item elementor-inline-item">
						<span class="elementor-icon-list-text"><a href="#" onclick="document.getElementById('restaurant_logout').submit();" style="color:white;text-decoration:none;">로그아웃</a></span>
						<form:form id="restaurant_logout" method="post" action="${cp }/logout">
						</form:form>
					</li>
					<div id="alarmlist" style="display:none;position:absolute;top:50px;
										border:1px solid black;width:300px;height:500px;z-index:99;background-color:yellow">
						<div id="alarmhead">
							<h3>주문목록</h3>
						</div>
						<div id="alarmbody" style="border-top:1px solid black">
						</div>
					</div>
					<script>
						var stompClient = null;
						$(function(){
							connect();
							$("#call").click(function(){
								$("#Alarmlist").toggle();
								//stompClient.send("/app/order", {}, JSON.stringify({'or_num': 322}));
							});
						});
						function connect() {
						    var socket = new SockJS('/project/stomp');
						    stompClient = Stomp.over(socket);
						    stompClient.connect({}, function (frame) {
						        console.log('Connected: ' + frame);
						        stompClient.subscribe('/topic/orders', function (greeting) {
						        	let alarm=""
						        	//JSON.parse(greeting.body).content
						        	alarm+="<a href='javascript:callbackorder("+JSON.parse(greeting.body).content+")'"
						        	alarm+=" class='list-group-item list-group-item-action' style='padding:0.4rem 0.8rem;text-align:left;' >";
						        	alarm+=""+JSON.parse(greeting.body).or_num+"번 주문이 들어왔습니다</a>";
						        	
						            $("#Alarmlist").append(alarm);
						        });
						    });
						}
						function callbackorder(or_num){
							//$.ajax({
							//	
							//});
							stompClient.send("/app/callback", {}, JSON.stringify({'deltime': 30,'or_num':322}));
						}
						function showalarm(){
							$("#alarmlist").toggle();
						}
					</script>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_ADMIN')">
				<li class="elementor-icon-list-item elementor-inline-item">
						<span class="elementor-icon-list-text"><a href="${cp }/admin/adminpage" style="color:white;text-decoration:none;">관리자페이지</a></span>
					</li>
				<li class="elementor-icon-list-item elementor-inline-item">
						<span class="elementor-icon-list-text"><a href="${cp }/category/upload" style="color:white;text-decoration:none;">카테고리등록</a></span>
				</li>
						<li class="elementor-icon-list-item elementor-inline-item">
						<span class="elementor-icon-list-text"><a href="#" onclick="document.getElementById('admin_logout').submit();" style="color:white;text-decoration:none;">로그아웃</a></span>
						<form:form id="admin_logout" method="post" action="${cp }/logout">
						</form:form>
					</li>
				</sec:authorize>
						</ul>
				</div>
				</div>
					</div>
		</div>
						</div>
					</section>
				</div>
			</div>
		</header>
		<main id="content" class="neve-main" role="main">

			<div id="main">
				<jsp:include page="${requestScope.main }" />
			</div>

		</main>
		<footer itemtype="https://schema.org/WPFooter" itemscope="itemscope"
			id="colophon" role="contentinfo">
			<div class='footer-width-fixer'>
				<div data-elementor-type="wp-post" data-elementor-id="907"
					class="elementor elementor-907" data-elementor-settings="[]">
					<div class="elementor-section-wrap">
						<section
							class="elementor-section elementor-top-section elementor-element elementor-element-31bccabf elementor-section-stretched footer elementor-section-boxed elementor-section-height-default elementor-section-height-default"
							data-id="31bccabf" data-element_type="section"
							data-settings="{&quot;stretch_section&quot;:&quot;section-stretched&quot;,&quot;background_background&quot;:&quot;classic&quot;}">
							<div class="elementor-container elementor-column-gap-narrow">
								<div
									class="elementor-column elementor-col-100 elementor-top-column elementor-element elementor-element-627f15bb"
									data-id="627f15bb" data-element_type="column">
									<div class="elementor-widget-wrap elementor-element-populated">
										<div
											class="elementor-element elementor-element-47ed8eb1 elementor-shape-rounded elementor-grid-0 e-grid-align-center elementor-widget elementor-widget-social-icons"
											data-id="47ed8eb1" data-element_type="widget"
											data-widget_type="social-icons.default"></div>
										<div
											class="elementor-element elementor-element-c200aca elementor-widget elementor-widget-text-editor"
											data-id="c200aca" data-element_type="widget"
											data-widget_type="text-editor.default">
											<div class="elementor-widget-container">
												<p class="p1">
												<span><a href="${cp }/loginRestaurant" style="color:white;text-decoration:none;">판매자 로그인</a></span>&nbsp;
												<span><a href="${cp }/loginAdmin" style="color:white;text-decoration:none;">관리자 로그인</a></span>&nbsp;
												<span><a href="${cp }/sellerInsert" style="color:white;text-decoration:none;">도로 주소명 테스트</a></span>
													<span class="s1"><br />유한책임회사 위대한개발자</span>(<span
														class="s1">주</span>) | <span class="s1">TEL</span>: <span
														class="s1">070-8240-3211~3 FAX: 02-777-5407</span> <br />
													<span class="s1">사업자</span> <span class="s1">등록번호</span>: 104-81-59383
													| <span class="s1">통신판매업신고</span>:  중구 065325 <span class="s1">중앙HTA㈜</span>
													<span class="s1"></span><br />
													<span class="s1">서울특별시</span> <span class="s1">종로구</span> <span
														class="s1">율곡로10길 105 다이망 </span> 4F(봉익동 10-1 디아망 4F)
												</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</section>
					</div>
				</div>
			</div>
		</footer>
	</div>
</body>
</html>
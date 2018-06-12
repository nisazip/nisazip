<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="kh.home.model.vo.*, java.util.*"%>

<%
	ArrayList<HashMap<String, Object>> rlist = (ArrayList<HashMap<String, Object>>) request
			.getAttribute("rlist");
	ArrayList<HashMap<String, Object>> tlist = (ArrayList<HashMap<String, Object>>) request
			.getAttribute("tlist");
	String area = (String) request.getAttribute("area");
	String location = (String) request.getAttribute("location");
	String checkin = (String) request.getAttribute("checkin");
	String checkout = (String) request.getAttribute("checkout");
	int people = (int) request.getAttribute("people");
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>네가 사는 제주</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=912ba5ded38a05dd53c37b8850dd2427&libraries=services"></script>
<style>
#price {
	text-align: right;
}

#score {
	text-align: right;
	margin-top: 0px;
}

#main {
	position: absolute;
	margin-top: 170px;
	width: 100%;
}

.img {
	width: 300px;
	height: 100px;
}

#map {
	height: 90%;
	width: 70%;
	margin-left: 30px;
	margin-top: 35px;
	margin-bottom: 10px;
}

.btn {
	width: 100px;
	height: 30px;
	margin: 35px 50px 0px;
	color: black;
	border: green;
}

.btn:hover {
	width: 100px;
	height: 30px;
	margin: 35px 50px 0px;
	color: black;
	border: green;
	background: rgb(131, 218, 150);
}

.select {
	padding-left: 24px !important;
	padding-right: 24px !important;
	max-width: 1080px !important;
}

#search {
	background: rgb(77, 60, 23);
	color: white;
}

.thumbnail:hover {
	background: gray;
	box-shadow: 0 1px 10px rgba(0, 0, 0, 0.4);
	opacity: 0.4;
}

#filterBtn {
	background: rgb(255, 215, 0);
	width: 80px;
	height: 35px;
}

#sortBtn {
	background: rgb(255, 215, 0);
	width: 80px;
	height: 35px;
}

.modal {
	text-align: center;
}

@media screen and (min-width: 768px) {
	.modal:before {
		display: inline-block;
		vertical-align: middle;
		content: " ";
		height: 100%;
	}
}

.modal-dialog {
	display: inline-block;
	text-align: left;
	vertical-align: middle;
}

ul {
	list-style: none;
}

#sortGroup {
	display: none;
	z-index: 1000;
	top: -30px;
}

.sortGroup {
	background: black;
	color: white;
	margin-right: 10px;
	margin-bottom: 0;
}
</style>
</head>

<body>

	<%@ include file="views/common/header.jsp"%>

	<div id="main">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-2"></div>
				<div class="col-sm-6" id="form">


					<br>
					<div class="col-xs-3">
						<label> 위 치: <%=location%></label>&nbsp;
					</div>
					<div class="col-xs-3">
						&nbsp;&nbsp;<label> 인 원 수: <%=people%>
						</label>&nbsp;&nbsp;
					</div>

					<div class="col-xs-3">
						&nbsp;<label>체크인 : <%=checkin%>
						</label>&nbsp;&nbsp;
					</div>

					<div class="col-xs-3">
						<label>체크아웃 : <%=checkout%>
						</label>&nbsp;
					</div>


					<br>

				</div>
			</div>

		</div>
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-2"></div>

				&nbsp;&nbsp;&nbsp;

				<div class="col-xs-2" style="top: 15px;">
					<input type="search" id="keyword" placeholder="지역이나 숙소이름을 검색하세요"
						value="<%=area%>" style="width: 300px; height: 40px;"> <a
						href="#" style="color: white">
						<button type="button" id="search" onclick="search();">검색하기</button>
					</a>
				</div>
				<div class="col-xs-8" style="right: 15%;">


					 <input type="checkbox"
						id="sortPrice" onclick="sortPrice();">낮은 가격순 <br> <br>
				</div>
				<br>
			</div>
		</div>
		<script>
             
                
                function search(){
                	 if($('input:checkbox[id="sortPrice"]').is(":checked") == true){
                   		 var checkVal = "true";
                   		 
                 	  	}else{
                   		var checkVal = "false";
                   		
                 	  	}  
                	
        			$.ajax({
        				url:'<%=request.getContextPath()%>/keywordSearch.ho',
    					type:"get",
    					data : {
    						keyword : $('#keyword').val(),
    						checkVal : checkVal
    					},
    					success:function(data){
    						
    						console.log(data);
    						console.log(data.rlist);
    						console.log(data.tlist);
    						// 전체 영역
    						
    						var $div = $('#form');
    						$div.text("");
    						
    						$div = $('#inn2_thumb');
    						$div.text("");
    						
    					
    						if(data.rlist.length > 0) {
	    						for(var i=1 ; i<5 ; i++){
	    							var str = '<div class="col-md-6">' 
	    								+ '<div class="thumbnail">'
	    							+'<a href="상세 페이지.html" target="_blank"> '
	    							+'<img src="'+data.rlist[i].file_path+data.rlist[i].change_name+'.jpg" class="img" style="height:190px;">'
	    							+' <div class="caption">'
	    							+'<p>'+data.rlist[i].r_name+'</p>'
	    							+'<p id="score">'+data.rlist[i].score+'점</p>'
	    							+'<p id="price">'+data.rlist[i].price+'￦</p>'
	    							+'</div></a></div></div>';
	    							
	    							$div.append(str);
	    							
	    							console.log(i);
	    						}
    						} else {
	     						$div.append("<h3>검색하신 조건에 해당하는 결과가 없습니다.</h3><br><br><br>");
	     					}
    					
	    						
    						$div = $('#trip2_thumb');
    						$div.text("");
    						if(data.tlist.length > 0){
    							for(var i=1 ; i<5 ; i++){
        							var str = '<div class="col-md-6">' 
        								+ '<div class="thumbnail">'
        							+'<a href="상세 페이지.html" target="_blank"> '
        							+'<img src="'+data.tlist[i].file_path+data.tlist[i].change_name+'.jpg" class="img" style="height:190px;">'
        							+' <div class="caption">'
        							+'<p>'+data.tlist[i].t_name+'</p>'
        							+'<p id="score">'+data.tlist[i].score+'점</p>'
        							+'<p id="price">'+data.tlist[i].price+'￦</p>'
        							+'</div></a></div></div>';
        							
        							$div.append(str);
        						}
    						} else {
    							$div.append("<h3>검색하신 조건에 해당하는 결과가 없습니다.</h3><br><br><br>");
    						}
    					}
    				});
        		};
                </script>






		<div class="container room">
			<div class="row">
				<h2>숙소</h2>
				<button type="button" onclick="moreRoom();"
					style="margin-left: 45%; border: 0; background: white;">+더보기</button>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="row" id="inn2_thumb">
						<%
							for (HashMap<String, Object> map : rlist) {
						%>

						<div class="col-md-6">
							<div class="thumbnail">
								<a href="상세 페이지.html" target="_blank"> <img
									src="resources/images/<%=map.get("change_name")%>.jpg"
									class="img" style="height: 190px;">
									<div class="caption">
										<p><%=map.get("r_name")%></p>
										<p id="score"><%=map.get("score")%>점
										</p>
										<p id="price"><%=map.get("price")%>￦
										</p>
									</div>
								</a>
							</div>
						</div>
						<%
							}
						%>
					</div>
				</div>
			</div>

		</div>
		<div class="container room">
			<div class="row">
				<h2>트립</h2>
				<button type="button" onclick="moreTrip();"
					style="margin-left: 45%; border: 0; background: white;">+더보기</button>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="row" id="trip2_thumb">
						<%
							for (HashMap<String, Object> map : tlist) {
						%>

						<div class="col-md-6">
							<div class="thumbnail">
								<a href="상세 페이지.html" target="_blank"> <img
									src="resources/images/<%=map.get("change_name")%>.jpg"
									class="img" style="height: 190px;">
									<div class="caption">
										<p><%=map.get("t_name")%></p>
										<p id="score"><%=map.get("score")%>점
										</p>
										<p id="price"><%=map.get("price")%></p>
									</div>
								</a>
							</div>
						</div>
						<%
							}
						%>
					</div>
				</div>
			</div>

		</div>
		<script>
	    	
	    	
	    	function moreRoom(){
	    		location.href='room.jsp';
	    	};
	    	
	    	function moreTrip(){
	    		location.href='trip.jsp';
	    	};
 
			 $(function(){
				 
				 $('#keyword').val('<%=location%>
			');
		<%if (checkin == "" || checkout == "") {%>
			if ($('#keyword').val() != "" && $('#keyword').val() != "null") {
					search();
				} else {
					var $div = $('#inn2_thumb');
					$div.append("<h3>검색 조건이 없습니다.</h3>");

					$div = $('#trip2_thumb');
					$div.append("<h3>검색 조건이 없습니다.</h3>");
				}
		<%}%>
			});
		</script>

		<div class="col-xs-6 hidden-xs"
			style="position: fixed; top: 320px; margin-left: 50%; bottom: 10px;">
			<div id="map"></div>
			<script>
				var infowindow = new daum.maps.InfoWindow({
					zIndex : 1
				});

				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new daum.maps.LatLng(33.499970, 126.535388), // 지도의 중심좌표
					level : 5
				// 지도의 확대 레벨
				};

				// 지도를 생성합니다    
				var map = new daum.maps.Map(mapContainer, mapOption);

				//검색어로 지도 표시(실행 안됨)
				$(document)
						.ready(
								function() {

									// 키워드로 지도 검색 코드 메서드를 callback이라는 변수로 저장합니다.그리고 하단부에 input엔터키 이벤트와        
									//버튼클릭 이벤트 메서드에서 따로 불러줍니다(두 이벤트를 같이 쓰기 위해서).

									var callback = function()

									{
										var r_addr = markerElem
												.getAttribute('r_addr');
										var r_name = markerElem
												.getAttribute('r_name');
										var r_loc = markerElem
												.getAttribute('r_loc');

										// 값을 입력하지 않았을 때 안내 경고창

										if ($('#keyword').val() == '') {

											alert('위치를 입력해주세요. ex)경기대 수원');

										}
										;

										// 본격적인 지도 검색의 핵심 코드 시작
										var keyword = $("#keyword").val();

										// 한글처리
										keyword = encodeURIComponent(keyword);

										// keyword JSON데이터에 접근하기 위한 주소
										var url = "https://apis.daum.net/local/v1/search/keyword.json?apikey=912ba5ded38a05dd53c37b8850dd2427&query="
												+ keyword;

										// 주소 뒤에 &callback=?을 붙임으로써 JSONP형식의 데이터를 이용하기 위한 메서드

										$
												.getJSON(
														url + "&callback=?",
														function(json) {

															// 다음 제공 JSON형식이 channel안에 각 item형식으로 되어 있기 때문에 원하는 단계까지 접근하기      
															var items = json.channel.item;

															// item안의 latitude, longitude 데이터를 활용하기 위한 메서드

															$
																	.each(
																			items,
																			function(
																					i,
																					it) {

																				var latitude = it.latitude;

																				var longitude = it.longitude;

																				var pos = latitude
																						+ ","
																						+ longitude;

																				if (i == 0) {

																					var container = document
																							.getElementById('map');

																					// 지도를 담을 영역의 DOM 레퍼런스

																					var options = { // 지도를 생성할 때 필요한 기본 옵션

																						center : new daum.maps.LatLng(
																								33.499970,
																								126.535388), // 지도의 중심좌표.

																						level : 3
																					//지도의 레벨(확대, 축소 정도)

																					};

																					var map = new daum.maps.Map(
																							container,
																							options); // 지도 생성 및 객체 리턴

																				}

																			});

														});

										// 검색 된 후 input에 입력했던 텍스트를 비워주는 코드

										$("#keyword").val("");

									}; // 여기까지 callback 변수에 저장된 메서드

									// 엔터키 누르면 위치검색 가능 메서드n

									$(".search").keypress(function() {

										if (event.which == 13)
											callback();

									});

									// 버튼 클릭으로 위치검색 가능 메서드
									$(".search").click(callback);

								});

				//검색어에 따른 여러 마커 표시
				/*              // 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
				 var infowindow = new daum.maps.InfoWindow({zIndex:1});

				 var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				 mapOption = {
				 center: new daum.maps.LatLng(33.499970, 126.535388), // 지도의 중심좌표
				 level: 5 // 지도의 확대 레벨
				 };  

				 // 지도를 생성합니다    
				 var map = new daum.maps.Map(mapContainer, mapOption); 

				 // 장소 검색 객체를 생성합니다
				 var ps = new daum.maps.services.Places(); 

				 // 키워드로 장소를 검색합니다
				 ps.keywordSearch('제주시', placesSearchCB); 

				 // 키워드 검색 완료 시 호출되는 콜백함수 입니다
				 function placesSearchCB (data, status, pagination) {
				 if (status === daum.maps.services.Status.OK) {

				 // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				 // LatLngBounds 객체에 좌표를 추가합니다
				 var bounds = new daum.maps.LatLngBounds();

				 for (var i=0; i<data.length; i++) {
				 displayMarker(data[i]);    
				 bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x));
				 }       

				 // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
				 map.setBounds(bounds);
				 } 
				 }

				 // 지도에 마커를 표시하는 함수입니다
				 function displayMarker(place) {
				
				 // 마커를 생성하고 지도에 표시합니다
				 var marker = new daum.maps.Marker({
				 map: map,
				 position: new daum.maps.LatLng(place.y, place.x) 
				 });

				 // 마커에 클릭이벤트를 등록합니다
				 daum.maps.event.addListener(marker, 'click', function() {
				 // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
				 infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
				 infowindow.open(map, marker);
				 });
				 } */

				//지도에 마커와 텍스트 표시
				/*                 var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				                mapOption = {
				                    center: new daum.maps.LatLng(33.499970, 126.535388), // 지도의 중심좌표
				                    level: 6 // 지도의 확대 레벨
				                };  
				                
				                //지도를 생성합니다    
				                var map = new daum.maps.Map(mapContainer, mapOption); 
				                
				                //주소-좌표 변환 객체를 생성합니다
				                var geocoder = new daum.maps.services.Geocoder();
				                
				                //주소로 좌표를 검색합니다
				                geocoder.addressSearch('서귀포시', function(result, status) {
				                
				                // 정상적으로 검색이 완료됐으면 
				                 if (status === daum.maps.services.Status.OK) {
				                
				                    var coords = new daum.maps.LatLng(result[0].y, result[0].x);
				                
				                    // 결과값으로 받은 위치를 마커로 표시합니다
				                    var marker = new daum.maps.Marker({
				                        map: map,
				                        position: coords
				                    });
				                
				                    // 인포윈도우로 장소에 대한 설명을 표시합니다
				                    var infowindow = new daum.maps.InfoWindow({
				                        content: '<div style="width:150px;text-align:center;padding:6px 0;">가격</div>'
				                    });
				                    infowindow.open(map, marker);
				                
				                    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				                    map.setCenter(coords);
				                } 
				                }); */

				map.setZoomable(false);
			</script>

		</div>

	</div>
	</div>

	<br>
	</div>


</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="kh.home.model.vo.*, java.util.*"%>
    
<% 
	ArrayList<HashMap<String,Object>> rlist= (ArrayList<HashMap<String,Object>>)request.getAttribute("rlist");
	ArrayList<HashMap<String,Object>> tlist= (ArrayList<HashMap<String,Object>>)request.getAttribute("tlist");
	String area = (String)request.getAttribute("area");
	String location = (String)request.getAttribute("location");
	String checkin = (String)request.getAttribute("checkin");
	String checkout = (String)request.getAttribute("checkout");
	int people = (int)request.getAttribute("people");
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>네가 사는 제주</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="resources/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=912ba5ded38a05dd53c37b8850dd2427&libraries=services"></script>
    <style>
    #price {
	text-align: right;
}

#score{
	text-align:right;
	margin-top:0px;
}
    
#main {
	position:absolute;
	margin-top: 170px;
	width:100%;
} 

.img{
 	  width:300px;
 	  height:100px;
}
#map {
	height: 90%;
	width: 70%;
	margin-left: 30px;
	margin-top:35px;
	margin-bottom:10px;
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

.sortGroup{
	background:black;
	color:white;
	margin-right:10px;
	margin-bottom:0;
}


</style>
</head>

<body>
    
    <%@ include file="views/common/header.jsp" %>
    
    	<div id="main">
    	<div class="container-fluid">
			<div class="row">
				<div class="col-sm-2"></div>
					<div class="col-sm-6" id="form">

						
							<br>
							<div class="col-xs-3" >
								<label> 위 치: <%= location %></label>&nbsp;
							</div>
							<div class="col-xs-3">
								&nbsp;&nbsp;<label> 인 원 수: <%= people %> </label>&nbsp;&nbsp;
							</div>
					
							<div class="col-xs-3">
								&nbsp;<label>체크인 : <%= checkin %> </label>&nbsp;&nbsp;
							</div>

							<div class="col-xs-3">
								<label>체크아웃 : <%= checkout %> </label>&nbsp;
							</div>
				

						<br>
	
					</div>
			</div>

		</div>
    	  <div class="container-fluid">
            <div class="row searchbar">
                <div class="col-sm-2"></div>

                &nbsp;&nbsp;&nbsp;
                
                <div class="col-sm-5" style="top:15px;">
	                <input type="search" id="keyword" placeholder="지역이나 숙소이름을 검색하세요" value="<%= area %>" style="width: 300px; height: 40px;">
	                <a href="#" style="color: white">
	                    <button type="button" id="search" onclick="search();">검색하기</button>
	                    
	                </a>
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
	    						for(var i=0 ; i<4 ; i++){
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
    							for(var i=0 ; i<4 ; i++){
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

            
                <div class="col-sm-5" style="right:15%;">
				         
                	<!-- <div class="col-sm-2">
                	<button type="button" id="filterBtn" name="filterBtn" data-toggle="modal" data-target="#myModal">필터</button>
                	<div id="myModal" class="modal fade" role="dialog">
					  <div class="modal-dialog">
					
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal">&times;</button>
					        <h4 class="modal-title">필터</h4>
					      </div>
					      <div class="modal-body">
					        <p>가격</p>
					        <ul>
						        <li><input type="checkbox" name="rPrice1">50000~100000</li>
						        <li><input type="checkbox" name="rprice2">100000~200000</li>
						        <li><input type="checkbox" name="rprice3">200000~300000</li>
					      	</ul>
					      <br>
					      
					      <p>예약가능한 숙소만 보기
					      <input type="checkbox" name="ableRoom"></p>
					      <br>
					      
					      <p>숙박 업체 유형</p>
					      <input type="checkbox" name="rtype1">펜션 
						  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						  <input type="checkbox" name="rtype2">게스트 하우스
						  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						  <input type="checkbox" name="rtype3">아파트
						  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						  <input type="checkbox" name="rtype4">호텔
					      
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					      </div>
					    </div>
					
					  </div>
					</div>
					</div>  -->
                	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                	 <!--  <input type="checkbox" id="sortPrice" onclick="sortPrice();" >낮은 가격 순  -->
             	<input type="checkbox" id="sortPrice" onclick="sortPrice();" >낮은 가격순
	          			<!-- <div class="container">          
						  <div id="sortGroup" class="btn-group">
						    <button type="button" id="scoresort" onclick="scoresort();" class="btn btn-primary sortGroup">평점순</button>
						    
						  </div>
						</div> -->
	          	 
	          	     
               
                <br>
                <br>
            </div>
        <br>
        </div>
        
        
         
				<div class="container room">
				<div class="row">
			<h2>숙소</h2>
			<button type="button" onclick="moreRoom();" style="margin-left:45%; border:0; background:white;">+더보기</button>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="row" id="inn2_thumb">
					<% for(HashMap<String,Object> map : rlist) { %>
					
					<div class="col-md-6"> 
	    				<div class="thumbnail">
	    					<a href="상세 페이지.html" target="_blank">
	    						<img src="resources/images/<%= map.get("change_name") %>.jpg" class="img" style="height:190px;">
	    							<div class="caption">
	    								<p><%=map.get("r_name") %></p>
	    								<p id="score"><%=map.get("score") %>점</p>
	    								<p id="price"><%=map.get("price") %>￦</p>
	    							</div>
	    					</a>
	    				</div>
	    			</div>
	    			<% } %>
					</div>
				</div>
			</div>
		
		</div>
		<div class="container room">
		<div class="row">
			<h2>트립</h2>
			<button type="button" onclick="moreTrip();" style="margin-left:45%; border:0; background:white;">+더보기</button>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="row" id="trip2_thumb">
					<% for(HashMap<String,Object> map : tlist) { %>
					
					<div class="col-md-6"> 
	    				<div class="thumbnail">
	    					<a href="상세 페이지.html" target="_blank">
	    						<img src="resources/images/<%= map.get("change_name") %>.jpg" class="img" style="height:190px;">
	    							<div class="caption">
	    								<p><%=map.get("t_name") %></p>
	    								<p id="score"><%=map.get("score") %>점</p>
	    								<p id="price"><%=map.get("price") %></p>
	    							</div>
	    					</a>
	    				</div>
	    			</div>
	    			<% } %>
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
				 
				 $('#keyword').val('<%= location %>'); 
				<% if (checkin == ""||checkout=="") { %> 
				 if($('#keyword').val() != "" && $('#keyword').val() != "null"){
					 search();
				 } else {
					var $div = $('#inn2_thumb');
					$div.append("<h3>검색 조건이 없습니다.</h3>");
					
					$div = $('#trip2_thumb');
					$div.append("<h3>검색 조건이 없습니다.</h3>");
				 }
				 <% } %>
			}); 
		</script>
        
         <div class="col-xs-6 hidden-xs" style="position:fixed;top:320px;margin-left:50%;bottom:10px;">
                <div id="map"></div>
                <script>
             // 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
             
                var infowindow = new daum.maps.InfoWindow({zIndex:1});

                var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                    mapOption = {
                        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
                        level: 3 // 지도의 확대 레벨
                    };  

                // 지도를 생성합니다    
                var map = new daum.maps.Map(mapContainer, mapOption); 

                
                // 키워드로 장소를 검색합니다
                
                
                /////////////////////////////////////////////////////
              
                var geocoder = new daum.maps.services.Geocoder();
                
                var addrs = new Array();
                var origin_data = new Array();
                <% for(HashMap<String,Object> map : rlist ){%>
                	var addr1 = '<%=map.get("r_addr")%>'.split("| ");
                	addrs.push(addr1[1]); 
                <% } %>
               
                for(var i = 0; i<addrs.length ;i++){

                	// 주소로 좌표를 검색합니다
	                geocoder.addressSearch(addrs[i], function(result, status) {
	
	                    // 정상적으로 검색이 완료됐으면 
	                     if (status === daum.maps.services.Status.OK) {
	
	                        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
							var subst = coords.toString();
							var tmp = subst.substring(1,subst.length-1);
							
							origin_data.push(tmp);
							///  console.log(origin_data);
							 // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	                        // LatLngBounds 객체에 좌표를 추가합니다
	                        var bounds = new daum.maps.LatLngBounds();

	                        for (var i=0; i<origin_data.length; i++) {
	                        	// console.log('origin_data[i] : '+origin_data[i]);
	                            displayMarker(origin_data[i]);    

	                            var places = origin_data[i].split(", ");
	                        	var resultX = places[1];
	                        	var resultY = places[0];
	                        	
	                            bounds.extend(new daum.maps.LatLng(resultY,resultX));
	                        }       
	                        
	                        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	                        map.setBounds(bounds);
	                    } 
	                }); 

                }
                
                // 지도에 마커를 표시하는 함수입니다
                 function displayMarker(place) {
                	<% for(HashMap<String,Object> map : rlist ){%>
                	var places = place.split(", ");
                	var resultX = places[1];
                	var resultY = places[0];
                	// console.log('resultY : '+resultY);
                	// console.log('resultX : '+resultX);
                	
                    // 마커를 생성하고 지도에 표시합니다
                    var marker = new daum.maps.Marker({
                        map: map,
                        position: new daum.maps.LatLng(resultY, resultX) 
                    });
                    
             
                    // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
                    infowindow.setContent('<div style="width:max-content;padding:5px;font-size:12px;">' +'<%=map.get("price")%>'+ '</div>');
                    infowindow.open(map, marker);
                    
                    <%}%>
                    /* // 마커에 클릭이벤트를 등록합니다
                    daum.maps.event.addListener(marker, 'click', function() {
                        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
                        infowindow.setContent('<div style="width:max-content;padding:5px;font-size:12px;">' + '</div>');
                        infowindow.open(map, marker);
                    }); */
                }

               
               
               
                
                <%-- /////////////////////////////////////////////
                /* if($('#keyword').val().equals('서귀포시')){ */
                ps.keywordSearch('서귀포시', placesSearchCB); 

                // 키워드 검색 완료 시 호출되는 콜백함수 입니다
                function placesSearchCB (origin_data, status, pagination) {
                    if (status === daum.maps.services.Status.OK) {
                       console.log("----- 변경 전 -----");
                       console.log(origin_data); // 원본 데이터
                       
                       // 이후 ajax등을 활용하여 데이터 덮어쓰기
                       // 위도, 경도 찾는 웹 사이트
                       // http://www.iegate.net/maps/rgeogoogle.php
                       console.log('origin_data[0].address_name'+origin_data[0].address_name);
                       <% for(HashMap<String,Object> map : rlist ){%>
                       if((origin_data[0].address_name).includes("서귀포")==true){
                       		console.log(typeof(origin_data[0].address_name));
                    	  var tmp = '<%=map.get("r_loc")%>';
                    	  var loc  = tmp.split(",");
                    	  
                    	   console.log('위도'+loc[0]);
                    	   console.log('경도'+loc[1]);
                    	   
                       origin_data = [
                          { place_name : "test1_서귀포해양도립공원",
                              x : "<%=map.get("r_loc")%>",
                              y : "33.239872" },
                            { place_name : "test2_걸매생태공원",
                             x : "126.554952",
                             y : "33.250029" },
                            { place_name : "test3_백호모텔",
                              x : "126.563581",
                              y : "33.240805" },
                            { place_name : "test4_정방폭포",
                              x : "126.571905",
                              y : "33.244321" },
                       ];
                       console.log("----- 변경 후 -----");
                      console.log(origin_data);
                      
                       }
                      <%}%>
                      
                      
                       
                    } 
                }

               
 --%>
               
                </script>
              
        </div>

    </div>
    </div>

    <br>
    </div>


</body>

</html>
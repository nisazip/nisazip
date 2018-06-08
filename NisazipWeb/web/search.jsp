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
	    	
	    	$("#sortPrice").click(function() {
	
	          
	
	        });
	
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
                <% for(HashMap<String,Object> map : rlist) { %>
                        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                        mapOption = {
                            center: new daum.maps.LatLng(33.499970, 126.535388), // 지도의 중심좌표
                            level: 3 // 지도의 확대 레벨
                        };  
                        
                        //지도를 생성합니다    
                        var map = new daum.maps.Map(mapContainer, mapOption); 
                        
                        //주소-좌표 변환 객체를 생성합니다
                        var geocoder = new daum.maps.services.Geocoder();
                        
                        //주소로 좌표를 검색합니다
                        geocoder.addressSearch('<%= map.get("r_addr")%>', function(result, status) {
                        
                        console.log(r_addr);
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
                                content: '<div style="width:150px;text-align:center;padding:6px 0;">우리 집</div>'
                            });
                            infowindow.open(map, marker);
                        
                            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                            map.setCenter(coords);
                        } 
                        });    
                        
                        <%}%>
                </script>
              
        </div>

    </div>
    </div>

    <br>
    </div>


</body>

</html>
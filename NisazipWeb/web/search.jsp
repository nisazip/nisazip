<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="kh.home.model.vo.*, java.util.*"%>
<%
	ArrayList<Room> rlist = (ArrayList<Room>) request.getAttribute("rlist");
	ArrayList<Trip> tlist = (ArrayList<Trip>) request.getAttribute("tlist");
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
    <script src="../js/jquery-3.3.1.min.js"></script>
    <style>
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

.search {
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
            <div class="row searchbar">
                <div class="col-sm-2"></div>

                &nbsp;&nbsp;&nbsp;
                
                <div class="col-sm-5" style="top:15px;">
	                <input type="text" id="search" placeholder="지역이나 숙소이름을 검색하세요" style="width: 300px; height: 40px;">
	                <a href="search.html" style="color: white">
	                    <button type="button" class="search">검색하기</button>
	                </a>
                </div>

                
                <div class="col-sm-5" style="right:15%;">
				  <div class="row">                
                	<div class="col-sm-2">
                	<button type="button" id="filterBtn" name="filterBtn" data-toggle="modal" data-target="#myModal">필터</button>
                	<div id="myModal" class="modal fade" role="dialog">
					  <div class="modal-dialog">
					
					    <!-- Modal content-->
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
					</div>
                	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <div class="col-sm-2">
	                	<button type="button" id="sortBtn" name="sortBtn">정렬</button>
	          	</div>
	          			
	          			<div class="col-sm-7">
	          			<div class="container">          
						  <div id="sortGroup" class="btn-group">
						    <button type="button" class="btn btn-primary sortGroup">인기순</button>
						    <button type="button" class="btn btn-primary sortGroup">거리순</button>
						    <button type="button" class="btn btn-primary sortGroup">평점순</button>
						    <button type="button" class="btn btn-primary sortGroup">가격순</button>
						  </div>
						</div>
	          	       </div>
	          	       
	          	       
	          	       
                </div>
                <br>
                <br>
            </div>
        <br>
        </div>
        
        <script>
        	
        	$("#sortBtn").click(function() {

                $("#sortGroup").toggle(); 

            });

        </script>
        
  
            	<%
			//[START] TEST FOR NULL ARRAY
			if(rlist != null) {
			for (Room r : rlist) {
		%>
		
			<%
				} } else { %>
				<div class="container room">
			<h2>인기 숙소</h2>
			<div class="row">
				<div class="col-sm-6">
					<div class="row" id="inn2_thumb">
					</div>
				</div>
			</div>
				<% } %>
		</div>
		<script>
			 $(function(){
				$.ajax({
					url:"<%=request.getContextPath()%>/rList.ho",
					type:"get",
					success:function(data){
						// 전체 영역
						var $div = $('#inn2_thumb');
						
						for(var i in data){
							var str = '<div class="col-md-6">' 
								+ '<div class="thumbnail">'
							+'<a href="상세 페이지.html" target="_blank"> '
							+'<img src="'+data[i].file_path+data[i].change_name+'.jpg" class="img" style="height:190px;">'
							+' <div class="caption">'
							+'<p>'+data[i].r_name+'</p>'
							+'<p id="price">'+data[i].price+'</p>'
							+'</div></a></div></div>';
							
							$div.append(str);
						}
					}
				});
			}); 
		</script>
    
              	<%
			//[START] TEST FOR NULL ARRAY
			if(tlist != null) {
			for (Trip t : tlist) {
		%>
		
			<%
				} } else { %>
				<div class="container room">
			<h2>인기 트립</h2>
			<div class="row">
				<div class="col-sm-6">
					<div class="row" id="trip2_thumb">
					</div>
				</div>
			</div>
				<% } %>
		</div>
		<script>
			 $(function(){
				$.ajax({
					url:"<%=request.getContextPath()%>/tList.ho",
					type:"get",
					success:function(data){
						// 전체 영역
						var $div = $('#trip2_thumb');
						
						for(var i in data){
							var str = '<div class="col-md-6">' 
								+ '<div class="thumbnail">'
							+'<a href="상세 페이지.html" target="_blank"> '
							+'<img src="'+data[i].file_path+data[i].change_name+'.jpg" class="img" style="height:190px;">'
							+' <div class="caption">'
							+'<p>'+data[i].t_name+'</p>'
							+'<p id="price">'+data[i].price+'</p>'
							+'</div></a></div></div>';
							
							$div.append(str);
						}
					}
				});
			}); 
		</script>
        
        <div class="col-xs-6 hidden-xs" style="position:fixed;top:320px;margin-left:50%;bottom:10px;">
                <div id="map"></div>
                <script>
                    function initMap() {
                        var uluru = {
                            lat: 33.499466, lng: 126.530418

                        };
                        var map = new google.maps.Map(document.getElementById('map'), {
                            zoom: 12,
                            center: uluru
                        });
                        var marker = new google.maps.Marker({
                            position: uluru,
                            map: map
                        });
                    }
                </script>
                <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBUmuy9dG2U1qXJBPEFCf7rFpDdsyZY-4k&callback=initMap">
                </script>
        </div>

    </div>
    </div>

    <br>
    </div>


</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=912ba5ded38a05dd53c37b8850dd2427&libraries=services"></script>

<title>메인페이지</title>
</head>
<body>
<%@ include file ="views/common/header.jsp" %>

<pre>














<a href="views/manager/admin_home.jsp">관리자 페이지로 이동</a>
</pre>
<!-- 지도 영역 -->
<div id="map" style="width:500px;height:400px;"></div>
<!-- GoogoleMap Asynchronously Loading the API ********************************************* -->
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
	    center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};  
	
	//지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption); 
	
	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();
	
	//주소로 좌표를 검색합니다
	geocoder.addressSearch('경기 안양시 동안구 경수대로610번길 31 (호계동, 무궁화태영아파트 상가동)', function(result, status) {
	
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
</script>



</body>

</html>
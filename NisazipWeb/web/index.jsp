<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=912ba5ded38a05dd53c37b8850dd2427&libraries=services"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<title>메인페이지</title>
</head>
<body>
<%@ include file ="views/common/header.jsp" %>

<pre>














<a href="views/manager/admin_home.jsp">관리자 페이지로 이동</a>
<button onclick="reservation();">예약하기</button>




<a href="<%= request.getContextPath()%>/messageList.m">메세지 목록</a> <br />
	 <a href="views/message/messageSend.jsp">메시지 보내기</a> <br /> // 여기서 시작해야됨 .
	 
<h1><a href="views/report/reportSend.jsp">신고하기</a></h1> <br /><br />
<h1><a href="views/review/review.jsp">후기</a></h1>

</pre>
<!-- 지도 영역 -->
<div id="map" style="width:500px;height:400px;"></div>
<!-- GoogoleMap Asynchronously Loading the API ********************************************* -->
<script>

/* 지도 영역 script */
	//랜덤 함수(정수)
	function makeRandom(min, max){
	    var RandVal = Math.random() * (max- min) + min;
	    return RandVal;
	}

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
	    center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	    level: 5 // 지도의 확대 레벨
	};  
	
	//지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption); 
	
	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();
	
	//주소로 좌표를 검색합니다
	geocoder.addressSearch('제주특별자치도 제주시 첨단로 242', function(result, status) {
		/* 제주특별자치도 제주시 공항로 2 (용담2동, 국제공항) */
	// 정상적으로 검색이 완료됐으면 
	 if (status === daum.maps.services.Status.OK) {
	
	    var coords = new daum.maps.LatLng(result[0].y, result[0].x);
	
	    // 결과값으로 받은 위치를 마커로 표시합니다
        /*  var marker = new daum.maps.Marker({
	        map: map,
	        position: coords
	    }); */
	
	    // 인포윈도우로 장소에 대한 설명을 표시합니다
	   /*  var infowindow = new daum.maps.InfoWindow({
	        content: '<div style="width:150px;text-align:center;padding:6px 0;">니네 집</div>'
	    }); */
	    /* infowindow.open(map, marker); */
/* 	    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	    map.setCenter(coords); */
	    var randomx = makeRandom(-0.003500000000000,0.003500000000000);
	    var randomy = makeRandom(-0.003500000000000,0.003500000000000);
	    
	    console.log(result[0].y);
	    console.log(result[0].x);

	    console.log(randomx);
	    console.log(randomy);
	    
	    var xxx = result[0].y*1;
	    var yyy = result[0].x*1;
	    
	    var yrandom = xxx+randomx;
	    var xrandom = yyy+randomy;
	    
	    xrandom+="";
		yrandom+="";	

	    console.log(yrandom);
	    console.log(xrandom);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(new daum.maps.LatLng(yrandom, xrandom));
	    // 지도에 표시할 원을 생성합니다
	    var circle = new daum.maps.Circle({

	    	/* center : new daum.maps.LatLng(result[0].y, result[0].x),  // 원의 중심좌표 입니다  */
	    	center : new daum.maps.LatLng(yrandom, xrandom),  // 원의 중심좌표 입니다 
	        radius: 450, // 미터 단위의 원의 반지름입니다 
	        strokeWeight: 3, // 선의 두께입니다 
	        strokeColor: '#63f25c', // 선의 색깔입니다
	        strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	        strokeStyle: 'dashed', // 선의 스타일 입니다
	        fillColor: '#a0ff9b', // 채우기 색깔입니다
	        fillOpacity: 0.7  // 채우기 불투명도 입니다   
	    }); 

	    // 지도에 원을 표시합니다 
	    circle.setMap(map); 

	} 
	}); 
/* 지도 영역 script 끝 */

    function reservation(){
    	var IMP = window.IMP; // 생략가능
    	IMP.init('imp76658870'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
    	
    	IMP.request_pay({
    	    pg : 'inicis', // version 1.1.0부터 지원.
    	    pay_method : 'card',
    	    merchant_uid : 'merchant_' + new Date().getTime(),
    	    name : '주문명: 숙소 예약결제',
    	    amount : 200,
    	    buyer_email : 'iamport@siot.do',
    	    buyer_name : '이원준',
    	    buyer_tel : '010-1234-5678',
    	    buyer_addr : '서울특별시 강남구 삼성동',
    	    buyer_postcode : '123-456'
    	   
    	}, function(rsp) {
    	    if ( rsp.success ) {
    	        var msg = '결제가 완료되었습니다.';
    	        msg += '고유ID : ' + rsp.imp_uid;
    	        msg += '상점 거래ID : ' + rsp.merchant_uid;
    	        msg += '결제 금액 : ' + rsp.paid_amount;
    	        msg += '카드 승인번호 : ' + rsp.apply_num;
    	        
    	        changePage();
    	        
    	    } else {
    	        var msg = '결제에 실패하였습니다.';
    	        msg += '에러내용 : ' + rsp.error_msg;
    	    }
    	    alert(msg);
    	});
    }
        
  
		function changePage(){
			alert('changePage()실행');
			location.href="<%=request.getContextPath()%>/home.jsp";
		}
 
</script>



</body>

</html>
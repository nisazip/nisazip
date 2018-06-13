<%@page import="com.sun.xml.internal.bind.v2.schemagen.xmlschema.Import"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="kh.room.model.vo.Room"%>
<%
	Room r = (Room)request.getAttribute("room");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.3.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
body,h1,h2,h3,h4,h5 {font-family: "Poppins", sans-serif}
body {font-size:16px;}
/* .w3-half img{margin-bottom:-6px;margin-top:16px;opacity:0.8;cursor:pointer}
.w3-half img:hover{opacity:1} */
</style>
<body>
	<%-- <div class="w3-top">
        <div class="w3-bar w3-white w3-card">
          <a href="#" class="w3-padding-large w3-button w3-right">로그인</a>
          <a href="#" class="w3-padding-large w3-button w3-right">마이페이지</a>
          <a href="#" class="w3-padding-large w3-button w3-right">메시지</a>
          <div class="w3-dropdown-hover w3-right">
              <button class="w3-padding-large w3-button">호스팅 <i class="fa fa-caret-down"></i></button>     
              <div class="w3-dropdown-content w3-bar-block w3-card-4">
                <a href="<%=request.getContextPath()%>/view/Room.jsp" class="w3-bar-item w3-button" id="home">숙소</a>
                <a href="#" class="w3-bar-item w3-button" id="trip">트립</a>
                                               
              </div>
            </div>
          <a href="#" class="w3-bar-item w3-padding-large w3-button w3-right">트립보기</a>
          <a href="#" class="w3-bar-item w3-padding-large w3-button w3-right">숙소보기</a>
          <a href="<%=request.getContextPath()%>/view/semi.html" class="w3-bar-item w3-padding-large w3-button w3-right">홈</a>
        </div>
      </div> --%>
      <%@ include file="../common/header.jsp" %>  <br /><br /><br /><br /><br /><br /><br /><br /><br />
<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-green w3-collapse w3-top w3-large w3-padding" style="z-index:0;width:300px;font-weight:bold;" id="mySidebar"><br>
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-hide-large w3-display-topleft" style="width:100%;font-size:22px">Close Menu</a>
  <div class="w3-container">
    <h3 class="w3-padding-64"></h3>
  </div>
  <div class="w3-bar-block">
    
    <a href="<%=request.getContextPath()%>/views/room/RoomInsert.jsp" class="w3-bar-item w3-button w3-hover-white">숙소 등록하기</a>  
    <div class="w3-bar-item w3-button w3-hover-white" onclick="location.href='<%=request.getContextPath()%>/roomselectList.no'">등록 숙소 보기</div> 
    <div class="w3-bar-item w3-button w3-hover-white" onclick="location.href='<%=request.getContextPath()%>/Rstatistics.no'">통계 페이지</div>
    <div class="w3-bar-item w3-button w3-hover-white" onclick="location.href='<%=request.getContextPath()%>/roomReservationList.no'">등록 숙소 예약자 명단</div>
</div>
</nav>
<!-- Header -->
	<div class="w3-container" id="showcase">
		<h1 class="w3-center" style="font-size: 48pt;">
			<b>4단계</b>
		</h1>
	</div>
	<br>
	<br>
	<form id="joinForm1" action="<%=request.getContextPath()%>/rInsert4.do" method="post" encType="multipart/form-data">

		<!-- <div style="font-weight: bold; font-size: 29px;" class="w3-center">
			○회원님의 숙소의 사진을 등록해주세요.<br>
			<div class="w3-green">
			<a href="" class="w3-padding-large w3-button w3-center">사진을 등록해주세요</a>
			<article>
				<p id="status"></p>
				<p><input type=file style="margin-left: 250px;" name="R_PIC"></p>
				<div id="holder"></div>
			</article>
			</div>
			<p>※최소 3장은 입력해야 게스트가 참고할수있습니다..</p> -->
			<div class="w3-container" style="margin-top:60px; display:flex; justify-content: center " id="showcase">
    <div style="  float:left; width:70%; height:300px;">
        <h1 class="w3-center"><b></b></h1>
        <div style="font-weight: bold; font-size: 29px;" class="w3-center">
         <div class="w3-white" style="width:1030px;">
         <a href="" style="font-size:25px; margin-left:400px;" class="w3-padding-large w3-button w3-center">사진을 등록해주세요</a>
            <table border="1" style="margin-left:200px; width:1000px;">
				<tr>
					<td style="width:400px; background:skyblue;">대표 사진</td>
					<td style="width:300px; background:skyblue;">서브 사진</td>
					<td style="width:300px; background:skyblue;">서브 사진2</td>
				</tr>
				<tr>
					<td colspan="1" style="height:400px;">
						<div id="titleImgArea1" >
							<img id="titleImg" name="R_PIC" width="400px;" height="400px;">
						</div>
					</td>
					<td>
						<div id="contentImgArea2">
							<img id="contentImg1" name="R_PIC2" width="300px;" height="400px;">
						</div>
					</td>
					<td>
						<div id="contentImgArea3">
							<img id="contentImg2" name="R_PIC3" width="300px;" height="400px;">
						</div>
					</td>
				</tr>
			</table>
            <div id="fileArea">
				<input type="file" id="thumbnailImg1" multiple="multiple" name="thumbnailImg1" onchange="LoadImg(this,1)">
				<input type="file" id="thumbnailImg2" multiple="multiple" name="thumbnailImg2" onchange="LoadImg(this,2)">
				<input type="file" id="thumbnailImg3" multiple="multiple" name="thumbnailImg3" onchange="LoadImg(this,3)">
			</div>
			<br>
         </div>
         <p>※ 3장은 입력해야 게스트가 참고 할 수 있습니다..</p>
 		
      </div>   	  
    </div>
		<button style="margin-top: 300px; width: 100px; height: 100px; background: green;"><a style="color: white;" href="<%=request.getContextPath()%>/views/room/RoomInsert3.jsp">이전단계</a></button>
		<button style="margin-top: 300px; width: 100px; height: 100px; color: white; background: green" onclick="insertR()">다음단계</button>
		</div>
		
	</form>	
	
	<script>
		 /* var upload = document.getElementsByTagName('input')[0], holder = document
				.getElementById('holder'), state = document
				.getElementById('status');

		if (typeof window.FileReader === 'undefined') {
			state.className = 'fail';
		} else {
			state.className = 'success';
			state.innerHTML = '';
		}

		upload.onchange = function(e) {
			e.preventDefault();

			var file = upload.files[0], reader = new FileReader();
			reader.onload = function(event) {
				var img = new Image();
				img.src = event.target.result;
				// note: no onload required since we've got the dataurl...I think! :)
				if (img.width > 560) { // holder width
					img.width = 560;
				}
				holder.innerHTML = '';
				holder.appendChild(img);
			};
			reader.readAsDataURL(file);

			return false;
		}; */
 
		$( "#joinForm1" ).submit(function( event ) {
			var p1 = $('#thumbnailImg1').val();
			var p2 = $('#thumbnailImg2').val();
			var p3 = $('#thumbnailImg3').val();
			
			
	   if(p1 == "" || p2 == "" || p3 == ""){
	   	alert("사진을 등록해주세요.");
	   } else {
	        return true;
	   }
			 event.preventDefault();
		});
		
		$(function(){
			$("#fileArea").hide();
				
			$("#titleImgArea1").click(function(){
				$("#thumbnailImg1").click();
			});
			$("#contentImgArea2").click(function(){
				$("#thumbnailImg2").click();
			});
			$("#contentImgArea3").click(function(){
				$("#thumbnailImg3").click();
			});
		});

		function LoadImg(value, num) {
			if (value.files && value.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					switch(num){
					case 1:
						$("#titleImg").attr("src", e.target.result);
						break;
					case 2:
						$("#contentImg1").attr("src", e.target.result);
						break;
					case 3:
						$("#contentImg2").attr("src", e.target.result);
						break;
					}
				}
				reader.readAsDataURL(value.files[0]);
			}
		}
		
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style>
#titleImgArea {
			width:350px;
			height:200px;
			border:2px dashed darkgray;
			text-align:center;
			display:table-cell;
			vertical-align:middle;
		}
		#titleImgArea1:hover, 
		#contentImgArea2:hover, 
		#contentImgArea3:hover {
			cursor:pointer;
		}
		#titleImgArea1, #contentImgArea2, #contentImgArea3 {
			width:150px;
			height:100px;
			border:2px dashed darkgray;
			text-align:center;
			display:table-cell;
			vertical-align:middle;
		}
</style>
</head>

<body>
	<%@ include file="../common/trip_header.jsp"%>
	<!-- !PAGE CONTENT! -->
	<form action="<%=request.getContextPath()%>/insertPicture.trip" method="post" encType="multipart/form-data">
<div class="w3-main" style="margin-left:340px;margin-right:40px">

  <!-- Header -->
  <div class="w3-container" style="margin-top:80px" id="showcase">
    <h1 class="w3-jumbo"><b>트립 등록하기</b></h1>
    <h1 class="w3-xxxlarge w3-text-green"><b>Ninth.</b></h1>
    <hr style="width:50px;border:5px solid green" class="w3-round">
  </div>
  
  <!-- Photo grid (modal) -->
  <div class="w3-container" style="margin-top:60px; display:flex; justify-content: center " id="showcase">
    <div style="  float:left; width:70%; height:300px;">
        <h1 class="w3-center"><b>커버 이미지 만들기</b></h1>
        <div style="font-weight: bold; font-size: 29px;" class="w3-center">
         <div class="w3-green" style="width:1030px;">
         <a href="" style="font-size:25px;" class="w3-padding-large w3-button w3-center">사진을 등록해주세요</a>
            <table border="1" style="margin:auto; width:1000px;">
				<tr>
					<td style="width:400px; background:skyblue;">대표 사진</td>
					<td style="width:300px; background:skyblue;">First Trip 사진</td>
					<td style="width:300px; background:skyblue;">Second Trip 사진</td>
				</tr>
				<tr>
					<td colspan="1" style="height:400px;">
						<div id="titleImgArea1" >
							<img id="titleImg" name="pic1" width="400px;" height="400px;">
						</div>
					</td>
					<td>
						<div id="contentImgArea2">
							<img id="contentImg1" name="pic2" width="300px;" height="400px;">
						</div>
					</td>
					<td>
						<div id="contentImgArea3">
							<img id="contentImg2" name="pic3" width="300px;" height="400px;">
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
    <div style="margin-left:70px; width:30%;"> <!-- padding:70px; ? -->
            <a onclick="this.nextSibling.style.display=(this.nextSibling.style.display=='none')?'block':'none';" href="javascript:void(0)"> 
              <추천>
              </a><div style="DISPLAY: none">
              <ul style="list-style:none; text-align:left; font-size:15px;">
                  <li><img src="resources/images/체크(그레이).PNG" style="width:5%; height:5%;">첫 번째 사진과 제목은 책 표지와도 같습니다.<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;사람들의 눈에 가장 먼저 띄는 부분이에요.</li>
                  <br>
                  <li><img src="resources/images/체크(그레이).PNG" style="width:5%; height:5%;">활동적이고 솔직한 모습이 드러나는 사진을 선택하세요.</li>
                  <br>
                  <li><img src="resources/images/체크(그레이).PNG" style="width:5%; height:5%;">조명이 밝은 장소에서 사진을 찍으세요.</li>
                  <br>
                  <li><img src="resources/images/체크(그레이).PNG" style="width:5%; height:5%;">세로로 긴 사진이 가장 적합합니다.</li>
              </ul>
              </div>
              <div style="font-weight: bold; font-size: 29px; text-align:left;" class="w3-center">
      			<br><br>
      
			</div> 
          </div>
      </div>
  
      
</div>
<div style="text-align:right; margin-right:100px;">
	 <a href="views/regist/8trip_reservation.jsp" id="btn_style" class="w3-padding-large w3-button w3-center">이전단계</a>&nbsp;&nbsp;
     <button type="submit" id="btn_style" class="w3-padding-large w3-button w3-center">다음단계</button>
</div>
</form>
<script>
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
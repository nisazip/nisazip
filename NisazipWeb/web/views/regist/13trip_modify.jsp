<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="kh.trip.model.vo.*, java.util.*"%>

<%!
// 선언자 태그라고 해서 특정 함수를 선언하거나 할 때 사용합니다.
	public String myDateChange(String str){
		String[] dateSplit = str.split("/");
		return dateSplit[0]+"년 "+dateSplit[1]+"월 "+dateSplit[2]+"일";
	}
%>
<%
	Trip tr = (Trip) request.getAttribute("tregist");
	Attachment hp = (Attachment) request.getAttribute("hp");
	
	/* 원하는 시간포맷으로 변경하기 */
	// SimpleDateFormat 만약 Date / Timestamp 타입으로 올 경우 이걸 사용하시면 됩니다.
	// 이게 아닌 경우는 날짜 월 일 정보를 직접 변경해주셔야 합니다.
	/* 
	String[] startDateFormat = tr.getTrip_stratReservation().split("/");
	String startDate = startDateFormat[0] + "년 " + startDateFormat[1] + " 월" + startDateFormat[2] + "일" ;
	
	String[] endDateFormat = tr.getTrip_endReservation().split("/");
	String endDate = endDateFormat[0] + "년 " + endDateFormat[1] + " 월" + endDateFormat[2] + "일" ; */
	// String startDateFormat = myDateChange(tr.getTrip_stratReservation());
	// String endDateFormat = myDateChange(tr.getTrip_endReservation());
			
	/* 세션이 아닌 것을 사용 해야함 */
	ArrayList<Attachment> fileList = (ArrayList<Attachment>)request.getAttribute("picList");
	
	Attachment titleImg = fileList.get(0);
	Attachment detailImg1 = fileList.get(1);
	Attachment detailImg2 = fileList.get(2);
	
%>

<!DOCTYPE html>

<html>
 <head>
 <style>
#pic1, #pic2, #pic3 {
				width:420px;
			} 
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
 	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet"
		href="https://fonts.googleapis.com/css?family=Poppins">
	<link rel="stylesheet"
		href="https://fonts.googleapis.com/css?family=Roboto">
	<link rel="stylesheet"
		href="https://fonts.googleapis.com/css?family=Montserrat">
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet"
		href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
		<link rel="stylesheet"
		href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
	<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
	<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
	<!-- <link rel="stylesheet" href="/resources/demos/style.css" /> -->
 </head>
<body>
	
	<%@ include file="../common/header.jsp"%><br><br><br><br><br><br>
	
	<nav class="w3-sidebar w3-green w3-collapse w3-top w3-large"
		style="z-index: 3; width: 300px; font-weight: bold; padding-top: 0px !important;"
		id="mySidebar">
		<br> <a href="javascript:void(0)" onclick="w3_close()"
			class="w3-button w3-hide-large w3-display-topleft"
			style="width: 100%; font-size: 22px">Close Menu</a>
		<div id="memberJoin"
			style="width: 300px; height: 80px; font-size: 13px; background: white;margin-top: 5px;">
		</div>
		<div class="w3-bar-block w3-padding">
			<div class="w3-bar-item w3-button w3-hover-white" onclick="location.href='<%=request.getContextPath()%>/views/regist/1trip_name.jsp'">트립 등록하기</div> <br>
			<div class="w3-bar-item w3-button w3-hover-white" onclick="location.href='<%=request.getContextPath()%>/tripSelectList.trip'">등록된 Trip 보기</div><br>
			<div class="w3-bar-item w3-button w3-hover-white" onclick="location.href='<%=request.getContextPath()%>/TripReservationList.trip'">등록 Trip 예약자 명단</div> <br> 
			<div class="w3-bar-item w3-button w3-hover-white" onclick="location.href='<%=request.getContextPath()%>/Trip_statistics.trip'">My Trip 통계보기</div>
		</div>
	</nav>
	<form id="updateForm" method="post" encType="multipart/form-data">
		<div class="w3-main" style="margin-left: 340px; margin-right: 40px">
			<!-- Header -->
			<div class="w3-container" style="margin-top: 80px" id="showcase">
				<h1 class="w3-center" style="font-size: 38pt;">
					<b> <i> 등록한 Trip 수정</i>
					</b>
				</h1>
				<hr style="width: 50px; border: 5px solid green" class="w3-round">
			</div>

			<!-- Photo grid (modal) -->
			<div style="font-weight: bold; font-size: 29px;" class="w3-center">
				<div style="width: 1400px;">
					<div style="width: 1400px; margin:auto;">
						<table border="1" style="width:1400px; height:800px; color:black;">
							<tr>
								<td style="width: 250px">트립 제목</td>
								<td style= "width: 730px; text-align: left; padding-left: 20px;">
									<input name="reTitle" style="width: 100%; border: none; background: white; color: black;" size="50" type="text" value="<%=tr.getT_name()%>"/>
								</td>
								<td style= "width: 420px;">대표 사진</td>
							</tr>
							<tr>
								<td>트립 가격</td>
								<td style="text-align: left; padding-left: 20px;">
									<input name="rePrice" style="width: 100%; border: none; background: white; color: black;" size="50" type="number" value="<%=tr.getPrice()%>"/>
								</td>
								<td rowspan="4">
									<div id="titleImgArea1" >
										<img name="pic1" id="titleImg" width="550px;" height="300px;" src="<%=request.getContextPath() %>/resources/trip_images/<%= titleImg.getChange_name() %>"/>
										<%-- <img id="titleImg" name="pic1" width="400px;" height="300px;" src="<%=request.getContextPath() %>/resources/trip_images/<%= tr.getPic1() %>"> --%>
									</div>
								</td>
							</tr>
							<tr>
								<td>트립 언어</td>
								<td style="text-align: left; padding-left: 20px;"><input name="reLanguage" style="width: 100%; border: none; background: white; color: black;" size="50" type="text"  value="<%=tr.getLanguage()%>"/></td>
								
							</tr>
							<tr>
								<td>트립 유형</td>
								<td style="text-align: left; padding-left: 20px;"><input name="reCategory" style="width: 100%; border: none; background: white; color: black;" size="50" type="text"  value="<%=tr.getT_type()%>"/></td>
								
							</tr>
							<tr>
								<td>트립 인원</td>
								<td style="text-align: left; padding-left: 20px;"><input name="rePeople" style="width: 100%; border: none; background: white; color: black;" size="50" type="number"  value="<%=tr.getT_max_num()%>"/></td>
								
							</tr>
							<tr>
								<td>트립 설명</td>
								<td style="text-align: left; padding-left: 20px;"><input name="reIntroduce" style="width: 100%; border: none; background: white; color: black;" size="50" type="text"  value="<%=tr.getT_detail()%>"/></td>
								<td></td>
							</tr>
							<tr>
								<td>우편번호</td>
								<td style="text-align: left; padding-left: 20px;">
									<input name="reZip" style="width: 100%; border: none; background: white; color: black;" size="50"  type="text" id="zip"  />
								</td>
								<td rowspan="3">
									<div id="contentImgArea2">
										<img name="pic2" id="contentImg1" name="pic2"  width="550px;" height="300px;" src="<%=request.getContextPath() %>/resources/trip_images/<%= detailImg1.getChange_name() %>"/>
										<%-- <img id="contentImg1" name="pic2" width="400px;" height="300px;" src="<%=request.getContextPath() %>/resources/trip_images/<%= tr.getPic2() %>"> --%>
									</div>
								</td>
							</tr>
							<tr>
								<td>주소</td>
								<td style="text-align: left; padding-left: 20px;">
									<input name="reAddr" style="width: 100%; border: none; background: white; color: black;" size="50" type="text" id="addr"  />
								</td>
								
							</tr>
							<tr>
								<td>상세 주소</td>
								<td style="text-align: left; padding-left: 20px;">
									<input name="reAddr_detail" style="width: 100%; border: none; background: white; color: black;" size="50" type="text" id="addr_detail"  />
								</td>
								
							</tr>
							<tr>
								<td>시작 시간</td>
								<td style="text-align: left; padding-left: 20px;">
									<input name="reStartTime" style="width: 100%; border: none; background: white; color: black;" size="50" type="text"  value="<%=tr.getT_start_time()%>"/>
								</td>
								<td></td>
							</tr>
							<tr>
								<td>종료 시간</td>
								<td style="text-align: left; padding-left: 20px;">
									<input name="reEndTime" style="width: 100%; border: none; background: white; color: black;" size="50" type="text"  value="<%=tr.getT_end_time()%>"/>
								</td>
								<td rowspan="3">
									<div id="contentImgArea3">
										<img id="contentImg2" name="pic3" width="550px;" height="300px;" src="<%=request.getContextPath() %>/resources/trip_images/<%= detailImg2.getChange_name() %>"/>
										<%-- <img id="contentImg2" name="pic3" width="400px;" height="300px;" src="<%=request.getContextPath() %>/resources/trip_images/<%= tr.getPic3() %>"> --%>
									</div>
								</td>
							</tr>
							<tr>
								<td>예약 시작 기간</td>
								<td style="text-align: left; padding-left: 20px;">
									<input name="reStartReservation" 
									style="width: 100%; border: none; background: white; color: black;" 
									size="50" type="text" value="<%=myDateChange(tr.getT_start_date())%>"/>
								</td>
								
							</tr>
							<tr>
								<td>예약 종료 기간</td>
								<td style="text-align: left; padding-left: 20px;">
									<input name="reEndReservation" style="width: 100%; border: none; background: white; color: black;" size="50" type="text"  value="<%=myDateChange(tr.getT_end_date())%>"/>
								</td>
							</tr>
						</table>
						<div id="fileArea">
							<input type="file" id="thumbnailImg1" multiple="multiple" name="thumbnailImg1" onchange="LoadImg(this,1)">
							<input type="file" id="thumbnailImg2" multiple="multiple" name="thumbnailImg2" onchange="LoadImg(this,2)">
							<input type="file" id="thumbnailImg3" multiple="multiple" name="thumbnailImg3" onchange="LoadImg(this,3)">
						</div>
						<br>
						<br>
						<button type="submit" id="btn_style" onclick="complete();" >수정 완료</button>&nbsp;&nbsp;
						<button id="btn_style" onclick="">취소</button>
						<br>
						<br>
					</div>
				</div>
			</div>
			</div>
	</form>
	<script>
		$(function(){
			var addr = '<%=tr.getT_addr()%>'.split('| ');
			$('#zip').val(addr[0]);
			$('#addr').val(addr[1]);
			$('#addr_detail').val(addr[2]);
	
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
		
	 function complete(){
	       $("#updateForm").attr("action","<%=request.getContextPath() %>/modifiedTrip.trip");
	       
	    }
	 <%--     
	    function deleteTrip(){
	       // delete 는 예약어 이므로 deleteNotice 로 ...!
	       $("#updateForm").attr("action","<%=request.getContextPath() %>/deleteBoard.bo");
	    } --%>
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="kh.trip.model.vo.*, java.util.*"%>

<%
	Trip tr = (Trip) request.getAttribute("tregist");
	Attachment hp = (Attachment) request.getAttribute("hp");
	
	ArrayList<Attachment> fileList = (ArrayList<Attachment>)request.getAttribute("picList");
	
	Attachment titleImg = fileList.get(0);
	Attachment detailImg1 = fileList.get(1);
	Attachment detailImg2 = fileList.get(2);

	String resMsg1 ="";
	resMsg1 = (String)request.getAttribute("resMsg1");
	String resMsg2 ="";
	resMsg2 = (String)request.getAttribute("resMsg2");
	String resMsg3 ="";
	resMsg3 = (String)request.getAttribute("resMsg3");
	
	String modifyMsg1 ="";
	modifyMsg1 = (String)request.getAttribute("modifyMsg1");
	String modifyMsg2 ="";
	modifyMsg2 = (String)request.getAttribute("modifyMsg2");
	String modifyMsg3 ="";
	modifyMsg3 = (String)request.getAttribute("modifyMsg3");
	
%>
<%!
// 선언자 태그라고 해서 특정 함수를 선언하거나 할 때 사용합니다.
	public String myDateChange(String str){
		String[] dateSplit = str.split("/");
		return dateSplit[0]+"년 "+dateSplit[1]+"월 "+dateSplit[2]+"일";
	}

%>
<!DOCTYPE html>
<html>
 <head>
 <style>
#pic1, #pic2, #pic3 {
				width:420px;
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
	<!-- !PAGE CONTENT! -->
		<div class="w3-main" style="margin-left: 340px; margin-right: 40px">
			<!-- Header -->
			<div class="w3-container" style="margin-top: 80px" id="showcase">
				<h1 class="w3-jumbo">
					<b>등록한 Trip 정보</b><br> <br>
					<h3 class="w3-center">
						<b>등록한 숙소 정보 (호스트 용)</b> &nbsp; 
						 <button type="button" class="w3-padding-large w3-button w3-center" id="btn_style" onclick="location.href='<%=request.getContextPath()%>/modifyTrip.trip?tripNumber=<%=tr.getT_id()%>'">Trip 수정</button>&nbsp; 
						 <button type="button" id="btn_style" onclick="location.href='<%=request.getContextPath()%>/deleteTrip.trip?TripNum=<%=tr.getT_id()%>'">Trip 삭제</button>&nbsp;
						 <input type="button" id="btn_style" value="게스트용" onclick="location.href='<%=request.getContextPath() %>/registedTrip_guest.trip?TripNum=<%=tr.getT_id()%>'">&nbsp;
						 <a id="btn_style" onclick="goMain();">메인으로</a>
					</h3>
				</h1>
			</div>
			<hr style="width: 50px; border: 5px solid green" class="w3-round">
		</div>

			<!-- Photo grid (modal) -->
			<div class="w3-container" style="margin-top: 80px" id="showcase">

			</div>
			<form id="updateForm" action="" method="post" encType="multipart/form-data">
			<div style="font-weight: bold; font-size: 29px;" class="w3-center">
				<div style="width: 1400px; margin-left:300px;">
					<div style="width: 1400px; margin:auto;">
						<table border="1" style="width:1400px; height:800px;">
							<tr>
								<td style="width: 250px">트립 제목 </td>
								<td style= "width: 730px; text-align: left; padding-left: 20px;"><input style="width: 100%; border: none; background: white; color: black;" size="50" type="text" disabled value="<%=tr.getT_name()%>"/></td>
								<td style= "width: 420px;">대표 사진</td>
							</tr>
							<tr>
								<td>트립 가격</td>
							
								<td style="text-align: left; padding-left: 20px;"><%=tr.getPrice()%>원</td>
								<td rowspan="4">
									<img id="pic1" src="<%=request.getContextPath() %>/resources/trip_images/<%= titleImg.getChange_name() %>"/>
								</td>
							</tr>
							<tr>
								<td>트립 언어</td>
								<td style="text-align: left; padding-left: 20px;"><%=tr.getLanguage()%></td>
								
							</tr>
							<tr>
								<td>트립 유형</td>
								<td style="text-align: left; padding-left: 20px;"><%=tr.getT_type()%></td>
								
							</tr>
							<tr>
								<td>트립 인원</td>
								<td style="text-align: left; padding-left: 20px;"><%=tr.getT_max_num()%></td>
								
							</tr>
							<tr>
								<td>트립 설명</td>
								<td style="text-align: left; padding-left: 20px;"><%=tr.getT_detail()%></td>
								<td></td>
							</tr>
							<tr>
								<td>우편번호</td>
								<td style="text-align: left; padding-left: 20px;">
									<input name="zip" style="width: 100%; border: none; background: white; color: black;" size="50"  type="text" id="zip" disabled />
								</td>
								<td rowspan="3">
									<img id="pic2" src="<%=request.getContextPath() %>/resources/trip_images/<%= detailImg1.getChange_name() %>"/>
								</td>
							</tr>
							<tr>
								<td>주소</td>
								<td style="text-align: left; padding-left: 20px;">
									<input name="addr" style="width: 100%; border: none; background: white; color: black;" size="50" type="text" id="addr" disabled />
								</td>
								
							</tr>
							<tr>
								<td>상세 주소</td>
								<td style="text-align: left; padding-left: 20px;">
									<input name="addr_detail" style="width: 100%; border: none; background: white; color: black;" size="50" type="text" id="addr_detail" disabled />
								</td>
								
							</tr>
							<tr>
								<td>시작 시간</td>
								<td style="text-align: left; padding-left: 20px;"><%=tr.getT_start_time()%></td>
								<td></td>
							</tr>
							<tr>
								<td>종료 시간</td>
								<td style="text-align: left; padding-left: 20px;"><%=tr.getT_end_time()%></td>
								<td rowspan="3">
									<img id="pic3" src="<%=request.getContextPath() %>/resources/trip_images/<%= detailImg2.getChange_name() %>"/>
								</td>
							</tr>
							<tr>
								<td>예약 시작 기간</td>
								<td style="text-align: left; padding-left: 20px;"><%=myDateChange(tr.getT_start_date())%></td>
								
							</tr>
							<tr>
								<td>예약 종료 기간</td>
								<td style="text-align: left; padding-left: 20px;"><%=myDateChange(tr.getT_end_date())%></td>
							</tr>
						</table>
						<br>
						<br>
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
			
			if("<%=resMsg1%>" != "null"){
				alert("<%=resMsg1%>\n<%=resMsg2%>\n<%=resMsg3%>");
				
			}
			
			if("<%=modifyMsg1%>" != "null"){
				alert("<%=modifyMsg1%>\n<%=modifyMsg2%>\n<%=modifyMsg3%>");
			}

		});
		
		<%-- function deleteTrip(){
			$('#updateForm').attr("action","<%=request.getContextPath()%>/deleteTrip.trip?TripNum=<%=tr.getTno()%>");
			} --%>
		
		
	</script>
</body>
</html>
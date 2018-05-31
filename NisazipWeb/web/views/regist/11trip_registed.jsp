<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="kh.trip.model.vo.*, java.util.*"%>
<%
	TripRegist tr = (TripRegist) session.getAttribute("tregist");
%>
<!DOCTYPE html>
<html>
<head>
<style>
#pic1, #pic2, #pic3 {
				width:420px;
			} 
</style>
</head>
<body>
	<%@ include file="../common/trip_header.jsp"%>
	<!-- !PAGE CONTENT! -->
	<form action="<%=request.getContextPath()%>/registedTrip.trip" method="post">
		<div class="w3-main" style="margin-left: 340px; margin-right: 40px">

			<!-- Header -->
			<div class="w3-container" style="margin-top: 80px" id="showcase">
				<h1 class="w3-jumbo">
					<b>등록한 Trip 정보</b><br> <br>
					<h3 class="w3-center">
						<b>등록한 숙소 정보 (호스트 용)</b> &nbsp; 
						 <a href="<%=request.getContextPath() %>/views/regist/13trip_modify.jsp" id="btn_style" class="w3-padding-large w3-button w3-center">수정하기</a>&nbsp; 
						 <input type="button" id="btn_style" value="게스트용" onclick="location.href='<%=request.getContextPath() %>/views/regist/12trip_registed(guest).jsp'">&nbsp; 
						 <a id="btn_style" onclick="goMain();">메인으로</a>
					</div>
					</h3>
				</h1>
				<hr style="width: 50px; border: 5px solid green" class="w3-round">
			</div>

			<!-- Photo grid (modal) -->
			<div class="w3-container" style="margin-top: 80px" id="showcase">

			</div>
			<div style="font-weight: bold; font-size: 29px;" class="w3-center">
				<div style="width: 1400px; margin-left:300px;">
					<div style="width: 1400px; margin:auto;">
						<table border="1" style="width:1400px; height:800px;">
							<tr>
								<td style="width: 250px">트립 제목 :</td>
								<td style= "width: 730px; text-align: left; padding-left: 20px;"><input style="width: 100%; border: none; background: white; color: black;" size="50" type="text" disabled value="<%=tr.getTrip_name()%>"/></td>
								<td style= "width: 420px;">대표 사진</td>
							</tr>
							<tr>
								<td>트립 가격 :</td>
								<td style="text-align: left; padding-left: 20px;"><%=tr.getTrip_price()%></td>
								<td rowspan="4">
									<img id="pic1" src="<%=request.getContextPath() %>/resources/host_images/<%= tr.getPic1() %>"/>
								</td>
							</tr>
							<tr>
								<td>트립 언어 :</td>
								<td style="text-align: left; padding-left: 20px;"><%=tr.getTrip_language()%></td>
								
							</tr>
							<tr>
								<td>트립 유형 :</td>
								<td style="text-align: left; padding-left: 20px;"><%=tr.getTrip_category()%></td>
								
							</tr>
							<tr>
								<td>트립 인원 :</td>
								<td style="text-align: left; padding-left: 20px;"><%=tr.getTrip_maxPeople()%></td>
								
							</tr>
							<tr>
								<td>트립 설명 :</td>
								<td style="text-align: left; padding-left: 20px;"><%=tr.getTrip_introduce()%></td>
								<td></td>
							</tr>
							<tr>
								<td>우편번호 :</td>
								<td style="text-align: left; padding-left: 20px;">
									<input style="width: 100%; border: none; background: white; color: black;" size="50"  type="text" id="zip" disabled />
								</td>
								<td rowspan="3">
									<img id="pic2" src="<%=request.getContextPath() %>/resources/host_images/<%= tr.getPic2() %>"/>
								</td>
							</tr>
							<tr>
								<td>주소 :</td>
								<td style="text-align: left; padding-left: 20px;">
									<input style="width: 100%; border: none; background: white; color: black;" size="50" type="text" id="addr" disabled />
								</td>
								
							</tr>
							<tr>
								<td>상세 주소 :</td>
								<td style="text-align: left; padding-left: 20px;">
									<input style="width: 100%; border: none; background: white; color: black;" size="50" type="text" id="addr_detail" disabled />
								</td>
								
							</tr>
							<tr>
								<td>시작 시간 :</td>
								<td style="text-align: left; padding-left: 20px;"><%=tr.getTrip_startTime()%></td>
								<td></td>
							</tr>
							<tr>
								<td>종료 시간 :</td>
								<td style="text-align: left; padding-left: 20px;"><%=tr.getTrip_endTime()%></td>
								<td rowspan="3">
									<img id="pic3" src="<%=request.getContextPath() %>/resources/host_images/<%= tr.getPic3() %>"/>
								</td>
							</tr>
							<tr>
								<td>예약 시작 기간 :</td>
								<td style="text-align: left; padding-left: 20px;"><%=tr.getTrip_stratReservation()%></td>
								
							</tr>
							<tr>
								<td>예약 종료 기간 :</td>
								<td style="text-align: left; padding-left: 20px;"><%=tr.getTrip_endReservation()%></td>
							</tr>
						</table>
						<br>
						<br>
						
					</div>
					
					<div>
						<table>
							<tr>
								<td></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
	</form>
	<script>
	
		$(function(){
			var addr = '<%=tr.getTrip_address()%>'.split('| ');
			$('#zip').val(addr[0]);
			$('#addr').val(addr[1]);
			$('#addr_detail').val(addr[2]);
		});
		
	</script>
</body>
</html>
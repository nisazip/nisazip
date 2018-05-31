<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="kh.trip.model.vo.*, java.util.*"%>

<%
	TripRegist tr = (TripRegist) session.getAttribute("tregist");
%>
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
	<form action="<%=request.getContextPath()%>/modifyTrip.trip" method="post" encType="multipart/form-data">
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
								<td style="width: 250px">트립 제목 :</td>
								<td style= "width: 730px; text-align: left; padding-left: 20px;">
									<input name="title" style="width: 100%; border: none; background: white; color: black;" size="50" type="text" value="<%=tr.getTrip_name()%>"/>
								</td>
								<td style= "width: 420px;">대표 사진</td>
							</tr>
							<tr>
								<td>트립 가격 :</td>
								<td style="text-align: left; padding-left: 20px;">
									<input name="price" style="width: 100%; border: none; background: white; color: black;" size="50" type="number" value="<%=tr.getTrip_price()%>"/>
								</td>
								<td rowspan="4">
									<div id="titleImgArea1" >
										<img id="titleImg" name="pic1" src="<%=request.getContextPath() %>/resources/host_images/<%= tr.getPic1() %>">
									</div>
								</td>
							</tr>
							<tr>
								<td>트립 언어 :</td>
								<td style="text-align: left; padding-left: 20px;"><input name="language" style="width: 100%; border: none; background: white; color: black;" size="50" type="text"  value="<%=tr.getTrip_language()%>"/></td>
								
							</tr>
							<tr>
								<td>트립 유형 :</td>
								<td style="text-align: left; padding-left: 20px;"><input name="category" style="width: 100%; border: none; background: white; color: black;" size="50" type="text"  value="<%=tr.getTrip_category()%>"/></td>
								
							</tr>
							<tr>
								<td>트립 인원 :</td>
								<td style="text-align: left; padding-left: 20px;"><input name="people" style="width: 100%; border: none; background: white; color: black;" size="50" type="number"  value="<%=tr.getTrip_maxPeople()%>"/></td>
								
							</tr>
							<tr>
								<td>트립 설명 :</td>
								<td style="text-align: left; padding-left: 20px;"><input name="introduce" style="width: 100%; border: none; background: white; color: black;" size="50" type="text"  value="<%=tr.getTrip_introduce()%>"/></td>
								<td></td>
							</tr>
							<tr>
								<td>우편번호 :</td>
								<td style="text-align: left; padding-left: 20px;">
									<input name="zip" style="width: 100%; border: none; background: white; color: black;" size="50"  type="text" id="zip"  />
								</td>
								<td rowspan="3">
									<div id="contentImgArea2">
										<img id="contentImg1" name="pic2" src="<%=request.getContextPath() %>/resources/host_images/<%= tr.getPic2() %>">
									</div>
								</td>
							</tr>
							<tr>
								<td>주소 :</td>
								<td style="text-align: left; padding-left: 20px;">
									<input name="addr" style="width: 100%; border: none; background: white; color: black;" size="50" type="text" id="addr"  />
								</td>
								
							</tr>
							<tr>
								<td>상세 주소 :</td>
								<td style="text-align: left; padding-left: 20px;">
									<input name="addr_detail" style="width: 100%; border: none; background: white; color: black;" size="50" type="text" id="addr_detail"  />
								</td>
								
							</tr>
							<tr>
								<td>시작 시간 :</td>
								<td style="text-align: left; padding-left: 20px;">
									<input name="startTime" style="width: 100%; border: none; background: white; color: black;" size="50" type="text"  value="<%=tr.getTrip_startTime()%>"/>
								</td>
								<td></td>
							</tr>
							<tr>
								<td>종료 시간 :</td>
								<td style="text-align: left; padding-left: 20px;">
									<input name="endTime" style="width: 100%; border: none; background: white; color: black;" size="50" type="text"  value="<%=tr.getTrip_endTime()%>"/>
								</td>
								<td rowspan="3">
									<div id="contentImgArea3">
										<img id="contentImg2" name="pic3" src="<%=request.getContextPath() %>/resources/host_images/<%= tr.getPic3() %>">
									</div>
								</td>
							</tr>
							<tr>
								<td>예약 시작 기간 :</td>
								<td style="text-align: left; padding-left: 20px;">
									<input name="startReservation" style="width: 100%; border: none; background: white; color: black;" size="50" type="text"  value="<%=tr.getTrip_stratReservation()%>"/>
								</td>
								
							</tr>
							<tr>
								<td>예약 종료 기간 :</td>
								<td style="text-align: left; padding-left: 20px;">
									<input name="endReservation" style="width: 100%; border: none; background: white; color: black;" size="50" type="text"  value="<%=tr.getTrip_endReservation()%>"/>
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
						<button id="modify" type="submit">수정 완료</button>
						<button id="cancel" onclick="">취소</button>
						<br>
						<br>
					</div>
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
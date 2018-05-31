<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	<%@ include file="../common/trip_header.jsp"%>
	<!-- !PAGE CONTENT! -->
	<form action="<%=request.getContextPath()%>/insertTime.trip" method="post">
		<div class="w3-main" style="margin-left: 340px; margin-right: 40px">

			<!-- Header -->
			<div class="w3-container" style="margin-top: 80px" id="showcase">
				<h1 class="w3-jumbo">
					<b>트립 등록하기</b>
				</h1>
				<h1 class="w3-xxxlarge w3-text-green">
					<b>Sixth.</b>
				</h1>
				<hr style="width: 50px; border: 5px solid green" class="w3-round">
			</div>

			<!-- Photo grid (modal) -->
			<div class="w3-container" style="margin-top: 80px" id="showcase">

			</div>
			<div style="font-weight: bold; font-size: 29px;" class="w3-center">
				회원님의 Trip에 시작시간과 종료시간을 설정하세요.
				<div style="font-weight: bold; font-size: 29px;" class="w3-center">
					<br> <select name="startTime"
						style="width: 500px; height: 50px; color: gray; text-align: center;">
						<option value="오전 12:00 KST">오전 12:00 KST</option>
						<option value="오전 12:30 KST">오전 12:30 KST</option>
						<option value="오전 1:00 KST">오전 1:00 KST</option>
						<option value="오전 1:30 KST">오전 1:30 KST</option>
						<option value="오전 2:00 KST">오전 2:00 KST</option>
						<option value="오전 2:30 KST">오전 2:30 KST</option>
						<option value="오전 3:00 KST">오전 3:00 KST</option>
						<option value="오전 3:30 KST">오전 3:30 KST</option>
						<option value="오전 4:00 KST">오전 4:00 KST</option>
						<option value="오전 4:30 KST">오전 4:30 KST</option>
						<option value="오전 5:00 KST">오전 5:00 KST</option>
						<option value="오전 5:30 KST">오전 5:30 KST</option>
						<option value="오전 6:00 KST">오전 6:00 KST</option>
						<option value="오전 6:30 KST">오전 6:30 KST</option>
						<option value="오전 7:00 KST">오전 7:00 KST</option>
						<option value="오전 7:30 KST">오전 7:30 KST</option>
						<option value="오전 8:00 KST">오전 8:00 KST</option>
						<option value="오전 8:30 KST">오전 8:30 KST</option>
						<option value="오전 9:00 KST">오전 9:00 KST</option>
						<option value="오전 9:30 KST">오전 9:30 KST</option>
						<option value="오전 10:00 KST">오전 10:00 KST</option>
						<option value="오전 10:30 KST">오전 10:30 KST</option>
						<option value="오전 11:00 KST">오전 11:00 KST</option>
						<option value="오전 11:30 KST">오전 11:30 KST</option>
						<option selected="" value="시작 시간을 선택하지 않으셨습니다.">시작 시간</option>
						<option value="오후 12:00 KST">오후 12:00 KST</option>
						<option value="오후 12:30 KST">오후 12:30 KST</option>
						<option value="오후 1:00 KST">오후 1:00 KST</option>
						<option value="오후 1:30 KST">오후 1:30 KST</option>
						<option value="오후 2:00 KST">오후 2:00 KST</option>
						<option value="오후 2:30 KST">오후 2:30 KST</option>
						<option value="오후 3:00 KST">오후 3:00 KST</option>
						<option value="오후 3:30 KST">오후 3:30 KST</option>
						<option value="오후 4:00 KST">오후 4:00 KST</option>
						<option value="오후 4:30 KST">오후 4:30 KST</option>
						<option value="오후 5:00 KST">오후 5:00 KST</option>
						<option value="오후 5:30 KST">오후 5:30 KST</option>
						<option value="오후 6:00 KST">오후 6:00 KST</option>
						<option value="오후 6:30 KST">오후 6:30 KST</option>
						<option value="오후 7:00 KST">오후 7:00 KST</option>
						<option value="오후 7:30 KST">오후 7:30 KST</option>
						<option value="오후 8:00 KST">오후 8:00 KST</option>
						<option value="오후 8:30 KST">오후 8:30 KST</option>
						<option value="오후 9:00 KST">오후 9:00 KST</option>
						<option value="오후 9:30 KST">오후 9:30 KST</option>
						<option value="오후 10:00 KST">오후 10:00 KST</option>
						<option value="오후 10:30 KST">오후 10:30 KST</option>
						<option value="오후 11:00 KST">오후 11:00 KST</option>
						<option value="오후 11:30 KST">오후 11:30 KST</option>
					</select>
				</div>
				<br>
				<div>
					<select name="endTime"
						style="width: 500px; height: 50px; color: gray; text-align: center;">
						<option value="오전 12:00 KST">오전 12:00 KST</option>
						<option value="오전 12:30 KST">오전 12:30 KST</option>
						<option value="오전 1:00 KST">오전 1:00 KST</option>
						<option value="오전 1:30 KST">오전 1:30 KST</option>
						<option value="오전 2:00 KST">오전 2:00 KST</option>
						<option value="오전 2:30 KST">오전 2:30 KST</option>
						<option value="오전 3:00 KST">오전 3:00 KST</option>
						<option value="오전 3:30 KST">오전 3:30 KST</option>
						<option value="오전 4:00 KST">오전 4:00 KST</option>
						<option value="오전 4:30 KST">오전 4:30 KST</option>
						<option value="오전 5:00 KST">오전 5:00 KST</option>
						<option value="오전 5:30 KST">오전 5:30 KST</option>
						<option value="오전 6:00 KST">오전 6:00 KST</option>
						<option value="오전 6:30 KST">오전 6:30 KST</option>
						<option value="오전 7:00 KST">오전 7:00 KST</option>
						<option value="오전 7:30 KST">오전 7:30 KST</option>
						<option value="오전 8:00 KST">오전 8:00 KST</option>
						<option value="오전 8:30 KST">오전 8:30 KST</option>
						<option value="오전 9:00 KST">오전 9:00 KST</option>
						<option value="오전 9:30 KST">오전 9:30 KST</option>
						<option value="오전 10:00 KST">오전 10:00 KST</option>
						<option value="오전 10:30 KST">오전 10:30 KST</option>
						<option value="오전 11:00 KST">오전 11:00 KST</option>
						<option value="오전 11:30 KST">오전 11:30 KST</option>
						<option selected="" value="종료 시간을 선택하지 않으셨습니다.">종료 시간</option>
						<option value="오후 12:00 KST">오후 12:00 KST</option>
						<option value="오후 12:30 KST">오후 12:30 KST</option>
						<option value="오후 1:00 KST">오후 1:00 KST</option>
						<option value="오후 1:30 KST">오후 1:30 KST</option>
						<option value="오후 2:00 KST">오후 2:00 KST</option>
						<option value="오후 2:30 KST">오후 2:30 KST</option>
						<option value="오후 3:00 KST">오후 3:00 KST</option>
						<option value="오후 3:30 KST">오후 3:30 KST</option>
						<option value="오후 4:00 KST">오후 4:00 KST</option>
						<option value="오후 4:30 KST">오후 4:30 KST</option>
						<option value="오후 5:00 KST">오후 5:00 KST</option>
						<option value="오후 5:30 KST">오후 5:30 KST</option>
						<option value="오후 6:00 KST">오후 6:00 KST</option>
						<option value="오후 6:30 KST">오후 6:30 KST</option>
						<option value="오후 7:00 KST">오후 7:00 KST</option>
						<option value="오후 7:30 KST">오후 7:30 KST</option>
						<option value="오후 8:00 KST">오후 8:00 KST</option>
						<option value="오후 8:30 KST">오후 8:30 KST</option>
						<option value="오후 9:00 KST">오후 9:00 KST</option>
						<option value="오후 9:30 KST">오후 9:30 KST</option>
						<option value="오후 10:00 KST">오후 10:00 KST</option>
						<option value="오후 10:30 KST">오후 10:30 KST</option>
						<option value="오후 11:00 KST">오후 11:00 KST</option>
						<option value="오후 11:30 KST">오후 11:30 KST</option>
					</select>
				</div>
				<br> 
				<a href="views/regist/5trip_maxPeople.jsp" id="btn_style" class="w3-padding-large w3-button w3-center">이전단계</a> 
				<button type="submit" id="btn_style" class="w3-padding-large w3-button w3-center">다음단계</button>
			</div>
		</div>
	</form>
</body>
</html>

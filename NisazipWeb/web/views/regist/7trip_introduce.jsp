<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	<%@ include file="../common/trip_header.jsp"%>
	<!-- !PAGE CONTENT! -->
	<form action="<%=request.getContextPath()%>/insertIntroduce.trip" method="post">
	<div class="w3-main" style="margin-left: 340px; margin-right: 40px">

		<!-- Header -->
		<div class="w3-container" style="margin-top: 80px" id="showcase">
			<h1 class="w3-jumbo">
				<b>트립 등록하기</b>
			</h1>
			<h1 class="w3-xxxlarge w3-text-green">
				<b>Seventh.</b>
			</h1>
			<hr style="width: 50px; border: 5px solid green" class="w3-round">
		</div>

		<!-- Photo grid (modal) -->
		<div class="w3-container" style="margin-top: 80px" id="showcase">
			<h2 class="w3-center">
				<b>Guest에게 자신의 Trip에 대해 설명해 주세요!</b>
			</h2>
			<br>
			<br>
			<br>
		</div>
		<div style="font-weight: bold; font-size: 29px;" class="w3-center">
			<textarea name="introduce" style="width: 700px; height: 300px;"></textarea>
			<br> 
			<a href="views/regist/6trip_timeStartEnd.jsp" id="btn_style" class="w3-padding-large w3-button w3-center">이전단계</a> 
			<button type="submit" id="btn_style" class="w3-padding-large w3-button w3-center">다음단계</button>
		</div>
	</div>
	</form>
</body>
</html>
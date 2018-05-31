<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	<%@ include file="../common/trip_header.jsp"%>
	<!-- !PAGE CONTENT! -->
	<form action="<%=request.getContextPath()%>/insertLanguage.trip" method="post">
	<div class="w3-main" style="margin-left: 340px; margin-right: 40px">

		<!-- Header -->
		<div class="w3-container" style="margin-top: 80px" id="showcase">
			<h1 class="w3-jumbo">
				<b>트립 등록하기</b>
			</h1>
			<h1 class="w3-xxxlarge w3-text-green">
				<b>Fourth.</b>
			</h1>
			<hr style="width: 50px; border: 5px solid green" class="w3-round">
		</div>

		<!-- Photo grid (modal) -->
		<div class="w3-container" style="margin-top: 80px" id="showcase">
			<h1 class="w3-center">
				<b>어떤 언어로 트립 설명을 작성하시겠어요?</b>
			</h1>
			<br>
			<br>
			<br>
		</div>
		<div style="font-weight: bold; font-size: 29px;" class="w3-center">
			<select name="language"	style="width: 500px; height: 50px; color: gray; text-align: center;">
				<option value="언어" style="color: gray">언어를 선택하세요.</option>
				<option value="한국어">한국어</option>
				<option value="영어">영어</option>
				<option value="중국어">중국어</option>
			</select> <br>
			<br>
			<a href="views/regist/3trip_category.jsp" id="btn_style" class="w3-padding-large w3-button w3-center">이전단계</a> 
			<button type="submit" id="btn_style" class="w3-padding-large w3-button w3-center">다음단계</button>
		</div>
		</div>
		</form>
</body>
</html>
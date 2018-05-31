<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	<%@ include file="../common/trip_header.jsp"%>
	<!-- !PAGE CONTENT! -->
	<form action="<%=request.getContextPath()%>/insertCategory.trip" method="post">
	<div class="w3-main" style="margin-left: 340px; margin-right: 40px">

		<!-- Header -->
		<div class="w3-container" style="margin-top: 80px" id="showcase">
			<h1 class="w3-jumbo">
				<b>트립 등록하기</b>
			</h1>
			<h1 class="w3-xxxlarge w3-text-green">
				<b>Third.</b>
			</h1>
			<hr style="width: 50px; border: 5px solid green" class="w3-round">
		</div>

		<!-- Photo grid (modal) -->
		<div class="w3-container" style="margin-top: 80px" id="showcase">
			<h1 class="w3-center">
				<b>Trip의 유형을 선택하세요!</b>
			</h1>
			<br>
			<br>
			<br>
		</div>
		<div style="font-weight: bold; font-size: 29px;" class="w3-center">
			<select name="category"	style="width: 500px; height: 50px; color: gray; text-align: center;">
				<option value="언어">카테고리 선택하기</option>
				<option value="예술 및 디자인">예술 및 디자인</option>
				<option value="패션">패션</option>
				<option value="엔터테인먼트">엔터테인먼트</option>
				<option value="스포츠">스포츠</option>
				<option value="웰빙">웰빙</option>
				<option value="자연">자연</option>
				<option value="음료 및 식사">음료 및 식사</option>
				<option value="라이프스타일">라이프스타일</option>
				<option value="역사">역사</option>
				<option value="음악">음악</option>
				<option value="비즈니스">비즈니스</option>
				<option value="바/클럽">바/클럽</option>
			</select> <br>
			<br> 
			<a href="views/regist/2trip_add.jsp" id="btn_style" class="w3-padding-large w3-button w3-center">이전단계</a> 
			<button type="submit" id="btn_style" class="w3-padding-large w3-button w3-center">다음단계</button>
		</div>
	</div>
	</form>
</body>
</html>
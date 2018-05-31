<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body>
	<%@ include file="../common/trip_header.jsp"%>
    <!-- !PAGE CONTENT! -->
    <form action="<%=request.getContextPath()%>/insertMaxPeople.trip" method="post">
        <div class="w3-main" style="margin-left:340px;margin-right:40px">

            <!-- Header -->
            <div class="w3-container" style="margin-top:80px" id="showcase">
                <h1 class="w3-jumbo">
                    <b>트립 등록하기</b>
                </h1>
                <h1 class="w3-xxxlarge w3-text-green">
                    <b>Fifth.</b>
                </h1>
                <hr style="width:50px;border:5px solid green" class="w3-round">
            </div>

            <!-- Photo grid (modal) -->
            <div class="w3-container" style="margin-top:80px" id="showcase">
                
            </div>
            <div style="font-weight: bold; font-size: 29px;" class="w3-center">
                회원님의 Trip에 참여할 인원수를 입력하세요
                <br><br>
                최대 인원수 : &nbsp; <input type="number" name="maxPeople" style="width:200px;" min="1" max="20" class="w3-center" placeholder="최대인원 수"> 명 <br><br>
                <br>
                <a href="views/regist/4trip_lang.jsp" id="btn_style"  class="w3-padding-large w3-button w3-center">이전단계</a>
                <button type="submit" id="btn_style" class="w3-padding-large w3-button w3-center">다음단계</button>
            </div>
        </div>
    </form>
</body>
</html>
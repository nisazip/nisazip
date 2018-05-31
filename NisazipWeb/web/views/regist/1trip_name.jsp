<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body>
	<%@ include file="../common/trip_header.jsp"%>
	<!-- !PAGE CONTENT! -->
    <form action="<%=request.getContextPath()%>/insertName.trip" method="post">
        <div class="w3-main" style="margin-left:340px;margin-right:40px">

            <!-- Header -->
            <div class="w3-container" style="margin-top:80px" id="showcase">
                <h1 class="w3-jumbo">
                    <b>트립 등록하기</b>
                </h1>
                <h1 class="w3-xxxlarge w3-text-green">
                    <b>First.</b>
                </h1>
                <hr style="width:50px;border:5px solid green" class="w3-round">
            </div>

            <!-- Photo grid (modal) -->
            <div class="w3-container" style="margin-top:80px" id="showcase">
        
            </div>
            <div style="font-weight: bold; font-size: 29px;" class="w3-center">
                회원님만의 Trip의 제목을 만들어주세요!
                <h6><b>훌륭한 제목은 간결하고 명확하면서도 구체적입니다.&nbsp;재밌고 독특한 표현을 사용해보세요.</b></h6>
                <br><br>

                <input type="text" name="trip_title" class="w3-center">
                <br>
                <br>
                <button type="submit" id="btn_style" class="w3-padding-large w3-button w3-center">다음단계</button>
            </div>
        </div>
    </form>
</body>
</html>
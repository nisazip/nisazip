<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	<%@ include file="../common/trip_header.jsp"%>
	    <!-- !PAGE CONTENT! -->
    <form action="<%=request.getContextPath()%>/insertPrice.trip" method="post">
        <div class="w3-main" style="margin-left:340px;margin-right:40px">

            <!-- Header -->
            <div class="w3-container" style="margin-top:80px" id="showcase">
                <h1 class="w3-jumbo">
                    <b>트립 등록하기</b>
                </h1>
                <h1 class="w3-xxxlarge w3-text-green">
                    <b>Tenth.</b>
                </h1>
                <hr style="width:50px;border:5px solid green" class="w3-round">
            </div>

            <!-- Photo grid (modal) -->
            <div class="w3-container" style="margin-top:80px" id="showcase">
               <!-- ㄴㄴ -->
            </div>
            <div style="font-weight: bold; font-size: 29px;" class="w3-center">
                <div>
                    <h2>당신의 Trip의 가격을 책정하세요!</h2><br>
                    <input type="number" name="price" id="numberComma" onkeyup="comma(this)" placeholder="￦" style="text-align:right;"><br><br>
                    <div>책정한 가격을 확인하세요!!</div>
                    <div class="result" id="regResult2" style="margin:auto; width:300px; height:50px; border:1px solid red;"></div>
                    <br>
                </div>
                <a href="views/regist/9trip_picture.jsp" id="btn_style" class="w3-padding-large w3-button w3-center">이전단계</a>
                <button type="submit" id="btn_style" class="w3-padding-large w3-button w3-center">등록하기</button>
            </div>

        </div>
    </form>
    
     <script type="text/javascript">

         function comma(obj) {

            var commaNum = obj.value;
            var regResult = document.getElementById('regResult2');
            // hint
            // \B'ABC' : 'ABC'로 시작하지 않는 것을 찾는다.
            // (?='ABC') : Positive lookahead (긍정형 전방 탐색)
            //   'ABC'를 찾되 'ABC' 전까지만 찾아라 라는 뜻이다.
            // (?!'ABC') : Nagative lookahead (부정형 전방 탐색)
            //   'ABC'가 아닌 것을 찾되 앞의 특수한 형식을 맞춰서 찾아라 라는 뜻이다.

            regResult.innerHTML = commaNum.replace(/\B(?=(\d{3})+(?!\d))/gm, ",") + "원";
         }
    </script>
</body>
</html>
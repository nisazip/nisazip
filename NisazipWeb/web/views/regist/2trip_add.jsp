<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script src="../resources/js/jquery-3.3.1.min.js"></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<body>
    <!-- !PAGE CONTENT! -->
    <%@ include file="../common/trip_header.jsp"%>
    <form action="<%=request.getContextPath()%>/insertAdd.trip" method="post">
    <div class="w3-main" style="margin-left:340px;margin-right:40px">

        <!-- Header -->
        <div class="w3-container" style="margin-top:80px" id="showcase">
            <h1 class="w3-jumbo">
                <b>트립 등록하기</b>
            </h1>
            <h1 class="w3-xxxlarge w3-text-green">
                <b>Second.</b>
            </h1>
            <hr style="width:50px;border:5px solid green" class="w3-round">
        </div>

        <!-- Photo grid (modal) -->
        <div class="w3-container" style="margin-top:80px" id="showcase">
            <h2 class="w3-center">
                <b>등록할 Trip의 지역 및 상세 주소를 입력해주세요!</b>
            </h2>
            <br>
            <br>
        </div>
        <div style="font-weight: bold; font-size: 29px;" class="w3-center">
            
            <ul>
                <li>회원님의 Trip의 지역은 어디인가요?</li>
                <li>
                    <div data-text-content="true" style="margin:auto; background:Lightgreen; text-align: center; font-size: 30px; width:500px;" >
                        대한민국 제주특별자치도
                    </div>
                </li>
                <br>
                <li style="text-align:left; margin-left:350px;">
                    우편번호:&nbsp;
                    <input type="text" id="zipCode" name="zipCode">&nbsp;&nbsp;
                    <a id="btn_style" onclick="addrSearch();">검색</a>
                </li>
                <br>
                <li>
                    주소:&nbsp;
                    <input type="text" id="address1" name="address1" size="40;" style="margin-left: 59px;">
                </li>
                <br>
                <li>
                    상세주소:&nbsp;
                    <input type="text" id="address2" name="address2" size="40">
                </li>
                <br>
                <li></li>
            </ul>
            <p><h1>※ 저희 사이트는 제주도만 가능합니다. ※</h1></p>
            <br>
            <a href="views/regist/1trip_name.jsp" id="btn_style" class="w3-padding-large w3-button w3-center">이전단계</a>
            <button type="submit" id="btn_style" class="w3-padding-large w3-button w3-center">다음단계</button>
        </div>
        </div>
        </form>
        <script>	
            // 참조 API : http://postcode.map.daum.net/guide
            function addrSearch() {
                new daum.Postcode({
                    oncomplete: function(data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
        
                        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var fullAddr = ''; // 최종 주소 변수
                        var extraAddr = ''; // 조합형 주소 변수
        
                        // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                            fullAddr = data.roadAddress;
        
                        } else { // 사용자가 지번 주소를 선택했을 경우(J)
                            fullAddr = data.jibunAddress;
                        }
        
                        // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                        if(data.userSelectedType === 'R'){
                            //법정동명이 있을 경우 추가한다.
                            if(data.bname !== ''){
                                extraAddr += data.bname;
                            }
                            // 건물명이 있을 경우 추가한다.
                            if(data.buildingName !== ''){
                                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                            }
                            // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                            fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                        }
        
                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        $('#zipCode').val(data.zonecode); //5자리 새우편번호 사용
                        
                        $('#address1').val(fullAddr);
        
                        // 커서를 상세주소 필드로 이동한다.
                        $('#address2').focus();
                    }
                }).open();
            };
        </script> 
        <script>
            // Script to open and close sidebar
            function w3_open() {
                document.getElementById("mySidebar").style.display = "block";
                document.getElementById("myOverlay").style.display = "block";
            }

            function w3_close() {
                document.getElementById("mySidebar").style.display = "none";
                document.getElementById("myOverlay").style.display = "none";
            }

            // Modal Image Gallery
            function onClick(element) {
                document.getElementById("img01").src = element.src;
                document.getElementById("modal01").style.display = "block";
                var captionText = document.getElementById("caption");
                captionText.innerHTML = element.alt;
            }
        </script>



        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
            crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
            crossorigin="anonymous"></script>
</body>

</html>
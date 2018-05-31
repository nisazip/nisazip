<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<title>Semi Project</title>
<style>
body, h1, h2, h3, h4, h5 {
	font-family: "Poppins", sans-serif
}

body {
	font-size: 16px;
}

.w3-half img {
	margin-bottom: -6px;
	margin-top: 16px;
	opacity: 0.8;
	cursor: pointer
}

.w3-half img:hover {
	opacity: 1
}

#memberJoin {
	width: 100%;
	height: 100%;
	margin-right: 15px;
	text-align: right;
}

#menuBox {
	width: 45%;
	height: 100%;
}

ul {
	list-style: none;
	margin: 1px;
	padding: 1px;
}

.pic_upLoad {
	height: 100% !important;
	font-weight: 700 !important;
	cursor: pointer !important;
	width: auto !important;
	font-size: 19px !important;
	line-height: 22px !important;
	color: white !important;
	background: #008489 !important;
	padding-right: 24px !important;
	padding-left: 24px !important;
	padding-top: 11px !important;
	padding-bottom: 11px !important;
	display: inline-block !important;
	border: 2px solid transparent !important;
	border-radius: 4px !important;
}

#btn_style {
	height: 50px !important;
	font-weight: 700 !important;
	cursor: pointer !important;
	width: auto !important;
	font-size: 19px !important;
	line-height: 22px !important;
	color: white !important;
	background: green !important;
	padding-right: 24px !important;
	padding-left: 24px !important;
	padding-top: 11px !important;
	padding-bottom: 11px !important;
	display: inline-block !important;
	border: 2px solid transparent !important;
	border-radius: 4px !important;
}

._1f9rmq80 {
	border-bottom: 1px solid #DBDBDB !important;
	padding-top: 24px !important;
	padding-bottom: 24px !important;
}

._1c2mf8i {
	font-weight: normal !important;
	margin: 0px !important;
	word-wrap: break-word !important;
	font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto,
		Helvetica Neue, sans-serif !important;
	font-size: 16px !important;
	line-height: 22px !important;
	padding-top: 0px !important;
	padding-bottom: 0px !important;
	color: #484848 !important;
}

._foo5i5 {
	white-space: pre-line !important;
}

._1l18zhtm {
	margin: 0px !important;
	word-wrap: break-word !important;
	font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto,
		Helvetica Neue, sans-serif !important;
	font-size: 16px !important;
	line-height: 22px !important;
	padding-top: 0px !important;
	padding-bottom: 0px !important;
	color: #484848 !important;
	font-weight: 300 !important;
	display: inline !important;
}

._1txkby91 {
	font-weight: normal !important;
	margin: 0px !important;
	word-wrap: break-word !important;
	font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto,
		Helvetica Neue, sans-serif !important;
	font-size: 16px !important;
	line-height: 22px !important;
	letter-spacing: undefined !important;
	padding-top: 0px !important;
	padding-bottom: 0px !important;
	color: #ffffff !important;
}

._1fcg9vv {
	padding-top: 48px !important;
	padding-bottom: 48px !important;
}

#jb-content {
	width: 450px;
	padding: 20px;
	margin-bottom: 20px;
	float: left;
}

#jb-sidebar {
	width: 590px;
	padding: 20px;
	margin-bottom: 20px;
	float: right;
}

#jb-footer {
	clear: both;
	padding: 20px;
}
</style>
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />
<script src="/sp2/resources/js/jquery-3.3.1.min.js"></script>

<script type="text/javascript"
	src="http://maps.google.com/maps/api/js?sensor=false&language=ko"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/holder/2.9.4/holder.js"></script>
<style>
#main {
   position: absolute;
   margin-top: 200px;
   width: 100%;
}
#header {
   
   width: 100%;
   height:15%;
   background:white;
   z-index:1000;
   margin-left:100px;
}

.select {
   padding-left: 24px !important;
   padding-right: 24px !important;
   max-width: 1080px !important;
}

.search {
   background: rgb(77, 60, 23);
   color: white;
}

.navbtn {
   margin-left: 40px;
   color: black;
}

.navbtn:hover {
   background: rgb(104, 143, 112);
   border: 1px solid white;
   color: black;
}

.navbar {
   background: white;
   border: 1px solid white;
   color: black;
   margin-top:15px;
   left:-20px;
   margin-right:-50px;
}

.navbar-toggle {
   background: rgb(77, 60, 23);
}
.navbar-nav{
   text-align:center;
}
</style>
</head>

<body>
	<header>
		<div id="header">
   <div class="container-fluid">
      <div class="row">
         <div class="col-sm-4"
            style="background-color: rgb(0, 153, 51); height: 30px;"></div>
         <div class="col-sm-8"
            style="background-color: rgb(168, 207, 168); height: 30px;">
            <button type="button" id="login"
               class="col-sm-offset-9 col-xs-offset-8 btn-link">
               <a href="login.html" style="color: rgb(41, 23, 23);">로그인/회원가입</a>
            </button>
         </div>
      </div>

      <div class="row">
         <div class="col-md-2"></div>
         <div class="col-md-3">
            <h1>네가 사는 제주</h1>
         </div>
         <div class="col-md-7">
            <nav class="navbar navbar-inverse">
               <div class="container-fluid">
                  <button type="button" id="menu" class="navbar-toggle"
                     data-toggle="collapse" data-target="#myNavbar">
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span> 
                     <span class="icon-bar"></span>
                  </button>

                  <div class="collapse navbar-collapse" id="myNavbar">
                     <ul class="nav navbar-nav">
                        <li class="navbtn"><a href="#">숙소</a></li>
                        <li class="navbtn"><a href="#">트립</a></li>
                        <li class="dropdown navbtn"><a class="dropdown-toggle"
                           data-toggle="dropdown" href="#">호스트 <span class="caret"></span></a>
                           <ul class="dropdown-menu">
                              <li><a href="#">숙소 등록/관리</a></li>
                              <li><a href="<%=request.getContextPath() %>/views/trip/regist/1trip_name.jsp">트립 등록/관리</a></li>
                           </ul></li>
                        <li class="navbtn"><a href="#">메시지</a></li>
                        <li class="navbtn"><a href="#">마이페이지</a></li>
                     </ul>
                  </div>
               </div>
            </nav>
         </div>
      </div>
   </div>
</div>
	</header>
	<!-- Sidebar/menu -->
	<nav class="w3-sidebar w3-green w3-collapse w3-top w3-large"
		style="z-index: 3; width: 300px; font-weight: bold; padding-top: 0px !important;"
		id="mySidebar">
		<br> <a href="javascript:void(0)" onclick="w3_close()"
			class="w3-button w3-hide-large w3-display-topleft"
			style="width: 100%; font-size: 22px">Close Menu</a>
		<div id="memberJoin"
			style="width: 300px; height: 80px; font-size: 13px; background: white;margin-top: 5px;">
		</div>
		<div class="w3-container w3-padding">
			<h3 class="w3-padding-64">
				<b>Semi<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Project
				</b>
			</h3>
		</div>
		<div class="w3-bar-block w3-padding">
			<a href="<%=request.getContextPath() %>/views/regist/1trip_name.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">트립 등록하기</a> <br> 
			<a href="<%=request.getContextPath() %>/views/regist/11trip_registed.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">트립 정보보기</a> <br> 
			<a href="<%=request.getContextPath() %>/views/regist/13trip_modify.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">트립 수정하기</a> <br> 
			<a href="<%=request.getContextPath() %>/views/regist/trip_name.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">트립별 통계보기</a>
		</div>
	</nav>

	<!-- Top menu on small screens -->
	<header	class="w3-container w3-top w3-hide-large w3-green w3-xlarge w3-padding">
		<a href="javascript:void(0)"
			class="w3-button w3-green w3-margin-right" onclick="w3_open()">☰</a>
		<span><b>Semi&nbsp;Project</b></span>
	</header>

	<!-- Overlay effect when opening sidebar on small screens -->
	<div class="w3-overlay w3-hide-large" onclick="w3_close()"
		style="cursor: pointer" title="close side menu" id="myOverlay"></div>


	<script src="<%= request.getContextPath() %>/resources/js/jquery-3.3.1.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
		integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
		crossorigin="anonymous"></script>
	

	<script>
	$(function() {
		$(".datepicker1").datepicker(
				{
					dateFormat : 'yy년 mm월 dd일',
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					changeMonth : true, //월변경가능
					changeYear : true, //년변경가능
					showMonthAfterYear : true, //년 뒤에 월 표시
				});
	});
	$(function() {
		$(".datepicker2").datepicker(
				{
					dateFormat : 'yy년 mm월 dd일',
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					changeMonth : true, //월변경가능
					changeYear : true, //년변경가능
					showMonthAfterYear : true, //년 뒤에 월 표시
				});
	});
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
<link rel="stylesheet"
		href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
	<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
	<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
	<link rel="stylesheet" href="/resources/demos/style.css" />
</body>
</html>
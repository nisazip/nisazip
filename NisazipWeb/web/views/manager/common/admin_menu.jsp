<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- customCSS -->
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/manage.css">
    
    <!-- bootStrapCDN -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/holder/2.9.4/holder.js"></script>
    
    <!-- 차트에 쓰이는 canvas -->
    <script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
    
</head>
<body>

	<!-- 메뉴 선택  -->
            <div class="col-sm-2">
                <ul class="nav nav-pills nav-stacked hidden-xs">
                    <li>
                        <a href="#" onclick="goMember();" class="col-sm-12" >회원 관리</a> 
                    </li>
                    <li>
                        <a href="#" onclick="goRoom();" class="col-sm-12">숙소 관리</a>
                    </li>
                    <li>
                        <a href="#" onclick="goTrip();" class="col-sm-12">트립 관리</a>
                    </li>
                    <li>
                        <a href="#" onclick="goBoard();" class="col-sm-12">댓글 관리</a>
                    </li>
                    <li>
                        <a href="#" onclick="goReport();" class="col-sm-12">신고 관리</a>
                    </li>
                    <li>
                        <a href="#" onclick="goAdmin();" class="col-sm-12">통계</a>
                    </li>
                </ul>
                <!-- 모바일 용 메뉴  -->
                <div class="row visible-xs">
	                <div class="navbar navbar-default" >
	                	<div class="navbar-header"> 
	                		<button class="navbar-toggle" data-toggle="collapse" data-target="#menu1">
	                		<!-- <span class="sr-only">Toggle navigationr</span> -->
	                		<span class="icon-bar"></span>
	                		<span class="icon-bar"></span>
	                		<span class="icon-bar"></span>
	                		</button>
	                		<a class="navbar-brand">메뉴 보기</a>
	                	</div>
	                
		                <div class="collapse navbar-collapse" id="menu1">
		                <ul class="nav navbar-nav">
			                <li>
		                        <a href="#" onclick="goMember();" class="col-sm-12" >회원 관리</a>
		                    </li>
		                    <li>
		                        <a href="#" onclick="goRoom();" class="col-sm-12">숙소 관리</a>
		                    </li>
		                    <li>
		                        <a href="#" onclick="goTrip();" class="col-sm-12">트립 관리</a>
		                    </li>
		                    <li>
		                        <a href="#" onclick="goBoard();" class="col-sm-12">댓글 관리</a>
		                    </li>
		                    <li>
		                        <a href="#" onclick="goReport();" class="col-sm-12">신고 관리</a>
		                    </li>
		                    <li>
		                        <a href="#" onclick="goAdmin();" class="col-sm-12">통계</a>
		                    </li>
		                </ul>
		                </div>
                	</div>
	       		</div>
            </div>
<script>

	function goMember(){
		location.href="<%=request.getContextPath()%>/memberList.mg";
		$('li').removeClass("active");
		$('li:nth-child(1)').addClass("active");
	}
	function goRoom(){
		location.href="<%=request.getContextPath()%>/roomList.mg";
		$('li').removeClass("active");
		$('li:nth-child(2)').addClass("active");
	}
	function goTrip(){
		location.href="<%=request.getContextPath()%>/tripList.mg";
		$('li').removeClass("active");
		$('li:nth-child(2)').addClass("active");
	}
	function goBoard(){
		location.href="";
		$('li').removeClass("active");
		$('li:nth-child(2)').addClass("active");
	}
	function goReport(){
		location.href="";
		$('li').removeClass("active");
		$('li:nth-child(2)').addClass("active");
	}
	function goAdmin(){
		location.href="";
		$('li').removeClass("active");
		$('li:nth-child(2)').addClass("active");
	}
	
	/* 
	$('li').click(function(){
	 $('li').removeClass("active");
	 $(this).addClass("active");
	})
 */
</script>
</body>
</html>
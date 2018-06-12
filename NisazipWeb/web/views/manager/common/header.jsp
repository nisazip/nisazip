<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!-- <script src="../js/jquery-3.3.1.min.js"></script> -->
	
<style>
    #header{
      position: fixed;
      width:100%;
      background : white;
   }  
   
   .select{
        padding-left: 24px !important;
        padding-right: 24px !important;
        max-width: 1080px !important;
      }

      .search{
          background: rgb(77, 60, 23);
          color: white;
      }
      .navbtn{
          margin-left: 40px; 
          color: black;
        
      }
      
      .navbtn:hover{
        background: rgb(104, 143, 112);
        border: 1px solid white;
        color: black;
      }

      .navbar{
        background: white;
        border: 1px solid white;
        color: black;
        margin: 30px 0 30px 0;
        
      }

      .navbar-toggle{
        background:rgb(77, 60, 23);
      }
    
     
</style>
</head>
<body>

  <div class="container-fluid">
	<div id="header">

    <div class="row">
 
    <div class="col-sm-4" style="background-color:rgb(30, 155, 80); height:30px;"></div>
    <div class="col-sm-8" style="background-color:rgb(168, 207, 168); height:30px;">
      <button type="button" id="login" class="col-sm-offset-9 col-xs-offset-8 btn-link">
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
              <button type="button" id="menu" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar" >
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>                        
              </button>
             
            <div class="collapse navbar-collapse" id="myNavbar">
              <ul class="nav navbar-nav">
                  <li class="navbtn"><a href="#">숙소</a></li>
                  <li class="navbtn"><a href="#">트립</a></li>
                  <li class="dropdown navbtn">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">호스트 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                    <li><a href="<%=request.getContextPath()%>/views/room/Room.jsp">숙소 등록/관리</a></li>
                    <li><a href="#">트립 등록/관리</a></li>
                  </ul>
                </li>
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
  <script>
      $('#menu').on('click',function(){
        $('.navbar-collapse').css({
            'position':'fixed',
            'background': 'white',
            'overflow': 'hidden',
            'top': '30%',
            'right': '0%',
            'left': '0%',
            'z-index': '1000',
            'padding': '7%',
            'text-align': 'center'
        });
        $('.navbar-collapse').toggle();
      });
      
  </script>




</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="kh.member.model.vo.*" %>
<%
	Member m = (Member) session.getAttribute("member");
%>
<head>
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
   z-index:-1;
}
#header {
   position: fixed;
   width: 100%;
   height:24%;
   background:white;
   z-index:1;
}
/* 
.select {
   padding-left: 24px !important;
   padding-right: 24px !important;
   max-width: 1080px !important;
} */

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
   margin-top:10px;
   left:-20px;
   margin-right:-50px;
}
 
.navbar-toggle {
   background: rgb(77, 60, 23);
}
.navbar-nav{
   text-align:center;
}

#title{
	font-size:30pt;
	text-decoration: none;
	color:black;
}
</style>
</head>

<%@ include file= "../../views/member/joinmodal.jsp" %>
<%@ include file ="../../views/member/loginmodal.jsp" %>
<%@ include file ="../../views/member/resetpwdModal.jsp" %>

<%@ include file ="../../views/member/messageModal.jsp" %> 

<div id="header">
   <div class="container-fluid">
      <div class="row">

        <div class="col-sm-4"
            style="background-color: rgb(0, 153, 51); height: 30px;"></div>
         <div class="col-sm-8"
            style="background-color: rgb(168, 207, 168); height: 30px;">
            <% if(m == null){ %>
            <button class="btn-link col-sm-offset-7 col-xs-offset-7" type="button" id="login" onclick="userLogin();" style="color:black"> 로그인    /</button>
            <button class="btn-link" type="button" id="join" onclick="userJoin();" style="color:black">회원가입     </button>
            <%}else{  %>
            <button class="btn-link col-sm-offset-7 col-xs-offset-7" type="button" id="logout" style="color:black" onclick="userLogout();"> 로그아웃    /</button>
            <%} %>
            <% if(m != null && m.getUser_id().equals("admin")){ %>
            <button class="btn-link" type="button" id="adminPage" style="color:black" onclick="adminPage();">관리자 화면 가기 </button>
            <%} %>
         </div>
      </div>

      <div class="row">
         <div class="col-md-2"></div>
         <div class="col-md-3">
            <button id="title" class="btn-link" onclick="location.href='home.jsp'">네가 사는 제주</button>
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
                        <li class="navbtn"><a href='room.jsp'>숙소</a></li>
                        <li class="navbtn"><a href="trip.jsp">트립</a></li>
                        <li class="dropdown navbtn"><a class="dropdown-toggle"
                           data-toggle="dropdown" href="#">호스트 <span class="caret"></span></a>
                           <ul class="dropdown-menu">
                              <li><a href="<%=request.getContextPath()%>/views/room/Room.jsp">숙소 등록/관리</a></li>
                              <li><a href="#">트립 등록/관리</a></li>
                           </ul></li>
                        <li class="navbtn"><a href="<%= request.getContextPath()%>/messageList.m">메시지</a></li>
                        <li class="navbtn"><a href="<%=request.getContextPath()%>/boardList.bo">Q&A</a></li>
                        <% if(m != null){ %>
                        <li class="navbtn"><a href="<%=request.getContextPath()%>/views/member/memberUpdate.jsp">마이페이지</a></li>
                        <%} %>
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
        'background': 'white',
        'overflow': 'hidden',
        'text-align': 'center'
    });
    $('.navbar-collapse').toggle();
  });
  
function userLogin(){
	$("#myModal").modal();
}
function userJoin(){
	 $("#myModal2").modal();
}

function userLogout(){
	location.href= "<%=request.getContextPath()%>/logout.me";
}

function adminPage(){
	location.href= "<%=request.getContextPath()%>/views/manager/admin_home.jsp";
}
</script>


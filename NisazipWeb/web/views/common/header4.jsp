<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="kh.member.model.vo.*" %>
<%
    Member m = (Member) session.getAttribute("member"); 
%>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  
<script src="/semi/resources/js/jquery-3.3.1.min.js"></script>
<!--  bootstrap4 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script> 

<!--summernote  -->
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>

<!--fontawesome  -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">

<%@ include file= "../../views/member/joinmodal.jsp" %>
<%@ include file ="../../views/member/loginmodal.jsp" %>
<%@ include file ="../../views/member/resetpwdModal.jsp" %>

<%@ include file ="../../views/member/messageModal.jsp" %> 
<style>

#main {
   position: absolute;
   margin-top: 200px;
   width: 100%;
}
#header {
   position: fixed;
   width: 100%;
   height:15%;
   background:white;
   z-index:1000;
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

.nav-item {
   margin-left: 40px;
   color: black;
}

.nav-item:hover {
   background: rgb(104, 143, 112);
   border: 1px solid white;
   color: black;
}
.nav-pills .show > .nav-link {
  color: #fff;
  background-color: #black;
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
   background: #c2c3c5;
}
.navbar-nav{
   text-align:center;
}

a{
	color: #9d9d9d;
text-decoration: none;
}

.btn-link {
  font-weight: normal;
  color: #337ab7;
  border-radius: 0;

}

.dropdown-item.active, .dropdown-item:active {
  color: #fff  ;
  text-decoration: none  ;
  background-color: black ;
}

.nav-pills .nav-link.active,
.nav-pills .show > .nav-link {
  color: #fff;
  background-color: black;
}
.page-item.active .page-link {
  z-index: 1;
  color: #fff;
  background-color: #dddddd;
  border-color: #dddddd;
}


</style>

</head>


<div id="header">
   <div class="container-fluid">
      <div class="row">

         <div class="col-sm-4" style="background-color: rgb(0, 153, 51); height: 30px;"></div>
         <div class="col-sm-8 " style="background-color: rgb(168, 207, 168); height: 30px; text-align:right; ">
               <a id="login"class="col-sm-offset-9 col-xs-offset-8 btn-link " href="login.html" style="color: rgb(41, 23, 23); " onclick="userLogin();">로그인/회원가입</a>
         </div>
      </div>

      <div class="row">
         <div class="col-md-2"></div>
         <div class="col-md-3">
           <button class="btn btn-link" onclick="location.href='<%=request.getContextPath()%>'"><h1>네가 사는 제주</h1></button>
         </div>
         <div class="col-md-7">
            <nav class="navbar navbar-inverse">
               <div class="container-fluid">

                <ul class="nav nav-pills">
                  <li class="nav-item">
                    <a class="nav-link " href="#">숙소</a>
                  </li>

                  <li class="nav-item">
                    <a class="nav-link" href="#">트립</a>
                  </li>
                
                      <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">호스트</a>
                      <div class="dropdown-menu">
                        <a class="dropdown-item" href="#">숙소 등록/관리	</a>
                        <a class="dropdown-item" href="#">트립 등록/관리</a>
                     </div>
                    </li>
                    <li class="nav-item">
                    <%if(m!=null){%>
                    <a class="nav-link " href="<%=request.getContextPath()%>/messageList.m"> 메시지</a>
                     <%}else {%>
                     <a class="nav-link " href="index.jsp"> 메시지</a>
                     <%} %>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">Q&A</a>
                  </li>
                  <% if(m!=null){ %>
                   <li class="nav-item">
                    <a class="nav-link " href="#">마이페이지</a>
                  </li>
                  <% } %>
                </ul>
				</div>
            </nav>
         </div>
      </div>
   </div>
</div>

<script>

function userLogin(){
  	$("#myModal").modal();
  }
 
</script>

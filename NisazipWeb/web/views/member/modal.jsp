<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    
        <title>Bootstrap Example</title>
       
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  .modal-header, h4, .close {
      background-color: #5cb85c;
      color:white !important;
      text-align: center;
      font-size: 30px;
  }
  .modal-footer {
      background-color: #f9f9f9;
  }

  select {

    width: 25%;
    height: 30px;
    padding-left: 10px;
    font-size: 18px;
    color: gray;
    border: 1px solid gray;
    border-radius: 3px;
}
  </style>
</head>
<body>


 

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-user"></span> Login</h4>
        </div>
        
        
        
        
        
        
        
        <div class="modal-body" style="padding:40px 50px;">
          <form  id="loginForm" role="form" action="<%= request.getContextPath()%>/login.me" method="POST">
            
             <div class="form-group">
              <label for="loginId"><span class="glyphicon glyphicon-eye-open"></span> 계정 </label>
              <input type="text" class="form-control" id="loginId" name="loginId" placeholder="ID나 EMAIL을 입력하세요">
            </div>
            <div class="form-group">
              <label for="loginPwd"><span class="glyphicon glyphicon-lock"></span> 비밀번호</label>
              <input type="password" class="form-control" id="loginPwd" name="pwd" placeholder="패스워드를 입력하세요">
            </div>
            <div class="checkbox">
              <label><input type="checkbox" value="" checked>Remember me</label>
            </div>
              <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span>Login</button>
          </form>
        </div>
        
        
        
        
        
        
        
        
        
        
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
          <p>Not a member?   <a data-target="#myModal2" data-toggle="modal" class="MainNavText" data-dismiss="modal" id="MainNavHelp" 
       href="#myModal">Join</a></p>
          <p>Forgot <a data-target="#myModal3" data-toggle="modal" class="findPwd" data-dismiss="modal" id="" 
       href="#myModal">Password?</a></p>
          
        </div>
      </div>
      
    </div>
  </div><!-- modal2 end-->



 <!-- Modal 회원가입-->
  <div class="modal fade" id="myModal2" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> Join</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form id="joinForm" role="form" action="join.me" method="POST">
          
          
          
          <div class="form-group">
                <center><input type="text" class="form-control" id="user_id" placeholder="ID" name="user_id" style="width:80%;" onkeyup="checkId();" ></center>
            	<center>	<span id = "chkMsg"></span> </center>
            </div>
            
            <div class="form-group">
                <center><input type="text" class="form-control" id="name" placeholder="이름" name="name" style="width: 80%" ></center>
            </div>
            <div class="form-group">
                <center><input type="email" class="form-control" id="email" placeholder="이메일주소" name="email" style="width: 80%" ></center>
            </div>
            <div class="form-group">
                <center><input type="password" class="form-control" id="pwd" placeholder="비밀번호" name="pwd" style="width: 80%"></center>    
                <center>
                  <div style="width: 80%; text-align: left;" >
                  <span class="pwdRef2" style="display: none; color: #228b22;">유효한 비밀번호입니다.<br></span>

                  <span class="pwdRef" style="display: none;">비밀번호는 8자 이상이어야 합니다.<br></span>

                  <span class="pwdRef" style="display: none;">숫자나 특수문자를 포함하세요 </span>

                  </div>
                </center>
                 
            </div>
            
            <div class="form-group">
                <center><input type="password" class="form-control" id="pwd2" placeholder="비밀번호 확인" name="pwd2" style="width: 80%" >  </center>

                  
                  <div style="width: 80%; text-align: left;" >
                  <span class="pwd2Ref2" style="display: none; ">비밀번호가 일치하지 않습니다.<br></span>

                  <span class="pwd2Ref" style="display: none; color: #228b22;">비밀번호가 일치합니다.<br></span>
                  </div>
                  

            </div>  
            
            <div class="form-group">
     
                <center><div style="width: 100%">
                <select id="birthday_year" name="birthday_year" class="">
                  <option disabled="" value="" selected>년</option>
                  <option value="2018">2018</option>
                  <option value="2017">2017</option>
                  <option value="2016">2016</option>
                  <option value="2015">2015</option>
                  <option value="2014">2014</option>
                  <option value="2013">2013</option>
                  <option value="2012">2012</option>
                  <option value="2011">2011</option>
                  <option value="2010">2010</option>
                  <option value="2009">2009</option>
                  <option value="2008">2008</option>
                  <option value="2007">2007</option>
                  <option value="2006">2006</option>
                  <option value="2005">2005</option>
                  <option value="2004">2004</option>
                  <option value="2003">2003</option>
                  <option value="2002">2002</option>
                  <option value="2001">2001</option>
                  <option value="2000">2000</option>
                  <option value="1999">1999</option>
                  <option value="1998">1998</option>
                  <option value="1997">1997</option>
                  <option value="1996">1996</option>
                  <option value="1995">1995</option>
                  <option value="1994">1994</option>
                  <option value="1993">1993</option>
                  <option value="1992">1992</option>
                  <option value="1991">1991</option>
                  <option value="1990">1990</option>
                  <option value="1989">1989</option>
                  <option value="1988">1988</option>
                  <option value="1987">1987</option>
                  <option value="1986">1986</option>
                  <option value="1985">1985</option>
                  <option value="1984">1984</option>
                  <option value="1983">1983</option>
                  <option value="1982">1982</option>
                  <option value="1981">1981</option>
                  <option value="1980">1980</option>
                  <option value="1979">1979</option>
                  <option value="1978">1978</option>
                  <option value="1977">1977</option>
                  <option value="1976">1976</option>
                  <option value="1975">1975</option>
                  <option value="1974">1974</option>
                  <option value="1973">1973</option>
                  <option value="1972">1972</option>
                  <option value="1971">1971</option>
                  <option value="1970">1970</option>
                  <option value="1969">1969</option>
                  <option value="1968">1968</option>
                  <option value="1967">1967</option>
                  <option value="1966">1966</option>
                  <option value="1965">1965</option>
                  <option value="1964">1964</option>
                  <option value="1963">1963</option>
                  <option value="1962">1962</option>
                  <option value="1961">1961</option>
                  <option value="1960">1960</option>
                  <option value="1959">1959</option>
                  <option value="1958">1958</option>
                  <option value="1957">1957</option>
                  <option value="1956">1956</option>
                  <option value="1955">1955</option>
                  <option value="1954">1954</option>
                  <option value="1953">1953</option>
                  <option value="1952">1952</option>
                  <option value="1951">1951</option>
                  <option value="1950">1950</option>
                  <option value="1949">1949</option>
                  <option value="1948">1948</option>
                  <option value="1947">1947</option>
                  <option value="1946">1946</option>
                  <option value="1945">1945</option>
                  <option value="1944">1944</option>
                  <option value="1943">1943</option>
                  <option value="1942">1942</option>
                  <option value="1941">1941</option>
                  <option value="1940">1940</option>
                  <option value="1939">1939</option>
                  <option value="1938">1938</option></select>
        
        
                <select id="birthday_month" name="birthday_month">
                  <option disabled="" value="" selected>월</option>
                  <option value="1">1월</option>
                  <option value="2">2월</option>
                  <option value="3">3월</option>
                  <option value="4">4월</option>
                  <option value="5">5월</option>
                  <option value="6">6월</option>
                  <option value="7">7월</option>
                  <option value="8">8월</option>
                  <option value="9">9월</option>
                  <option value="10">10월</option>
                  <option value="11">11월</option>
                  <option value="12">12월</option></select>
        
                <select id="birthday_day" name="birthday_day" class="_10ukhb4t">
                    <option disabled="" value="" selected>일</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                    <option value="13">13</option>
                    <option value="14">14</option>
                    <option value="15">15</option>
                    <option value="16">16</option>
                    <option value="17">17</option>
                    <option value="18">18</option>
                    <option value="19">19</option>
                    <option value="20">20</option>
                    <option value="21">21</option>
                    <option value="22">22</option>
                    <option value="23">23</option>
                    <option value="24">24</option>
                    <option value="25">25</option>
                    <option value="26">26</option>
                    <option value="27">27</option>
                    <option value="28">28</option>
                    <option value="29">29</option>
                    <option value="30">30</option>
                    <option value="31">31</option></select></div></div></center>
            
              <center><button type="submit" class="btn btn-success btn-block" id="joinsubmit" style="width:80%;" onclick="check();" ><span class="glyphicon glyphicon-off"></span> 회원가입</button></center>
          </form>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
          <p>Already a member? <a data-target="#myModal" data-toggle="modal" class="MainNavText" data-dismiss="modal"
       href="#myModal">Login</a></p>
          
        </div>
      </div>
      
    </div>
  </div> <!-- 모달 끝-->




</div>
 
<script>
var check =false;



var pwd = $("#pwd").val();




$("#loginModalOpen").on("click",function(e){
    $("#myModal2").modal();

  });

$("#loginModalOpen").on("click",function(e){
    $("#myModal").modal();

  });

$("joinFormOpen").on("click",function(e){
    $("#myModal2").modal();

  });



$("#pwd").on("focus",function(){
  $(".pwdRef").show();
});
$("#pwd").on("blur",function(){
  $(".pwdRef").hide();
});


$("#email").keyup(function (event) {

            regexp = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;

            v = $(this).val();

            if (regexp.test(v)) {
                $("#email").css("border","2px solid lightgreen");

            }else {
               $("#email").css("border","1px solid red");
            }

});

$("#name").keyup(function (event) {

            regexp =/^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;


            v = $(this).val();

            if (regexp.test(v)) {

            $("#name").css("border","2px solid lightgreen");

            }else{
               $("#name").css("border","1px solid red");

            }

});




$("#pwd").keyup(function (event) {

            regexp = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,}$/;

            v = $(this).val();

            if (regexp.test(v)) {

               $(".pwdRef").hide();
               $(".pwdRef2").show().fadeOut(2000);

                $("#pwd").css("border","2px solid lightgreen");

               }else{
                $("#pwd").css("border","1px solid red");

               }
});

$("#pwd2").keyup(function(event){
               $(".pwd2Ref2").show();


               if($(this).val()==$("#pwd").val()){

                $("#pwd2").css("border","2px solid lightgreen");
                $(".pwd2Ref").show().fadeOut(2000);

                 $(".pwd2Ref2").hide();


               }else{
                $("#pwd2").css("border","1px solid red");


               }
});



$("select").keyup(function(event){
               $(".pwd2Ref2").show();

               if($(this).val()==$("#pwd").val()){


                $("#pwd2").css("border","2px solid lightgreen");
                $(".pwd2Ref").show().fadeOut(2000);

                 $(".pwd2Ref2").hide();
                 check =true;

               }else{
                $("#pwd2").removeAttr('style:border');
               }
});

/*$("#user_id").keyup(function (event) {

    regexp = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,}$/;

    v = $(this).val();

    if (regexp.test(v)) {

    	

       }else{
        $("#user_id").css("border","1px solid red");

       }
});*/

function checkId(){
    var id = $('#user_id').val();
 	
    $.ajax({
	      url:'/semi/chk.do',
	      type:'get',
	      data:{id:id},
	      success:function(data){
	            if( data != 1 && id.length >7 ){
	            	 $("#user_id").css("border","2px solid lightgreen");
	           
	            }else{
	            	$("#chkMsg").text("아이디는 7자 이상이어야 합니다.");
	   	            $("#user_id").css("border","1px solid red");
	            	console.log('2'+data);
	           
	           }
	       },
	       error:function(){
	               alert("에러입니다");
	       }
	    });
   
};

$("#joinForm").submit(function(event){
	if($("#userPwd").val() == "" || $("#userId").val() == "") alert("아이디나 비밀번호는 필수 값입니다.");
	else if($('#userPwd').val() != $('#userPwd2').val()) alert("비밀번호 확인 값과 다릅니다.");
	else return;
	event.preventDefault();
});

   $("joinsubmit").attr("disabled");



</script>

</body>
</html>
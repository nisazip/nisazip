<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
<% String id = (String)session.getAttribute("id"); %>
<!DOCTYPE html>
<html>
<head>
       <title>Join</title>      
      

</head>




<body>

<%@ include file= "../../views/common/header.jsp" %>

<div id="main">
	<div class="row">
	<div class="col-sm-4"></div>
    <div class="col-sm-4"> 
    
    		<br><br><br><br><br>
        	<form  class="form-horizontal" action="<%=request.getContextPath()%>/resetPwd2.me" method="post">  
      			<fieldset>
        		<legend>비밀번호 변경</legend>
        		 <div class="form-group">
						<center><h2><%= id %> 님</h2><center>
						<center><h5>비밀번호를 변경하고 다시 로그인하세요</h5><center>
						<center><h6>비밀번호는 8자 이상의 영문+(숫자 or 문자) 혼합이어야 합니다.</h6><center>
						<input type="hidden"  value="<%=id %>" name="id">
		            </div>	               		
      		 <div class="form-group">
	                <center><input type="password" class="form-control"  placeholder="비밀번호" id="pwdchange1" name="pwd" style="width: 80%"></center>    
	                <center>
	                  <div style="width: 80%; text-align: left;" >
		                  <span class="pwdRef2" style="display: none; color: #228b22;">유효한 비밀번호입니다.<br></span>	
		                  <span class="pwdRef" style="display: none;">비밀번호는 8자 이상이어야 합니다.<br></span>	
		                  <span class="pwdRef" style="display: none;">영문 외에도 숫자나 특수문자를 포함하세요 </span>
		
	                  </div>
	                </center>
	                 
	            </div>
            
            <div class="form-group">
                <center><input type="password" class="form-control"  placeholder="비밀번호 확인" id="pwdchange2" name="pwd2" style="width: 80%" >  </center>                 
                  <div style="width: 80%;" >
                  <center><span class="pwd2Ref2" style="display: none; ">비밀번호가 일치하지 않습니다.<br></span></center>

                  <center><span class="pwd2Ref" style="display: none; color: #228b22;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;비밀번호가 일치합니다.<br></span></center>
                  </div>
                  

            </div>  </fieldset>
            
            <center><button id="changePwdbtn" type="submit" class="btn btn-success btn-block" id="joinsubmit" style="width:80%;" onclick="check();">변경</button></center>
            
            
            </form>
            
            
            </div>
			
			</div>
			</div>
<script type="text/javascript">
var pwdcheck1 = false;
var pwdcheck2 = false;

	
if(pwdcheck1 == false ){
	$("#changePwdbtn").attr('disabled','disabled');
}
	
$("#pwdchange1").on("blur",function(){
	  regexp = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,}$/;
      v = $(this).val();
      if (regexp.test(v)) {
          $(this).css("border","1px solid green");
          pwdcheck1= true;
  			if( pwdcheck1 ==true &&  pwdcheck2 ==true){
          	$("#changePwdbtn").removeAttr("disabled")	            	
          	}
         }else{
          $(this).css("border","1px solid red");
          pwdcheck1= false
         }

});



$("#pwdchange2").on("keyup",function(){
	if($(this).val()==$("#pwdchange1").val() && $(this).val() != "" && pwdcheck1 ==true){
	     $(this).css("border","1px solid green");
	     $(".pwd2Ref").show().fadeOut(2000);
	     $(".pwd2Ref2").hide();
	      pwdcheck2 = true;
	      if( pwdcheck1 ==true &&  pwdcheck2 ==true){
	      	$("#changePwdbtn").removeAttr("disabled")
	      	
	      	}
				
	    }else{
	     $(this).css("border","1px solid red");
	     pwdcheck2= false;

	    }
	
	
});




</script>
</body>
</html>
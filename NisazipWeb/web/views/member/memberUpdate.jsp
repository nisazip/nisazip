<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    

<!DOCTYPE html>
<html>
<head>
       <title>Join</title>      
      

<style type="text/css">
 img{
   width: 21%;
    height: 20%;
 }

 select {
    width: 21%;
    height: 30px;
    padding-left: 10px;
    font-size: 18px;
    color: gray;
    border: 1px solid lightgray;
    border-radius: 3px;
}

.phone input[type=text]{
    width: 21%;
    height: 30px;
    padding-left: 10px;
    font-size: 18px;
    color: gray;
    border: 1px solid lightgray;
    border-radius: 3px;
}


</style>
<script>


function profileModal(){
	$("#myModal4").modal();
	
}

	
</script>

</head>




<body>

<%@ include file= "../../views/common/header.jsp" %>


<div id="main">
<div class="container-fluid">

  <div class="row content">
    <div class="col-sm-3 sidenav">
  
      <ul class="nav nav-pills nav-stacked">
        
        <li><a href="/semi/views/member/memberUpdate.jsp">사용자 정보 수정/추가</a></li>
        <li><a href="/semi/views/member/certification.jsp">사진 등록 및 인증</a></li>
        <li><a href="/semi/views/member/myBin.jsp">보관 목록</a></li>
      </ul><br>
      <br><br><br><br><br><br><br>
    </div>


    <div class="col-sm-6"> 
    
    		<div class="col-sm-12 col-xs-12" style="">
    			<fieldset>		
    			<legend>프로필 사진 올리기</legend>
    			<div class="row">
	    			<div class="col-lg-3 xs-hidden"></div>	
    			 	<div class="col-lg-9 panel panel-info">
      					<div class="panel-heading">사진을 올리시기 전에</div>
     				   <div class="panel-body">호스트와 게스트가 서로를 알 수 있도록 선명하게 나온 얼굴 정면 사진을 사용하는 것이 중요합니다. 풍경 사진을 올리면 호스트가 알아보기 힘들겠죠? 회원님의 얼굴이 선명하게 보이며 호스트나 게스트에게 공개하고 싶지 않은 개인 정보나 민감한 정보가 나타나지 않은 사진을 사용하세요.</div>
    				</div>   
    			</div>	
    			<div class="row">
	    			<div class="col-lg-4 xs-hidden"></div>
	    			<div class="col-lg-7 col-xs-12">	
		    		 			
						<center><img alt="" id="presentProfileImg"  class="align-center" style="width:200px; height: 200px; box-shadow: 4px 4px 3px gray; border-radius: 50em;"></center>
			    			<br><br>
    					<center><button class="btn btn-success" type="submit" style="width: 60%;" onclick="profileModal();">사진 입력/수정</button></center>
    				</div>
    			</div>
    			</fieldset>   
    		
    	
    		<hr>
        	<form  class="form-horizontal" action="<%=request.getContextPath()%>/Update.me" method="post">  
      			<fieldset>
        		<legend>프로필 수정</legend>
      			<div class="form-group">
             		 <label class="control-label col-sm-4" for="id">ID:</label>

       				 <div class="col-sm-8"><input type="text" class="form-control" id="updateId" value="<%= m.getUser_id()%>" name="updateId" readonly ></div>
      			 </div>
      			 
       			<div class="form-group">
             		 <label class="control-label col-sm-4" for="email">Email:</label>
       				<div class="col-sm-8"><input type="email" class="form-control" id="updateEmail" value="<%= m.getEmail()%>" name="updateEmail" readonly ></div>
       			</div>
       			
      			<div class="form-group"> 
              		<label class="control-label col-sm-4" for="name">이름:</label>
        			<div class="col-sm-8"><input type="text" class="form-control" id="updateName" value="<%= m.getUser_name()%>"  name="updateName"  ></div>
      			</div>
       
      			<div class="form-group ">
        			<label class="control-label col-sm-4" for="email">성별:</label>
      
        			<div class="col-sm-8">
       					<div class="btn-group" data-toggle="buttons">
	        				<label class="btn btn-default">
	       					<input type="radio" value="F" name="gender" id="option2" autocomplete="off" >
	        				<span>여성</span>
	        				</label>
	
	       					<label class="btn btn-default">
	       					<input type="radio" value="M" name="gender" id="option1" autocomplete="off">
	        				<span >남성</span>
	        				</label>
    					</div>
    				 <p>이 정보는 통계적 목적으로만 사용됩니다.</p>
  				   </div>
  				</div>
  				
  				
  				<div class="form-group ">
					    	<label class="control-label col-sm-4" for="select">핸드폰 번호:</label>
					    <div class="col-sm-8 phone align-right">
					      <select id="phone1" class="phoneNum" name="phone1" >
					          <option value="010">010</option>
					          <option value="011">011</option>
					          <option value="016">016</option>
					          <option value="017">017</option>
					          <option value="019">019</option></select>
					      -
					      <input  type="text" class="phoneNum" name="phone2">
					      -
					      <input type="text" class="phoneNum" name="phone3">
					      <br>
					      <p>예약이 완료될 경우에만 공유됩니다. 번호가 공유되면 개인적으로 연락할 수 있습니다.</p>
					    </div>
					
					  </div>

   

       		<div class="form-group">
       			 <label class="control-label col-sm-4" for="select">생년월일:</label>

     
			        <div class="col-sm-8">
			        <select id="upBirthday_year" name="upBirthday_year" >
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
			
			          &nbsp;
			        <select id="upBirthday_month" name="upBirthday_month" class="_10ukhb4t">
			          <option disabled="" value="" selected>월</option>
			          <option value="01">1월</option>
			          <option value="02">2월</option>
			          <option value="03">3월</option>
			          <option value="04">4월</option>
			          <option value="05">5월</option>
			          <option value="06">6월</option>
			          <option value="07">7월</option>
			          <option value="08">8월</option>
			          <option value="09">9월</option>
			          <option value="10">10월</option>
			          <option value="11">11월</option>
			          <option value="12">12월</option></select>
						&nbsp;
			        <select id="upBirthday_day" name="upBirthday_day" class="_10ukhb4t">
			            <option disabled="" value="" selected>일</option>
			            <option value="01">1일</option>
			            <option value="02">2일</option>
			            <option value="03">3일</option>
			            <option value="04">4일</option>
			            <option value="05">5일</option>
			            <option value="06">6일</option>
			            <option value="07">7일</option>
			            <option value="08">8일</option>
			            <option value="09">9일</option>
			            <option value="10">10일</option>
			            <option value="11">11일</option>
			            <option value="12">12일</option>
			            <option value="13">13일</option>
			            <option value="14">14일</option>
			            <option value="15">15일</option>
			            <option value="16">16일</option>
			            <option value="17">17일</option>
			            <option value="18">18일</option>
			            <option value="19">19일</option>
			            <option value="20">20일</option>
			            <option value="21">21일</option>
			            <option value="22">22일</option>
			            <option value="23">23일</option>
			            <option value="24">24일</option>
			            <option value="25">25일</option>
			            <option value="26">26일</option>
			            <option value="27">27일</option>
			            <option value="28">28일</option>
			            <option value="29">29일</option>
			            <option value="30">30일</option>
			            <option value="31">31일</option></select>
			            <br>
						<p>이 정보는 통계적 목적으로만 사용됩니다.</p>
			            </div>
						
				</div>

</div>
      		</fieldset>  
      			<hr>
      <div class="form-group row">   
            <div class="col-sm-4 xs-hidden"></div>   
            <div class="col-sm-8 ">
            <center><button type="submit" class="btn btn-success" style="width:60%;">회원정보 수정하기</button></center>
             </div>  
   		 </div>

     </form>
    </div>
</div>


<div id="myModal4" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">프로필 사진 설정<span class=""></span></h4>
      </div>
      <div class="modal-body">
       	<div class="row">
       		<div class="col-sm-3 xs-hiiden"></div>       
       		<div class="col-sm-6 col-xs-10">
        	 <form  id="" role="form" action="<%= request.getContextPath()%>/profile.pic"  method="post" enctype="multipart/form-data">            
	             <div class="form-group">
	              
	              <img alt="" id="titleImg">
	              <input type="file"  id="profilePicture" name="profilePicture" onchange="LoadImg(this);">
	              <input type="hidden" value="<%= m.getUser_id()%>" name="uploadId">
	              
	            </div>
	            
	             <button type="submit" class="btn btn-success btn-block" style="width: 100%;"><span class="glyphicon glyphicon-off"></span>입력</button>
            </form>
            </div>
            <div class="col-sm-3 xs-hiiden""></div>
     	 </div>
      </div>
      <div class="modal-footer">
     	 
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>


<script>
				
				
				
				
				
				$(function(){
				var id = "<%=m.getUser_id()%>";
					console.log(id);
					$.ajax({
						url:'/semi//presentUser.pic',
						type:'get',
						data:{id:id},
						success:function(result){
						$("#presentProfileImg").attr("src", "<%=request.getContextPath()%>\\resources\\thumbnail_uploadFiles\\"+result);		
						},
						error:function(){
						    alert("에러입니다");
						}
					});
											
				});
		

				$(function(){
					if('<%=m.getGender()%>' != null){
					$('input:radio').each(function(){
						if( $(this).val() == '<%=m.getGender()%>'){
						  $(this).prop('checked', true);
						  $(this).parent().addClass('active');
						//console.log( $(this).parent().children().eq(0));
						//console.log( $(this).parent());
						}else 
						  $(this).prop('checked', false);
						//$(this).prop('disabled', true);
					});
					}
					var phoneArr = '<%=m.getPhone()%>'.split('-');
				
					$('input[class*="phone"]').each(function(index){
						$(this).val(phoneArr[index+1]);
					});
					
					var birthArrST = '<%=m.getBirthdate()%>'.substring(0,10)
					var birthArr = birthArrST.split('-');
					console.log(birthArrST);
					console.log(birthArr[0]);
					console.log(birthArr[1]);
					console.log(birthArr[2]);
					
					$('#upBirthday_year').val(birthArr[0]);
					$('#upBirthday_month').val(birthArr[1]);
					$('#upBirthday_day').val(birthArr[2]);
					
					
				});
				
				function updateMember() {
					$("#updateForm").submit();
				}
				
				/* $("#updateForm").submit(function(event){
					if($("#userPwd").val() == "" || $("#userId").val() == "") alert("아이디나 비밀번호는 필수 값입니다.");
					else if($('#userPwd').val() != $('#userPwd2').val()) alert("비밀번호 확인 값과 다릅니다.");
					else return;
					event.preventDefault();
					
					
					
					
				}); */
				//function deleteMember() {
				//	location.href = "/myWeb/mDelete.me?mid=";
				//}
				
				
				
				function LoadImg(value, num) {
				    if (value.files && value.files[0]) {
				       var reader = new FileReader();
				       reader.onload = function(e) {
				         
				             $("#titleImg").attr("src", e.target.result).css({"width":"200px","height":"200px"});	          
				       }
				       reader.readAsDataURL(value.files[0]);
				    }
				 }
			
				
				
				
			</script>	
			
			
			

</body>
</html>
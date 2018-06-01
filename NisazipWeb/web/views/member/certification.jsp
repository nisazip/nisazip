<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
       <title>신분증인증</title>      
      

<style type="text/css">


.btn-file{
position :relative;
overflow: hidden;
}
.btn-file input[type=file]{
	position :absolute;
	top :0;
	right :0;
	min-width:100%;
	min-height:100%;
	font-size:100px;
	text-align :right;
	filter :alpha(opacity=0);
	opacity :0;
	outline : none;
	background :white;
	cursor :inherit;
	display: block;
}

</style>
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


    <div class="col-sm-5"> 
    
    	
    		<form action="" enctype="multipart/form-data" method="post">
    			<h2>사진 업로드</h2>
    			<span class="btn btn-default btn-file">이미지를 업로드 하세요
    			<input type="file" name="userProfile">
    			</span>
    			
    		</form>
    
        	
<script>
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
					
					var addressArr = '<%=m.getBirthdate()%>'.split('-');
					
					$('#zipCode').val(addressArr[0]);
					$('#address1').val(addressArr[1]);
					$('#address2').val(addressArr[2]);
					
					
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
				
				function deleteMember() {
					location.href = "/myWeb/mDelete.me?mid=<%=m.getUser_id()%>";
				}
				
				
				
				function goMain(){
					location.href='<%=request.getContextPath()%>/index.jsp';
				};
				
			</script>

</body>
</html>
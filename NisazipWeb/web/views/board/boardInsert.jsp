<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>ㄷ작성페이지</title>
<!-- <link rel="stylesheet" href="/semi/resources/css/bootstrap.css"> -->
<!-- <script src="/semi/resources/js/jquery-3.3.1.min.js"></script> -->
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
 -->

<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="/semi/resources/js/bootstrap.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script> -->

<style>
	table th{
	background-color:#eeeeee;
	text-align:center;

	}
	
	table tr{
	/* border-bottom: 1px solid #dee2e6; */

	}
	
</style>

</head>

<body>
	  <%@ include file="../common/header4.jsp" %>
	<br>
	<br>
	<br>
	<br>
	<hr>

	<form id="insertForm"  action="<%=request.getContextPath()%>/boardInsert.bo" method="post">
		<div class="container col-sm-6" align="center" >
			<h1 align="left">Q & A 게시판</h1>
			<p align="left"> <i class="fas fa-exclamation-circle"> 개인정보가 포함된 글이나 게시판 성격에 맞지 않은 글은 관리자에 의해 통보없이 삭제 될 수 있습니다.</i></p>
			<br />
		
				<table class=" table-bordered1 table "style="table-layout: fixed">
					<colgroup>
						<col width="15%">
						<col width="85%">
					</colgroup>
  					
                        <tbody>
					<tr>
						<th style="vertical-align:middle;">제목</th>
						<td><input type="text" name="b_title" id="b_title"
							class="form-control"></td>
					</tr>
					
					<tr>
						<th>작성자</th>
						<td> <input type="hidden" name="user_id" value="<%=m.getUser_id() %>" /><%=m.getUser_name() %></td>
						<%-- <% if(m != null) out.print(m.getUser_name()); else out.print("비로그인"); %> --%>
					</tr>
			
					<tr>
						<td colspan="2"><textarea id="summernote" name="b_content"style="resize: none;"></textarea></td>
					</tr>
					<tr style="border-bottom:none;">
						<td colspan="2" align="right" ><input type="button"class="btn btn-success "
						 onclick="valueChk();"value="저장" > 
							<input type="reset" class="btn btn-success " onclick="getList();"value="목록"> 
						</td>
					</tr>
					</tbody>
				</table>
				
		 </div>
	</form>


	<hr>
	<br>
	<br>
	<br>
	<br>

	<div class="modal fade" id="messageModal" >
				<div class="modal-dialog vertical-align-center ">
					<div class="modal-content  ">
						<div class="modal=header panel-heading alert alert-danger">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times</span>
								<span class="sr-only">close</span>
							</button>
							<h5 class="modal-title">경고창</h5>					
						</div>
						<div class="modal-body">
							<p id="dangerMsg"></p>			
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-outline-secondary" data-dismiss="modal">확인</button>
						</div>
					</div>
				</div>
			</div>
		</div>

	<script>
      $('#summernote').summernote({
        //placeholder: 'ㅋㅋ',
        tabsize: 2,
        height: 400,
         toolbar: [
        // [groupName, [list of button]]
        ['style', ['bold', 'italic', 'underline', 'clear']],
        ['font', ['strikethrough', 'superscript', 'subscript']],
        ['fontsize', ['fontsize']],
        ['color', ['color']],
        ['para', ['ul', 'ol', 'paragraph']],
        ['height', ['height']]
    ]
      });
      
      // 목록
      function getList(){
    	  
    	  location.href="<%=request.getContextPath()%>/boardList.bo";
      }

      // 제목/ 내용 확인
      function valueChk(){
    	 if($('#summernote').val()=="" || $('#b_title').val()==""){
    	
    	           if($('#b_title').val()==""){
    	        	   $('#dangerMsg').html("제목을 입력해주세요");
    	                $('#b_title').focus();
    	                $('#messageModal').modal("show");
    	           }else if($('#summernote').val()=="" ){
    	        	   $('#dangerMsg').html("내용을 입력해주세요");
    	                $('#summernote').focus();
    	                $('#messageModal').modal("show");
    	           }
    		 
    	    }else{
    	       /* alert("작성완료"); */
    	       $('#insertForm').submit();
    	    }
    	 }

    </script>
</body>
</html>

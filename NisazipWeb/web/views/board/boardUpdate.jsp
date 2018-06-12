<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="kh.board.model.vo.*"%>
	<%
		Board b = (Board) request.getAttribute("b");
	%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Q & A 수정</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>  


<style>
	table th{
	background-color:#eeeeee;
	text-align:center;

	}
	

</style>

</head>

<body>
	  <%@ include file="../common/header3.jsp" %>
	

	<form id="updateForm"  action="<%=request.getContextPath()%>/boardUpdate.bo?b_no=<%=b.getB_no() %>" method="post">
		<div class="container col-sm-6 col-sm-offset-3" align="center" style="margin-top:7%;">
			<h1 align="left">Q & A 게시판</h1>
				<p align="left"> <i class="fas fa-exclamation-circle"> 개인정보가 포함된 글이나 게시판 성격에 맞지 않은 글은 관리자에 의해 통보없이 삭제 될 수 있습니다.</i></p><br />
				
				<table class=" table-bordered1 table "style="table-layout: fixed">
					<colgroup>
						<col width="15%">
						<col width="85%">
					</colgroup>
  					
                        <tbody>
					<tr>
						<th style="vertical-align:middle;">제목</th>
						<td><input type="text" name="b_title" id="b_title"
							class="form-control" value="<%=b.getB_title() %>"></td>
					</tr>
					
					<tr>
						<th>작성자</th>
						<td> <input type="hidden" name="user_id" value="<%= b.getB_writer() %>" /><%= b.getB_writer() %></td>
					</tr>
			
					<tr>
						<td colspan="2"><textarea id="summernote" name="b_content"style="resize: none;"><%=b.getB_content() %></textarea></td>
					</tr>
					<tr style="border-bottom:none;">
						<td colspan="2" align="right"><input type="button"class="btn btn-success " onclick="valueChk();"value="수정"> 
							<input type="reset" class="btn btn-success " onclick="getList();"value="목록"> 
						</td>
					</tr>
					</tbody>
				</table>
				
		 </div>
	</form>





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
    	        	   alert("제목을 입력해주세요");
    	                $('#b_title').focus();
    	           }else if($('#summernote').val()=="" ){
    	        	   alert("내용을 입력해주세요");
    	                $('#summernote').focus();
    	           }
    		 
    	    }else{
    	       /* alert("작성완료"); */
    	       $('#updateForm').submit();
    	    }
    	 }

    </script>
</body>
</html>

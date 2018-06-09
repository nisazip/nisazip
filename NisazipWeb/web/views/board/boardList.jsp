<%@page import="kh.board.model.service.BoardCommentService"%>
<%@page import="kh.board.model.service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="java.util.*, kh.member.model.vo.*,  kh.board.model.vo.*, java.text.SimpleDateFormat"%>
    <% 
    	ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");
    	PageInfo pi = (PageInfo)request.getAttribute("pi");
    	int listCount = pi.getListCount();
    	int currentPage= pi.getCurrentPage();
    	int maxPage= pi.getMaxPage();
    	int startPage=pi.getStartPage();
    	int endPage = pi.getEndPage();
    	String key=(String)request.getAttribute("key");
    	String con=(String)request.getAttribute("con");
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta  charset="UTF-8">
      <!--  <script src="/semi/resources/js/jquery-3.3.1.min.js"></script>
  	<link rel="stylesheet" href="/semi/resources/css/bootstrap.css">        
      <script src="/semi/resources/js/bootstrap.js"></script>   -->
  <!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script> -->
      
     
   
<title>Insert title here</title>
<style>
	table th{
	vertical-align: middle;
	}
.page-item.active .page-link {
  z-index: 1;
  color: #fff;
  background-color: #dddddd;
  border-color: #dddddd;
}
.table td{
	padding : 10px;
}

</style>
</head>

    <body  >
      <%@ include file="../common/header4.jsp" %>
        <br><br><br><br> <br /> <br /><br /><br />

<script>
	// 검색
 	function search(){
 		var key=$('#searchKey').val();
		var con =$('#searchCon').val();
		console.log(key);
		console.log(con);
		 location.href='<%=request.getContextPath()%>/boardList.bo?condition='+con +'&keyword='+key;
		 
	}
	
 	
 	 function enterKey(e){
 		if(window.event.keyCode == 13)
 			search();
 	}
</script>


    <div class="container col-sm-6 table-responsive" >
        <h1>Q & A 게시판</h1>
 <p> <i class="fas fa-exclamation-circle"> 개인정보가 포함된 글이나 게시판 성격에 맞지 않은 글은 관리자에 의해 통보없이 삭제 될 수 있습니다.</i></p><br />
		<!-- 검색창 -->
		
		       <div class=" row" >
		           <div class="input-group  justify-content-end ">
		                   <select name="searchCon" id="searchCon" class="form-control col-sm-2 "  >
		                       <option value="all">전체</option>
		                       <option value="title">제목</option>
		                       <option value="content">내용</option>
		                       <option value="writer">작성자</option>
		                   </select>&nbsp;
		                   <input  id= "searchKey" name = "searchKey" class="form-control col-sm-3" type="text" onkeyup="enterKey();"> &nbsp;
		                   <button id="searchBtn"class="btn btn-outline-secondary" onclick="search();" style="border: 1px solid #ced4da;" >검색</button>
		           </div>
		       </div>
     
        
        
           	전체 게시물 : <%=listCount %>  <br />        
			<div  class="table-responsive">
		        <table   id="listTable" class="table table-hover table-bordered " style=" text-align:center; ">
	                <colgroup>
	                    <col width="7%">  <!-- 글 번호 -->
	                    <col width="40%">   <!--  제목   -->
	                    <col width="15%"> <!-- 작성자 -->
	                    <col width="10%"> <!-- 작성일 -->
	                    <col width="7%">  <!-- 조회수 -->
	                </colgroup>
		            <thead>
			            <tr style=" text-align:center; background-color: #eeeeee;">
			                <th style="  border-left: none;  vertical-align:middle;"> 게시물번호</th>
			                <th style="vertical-align:middle;">제목</th>
			                <th style="vertical-align:middle;">작성자</th>
			                <th style="vertical-align:middle;">작성일</th>
			                <th style="border-right: none; vertical-align:middle;">조회수</th>
			            </tr>
		            </thead>
		            <tbody>
		            <%
		            for(Board b : list){ String mark=""; String check="";%>
		            <tr>
						<% if (b.getB_writer().equals("관리자")) {%>
						<td style="border-left: none;"><b>[공지]</b>
						<%}else{ %>
		                <td style="border-left: none;"><%=b.getB_no() %>
		                <% }%>  
		                <input type="hidden"  name="bno" value="<%= b.getB_no()%>" />
		                </td>
		                
		                <td align="left" ><%= b.getB_title()%>
		                <%  
		                	int result = new BoardCommentService().commentCheck(b.getB_no());
		                	if(result>0){
		                		check="[답변완료]";
		                	}
		                	
		              		SimpleDateFormat sdf = new  SimpleDateFormat("yyyy-MM-dd");
							String b_date = sdf.format(b.getB_date());
							String now = sdf.format(new Date());

								if(b_date.equals(now)) mark="new";
							%>
							<span align="right"> <b><%= check %> </b></span>
							<span   class="<%if(mark.equals("new")){ out.print("badge badge-light");}%>" style="color:red;"> <%= mark %> </span>
		                </td>
		                <td><%= b.getB_writer() %> </td>
		                <td><%= b.getB_date()%></td>
		                <td style="border-right: none;"><%= b.getB_count()%></td>
		            </tr>
		            <%} %>
		            </tbody>
		        </table>
	 
	        </div>
		<% if(m!=null){%> 
        <div class=" row justify-content-end">	
    	  <button type="button" class="btn btn-success"
      	    onclick="location.href='views/board/boardInsert.jsp'">글쓰기</button> 
        </div>
       <%}%>
        
        
        
   
        
        	<!-- 페이징 페이지 수 5개씩 -->
	        <div class="row justify-content-center ">
	            	
				<ul class="pagination" >
	                
	                <li class="page-item "><a class="page-link" onclick="location.href='<%= request.getContextPath()%>/boardList.bo?currentPage=1&condition=<%=con%>&keyword=<%=key%>'" >처음</a></li>
	                
	               <%if(currentPage <=1){ %>
						 <li class="page-item "><a class="page-link "  onclick="firstPage()" >이전</a></li>
					<%} else {%>
						 <li class="page-item "><a class="page-link" onclick="location.href='<%= request.getContextPath()%>/boardList.bo?currentPage=<%=currentPage-1%>&condition=<%=con%>&keyword=<%=key%>'" >이전</a></li>
					<%} %>
	               
	          
	               <%for(int i=startPage;i<= endPage; i++) {%>
	               <% if(i== currentPage) { %>
							<li class="page-item active "><a class="page-link"  ><%=i%></a></li>
						<%}  else{%>
							 <li class="page-item "><a class="page-link" onclick="location.href='<%= request.getContextPath()%>/boardList.bo?currentPage=<%=i%>&condition=<%=con%>&keyword=<%=key%>'" ><%=i%></a></li>
						<%} %>
					<%} %>
	               
	            	<%if(currentPage >=maxPage){ %>
						 <li class="page-item "><a class="page-link" onclick="lastPage();" >다음</a></li>
					<%} else {%>
						 <li class="page-item "><a class="page-link" onclick="location.href='<%= request.getContextPath()%>/boardList.bo?currentPage=<%=currentPage+1%>&condition=<%=con%>&keyword=<%=key%>'" >다음</a></li>
					<%} %>
	            
	            <li class="page-item "><a class="page-link" 
	            	onclick="location.href='<%= request.getContextPath()%>/boardList.bo?currentPage=<%=maxPage %>&condition=<%=con%>&keyword=<%=key%>'" >마지막 </a></li>
	            </ul>
	        </div>

    </div>


      <hr>   <br><br><br><br> 
      
      <script>
      
      //게시물 클릭
      $('#listTable td').on('click',function(){
    	  var num = $(this).parent().children().eq(0).find('input').val();
    	  console.log(num);
    	   location.href="<%=request.getContextPath() %>/boardSelect.bo?b_no="+num; 
      });
      
      function firstPage(){
    	  alert("처음 페이지 입니다.");
      }
      function lastPage(){
    	  alert("마지막 페이지 입니다.");
      }

     

      </script>
   </body>
</html>
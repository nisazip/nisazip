<%@page import="kh.board.model.service.BoardCommentService"%>
<%@page import="kh.board.model.service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="java.util.*,  kh.board.model.vo.*,java.text.SimpleDateFormat"%>
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
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">         
   
<title>Q & A 목록</title>
<style>
	table th {
		vertical-align: middle;
		text-align: center;
	}
	
	.table td {
		padding: 10px;
	}
	
	.label-danger {
		background-color: white !important;
	}
	
	.pagination>li>a {
		color: black !important;
	}
	
	a {
		color: black !important;
	}
	
	.pagination>.active>a, .pagination>.active>a:hover{
		background-color: #5cb85c !important;
		border-color: #5cb85c !important;
		color:#fff  !important;
	}
</style>
</head>

    <body >
      <%@ include file="../common/header.jsp" %>
     <div id = "main">
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


    <div class="container col-sm-6 col-sm-offset-3 " >
        <h1>Q & A 게시판</h1>
 		<p> <i class="fas fa-exclamation-circle"> 개인정보가 포함된 글이나 게시판 성격에 맞지 않은 글은 관리자에 의해 통보없이 삭제 될 수 있습니다.</i></p><br />
		<!-- 검색창 -->
			
		       <div class="row" >
		            <div class="form-group form-inline pull-right" >  
		                   <select name="searchCon" id="searchCon" class=" col-sm-2  form-control "  >
		                       <option value="all">전체</option>
		                       <option value="title">제목</option>
		                       <option value="content">내용</option>
		                       <option value="writer">작성자</option>
		                   </select>&nbsp;
		                   <input  id= "searchKey" name = "searchKey" class="col-sm-3 form-control " type="text" onkeyup="enterKey();"> &nbsp;
		                  	<input type="button" id="searchBtn"class="btn btn-success  col-sm-2 form-control" onclick="search();" style="border: 1px solid #ced4da;" value="검색" >
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
			                <th style="  border-left: none;  vertical-align:middle;"> 게시물<br />번호</th>
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
		                	if(result>0) check="[답변완료]";

		              		SimpleDateFormat sdf = new  SimpleDateFormat("yyyy-MM-dd");
							String b_date = sdf.format(b.getB_date());
							String now = sdf.format(new Date());

							if(b_date.equals(now)) mark="new";
							%>
							<span align="right"> <b><%= check %> </b></span>
							<span   class="<%if(mark.equals("new")){ out.print("label label-danger");}%>" style="color:red;"> <%= mark %> </span>
		                </td>
		                <td><%= b.getB_writer() %> </td>
		                <td><%= b.getB_date()%></td>
		                <td style="border-right: none;"><%= b.getB_count()%></td>
		            </tr>
		            <%} %>
		            </tbody>
		        </table>	
	 
	        </div>

        <div class="row ">	
    	  <button type="button" class="btn btn-success pull-right"
      	    onclick="<% if(m==null){out.print("location.href='index.jsp'");} else{%>location.href='views/board/boardInsert.jsp'<%}%>">글쓰기</button> 
        </div>
        

        	<!-- 페이징 페이지 수 5개씩 -->
			<div class="row" align="center">
					<ul class="pagination"  >
			                
			                <li><a  onclick="location.href='<%= request.getContextPath()%>/boardList.bo?currentPage=1&condition=<%=con%>&keyword=<%=key%>'" >처음</a></li>
			                
			               <%if(currentPage <=1){ %>
								 <li><a onclick="firstPage()" >이전</a></li>
							<%} else {%>
								 <li ><a  onclick="location.href='<%= request.getContextPath()%>/boardList.bo?currentPage=<%=currentPage-1%>&condition=<%=con%>&keyword=<%=key%>'" >이전</a></li>
							<%} %>
			               
			          
			               <%for(int i=startPage;i<= endPage; i++) {%>
			               <% if(i== currentPage) { %>
									<li class="active "><a  ><%=i%></a></li>
								<%}  else{%>
									 <li ><a onclick="location.href='<%= request.getContextPath()%>/boardList.bo?currentPage=<%=i%>&condition=<%=con%>&keyword=<%=key%>'" ><%=i%></a></li>
								<%} %>
							<%} %>
			               
			            	<%if(currentPage >=maxPage){ %>
								 <li ><a  onclick="lastPage();" >다음</a></li>
							<%} else {%>
								 <li ><a  onclick="location.href='<%= request.getContextPath()%>/boardList.bo?currentPage=<%=currentPage+1%>&condition=<%=con%>&keyword=<%=key%>'" >다음</a></li>
							<%} %>
			            
			          		 <li><a onclick="location.href='<%= request.getContextPath()%>/boardList.bo?currentPage=<%=maxPage %>&condition=<%=con%>&keyword=<%=key%>'" >마지막 </a></li>
			            </ul>
		            </div>
    </div>



      
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

      $('.pagination').find('li').on('mouseenter',function(){
    	 	 $(this).css("cursor","pointer");
      });
     

      </script>
      </div>
   </body>
</html>
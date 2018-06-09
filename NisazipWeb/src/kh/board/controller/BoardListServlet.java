package kh.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.board.model.service.BoardService;
import kh.board.model.vo.Board;
import kh.board.model.vo.PageInfo;

@WebServlet("/boardList.bo")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		BoardService bs = new BoardService();
		ArrayList<Board> list = null;
		String condition = request.getParameter("condition");
		String keyword= request.getParameter("keyword");
		
//-- 페이지처리 코드 부분 --//
		
		int startPage; // 한번에 표시될 게시글들의 시작 페이지
		int endPage; // 한번에 표시될 게시글들의 마지막 페이지
		int maxPage; // 전체 페이지의 마지막 페이지
		int currentPage; // 현재 페이지
		int limit; // 한 페이지당 게시글 수
		int pagenum ; // 페이지에  보여줄 버튼수  ex)1,2,3,4,5
		pagenum = 5; 
		
		// 게시판 시작페이지
		currentPage =1;
		
		
		// 만약에 전달받는 페이지가 있을 경우 즉, 현재 페이지 정보를 받을 경우
		// currentPage 의 값을 수정한다.
		if(request.getParameter("currentPage")!= null){
			currentPage= Integer.parseInt(request.getParameter("currentPage"));
		}
		
		
		// 한페이지에 보여질 게시글 수
		limit =10;
		
		int listCount=0;
	
		
	
		if( (condition==null && keyword==null || condition.equals("null") && keyword.equals("null") ) || condition.equals("all")){
			listCount = bs.getListCount();
			list = bs.boardList(currentPage, limit);
		}else if(condition.equals("title")){
			listCount = bs.getListCountTitle(keyword);
			list =bs.boardSearch(condition, keyword, currentPage, limit);
		}else if (condition.equals("writer")){
			listCount = bs.getListCountWriter(keyword);
			list =bs.boardSearch(condition, keyword, currentPage, limit);
		}else if(condition.equals("content")){
			 listCount = bs.getListCountContent(keyword);
			 list =bs.boardSearch(condition, keyword, currentPage, limit);
		}else{
			System.out.println("ㅠㅠ");
		}
		
		// 전체 게시글의 수
		System.out.println("총 게시글 수 : " +listCount);

		

		
		// 총 게시글 수에 대한 페이지
		maxPage = (int)((double)listCount / limit +0.9); 
		
		// 현재 화면에 표시할 페이지 개수
		startPage = (((int)((double)currentPage/ pagenum + 0.9)) -1) * pagenum +1;
		
		// 한 화면에 표시할 마지막 페이지 번호
		endPage = startPage + pagenum -1;
		
		
		if(maxPage<endPage){
			endPage=maxPage;
		}
		
		// 페이지 관련 변수 전달용 vo 생성
		PageInfo pi = new PageInfo(currentPage, listCount, limit,  maxPage, startPage,endPage);		
		
		
		
		String page="";
		if(list!=null){
			page = "views/board/boardList.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			request.setAttribute("con", condition);  
			request.setAttribute("key", keyword);	
		}else{
			page ="views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 조회 실패");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

package kh.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.board.model.service.BoardCommentService;
import kh.board.model.service.BoardService;
import kh.board.model.vo.Board;
import kh.board.model.vo.BoardComment;


@WebServlet("/boardSelect.bo")
public class BoardSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BoardSelectServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int b_no = Integer.parseInt(request.getParameter("b_no"));
		
		Board b = new BoardService().boardSelect(b_no);
		
		ArrayList<BoardComment> clist = new BoardCommentService().commentList(b_no);
		
		String page="";
		if(b!=null){
			page ="views/board/boardDetail.jsp";
			request.setAttribute("b",b);
			request.setAttribute("clist", clist);
		}else{
			page ="views/common/errorPage.jsp";
			request.setAttribute("msg","게시판 상세보기 실패");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package kh.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.board.model.service.BoardService;
import kh.board.model.vo.Board;

@WebServlet("/boardInsert.bo")
public class BoardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BoardInsertServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String b_title = request.getParameter("b_title");
		String b_content = request.getParameter("b_content");
		String b_writer =  request.getParameter("user_id"); // 로그인 아이디 가져와야징
		
		System.out.println(b_content);
		Board b = new Board();
		
		b.setB_title(b_title);
		b.setB_content(b_content);
		b.setB_writer(b_writer);  // 로그인 아이디 자리
		
		int result = new BoardService().boardInsert(b);
		
		String page ="";
		if(result>0){
				page="boardList.bo";
		}else{
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글 등록 실패");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
			
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

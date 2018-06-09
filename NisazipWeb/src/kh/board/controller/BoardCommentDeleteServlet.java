package kh.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.board.model.service.BoardCommentService;

/**
 * Servlet implementation class BoardCommentDeleteServlet
 */
@WebServlet("/bCommentDelete.bo")
public class BoardCommentDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardCommentDeleteServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int c_no = Integer.parseInt( request.getParameter("c_no"));
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		
		
		int result = new BoardCommentService().commentDelete(c_no);
		
		String page="";
		if(result>0){
			page="boardSelect.bo?b_no"+b_no;
		}else{
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "댓글 삭제 오류");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

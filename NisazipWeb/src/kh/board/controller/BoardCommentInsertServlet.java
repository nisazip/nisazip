package kh.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.board.model.service.BoardCommentService;
import kh.board.model.vo.BoardComment;

/**
 * Servlet implementation class BoardCommentInsertServlet
 */
@WebServlet("/bCommentInsert.bo")
public class BoardCommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public BoardCommentInsertServlet() {
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		String c_writer = request.getParameter("c_writer");
		String c_content = request.getParameter("c_content");
		
	
		BoardComment bc = new BoardComment();
		bc.setB_no(b_no);
		bc.setC_content(c_content);
		bc.setC_writer(c_writer);
		
		int result  = new BoardCommentService().commentInsert(bc);
		
		String page="";
		if(result>0){
			page="/semi/boardSelect.bo?b_no="+b_no;
			response.sendRedirect(page);
		}else{
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "댓글 추가 오류");
			request.getRequestDispatcher(page).forward(request, response);
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

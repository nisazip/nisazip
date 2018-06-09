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
 * Servlet implementation class BoardCommentUpdateServlet
 */
@WebServlet("/bCommentUpdate.bo")
public class BoardCommentUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardCommentUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int b_no= Integer.parseInt(request.getParameter("b_no"));
		int c_no = Integer.parseInt(request.getParameter("c_no"));
		String c_content = request.getParameter("c_content");
	
		System.out.println(c_content);
		BoardComment bc = new BoardComment();
		bc.setC_no(c_no);
		bc.setC_content(c_content);
		
		int result = new BoardCommentService().commentUpdate(bc);
		
		String page="";
		if(result>0){
			page="boardSelect.bo?b_no"+b_no;
		}else{
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "댓글 수정 오류");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

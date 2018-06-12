package kh.room.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kh.room.model.vo.Room;

/**
 * Servlet implementation class SInsertServlet
 */
@WebServlet("/rInsert5.do")
public class RInsertServlet5 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RInsertServlet5() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String R_DETAIL = request.getParameter("R_DETAIL");
		String R_RULE = String.join("| ", request.getParameterValues("R_RULE"));
		String R_NAME = request.getParameter("R_NAME");
		
		HttpSession session = request.getSession();
		Room room = (Room)session.getAttribute("room");
		
		room.setR_detail(R_DETAIL);
		room.setR_rule(R_RULE);
		room.setR_name(R_NAME);
		
		
		System.out.println("5단계.");
		
		session.getAttribute("at");
		session.getAttribute("fileList");
		
		session.setAttribute("room", room);
		
		request.getRequestDispatcher("views/room/RoomInsert6.jsp").forward(request, response);		
				
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

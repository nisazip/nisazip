package kh.room.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kh.room.model.service.rService;
import kh.room.model.vo.Room;

/**
 * Servlet implementation class SInsertServlet
 */
@WebServlet("/rInsert7.do")
public class RInsertServlet7 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RInsertServlet7() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int PRICE = Integer.parseInt(request.getParameter("PRICE"));
		
		String pno = request.getParameter("pno");
		
		HttpSession session = request.getSession();
		Room room = (Room)session.getAttribute("room");
		
		room.setPrice(PRICE);
		
		
		System.out.println("7단계.");
	
		session.getAttribute("at");
		session.getAttribute("fileList");
		
		session.setAttribute("room", room);
		//request.getRequestDispatcher("view/RoomInsert8.jsp").forward(request, response);
		
		System.out.println("1~7: "+room);
		
		rService rs = new rService();
		
		int result = rs.insertRoom(room);
		
		String page = "";
		if(result > 0){
			System.out.println("숙소 등록 완료! : "+room);
			page = "views/room/Roomlist.jsp";
			request.setAttribute("list", rs.selectList());
			/*RequestDispatcher view = request.getRequestDispatcher("index.jsp");
			view.forward(request, response);*/
		} else {
			System.out.println("숙소 등록 실패!");
			page = "views/common/errorPage.jsp";
			
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

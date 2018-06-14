package kh.room.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.room.model.dao.rDao;
import kh.room.model.service.rService;


/**
 * Servlet implementation class RDeleteRoomServlet
 */
@WebServlet("/deleteRoom.no")
public class RDeleteRoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RDeleteRoomServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num = request.getParameter("num");
		
		int deleteSearch = new rService().deleteSearch(num);
		
		if(deleteSearch == 0){
			
			int result = new rService().DeleteRoom(num);
			
			String page = "";
			if(result > 0){
				page = "views/room/Roomlist.jsp";
				request.setAttribute("list", new rService().selectList());
			} else {
				System.out.println("삭제 실패!");
				page = "views/common/errorPage.jsp";
			}
			request.getRequestDispatcher(page).forward(request, response);
		} else {
			String resMsg = "남아있는 예약이 있어서 삭제가 불가능 합니다., 남아있는 예약수: " + deleteSearch;
			request.setAttribute("resMsg", resMsg);
			request.getRequestDispatcher("/views/room/Room.jsp").forward(request, response);
		}
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
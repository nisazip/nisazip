package kh.room.controller.statistics;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.room.model.service.rService;
import kh.room.model.vo.R_RESERVATION;

/**
 * Servlet implementation class RstatisticsServlet
 */
@WebServlet("/Rstatistics.no")
public class RstatisticsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RstatisticsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("통계 서블릿!");
		ArrayList<R_RESERVATION> list = null;
		
		list = new rService().selectReservationlist();
		
		System.out.println("list : " + list);
		
		String page = "";
		if(list != null){
			page = "views/room/RoomTOTAL.jsp";
			request.setAttribute("list", list);
		} else {
			System.out.println("실패!");
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

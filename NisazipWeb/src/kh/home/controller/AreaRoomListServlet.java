package kh.home.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.home.model.service.RoomService;
import kh.home.model.service.TripService;
import kh.room.model.vo.Room;
import kh.trip.model.vo.Trip;

/**
 * Servlet implementation class AreaRoomListServlet
 */
@WebServlet("/arealist.ho")
public class AreaRoomListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AreaRoomListServlet() {
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String area = request.getParameter("keyword");
		
		RoomService roomServ = new RoomService();
		TripService tripServ = new TripService();
		
		String page="";
		page="search.jsp";
		
		// keyword 에 대한 List 객체 조회
		
		ArrayList<HashMap<String, Object>> rlist = roomServ.searchKeyword(area);
		ArrayList<HashMap<String, Object>> tlist = tripServ.searchKeyword(area);
		
		System.out.println("결과 rlist : "+rlist);
		System.out.println("결과 tlist : "+tlist);
		
		request.setAttribute("area",area);
		request.setAttribute("rlist", rlist);
		request.setAttribute("tlist", tlist);
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

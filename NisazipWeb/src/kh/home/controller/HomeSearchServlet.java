package kh.home.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.home.model.service.RoomService;
import kh.home.model.service.TripService;
import kh.home.model.vo.Room;
import kh.home.model.vo.Trip;

/**
 * Servlet implementation class HomeSearchServlet
 */
@WebServlet("/search.ho")
public class HomeSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String location = request.getParameter("location");
		String checkin = request.getParameter("checkin");
		String checkout = request.getParameter("checkout");
		String adults = request.getParameter("adults");
		String children = request.getParameter("children");
		
		java.sql.Date day = null;
		
		if(checkin != ""){
			String[] dateArr = checkin.split("-");
			int[] drr = new int[dateArr.length];
			
			for(int i = 0; i<dateArr.length;i++){
				drr[i] = Integer.parseInt(dateArr[i]);
			}
			day = new java.sql.Date(new GregorianCalendar(drr[0],drr[1]-1,drr[2]).getTimeInMillis());
			
		}else{
			day = new java.sql.Date(new GregorianCalendar().getTimeInMillis());
		}
		
		ArrayList<Room> rlist = new RoomService().searchRoom(location,checkin,checkout,adults,children);
		ArrayList<Trip> tlist = new TripService().searchTrip(location,checkin,checkout,adults,children);
		
		String page="";
		if( rlist != null || tlist != null){
			page="views/notice/noticeList.jsp";
			request.setAttribute("rlist", rlist);
			request.setAttribute("tlist", tlist);
		}else{
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "검색을 실패하였습니다.");
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

package kh.room.controller.Reservation;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.member.model.vo.Member;
import kh.room.model.service.rService;
import kh.room.model.vo.R_RESERVATION;
import kh.room.model.vo.Room;

/**
 * Servlet implementation class ReservationDetailServlet
 */
@WebServlet("/roomReservation.no")
public class ReservationDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("서블릿으로 넘어감!");
		String num = request.getParameter("num");
		int price = Integer.parseInt(request.getParameter("price"));
		String R_START_DATE = request.getParameter("R_START_DATE");
		String R_END_DATE = request.getParameter("R_END_DATE");
		int day = Integer.parseInt(request.getParameter("R_END_DATE")) - Integer.parseInt(request.getParameter("R_START_DATE"));
		int people = Integer.parseInt(request.getParameter("people"));
		int R_MAX_NUM = Integer.parseInt(request.getParameter("max_num"));
		String id = request.getParameter("id");
		
		int result = 0;
		R_RESERVATION res = new R_RESERVATION();
		Room room = new Room();
		
		res.setTotal_price((price*day*people)+((price*day*people))/10);
		res.setCheck_in(R_START_DATE);
		res.setCheck_out(R_END_DATE);
		res.setPeople(people);
		res.setR_id(num);
		room.setR_max_num(R_MAX_NUM);
		res.setUser_id(id);
		
		int roomTotalpeople = new rService().roomTotalcount(res.getR_id(), res.getCheck_in(), res.getCheck_out());
		
		String page = "";
		
		if(roomTotalpeople + res.getPeople() >= room.getR_max_num() ){
			String countMsg = "예약가능한 인원을 초과하였습니다.예약 가능 인원 : "+(room.getR_max_num()-roomTotalpeople);
			request.setAttribute("countMsg", countMsg);
			page = "/ViewRoom.no";	
			//request.getRequestDispatcher("ViewRoom.no").forward(request, response);
		} else {
			result = new rService().ReservationPrice(res);
		
		
		if(result > 0){
			res = new rService().selectRecent(res);
			System.out.println("성공!");
			System.out.println(res);
			page = "views/room/ReservationRoom.jsp";
			request.setAttribute("res", res);
		} else {
			System.out.println("실패");
//			page = "views/common/errorPage.jsp";
		}
			
		}
		request.getRequestDispatcher(page).forward(request, response);
		/*String page = "";
		if(result > 0){
			res = new rService().selectRecent();
			
			System.out.println("성공!");
			System.out.println(res);
			page = "views/room/ReservationRoom.jsp";
			request.setAttribute("res", res);
		} else {
			System.out.println("실패");
			page = "views/common/errorPage.jsp";
		}request.getRequestDispatcher(page).forward(request, response);*/
		
		/*int result = 0;
		Room room = new Room();
		room.setPrice(price);
		room.setDay(day);
		room.setPeople(people);

		result = new rService().multipleRes(room);
		
		String page = "";
		if(result > 0){
			System.out.println("성공!");
			page = "views/ReservationRoom.jsp";
			request.setAttribute("room", room);
		} else {
			System.out.println("실패");
		}*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

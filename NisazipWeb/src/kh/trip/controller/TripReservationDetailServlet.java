package kh.trip.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kh.member.model.vo.Member;
import kh.trip.model.service.TripRegistService;
import kh.trip.model.vo.T_RESERVATION;

@WebServlet("/TripReservation.trip")
public class TripReservationDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public TripReservationDetailServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("------------- Reservation 서블릿으로 이동 ------------");

		HttpSession session = request.getSession();
		Member m = (Member) session.getAttribute("member");
		String userId = m.getUser_id();

		String tripNumber = request.getParameter("tripNumber");
		int price = Integer.parseInt(request.getParameter("price"));
		String startTime = request.getParameter("T_START_DATE");
		int people = Integer.parseInt(request.getParameter("people"));

		int result = 0;
		T_RESERVATION trip_reservation = new T_RESERVATION();

		trip_reservation.setT_id(tripNumber);
		trip_reservation.setUser_id(userId);
		trip_reservation.setGuest_num(people);
		trip_reservation.setT_date(startTime);
		// trip_reservation.setT_date(startTime + " ~ " + endTime);
		trip_reservation.setTotal_price((price * people));

		request.setAttribute("trip_reservation", trip_reservation);

		System.out.println("Servlet단 trip_reservation : " + trip_reservation);

		System.out.println("trip_reservation.getT_id()" + trip_reservation.getT_id());
		int maxPeople = new TripRegistService().maxPeople(trip_reservation.getT_id());

		int tripTotalCount = new TripRegistService().tripTotalCount(trip_reservation.getT_id(),
				trip_reservation.getT_date());

		System.out.println("tripTotalCount : " + tripTotalCount);

		if (tripTotalCount + trip_reservation.getGuest_num() > maxPeople) {
			String countMsg = "예약가능한 인원을 초과하였습니다.예약 가능 인원 : " + (maxPeople - tripTotalCount);
			request.setAttribute("countMsg", countMsg);
			request.getRequestDispatcher("/registedTrip_guest.trip").forward(request, response);
		} else {
			result = new TripRegistService().ReservationPrice(trip_reservation);

			System.out.println("Servelt단 result : " + result);

			String page = "";
			if (result > 0) {
				trip_reservation = new TripRegistService().selectTripRecent();
				System.out.println("성공!");
				System.out.println("trip_reservation : " + trip_reservation);
				page = "/views/regist/17Reservation_trip_guest.jsp";

			} else {
				System.out.println("실패");
			}
			request.getRequestDispatcher(page).forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

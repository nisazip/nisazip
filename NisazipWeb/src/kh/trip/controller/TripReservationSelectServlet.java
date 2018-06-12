package kh.trip.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.trip.model.service.TripRegistService;
import kh.trip.model.vo.T_RESERVATION;

@WebServlet("/ReservationselectOne.trip")
public class TripReservationSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public TripReservationSelectServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String tripNumber = request.getParameter("tripNumber");

		System.out.println("tripNumber : " + tripNumber);

		T_RESERVATION trip_reservation = new TripRegistService().selectTwo(tripNumber);

		System.out.println("Servlet단 trip_reservation : " + trip_reservation);
		
		request.setAttribute("trip_reservation", trip_reservation);
		
		String page = "";
		if (trip_reservation != null) {
			page = "/views/regist/16Reservation_trip_detail.jsp";
		} else {
			System.out.println("접근 실패!");
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

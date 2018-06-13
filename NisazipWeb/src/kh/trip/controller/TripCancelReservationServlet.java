package kh.trip.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.trip.model.service.TripRegistService;
import kh.trip.model.vo.T_RESERVATION;
import kh.trip.model.vo.Trip;

@WebServlet("/CancelReservation.trip")
public class TripCancelReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public TripCancelReservationServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("---------- 예약 취소 서블릿 시작 ----------");
		

		String tripNumber = request.getParameter("tripNumber");

		System.out.println("예약 취소 서블릿에서의 tripNumber : " + tripNumber);

		T_RESERVATION delRes = new T_RESERVATION();
		delRes.getT_id();
		delRes.getTotal_price();
		delRes.getT_date();
		delRes.getUser_id();

		Trip delTrip = new Trip();

		delTrip.getT_id();
		delTrip.getT_name();
		delTrip.getHost_id();

		int cancelTrip = new TripRegistService().cancelTrip(tripNumber, delTrip, delRes);

		System.out.println("Cancel Servlet cancelTrip : " + cancelTrip);

		String page = "";
		if (cancelTrip > 0) {
			page = "/views/regist/20CancelReservationTrip.jsp";
			request.setAttribute("delRes", delRes);
			request.setAttribute("delTrip", delTrip);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

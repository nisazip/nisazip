package kh.trip.controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.trip.model.service.TripRegistService;
import kh.trip.model.vo.T_RESERVATION;
import kh.trip.model.vo.Trip;

@WebServlet("/TripReservationList.trip")
public class TripReservationListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public TripReservationListServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ArrayList<T_RESERVATION> trip_list = new TripRegistService().selectReservation();

		System.out.println("Servlet trip_list : " + trip_list);

		String page = "";

		if (trip_list != null) {
			page = "/views/regist/15Reservation_trip_list.jsp";
			request.setAttribute("trip_list", trip_list);
		} else {
			page = "/views/common/errorPage.jsp";
		}

		request.getRequestDispatcher(page).forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

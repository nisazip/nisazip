package kh.trip.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kh.trip.model.vo.Trip;

@WebServlet("/insertReservation.trip")
public class InsertTripReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public InsertTripReservationServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String startReservation = request.getParameter("datepicker1");
		String endReservation = request.getParameter("datepicker2");

		HttpSession session = request.getSession();

		Trip tregist = (Trip) session.getAttribute("tregist");

		
		
		tregist.setT_start_date(startReservation);
		tregist.setT_end_date(endReservation);
		
		session.setAttribute("tregist", tregist);
		
		System.out.println("시작 기간 : " + startReservation);
		System.out.println("종료 기간 : " + endReservation);
		System.out.println("시작 및 종료 기간 객체 확인 : " + tregist);
		
		request.getRequestDispatcher("/views/regist/9trip_picture.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

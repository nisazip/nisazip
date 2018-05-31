package kh.trip.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kh.trip.model.vo.TripRegist;

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

		TripRegist tregist = (TripRegist) session.getAttribute("tregist");

		/*// 시간 계산하여 DB 용도의 날짜 값으로 변환
		java.sql.Date startDay = null;

		if (startReservation != "") {
			String[] dateArr = startReservation.split("-");
			int[] drr = new int[dateArr.length];

			for (int i = 0; i < dateArr.length; i++) {
				drr[i] = Integer.parseInt(dateArr[i]);
			}
			startDay = new java.sql.Date(new GregorianCalendar(drr[0], drr[1] - 1, drr[2]).getTimeInMillis());
		} else {
			startDay = new java.sql.Date(new GregorianCalendar().getTimeInMillis());
		}

		// 시간 계산하여 DB 용도의 날짜 값으로 변환
		java.sql.Date endDay = null;

		if (endReservation != "") {
			String[] dateArr = endReservation.split("-");
			int[] drr = new int[dateArr.length];

			for (int i = 0; i < dateArr.length; i++) {
				drr[i] = Integer.parseInt(dateArr[i]);
			}
			endDay = new java.sql.Date(new GregorianCalendar(drr[0], drr[1] - 1, drr[2]).getTimeInMillis());
		} else {
			endDay = new java.sql.Date(new GregorianCalendar().getTimeInMillis());
		}*/
		
		tregist.setTrip_stratReservation(startReservation);
		tregist.setTrip_endReservation(endReservation);
		
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

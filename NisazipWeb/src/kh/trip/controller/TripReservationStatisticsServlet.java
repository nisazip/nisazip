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

@WebServlet("/Trip_statistics.trip")
public class TripReservationStatisticsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public TripReservationStatisticsServlet() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("-------- 예약자 통계 서블릿 실행 --------");
		
		ArrayList<T_RESERVATION> list = new TripRegistService().selectReservationList();
		
		System.out.println("통계 서블릿단에서의 list : " + list);
		
		String page="";
		if(list != null){
			page="/views/regist/18Reservation_trip_statistics.jsp";
			request.setAttribute("list", list);
		} else {
			page="/views/common/errorPage.jsp";
		}
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

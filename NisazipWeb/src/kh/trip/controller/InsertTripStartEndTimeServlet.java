package kh.trip.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kh.trip.model.vo.TripRegist;

@WebServlet("/insertTime.trip")
public class InsertTripStartEndTimeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public InsertTripStartEndTimeServlet() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String startTime = request.getParameter("startTime");
		String endTime = request.getParameter("endTime");
		
		HttpSession session = request.getSession();
		
		TripRegist tregist = (TripRegist)session.getAttribute("tregist");
		
		tregist.setTrip_startTime(startTime);
		tregist.setTrip_endTime(endTime);
		
		session.setAttribute("tregist", tregist);
		
		System.out.println("시작 시간 : " + startTime);
		System.out.println("종료 시간 : " + endTime);
		System.out.println("시작 및 종료 시간 : " + tregist);
		
		request.getRequestDispatcher("/views/regist/7trip_introduce.jsp").forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

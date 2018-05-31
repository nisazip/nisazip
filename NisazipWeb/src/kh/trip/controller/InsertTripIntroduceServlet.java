package kh.semi.trip.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kh.semi.trip.model.vo.TripRegist;

@WebServlet("/insertIntroduce.trip")
public class InsertTripIntroduceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InsertTripIntroduceServlet() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String introduce = request.getParameter("introduce");
		
		HttpSession session = request.getSession();
		
		TripRegist tregist = (TripRegist)session.getAttribute("tregist");
		
		tregist.setTrip_introduce(introduce);
		
		session.setAttribute("tregist", tregist);
		
		System.out.println("상세 소개 : " + introduce);
		System.out.println("객체 안에 상세 소개 : " + tregist);
		
		request.getRequestDispatcher("/views/regist/8trip_reservation.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

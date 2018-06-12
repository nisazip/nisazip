package kh.trip.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kh.trip.model.vo.Trip;

@WebServlet("/insertMaxPeople.trip")
public class InsertTripMaxPeopleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InsertTripMaxPeopleServlet() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));
		
		System.out.println("maxPeople : " + maxPeople);
		
		HttpSession session = request.getSession();
		
		Trip tregist = (Trip)session.getAttribute("tregist");
		
		tregist.setT_max_num(maxPeople);
		
		session.setAttribute("tregist", tregist);
		
		System.out.println("최대 인원 수 : " + tregist);
		
		request.getRequestDispatcher("/views/regist/6trip_timeStartEnd.jsp").forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

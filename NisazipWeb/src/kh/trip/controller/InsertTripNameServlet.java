package kh.semi.trip.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kh.semi.trip.model.vo.TripRegist;

@WebServlet("/insertName.trip")
public class InsertTripNameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InsertTripNameServlet() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String trip_title = request.getParameter("trip_title");
		
		System.out.println("1trip_title : " + trip_title);
		
		HttpSession session = request.getSession();
		
//		TripRegist tregist = (TripRegist) session.getAttribute("member");
		
		TripRegist tregist = new TripRegist();

		tregist.setTrip_name(trip_title);	
		
		session.setAttribute("tregist", tregist);
	
		System.out.println("Trip명 : " + tregist);
	
		request.getRequestDispatcher("/views/regist/2trip_add.jsp").forward(request, response);
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package kh.trip.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kh.trip.model.vo.TripRegist;

@WebServlet("/insertCategory.trip")
public class InsertTripCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InsertTripCategoryServlet() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String category = request.getParameter("category");
		
		System.out.println("유형 : " + category);

		HttpSession session = request.getSession();
		
		TripRegist tregist= (TripRegist)session.getAttribute("tregist");
		
		tregist.setTrip_category(category);
		
		session.setAttribute("tregist", tregist);
		
		System.out.println("선택한 유형 : " + tregist);
		
		request.getRequestDispatcher("views/regist/4trip_lang.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

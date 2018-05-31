package kh.semi.trip.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kh.semi.trip.model.vo.TripRegist;

@WebServlet("/insertPrice.trip")
public class InsertTripPriceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InsertTripPriceServlet() {  }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int price =Integer.parseInt(request.getParameter("price"));
		
		HttpSession session = request.getSession();
		
		TripRegist tregist = (TripRegist)session.getAttribute("tregist");
		
		tregist.setTrip_price(price);
		
		session.setAttribute("tregist", tregist);
		
		System.out.println("가격 : " + price);
		
		System.out.println("객체에 담긴 가격 : " + tregist);
		
//		session.getAttribute("tregist");
		
		request.getRequestDispatcher("/views/regist/11trip_registed.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

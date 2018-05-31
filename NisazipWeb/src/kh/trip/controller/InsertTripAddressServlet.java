package kh.trip.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kh.trip.model.vo.TripRegist;

@WebServlet("/insertAdd.trip")
public class InsertTripAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InsertTripAddressServlet() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String address = request.getParameter("zipCode") + "| " + request.getParameter("address1") + "| "  + request.getParameter("address2");
		
		System.out.println("주소 : " + address);
		
		HttpSession session = request.getSession();
		
		TripRegist tregist= (TripRegist)session.getAttribute("tregist");
		
		tregist.setTrip_address(address);
		
		session.setAttribute("tregist", tregist);
		
		System.out.println("주소값 : " + tregist);
		
		request.getRequestDispatcher("/views/regist/3trip_category.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package kh.trip.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kh.trip.model.service.TripRegistService;
import kh.trip.model.vo.TripRegist;

@WebServlet("/insertPrice.trip")
public class InsertTripPriceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InsertTripPriceServlet() {  }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String tno = request.getParameter("tripNumber");
		int price =Integer.parseInt(request.getParameter("price"));
		
		HttpSession session = request.getSession();
		
		TripRegist tregist = (TripRegist)session.getAttribute("tregist");
		
		tregist.setTrip_price(price);
		//tregist.setTno(tno);
		
		//System.out.println("시퀀스 : " + tregist.getTno());
		
		System.out.println("가격 : " + price);
		
		System.out.println("객체 정보 : " + tregist);
		
		int result = new TripRegistService().insertTrip(tregist);
		
		tregist = new TripRegistService().selectRecent(tno);
		
		session.setAttribute("tregist", tregist);
		
		String page ="";
		if(result > 0){
			
			page = "/views/regist/11trip_registed.jsp";
			request.getRequestDispatcher(page).forward(request, response);
			
		} else {
			
			page = "/views/common/errorPage.jsp";
			request.getRequestDispatcher(page).forward(request, response);

		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
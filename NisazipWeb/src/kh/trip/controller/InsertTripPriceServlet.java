package kh.trip.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kh.member.model.vo.Member;
import kh.trip.model.service.TripRegistService;
import kh.trip.model.vo.Attachment;
import kh.trip.model.vo.Trip;

@WebServlet("/insertPrice.trip")
public class InsertTripPriceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public InsertTripPriceServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String tno = request.getParameter("tno");
		System.out.println("tno:" + tno);
		int price = Integer.parseInt(request.getParameter("price"));

		HttpSession session = request.getSession();

		Trip tregist = (Trip) session.getAttribute("tregist");
		Member m = (Member)session.getAttribute("member");

		int result = new TripRegistService().insertTrip(tno, price, m);

		tregist.setPrice(price);
		tregist.setT_id(tno);
		tregist.setHost_id(m.getUser_id());

		System.out.println("result 값 : " + result);
		System.out.println("tno : " + tno);
		System.out.println("price : " + price);

		System.out.println("list : " + tregist);

		session.getAttribute("hp");
		session.getAttribute("fileList");
		session.setAttribute("tregist", tregist);
		String page = "";
		if (result > 0) {
			page = "/registedTrip.trip";

			System.out.println("가격 포함 전체 객체 : " + tregist);

		} else {
			page = "/views/common/errorPage.jsp";

		}

		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
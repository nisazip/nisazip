package kh.trip.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kh.trip.model.vo.Trip;

@WebServlet("/insertLanguage.trip")
public class InsertTripLanguageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InsertTripLanguageServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String language = request.getParameter("language");
		
		System.out.println("언어 : " + language);
		
		HttpSession session = request.getSession();
		
		Trip tregist = (Trip)session.getAttribute("tregist");
		
		tregist.setLanguage(language);
		
		session.setAttribute("tregist", tregist);
		
		System.out.println("선택된 언어 : " + tregist);
		
		request.getRequestDispatcher("/views/regist/5trip_maxPeople.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

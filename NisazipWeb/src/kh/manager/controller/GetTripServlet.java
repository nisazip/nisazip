package kh.manager.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kh.manager.model.service.ManagerService;

@WebServlet("/getTrip.mg")
public class GetTripServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetTripServlet() {  }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tno = request.getParameter("tripNo");
		System.out.println("tno : "+ tno);

		HashMap<String, Object> t = new ManagerService().selectOneRoom(tno);

		response.setContentType("application/json; charset=UTF-8");
	      new Gson().toJson(t, response.getWriter());
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

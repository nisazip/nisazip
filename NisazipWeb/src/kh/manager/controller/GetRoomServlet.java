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

@WebServlet("/getRoom.mg")
public class GetRoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public GetRoomServlet() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rNo = request.getParameter("roomNo");
		
		System.out.println("rNo : "+ rNo);

		HashMap<String, Object> t = new ManagerService().selectOneRoom(rNo);

		response.setContentType("application/json; charset=UTF-8");
	      new Gson().toJson(t, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

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

@WebServlet("/getReport.mg")
public class SelectOneReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SelectOneReportServlet() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reNo = Integer.parseInt(request.getParameter("roomNo"));

		HashMap<String, Object> re = new ManagerService().selectOneReport(reNo);

		response.setContentType("application/json; charset=UTF-8");
	      new Gson().toJson(re, response.getWriter());
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

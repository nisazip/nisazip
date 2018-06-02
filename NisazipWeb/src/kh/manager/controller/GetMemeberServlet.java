package kh.manager.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;

import kh.home.model.service.RoomService;
import kh.manager.model.service.ManagerService;
import kh.manager.model.vo.MemeberList;


@WebServlet("/getMember.mg")
public class GetMemeberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public GetMemeberServlet() { }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		HashMap<String, Object> m = new ManagerService().selectOneMember(userNo);
		/*MemeberList m = new ManagerService().selectOneMember(userNo);*/
		
		/*
		ArrayList<HashMap<String, Object>> rlist = new RoomService().selectrList();	   */
		
		
		response.setContentType("application/json; charset=UTF-8");
	      new Gson().toJson(m, response.getWriter());
	    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

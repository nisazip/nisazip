package kh.manager.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kh.manager.model.service.ManagerService;
import kh.manager.model.vo.RecentCnt;

@WebServlet("/visteCnt.mg")
public class VisteCntServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public VisteCntServlet() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*{ y: 100 , label:"15일"},*/
		
		ArrayList<HashMap<String, Object>> recentCnt  = new ManagerService().recentCnt();
		 
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(recentCnt, response.getWriter());
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

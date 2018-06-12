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

import kh.manager.model.service.ManagerService;
import kh.manager.model.vo.ReportList;

@WebServlet("/certifiTop5.mg")
public class CertifiTop5 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public CertifiTop5() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<HashMap<String, Object>> certifiList  = new ManagerService().certifiTop();
		 
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(certifiList, response.getWriter());
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

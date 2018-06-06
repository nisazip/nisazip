package kh.manager.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import kh.manager.model.service.ManagerService;
import kh.manager.model.vo.ReportList;

@WebServlet("/reportTop5.mg")
public class ReportTop5 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public ReportTop5() { }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		JSONArray result = new JSONArray();
		JSONObject Top5Info = null;
		System.out.println("top5 서블릿");
		ArrayList<ReportList> list = new ManagerService().reportTop5();
		
		for(ReportList re : list){
			
			Top5Info = new JSONObject();
			
			Top5Info.put("reNo", re.getUserNo());
			Top5Info.put("userId", re.getUserId());
			Top5Info.put("reCount", re.getReCount());
			
			result.add(Top5Info);
		}
		
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().print(result.toJSONString());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

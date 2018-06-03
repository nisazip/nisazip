package kh.manager.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kh.manager.model.service.ManagerService;
import kh.trip.model.vo.Trip;

@WebServlet("/upRoom.mg")
public class UpdateRoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateRoomServlet() {  }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tripNo = request.getParameter("tripNo");
		String tripName = request.getParameter("tripName");
		int maximum = Integer.parseInt(request.getParameter("maximum"));
		String triptype = request.getParameter("triptype");
		String language = request.getParameter("language");
		String startTime = request.getParameter("startTime");
		String endTime = request.getParameter("endTime");
		int price = Integer.parseInt(request.getParameter("price"));
		String detail = request.getParameter("detail");
		String area = request.getParameter("area");
		String address = request.getParameter("address");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		
		String loc = "37.389205, 126.950686";
		
		Trip t = new Trip(tripNo, tripName, maximum, triptype, language, startTime, endTime, price, detail, area, address, loc, startDate, endDate);
		int result = new ManagerService().updateRoom(t); 
		String msg = "";
		
		if(result >0){
			System.out.println("맴버 수정 성공");
			msg="맴버 수정이 완료되었습니다.";
		}else{
			System.out.println("맴버 수정 실패");
			msg="맴버 수정이 실패하였습니다.";
		}
		
		response.setContentType("application/json; charset=UTF-8");
	      new Gson().toJson(msg, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

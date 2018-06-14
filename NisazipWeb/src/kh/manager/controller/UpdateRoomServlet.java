package kh.manager.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kh.manager.model.service.ManagerService;
import kh.room.model.vo.Room;

@WebServlet("/upRoom.mg")
public class UpdateRoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateRoomServlet() {  }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String roomNo = request.getParameter("roomNo");
		String roomName = request.getParameter("roomName");
		int maximum = Integer.parseInt(request.getParameter("maximum"));
		String roomtype1 = request.getParameter("roomtype1");
		String roomtype2 = request.getParameter("roomtype2");
		String rOption = request.getParameter("rOption");
		int rRoomNum = Integer.parseInt(request.getParameter("rRoomNum"));
		int rBathNum = Integer.parseInt(request.getParameter("rBathNum"));
		int rBedNum = Integer.parseInt(request.getParameter("rBedNum"));
		String detail = request.getParameter("detail");
		String rRole = request.getParameter("rRole");
		int price = Integer.parseInt(request.getParameter("price"));
		String area = request.getParameter("area");
		String address = request.getParameter("address");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		
		Room r = new Room(roomNo, roomName, maximum, roomtype1, roomtype2, rOption, rRoomNum,rBathNum, rBedNum, detail, rRole, price, area, address, startDate, endDate);
		
		int result = new ManagerService().updateRoom(r); 
		String msg = "";
		
		if(result >0){
			System.out.println("숙소 수정 성공");
			msg="숙소 수정이 완료되었습니다.";
		}else{
			System.out.println("숙소 수정 실패");
			msg="숙소 수정이 실패하였습니다.";
		}
		
		response.setContentType("application/json; charset=UTF-8");
	      new Gson().toJson(msg, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
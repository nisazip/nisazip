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
import kh.manager.model.vo.MemeberList;

@WebServlet("/upMemeber.mg")
public class UpdateMemeberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateMemeberServlet() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String birth = request.getParameter("birth");
		int roomHosting = Integer.parseInt(request.getParameter("roomHosting"));
		int tripHosting = Integer.parseInt(request.getParameter("tripHosting"));

		MemeberList m = new MemeberList(userNo, userId, userName, email, phone, birth, roomHosting, tripHosting);
		int result = new ManagerService().updateMemeber(m); 
		System.out.println("m:"+m);
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
		doGet(request, response);
	}

}

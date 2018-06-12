package kh.trip.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.trip.model.service.TripRegistService;


@WebServlet("/deleteTrip.trip")
public class DeleteTripServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeleteTripServlet() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println(" --------- Delete Trip 서블릿 실행 -----------");
		
		String tripNum = request.getParameter("TripNum");
		
		System.out.println("Delete Trip tripNum : " + tripNum);
		
		// 삭제 안되게 막는 부분 -> deleteSearch
		int deleteSearch = new TripRegistService().deleteSearch(tripNum);
	
		if(deleteSearch == 0){
			int result = new TripRegistService().deleteTrip(tripNum);
			
			System.out.println("Delete Trip 결과 값 : " + result);
			
			String page = "";
			if(result > 0){
				page = "/index.jsp";
				// 삭제 완료후 메인 페이지에서의 trip 리스트에서도 삭제 시키는 부분을 추가해야 함.
			} else {
				page= "/views/common/errorPage.jsp";
			}
			
			request.getRequestDispatcher(page).forward(request, response);
		} else {
			String resMsg1 = "남아있는 예약이 존재하기 때문에";
			String resMsg2 = "삭제가 불가능 합니다.";
			String resMsg3 = deleteSearch + "건이 있습니다.";
			request.setAttribute("resMsg1", resMsg1);
			request.setAttribute("resMsg2", resMsg2);
			request.setAttribute("resMsg3", resMsg3);
			request.getRequestDispatcher("/registedTrip.trip").forward(request, response);
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package kh.trip.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kh.member.model.vo.Member;
import kh.trip.model.service.TripRegistService;
import kh.trip.model.vo.Attachment;
import kh.trip.model.vo.Trip;

@WebServlet("/modifyTrip.trip")
public class ModifyTripViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ModifyTripViewServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		Member m = (Member) session.getAttribute("member");
		String userId = m.getUser_id();

		request.getAttribute("tregist");
		request.getAttribute("hp");
		request.getAttribute("picList");

		System.out.println("수정 Trip 객체 : " + request.getAttribute("tregist"));

		String tripNum = request.getParameter("tripNumber");

		int modifySearch = new TripRegistService().modifySearch(tripNum);

		System.out.println("수정 서블릿에서의 tripNum : " + tripNum);

		System.out.println("수정 서블릿에서의 예약 개수 : " + modifySearch);

		Trip t = new TripRegistService().getTrip(userId);
		ArrayList<Attachment> list = new TripRegistService().getPicture(userId);

		System.out.println("수정 서블릿단에서의 tregist : " + t);

		System.out.println("list.get(0) : " + list.get(0));
		System.out.println("list.get(1) : " + list.get(1));
		System.out.println("list.get(2) : " + list.get(2));

		System.out.println("list.get(0).getChange_name() : " + list.get(0).getChange_name());

		System.out.println("Change_name : " + list);

		if (modifySearch == 0) {
			String page = "";
			if (t != null && list != null) {
				page = "/views/regist/13trip_modify.jsp";
				request.setAttribute("tregist", t);
				request.setAttribute("picList", list);

			} else {
				page = "/views/common/errorPage.jsp";
				System.out.println("업데이트 실패");
			}
			request.getRequestDispatcher(page).forward(request, response);
		} else {
			String modifyMsg1 = "이전 정보를 보고 진행된 예약이 존재하기 때문에";
			String modifyMsg2 = "수정이 불가능 합니다.";
			String modifyMsg3 = "남아있는 예약 수가 " + modifySearch + "건이 있습니다.";
			request.setAttribute("modifyMsg1", modifyMsg1);
			request.setAttribute("modifyMsg2", modifyMsg2);
			request.setAttribute("modifyMsg3", modifyMsg3);

			request.getRequestDispatcher("/registedTrip.trip").forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

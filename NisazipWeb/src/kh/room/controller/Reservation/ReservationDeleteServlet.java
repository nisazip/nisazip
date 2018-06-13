package kh.room.controller.Reservation;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.room.model.service.rService;

/**
 * Servlet implementation class ReservationDeleteServlet
 */
@WebServlet("/ResDelete.no")
public class ReservationDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("예약 취소 서블릿 접근 성공!!!");
		
		String Resname = request.getParameter("Resname");
		int price = Integer.parseInt(request.getParameter("price"));
		
		int result = new rService().DeleteReservation(Resname, price);
		
		System.out.println("예약 취소 서블릿 result : " + result);
		String page = "";
		if(result > 0){
			page ="views/member/myBin.jsp";
			request.setAttribute("list", new rService().selectReservation());
			/*String DelMsg = "예약 취소 되었습니다!";
			request.setAttribute("DelMsg", DelMsg);	*/
		} else {
			System.out.println("삭제 실패!");
			page = "views/common/errorPage.jsp";
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

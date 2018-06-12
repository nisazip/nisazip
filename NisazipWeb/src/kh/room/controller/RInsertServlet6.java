package kh.room.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kh.room.model.vo.Room;

/**
 * Servlet implementation class SInsertServlet
 */
@WebServlet("/rInsert6.do")
public class RInsertServlet6 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RInsertServlet6() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String R_START_DATE = request.getParameter("R_START_DATE");
		String R_END_DATE = request.getParameter("R_END_DATE");
		
		/*java.sql.Date Startday =null;
		if(R_START_DATE != ""){
			String[] dateArr = R_START_DATE.split("-");
			int[] drr = new int[dateArr.length];
			for(int i = 0; i < dateArr.length; i++){
				drr[i] = Integer.parseInt(dateArr[i]);
			}
			Startday = new java.sql.Date(new GregorianCalendar(drr[0], drr[1] - 1, drr[2]).getTimeInMillis());
		}else{
			Startday = new java.sql.Date(new GregorianCalendar().getTimeInMillis());
		}
		
		java.sql.Date Endday =null;
		if(R_START_DATE != ""){
			String[] dateArr2 = R_END_DATE.split("-");
			int[] drr2 = new int[dateArr2.length];
			for(int i = 0; i < dateArr2.length; i++){
				drr2[i] = Integer.parseInt(dateArr2[i]);
			}
			Endday = new java.sql.Date(new GregorianCalendar(drr2[0], drr2[1] - 1, drr2[2]).getTimeInMillis());
		}else{
			Endday = new java.sql.Date(new GregorianCalendar().getTimeInMillis());
		}*/
		
		HttpSession session = request.getSession();
		Room room = (Room)session.getAttribute("room");
		
		room.setR_start_date(R_START_DATE);
		room.setR_end_date(R_END_DATE);
		room.setR_date(new SimpleDateFormat("yy/MM/dd").format(Calendar.getInstance().getTime()));
		System.out.println(new SimpleDateFormat("yy/MM/dd").format(Calendar.getInstance().getTime()));
		System.out.println("6단계.");
		
		session.getAttribute("at");
		session.getAttribute("fileList");
		
		session.setAttribute("room", room);
		request.getRequestDispatcher("views/room/RoomInsert7.jsp").forward(request, response);		
				
		/*int R_MAX_NUM = 0;
		if(request.getParameter("R_MAX_NUM") != null) {
			
			R_MAX_NUM = Integer.parseInt(request.getParameter("R_MAX_NUM"));
			System.out.println(R_MAX_NUM);
			page = "view/숙소등록2.jsp";
			request.getRequestDispatcher(page).forward(request, response);
		}
		int ROOM_NUM = Integer.parseInt(request.getParameter("ROOM_NUM"));
		int BED_NUM = Integer.parseInt(request.getParameter("BED_NUM"));
		
		int TOILET_NUM = 0;
		if(request.getParameter("TOILET_NUM") != null){
			
			TOILET_NUM = Integer.parseInt(request.getParameter("TOILET_NUM"));
			System.out.println(TOILET_NUM);
			String advantage = String.join(", ", request.getParameterValues("advantage"));
			page = "view/숙소등록3.jsp";
			request.getRequestDispatcher(page).forward(request, response);
		}*/
		/*int ROOM_NUM = Integer.parseInt(request.getParameter("ROOM_NUM"));
		int BED_NUM = Integer.parseInt(request.getParameter("BED_NUM"));
		int TOILET_NUM = Integer.parseInt(request.getParameter("TOILET_NUM"));
		
		
		String advantage = String.join(", ", request.getParameterValues("advantage"));
		String R_LOC = request.getParameter("zipCode")+", "+request.getParameter("address1")+", "+request.getParameter("address2");
		String R_PIC = request.getParameter("R_PIC");
		String R_DETAIL = request.getParameter("R_DETAIL");
		String R_RULE = String.join(", ", request.getParameterValues("R_RULE"));
		String R_NAME = request.getParameter("R_NAME");
		String R_START_DATE = request.getParameter("R_START_DATE");
		String R_END_DATE = request.getParameter("R_END_DATE");
		int PRICE = Integer.parseInt(request.getParameter("PRICE"));
		
		System.out.println("R_TYPE : " + R_TYPE);
		
		HttpSession session = request.getSession();
		
		session.getAttribute("R_TYPE");
		
		System.out.println("R_TYPE : " + R_TYPE);
		
		java.sql.Date Startday =null;
		if(R_START_DATE != ""){
			String[] dateArr = R_START_DATE.split("-");
			int[] drr = new int[dateArr.length];
			for(int i = 0; i < dateArr.length; i++){
				drr[i] = Integer.parseInt(dateArr[i]);
			}
			Startday = new java.sql.Date(new GregorianCalendar(drr[0], drr[1] - 1, drr[2]).getTimeInMillis());
		}else{
			Startday = new java.sql.Date(new GregorianCalendar().getTimeInMillis());
		}
		
		java.sql.Date Endday =null;
		if(R_START_DATE != ""){
			String[] dateArr2 = R_END_DATE.split("-");
			int[] drr2 = new int[dateArr2.length];
			for(int i = 0; i < dateArr2.length; i++){
				drr2[i] = Integer.parseInt(dateArr2[i]);
			}
			Endday = new java.sql.Date(new GregorianCalendar(drr2[0], drr2[1] - 1, drr2[2]).getTimeInMillis());
		}else{
			Endday = new java.sql.Date(new GregorianCalendar().getTimeInMillis());
		}
		
		Room r = new Room();
		
		r.setR_type(R_TYPE);
		r.setR_type2(R_TYPE2);
		r.setR_name(R_NAME);
		r.setR_max_num(R_MAX_NUM);
		r.setR_detail(R_DETAIL);
		r.setR_start_date(Startday);
		r.setR_end_date(Endday);
		r.setPrice(PRICE);
		r.setR_loc(R_LOC);
		
		System.out.println("?");
		System.out.println(r);
		
		int result = new rService().insertRoom(r);
		
		System.out.println("Result: "+result);
		
		if(new rService().insertRoom(r) > 0){
			System.out.println("성공");
			RequestDispatcher view = request.getRequestDispatcher("index.jsp");
			view.forward(request, response);
		} else {
			System.out.println("실패");
		}
		
	
*/
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package kh.report.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.report.model.service.ReportService;
import kh.report.model.vo.Report;


@WebServlet("/reportInsert.re")
public class ReportInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public ReportInsertServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String rp_writer =request.getParameter("rp_writer");
		String rp_receiver = request.getParameter("rp_receiver");
	    String rp_type = request.getParameter("rp_type");
		String rp_content = request.getParameter("rp_content");
		
		
		
		Report rp = new Report();
		
		rp.setRp_content(rp_content);
		rp.setRp_type(rp_type);
		rp.setRp_writer(rp_writer);
		rp.setRp_receiver(rp_receiver);
		
		int result = new ReportService().reportInsert(rp);
		System.out.println("결과"+result); //1이  성공
	/*	String page= "";
		if(result>0){
			page ="views/report/reportResult.jsp";
			request.setAttribute("report", rp);
		}else{
			page ="views/common/errorPage.jsp";
			request.setAttribute("msg", "신고하기 실패");
		}
	        
		request.getRequestDispatcher(page).forward(request, response);*/
		response.getWriter().print(result);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

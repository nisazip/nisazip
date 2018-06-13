package kh.review.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kh.review.model.service.ReviewService;

/**
 * Servlet implementation class ReviewListServlet
 */
@WebServlet("/reviewList.re")
public class ReviewListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hosting_id = request.getParameter("hosting_id_r");
		String type = request.getParameter("type");
		
		System.out.println(type);
		ArrayList<HashMap<String, Object>> rlist =null;
		if(type.equals("time")){
			rlist =new ReviewService().reviewListTime(hosting_id);
		}else if(type.equals("score")){
			rlist =new ReviewService().reviewListScore(hosting_id);
		}else{
			rlist =new ReviewService().reviewListScoreAsc(hosting_id);
		}

		System.out.println(rlist);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(rlist, response.getWriter());
	}
	
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

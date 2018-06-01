package kh.home.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kh.home.model.service.RoomService;
import kh.home.model.service.TripService;
import kh.home.model.vo.Room;
import kh.home.model.vo.Trip;

/**
 * Servlet implementation class KeywordSearchServlet
 */
@WebServlet("/keywordSearch.ho")
public class KeywordSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KeywordSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyword = request.getParameter("keyword");
		
		ArrayList<HashMap<String, Object>> rlist = new RoomService().searchKeyword(keyword);
		ArrayList<HashMap<String, Object>> tlist = new TripService().searchKeyword(keyword);
		
		HashMap<String, ArrayList> data = new HashMap<String, ArrayList>();
		
		data.put("rlist", rlist);
		data.put("tlist", tlist);
		
		response.setContentType("application/json; charset=UTF-8");
		
		if(rlist.size() > 0 || tlist.size() > 0){
			new Gson().toJson(data, response.getWriter());
		}/*else if(rlist.size() == 0){
			
		}else if(tlist.size() == 0){
		
		}*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

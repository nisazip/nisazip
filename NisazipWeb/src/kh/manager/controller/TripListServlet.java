package kh.manager.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.manager.model.service.ManagerService;
import kh.trip.model.vo.Trip;

@WebServlet(name = "TListServlet", urlPatterns = { "/tripList.mg" })
public class TripListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public TripListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Trip> list = new ManagerService().tList();
		String page="";
		System.out.println("서블릿 : "+list);
		if(list != null){
			page="views/manager/trip_mng.jsp";
			request.setAttribute("tList", list);
			request.getRequestDispatcher(page).forward(request, response);
		}else{
			page="views/Common/errorPage.jsp";
			request.getRequestDispatcher(page).forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

/*
CREATE TABLE MEMBER(
        USER_NO NUMBER PRIMARY KEY,                            -- 회원번호
        USER_ID VARCHAR2(30) NOT NULL UNIQUE,                  -- 아이디
        PASSWORD VARCHAR2(100) NOT NULL,                       -- 비밀번호
        USER_NAME VARCHAR2(20) NOT NULL,                       -- 이름
        EMAIL VARCHAR2(30) UNIQUE,                             -- 이메일
        PHONE CHAR(13),                                        -- 연락처
        GENDER CHAR(1) CHECK( GENDER IN('F','M')),             -- 성별
        BIRTHDATE date,                                        -- 생년월일
        LIKEROOMS VARCHAR2(1000),                              -- 찜한 숙소 
        LIKETRIPS VARCHAR2(1000),                              -- 찜한 트립 
        R_HOSTING NUMBER DEFAULT 0,                            -- 숙소호스팅  
        T_HOSTING NUMBER DEFAULT 0,                            -- 트립 호스팅
        JOIN_DATE DATE DEFAULT SYSDATE                         -- 가입일
);
CREATE SEQUENCE SEQ_USER_NO;*/








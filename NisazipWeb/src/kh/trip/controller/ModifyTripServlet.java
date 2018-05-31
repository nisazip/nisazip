package kh.trip.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import kh.common.MyFileRenamePolicy;
import kh.trip.model.vo.Attachment;
import kh.trip.model.vo.TripModify;

@WebServlet("/modifyTrip.trip")
public class ModifyTripServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ModifyTripServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (ServletFileUpload.isMultipartContent(request)) {

			// 전송 파일 용량 제한 : 10Mbyte 제한한 경우
			int maxSize = 1024 * 1024 * 10;

			// 웹서버 컨테이너 경로 추출함
			String root = request.getSession().getServletContext().getRealPath("/resources");

			System.out.println(root);

			// 파일 저장 경로(ex : web/board_uploadFiles/) 정함
			String savePath = root + "/host_images/";

			// 객체 생성시 파일을 저장하고 그에 대한 정보를 가져오는 형태이다.
			// 즉 파일의 정보를 검사하여 저장하는 형태가 아닌, 저장한 다음 검사 후 삭제를 해야 한다.

			// 사용자가 올린 파일명을 그대로 저장하지는 않는 것이 일반적이다.
			// 1. 같은 파일명이 있는 경우 이전 파일을 덮어 쓸 수 있다.
			// 2. 한글로 된 파일명, 특수기호나 띄어쓰기 등은 서버에 따라 문제가 생길 수 도 있다.
			// DefaultFileRenamePolicy는 cos.jar안에 존재하는 클래스로
			// 같은 파일 명이 존재하는지를 검사하고 있을 경우에는 파일명 뒤에 숫자를 붙여준다.
			// ex : aaa.zip, aaa1.zip, aaa2.zip

			// DefaultFileRenamePolicy 사용
			// MultipartRequest multiRequest = new MultipartRequest(request,
			// savePath, maxSize, "UTF-8",new DefaultFileRenamePolicy());

			// FileRenamePolicy 상속 후 오버라이딩
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
					new MyFileRenamePolicy());

			// 다중 파일을 묶어서 업로드 하기에 컬렉션을 사용한다.
			// 저장한 파일의 이름을 저장할 arrayList를 생성한다.
			ArrayList<String> saveFiles = new ArrayList<String>();
			// 원본 파일의 이름을 저장할 arrayList를 생성한다.
			ArrayList<String> originFiles = new ArrayList<String>();

			// 파일이 전송된 폼의 이름을 반환한다.
			Enumeration<String> files = multiRequest.getFileNames();

			// 각 파일의 정보를 구해 온 후 DB에 저장할 목적의 데이터를 꺼내온다.
			while (files.hasMoreElements()) {
				String name = files.nextElement();

				System.out.println("name : " + name);
				// 저장된 경로에 저장된 파일 시스템 이름을 가져온다
				saveFiles.add(multiRequest.getFilesystemName(name));
				originFiles.add(multiRequest.getOriginalFileName(name));

				System.out.println("filesystem name : " + multiRequest.getFilesystemName(name));
				System.out.println("originFile : " + multiRequest.getOriginalFileName(name));
			}

			// multipartRequest객체에서 파일 외의 값을 가져올 수도 있다.

			// Attachment객체 생성하여 arrayList 객체 생성
			ArrayList<String> fileList = new ArrayList<String>();

			// 전송순서 역순으로 파일이 list에 저장되기 때문에 반복문을 역으로 수행함
			for (int i = originFiles.size() - 1; i >= 0; i--) {
				Attachment at = new Attachment();
				at.setFilePath(savePath);
				at.setOriginName(originFiles.get(i));
				at.setChangeName(saveFiles.get(i));

				System.out.println("at : " + at);
				fileList.add(at.getChangeName());

			}
			System.out.println("fileList : " + fileList);

			String title = multiRequest.getParameter("title");
			int price = Integer.parseInt(multiRequest.getParameter("price"));
			String language = multiRequest.getParameter("language");
			String category = multiRequest.getParameter("category");
			int people = Integer.parseInt(multiRequest.getParameter("people"));
			String introduce = multiRequest.getParameter("introduce");
			String zip = multiRequest.getParameter("zip");
			String addr = multiRequest.getParameter("addr");
			String addr_detail = multiRequest.getParameter("addr_detail");
			String startTime = multiRequest.getParameter("startTime");
			String endTime = multiRequest.getParameter("endTime");
			String startReservation = multiRequest.getParameter("startReservation");
			String endReservation = multiRequest.getParameter("endReservation");
			
			System.out.println("title : " + title);
			System.out.println("price : " + price);
			System.out.println("lang : " + language);
			System.out.println("cate : " + category);
			System.out.println("people : " + people);
			System.out.println("intro : " + introduce);
			System.out.println("zip : " + zip);
			System.out.println("addr : " + addr);
			System.out.println("addr-d : " + addr_detail);
			System.out.println("st : " + startTime);
			System.out.println("et : " + endTime);
			System.out.println("sr : " + startReservation);
			System.out.println("er : " + endReservation);
			
			TripModify tmodify = new TripModify();

			tmodify.setTitle(title);
			tmodify.setPrice(price);
			tmodify.setLanguage(language);
			tmodify.setcategory(category);
			tmodify.setPeople(people);
			tmodify.setIntroduce(introduce);
			tmodify.setZip(zip);
			tmodify.setAddr(addr);
			tmodify.setAddr_detail(addr_detail);
			tmodify.setStartTime(startTime);
			tmodify.setEndTime(endTime);
			tmodify.setStartReservation(startReservation);
			tmodify.setEndReservation(endReservation);
			
			if(fileList.size() > 0){
				
				for(int i = 0 ; i < fileList.size() ; i ++){
					String fileName = fileList.get(i);
					switch(i){
						case 0: tmodify.setPic1(fileName);
								System.out.println("1 : " + fileName);
								break; 
						case 1: tmodify.setPic2(fileName); 
								System.out.println("2 : " + fileName);
								break;
						case 2: tmodify.setPic3(fileName);
								System.out.println("3 : " + fileName);
								break;
					}
					
				}
			}

			request.setAttribute("tmodify", tmodify);
			
		}

		request.getRequestDispatcher("/views/regist/14trip_modified.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

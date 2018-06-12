package kh.trip.controller;

import java.io.File;
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
import kh.member.model.vo.Member;
import kh.trip.model.service.TripRegistService;
import kh.trip.model.vo.Attachment;

import kh.trip.model.vo.Trip;

@WebServlet("/insertPicture.trip")
public class InsertTripPictureServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public InsertTripPictureServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("사진첨부 서블릿 실행확인");

		// 폼전송을 multipart/form-data로 전송하는 경우에는 기존처럼
		// request.getParameter로 값을 받을 수 없다.
		// cos.jar가 파일도 받고 폼의 다른 값을도 받아주는 역할을 한다.
		// com.orelilly.servlet의 약자이다.
		if (ServletFileUpload.isMultipartContent(request)) {

			// 전송 파일 용량 제한 : 10Mbyte 제한한 경우
			int maxSize = 1024 * 1024 * 10;

			// 웹서버 컨테이너 경로 추출함
			String root = request.getSession().getServletContext().getRealPath("/resources");

			System.out.println(root);

			// 파일 저장 경로(ex : web/board_uploadFiles/) 정함
			String savePath = root + "/trip_images/";

			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
					new MyFileRenamePolicy());

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
			ArrayList<Attachment> fileList = new ArrayList<Attachment>();

			HttpSession session = request.getSession();

			Attachment hp = null;

			// 전송순서 역순으로 파일이 list에 저장되기 때문에 반복문을 역으로 수행함
			for (int i = originFiles.size() - 1; i >= 0; i--) {
				hp = new Attachment();
				hp.setFile_path(savePath);
				hp.setOrigin_name(originFiles.get(i));
				hp.setChange_name(saveFiles.get(i));

				System.out.println("hp : " + hp);
				fileList.add(hp);
				
				System.out.println("fileList 종류"+i+ " : "+ fileList );

			}
			Trip tr = (Trip) session.getAttribute("tregist");
			Member m = (Member)session.getAttribute("member");
			
			System.out.println("Member m : " + m);
			session.setAttribute("hp", hp);
			session.setAttribute("tregist", tr);
			session.setAttribute("fileList", fileList);
						
			String tno = new TripRegistService().insertThumbnail(tr, fileList, m);


			System.out.println("T_seq ? " + tno);

			if (tno != null) {
				session.setAttribute("tno", tno);

				request.getRequestDispatcher("/views/regist/10trip_price.jsp").forward(request, response);
			} else {
				// 실패시 저장된 사진 삭제
				for (int i = 0; i < saveFiles.size(); i++) {
					// 파일시스템에 저장된 이름으로 파일 객체 생성함
					File failedFile = new File(savePath + saveFiles.get(i));
					System.out.println(failedFile);
					// true false 리턴됨
					// 실행하고 출력하면 당연히 false나오기 때문에 출력하면서 삭제
					System.out.println(failedFile.delete());
				}
				// 에러페이지로 메세지 전달
				request.setAttribute("msg", "사진게시판 등록 실패!");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);

			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package freeboard.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.mail.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import member.model.vo.Member;
import freeboard.model.vo.FreeBoard;
import freeboard.model.service.FreeBoardService;

/**
 * Servlet implementation class RentReviewWriter
 */

@WebServlet("/fbwrite")
public class FreeBoardWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardWrite() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//파일 업로드 기능이 추가된 공지글 등록 처리 컨트롤러
		//1. 한글이 있을 경우 인코딩 처리
		RequestDispatcher view = null;
		
		
		request.setCharacterEncoding("UTF-8");
		System.out.print("subjectsubjectsubjectsubject"+request.getParameter("fb_content") );
		
		
		FreeBoard fb= new FreeBoard();
		
		HttpSession session = request.getSession();
		session.getAttribute("loginUser");
		
		Member loginUser = (Member)session.getAttribute("loginUser");

		fb.setFb_subject(request.getParameter("fb_subject"));
		
		fb.setFb_writer(loginUser.getName());
		fb.setFb_content(request.getParameter("fb_content"));

		
		int result = new FreeBoardService().insertFreeBoard(fb);
		
		
		
		
		
		response.setContentType("text/html; charset=UTF-8");
		if(result > 0) {
			response.sendRedirect("/cs/fblist");
		}else {
			response.sendRedirect("DongGuk/views/freeBoardWrite.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

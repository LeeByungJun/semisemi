package rentreview.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import rentreview.model.vo.ReviewRentComment;
import rentreview.model.service.ReviewRentService;

/**
 * Servlet implementation class RentReviewWriter
 */

@WebServlet("/rrcomment")
public class ReviewRentCommentWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewRentCommentWrite() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//파일 업로드 기능이 추가된 공지글 등록 처리 컨트롤러
		//1. 한글이 있을 경우 인코딩 처리
		request.setCharacterEncoding("UTF-8");
		RequestDispatcher view = null;
		
System.out.println("writer" + request.getParameter("writer"));
		
		ReviewRentComment rc= new ReviewRentComment();
		rc.setRc_parent_num(Integer.parseInt(request.getParameter("rr_num")));
		rc.setRc_writer(request.getParameter("writer"));
		rc.setRc_content(request.getParameter("content"));
		
		
		int result = new ReviewRentService().insertReviewRentComment(rc);
		
		
		
		
		
		response.setContentType("text/html; charset=UTF-8");
		if(result > 0) {
			response.sendRedirect("/cs/rrdetail?rr_num="+request.getParameter("rr_num"));
		}else {
			response.sendRedirect("DongGuk/views/reviewWrite.jsp");
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

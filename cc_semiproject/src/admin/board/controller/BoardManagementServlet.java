package admin.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import faq.model.service.FaqService;
import faq.model.vo.Faq;

/**
 * Servlet implementation class BoardManagementServlet
 */
@WebServlet("/boardmanage")
public class BoardManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardManagementServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 관리자 공지사항,FAQ,불량고객 신고 게시판 관리용 메소드
		// FAQ 
		// 페이지 기본값 지정
		int currentPage = 1;
		// 전달된 페이지값 추출
		if (request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}

		// 한 페이지당 출력할 목록 갯수 지정
		int limit = 3;

		FaqService fservice = new FaqService();
		// 전체 목록 갯수 조회
		int listCount = fservice.getListCount();
		// System.out.println("총 게시글 수 : " + listCount);
		// 현재 페이지에 출력할 목록 조회
		ArrayList<Faq> list = fservice.selectList(currentPage, limit);
		System.out.println(list);

		// 총 페이지 수 계산 : 목록이 1개일 때 1페이지로 처리
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지 그룹(10개 페이지를 한 그룹 처리)에 보여줄 시작 페이지
		// 현재 페이지가 13페이지이면 그룹은 11 ~ 20페이지가 보여지게 함
		int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
		int endPage = startPage + limit - 1;

		if (maxPage < endPage)
			endPage = maxPage;
		
		//NOTICE - 욱재형 파트
		

		response.setContentType("text/html; charset=utf-8");
		RequestDispatcher view = null;
		if (list.size() > 0) {
			view = request.getRequestDispatcher("byungjun/views/writeFormManagement.jsp");
			request.setAttribute("list", list);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("listCount", listCount);
			view.forward(request, response);
		} else {
			response.sendRedirect("index.jsp");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

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
import notice.model.service.NoticeService;
import notice.model.vo.Notice;

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
		int nCurrentPage = 1;
		int fCurrentPage = 1;
		// 전달된 페이지값 추출
		if (request.getParameter("npage") != null && request.getParameter("fpage") == null) {
			nCurrentPage = Integer.parseInt(request.getParameter("npage"));
		}else if(request.getParameter("npage") == null && request.getParameter("fpage") != null) {
			fCurrentPage = Integer.parseInt(request.getParameter("fpage"));
		}else if(request.getParameter("npage") != null && request.getParameter("fpage") != null) {
			fCurrentPage = Integer.parseInt(request.getParameter("fpage"));
			nCurrentPage = Integer.parseInt(request.getParameter("npage"));
		}

		// 한 페이지당 출력할 목록 갯수 지정
		int limit = 3;

		FaqService fservice = new FaqService();
		// 전체 목록 갯수 조회
		int faqListCount = fservice.getListCount();
		// System.out.println("총 게시글 수 : " + listCount);
		// 현재 페이지에 출력할 목록 조회
		ArrayList<Faq> faqList = fservice.selectList(fCurrentPage, limit);
		System.out.println(faqList);

		// 총 페이지 수 계산 : 목록이 1개일 때 1페이지로 처리
		int faqMaxPage = (int) ((double) faqListCount / limit + 0.9);
		// 현재 페이지 그룹(10개 페이지를 한 그룹 처리)에 보여줄 시작 페이지
		// 현재 페이지가 13페이지이면 그룹은 11 ~ 20페이지가 보여지게 함
		int faqStartPage = (((int) ((double) fCurrentPage / limit + 0.9)) - 1) * limit + 1;
		int faqEndPage = faqStartPage + limit - 1;

		if (faqMaxPage < faqEndPage)
			faqEndPage = faqMaxPage;
		
		//faq 카테고리 그룹 얻어오기
		/*ArrayList<Faq> categoryList = fservice.categoryGroupBy();*/
		//////////////////////
		
		//NOTICE - 욱재형 파트
		NoticeService nservice = new NoticeService();
		//notice 목록 갯수 조회
		int noticeListCount = nservice.getListCount();
		ArrayList<Notice> noticeList = nservice.selectList(nCurrentPage, limit);
		// 총 페이지 수 계산 : 목록이 1개일 때 1페이지로 처리
		int noticeMaxPage = (int) ((double) noticeListCount / limit + 0.9);
		// 현재 페이지 그룹(10개 페이지를 한 그룹 처리)에 보여줄 시작 페이지
		// 현재 페이지가 13페이지이면 그룹은 11 ~ 20페이지가 보여지게 함
		int noticeStartPage = (((int) ((double) nCurrentPage / limit + 0.9)) - 1) * limit + 1;
		int noticeEndPage = noticeStartPage + limit - 1;
		
		//////////////////////////////////////////
		

		response.setContentType("text/html; charset=utf-8");
		RequestDispatcher view = null;
		if (faqList.size() > 0) {
			view = request.getRequestDispatcher("byungjun/views/writeFormManagement.jsp");
			request.setAttribute("faqList", faqList);
			request.setAttribute("fCurrentPage", fCurrentPage);
			request.setAttribute("faqMaxPage", faqMaxPage);
			request.setAttribute("faqStartPage", faqStartPage);
			request.setAttribute("faqEndPage", faqEndPage);
			request.setAttribute("faqListCount", faqListCount);
			/*request.setAttribute("categoryList", categoryList);*/
			
			request.setAttribute("noticeList", noticeList);
			request.setAttribute("nCurrentPage", nCurrentPage);
			request.setAttribute("noticeMaxPage", noticeMaxPage);
			request.setAttribute("noticeStartPage", noticeStartPage);
			request.setAttribute("noticeEndPage", noticeEndPage);
			request.setAttribute("noticeListCount", noticeListCount);
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

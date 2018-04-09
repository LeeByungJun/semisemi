package admin.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import faq.model.service.FaqService;
import faq.model.vo.Faq;

/**
 * Servlet implementation class FaqDetailViewServlet
 */
@WebServlet("/faqview")
public class FaqDetailViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqDetailViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//faq 게시글 상세보기용 서블릿
		int no = Integer.parseInt(request.getParameter("no"));
		
		Faq f = new FaqService().adminFaqDetail(no);
		
		response.setContentType("text/html; charset=utf-8");
		if(f != null) {
			//성공
			RequestDispatcher view = request.getRequestDispatcher("byungjun/views/faqDetailView.jsp");
			request.setAttribute("faq", f);
			view.forward(request, response);
		}else {
			System.out.println("관리자 FAQ 상세보기 실패!");
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

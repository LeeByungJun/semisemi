package admin.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import faq.model.service.FaqService;
import faq.model.vo.Faq;

/**
 * Servlet implementation class FaqUpdateServlet
 */
@WebServlet("/faqupdate")
public class FaqUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//faq 게시글 수정용 서블릿
		request.setCharacterEncoding("utf-8");
		
		Faq f = new Faq();
		f.setF_no(Integer.parseInt(request.getParameter("no")));
		f.setF_category(request.getParameter("category"));
		f.setF_title(request.getParameter("title"));
		f.setF_contents(request.getParameter("contents"));
		
		System.out.println("f : " + f.toString());
		
		int result = new FaqService().adminFaqUpdate(f);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if(result > 0) {
			out.print("게시글 수정 성공");
		}else {
			out.print("게시글 수정 실패");
			System.out.println("관리자 FAQ 게시글 수정 실패");
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

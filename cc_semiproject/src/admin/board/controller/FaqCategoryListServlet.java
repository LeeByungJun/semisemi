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
 * Servlet implementation class FaqCategoryListServlet
 */
@WebServlet("/fcategorylist")
public class FaqCategoryListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqCategoryListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{	
		//카테고리 목록 불러오기
		ArrayList<Faq> categoryList = new FaqService().categoryGroupBy();
		
		response.setContentType("text/html; charset=utf-8");
		RequestDispatcher view = request.getRequestDispatcher("byungjun/views/faqInsertView.jsp");
		if(categoryList.size() > 0) {
			request.setAttribute("categoryList", categoryList);
			view.forward(request, response);
		}else {
			System.out.println("관리자 faq 카테고리 불러오기 실패!");
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

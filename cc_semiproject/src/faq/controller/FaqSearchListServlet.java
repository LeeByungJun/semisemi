package faq.controller;

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
 * Servlet implementation class FaqSearchListServlet
 */
@WebServlet("/fslist")
public class FaqSearchListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqSearchListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//faq 검색용 컨트롤러
		request.setCharacterEncoding("utf-8");
		
		String category = request.getParameter("category");
		
		ArrayList<Faq> list = new FaqService().selectSearchList(category);
		
		response.setContentType("text/html; charset=utf-8");
		if(list.size() > 0) {
			RequestDispatcher view = request.getRequestDispatcher("byungjun/views/faq.jsp");
			request.setAttribute("list", list);
			request.setAttribute("currentPage", 0);
			request.setAttribute("maxPage", 0);
			request.setAttribute("startPage", 0);
			request.setAttribute("endPage", 0);
			request.setAttribute("listCount", 0);
			view.forward(request, response);
		}else {
			//조회할 값이 없습니다.
			response.sendRedirect("index.jsp");
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

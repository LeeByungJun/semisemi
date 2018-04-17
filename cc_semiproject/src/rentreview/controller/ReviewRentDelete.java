package rentreview.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rentreview.model.service.ReviewRentService;
import rentreview.model.vo.ReviewRent;

/**
 * Servlet implementation class ReviewRentDelete
 */
@WebServlet("/rrdelete")
public class ReviewRentDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewRentDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		RequestDispatcher view = null;
		
		int rr_num = Integer.parseInt(request.getParameter("id"));
		
		ReviewRentService rservice = new ReviewRentService();
		
		int result = rservice.deleteReviewRent(rr_num);
		
		
		
		
		
		
		response.setContentType("text/html; charset=UTF-8");
		if(result > 0) {
			response.sendRedirect("/cs/rrlist");
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

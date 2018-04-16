package report.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import report.model.dao.ReportDao;
import report.model.service.ReportService;

/**
 * Servlet implementation class ReportDeleteServlet
 */
@WebServlet("/rdelete")
public class ReportDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int reportNo = Integer.parseInt(request.getParameter("no"));
		//System.out.println("삭제 시도한 게시판 글번호 : "+reportNo);
		
		int result = new ReportService().deleteReport(reportNo);
				
		response.setContentType("text/html; charset=utf-8");
		RequestDispatcher view = null;			
		if(result>0) {
			response.sendRedirect("/cs/rlist?page=1");
		}else {
			view = request.getRequestDispatcher("/cs/WookJae/views/report/reportError.jsp");
			request.setAttribute("error", "게시글 삭제 실패..");			
			view.forward(request, response);
			
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

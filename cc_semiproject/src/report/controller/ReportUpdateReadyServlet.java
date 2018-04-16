package report.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import report.model.service.ReportService;
import report.model.vo.Report;

/**
 * Servlet implementation class ReportUpdateReadyServlet
 */
@WebServlet("/rupdateready")
public class ReportUpdateReadyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportUpdateReadyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//게시글 수정 출력 페이지용 컨트롤러 
		int currentPage = Integer.parseInt(request.getParameter("page"));
		int reportNo = Integer.parseInt(request.getParameter("no"));
		
		//system.out.println("수정을 시도하는 게시글은 페이지 : "+currentPage+"의 "reportNo+"번 게시글입니다.");
		Report report = new ReportService().selectReport(reportNo);
		//수정을 시도하려는 객체를 조회하기 위해 게시글 번호를 파라미터로 넘겨 결과를 리턴받는다.

		response.setContentType("text/html; charset=utf-8");
		RequestDispatcher view = null;		
		
		if(report!=null) {
			view = request.getRequestDispatcher("WookJae/views/report/reportUpdateViewer.jsp");
			request.setAttribute("report", report);
			request.setAttribute("page", new Integer(currentPage));
			view.forward(request, response);
		}else {
			view=request.getRequestDispatcher("WookJae/views/report/reportError.jsp");
			request.setAttribute("error", "수정글 조회가 실패되었습니다.");
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

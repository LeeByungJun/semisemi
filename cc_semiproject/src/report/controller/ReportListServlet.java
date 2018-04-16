package report.controller;

import java.io.IOException;

import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import report.model.service.ReportService;
import report.model.vo.Report;

/**
 * Servlet implementation class ReportListServlet
 */
@WebServlet("/rlist")
public class ReportListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//페이지별로 출력되는 불량고객신고(게시글) 전체 조회 처리용 컨트롤러
		
		//페이지의 기본값 지정 
		int currentPage=1;
		if(request.getParameter("page")!=null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		
		//한 페이지당 출력할 목록 갯수 지정(10EA)
		int limit=7;
		
		ReportService rservice = new ReportService();
		//전체 목록 갯수 조회 
		int listCount = rservice.getListCount();
		//System.out.println("총 게시글의 갯수 : "+listCount);
		
		//Top4목록에대한 조회 리스트페이지에 뿌려짐 
		ArrayList<Report> list2 = rservice.getTop4List();
		
		
		
		//현재 페이지에 출력될 목록 조회 
		ArrayList<Report> list = rservice.selectList(currentPage,limit);
			
		//System.out.println("list : "+list);
		
		//총 페이지수 계산 : 목록이 1개일 때 1페이지로 처리
		int maxPage = (int)((double)listCount / limit + 0.9);
		//현재 페이지 그룹(10개페이지를 한그룹처리)에 보여줄 시작 페이지수
		//현재 페이지가 13페이지이면 그룹은 11 ~ 20페이지가 보여지게함
		int startPage = (((int)((double)currentPage / limit + 0.9))
				- 1) * limit + 1;
		int endPage = startPage + limit - 1;
		
		if(maxPage < endPage)		
			endPage = maxPage;
		
		response.setContentType("text/html; charset=utf-8");
		RequestDispatcher view = null;
		if(list.size() > 0) {
			view = request.getRequestDispatcher("WookJae/views/report/reportList.jsp");
			request.setAttribute("list", list);
			request.setAttribute("list2", list2);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);			
			request.setAttribute("listCount", listCount);
			view.forward(request, response);
		}else { //공지 내용이 없다면.
			view = request.getRequestDispatcher("WookJae/views/report/reportError.jsp");
			request.setAttribute("error", currentPage + "페이지에 대한 목록 조회 실패!..");
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









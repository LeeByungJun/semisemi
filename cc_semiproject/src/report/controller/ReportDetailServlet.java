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
import reportcomment.model.service.ReportCommentService;
import reportcomment.model.vo.ReportComment;

/**
 * Servlet implementation class ReportDetailServlet
 */
@WebServlet("/rdetail")
public class ReportDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 3L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//불량고객신고 상세보기 처리용 컨트롤러 
		int reportNo = Integer.parseInt(request.getParameter("no"));
		int currentPage = Integer.parseInt(request.getParameter("page"));
		
		//System.out.println("선택한 게시글의 번호 -> "+reportNo);
		
		/*int commentCurrentPage=1;
		if(request.getParameter("commentpage")!=null) {
			commentCurrentPage=Integer.parseInt(request.getParameter("commentpage"));
		}*/
		
		ReportService rservice = new ReportService();
		rservice.addReadCount(reportNo);
		//글을 클릭시 조횟수 1증가처리 
		
		/////////////////////////////////////////////////////////////////////////
				
		int Commentlimit=4; //한 페이지당 출력할 댓글목록 갯수 지정(4EA)
		
		ReportCommentService rcs = new ReportCommentService();		
		int CommentListCount = rcs.getCommentListCount(reportNo); 
		//해당 페이지의 총 댓글갯수를 불러옴

		System.out.println("===============================================================");
		System.out.println("테스트용 => 댓글의 총 갯수("+CommentListCount+")");
		System.out.println("===============================================================");
		
		//해
		ArrayList<ReportComment> Commentlist2 = new ReportCommentService().selectAllCommentList2(currentPage,Commentlimit,reportNo);
		System.out.println("list : "+Commentlist2);
		
		
		//총 페이지수 계산 : 목록이 1개일 때 1페이지로 처리
		int CmaxPage = (int)((double)CommentListCount / Commentlimit + 0.9);
		//현재 페이지 그룹(10개페이지를 한그룹처리)에 보여줄 시작 페이지수
		//현재 페이지가 13페이지이면 그룹은 11 ~ 20페이지가 보여지게함
		int CstartPage = (((int)((double)currentPage / Commentlimit + 0.9))
				- 1) * Commentlimit + 1;
		int CendPage = CstartPage + Commentlimit - 1;
		
		if(CmaxPage < CendPage)		
			CendPage = CmaxPage;
		
		/////////////////////////////////////////////////////////////////////////
		
		Report report = rservice.selectReport(reportNo);
		//System.out.println(report.toString());
		
		response.setContentType("text/html; charset=utf-8"); 
		RequestDispatcher view = null;
		
		
		view = request.getRequestDispatcher("WookJae/views/report/reportDetailView.jsp");
		request.setAttribute("report", report);
		request.setAttribute("reportNo", reportNo);
		request.setAttribute("currentPage", new Integer(currentPage));
		
		/////////////////// 댓글 페이징 전달값 //////////////////////////////////////////
		request.setAttribute("Commentlist2", Commentlist2);
		//request.setAttribute("commentCurrentPage", new Integer(currentPage));
		request.setAttribute("CmaxPage", CmaxPage);
		request.setAttribute("CstartPage", CstartPage);
		request.setAttribute("CendPage", CendPage);
		request.setAttribute("CommentListCount", CommentListCount);
		view.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

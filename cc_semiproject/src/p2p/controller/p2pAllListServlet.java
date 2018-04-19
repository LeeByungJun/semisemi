package p2p.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import p2p.model.service.p2pService;
import p2p.model.vo.p2p;
import report.model.service.ReportService;
import report.model.vo.Report;

/**
 * Servlet implementation class p2pAllListServlet
 */
@WebServlet("/p2plist")
public class p2pAllListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public p2pAllListServlet() {
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
		
		//한 페이지당 출력할 목록 갯수 지정(6EA)
		int limit=8;
		
		p2pService pservice = new p2pService();		
		//전체 목록 갯수 조회 
		int p2plistCount = pservice.getP2PCount();
		//System.out.println("p2p게시판의 총 게시글의 갯수");
		

		//int listCount = rservice.getListCount();
		//System.out.println("총 게시글의 갯수 : "+listCount);
		
		
		//P2P 페이지에 출력될 목록 조회 
		ArrayList<p2p> list = pservice.selectP2PList(currentPage,limit);
		//System.out.println("출력 리스트 : "+list);
		
		
		
		//ArrayList<Report> list = rservice.selectList(currentPage,limit);		
		//System.out.println("list : "+list);
		
		//총 페이지수 계산 : 목록이 1개일 때 1페이지로 처리
		int maxPage = (int)((double)p2plistCount / limit + 0.9);
		//현재 페이지 그룹(10개페이지를 한그룹처리)에 보여줄 시작 페이지수
		//현재 페이지가 13페이지이면 그룹은 11 ~ 20페이지가 보여지게함
		int startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;
		int endPage = startPage + limit - 1;
		
		if(maxPage < endPage)		
			endPage = maxPage;
		
		response.setContentType("text/html; charset=utf-8");
		RequestDispatcher view = null;
		if(list.size() > 0) {
			view = request.getRequestDispatcher("Aram/views/p2palllist.jsp");
			request.setAttribute("list", list);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);			
			request.setAttribute("listCount", p2plistCount);
			view.forward(request, response);
		}else { //P2P게시글이 없다면
			System.out.println("게시글이 없습니다. 재확인 바랍니다.");
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

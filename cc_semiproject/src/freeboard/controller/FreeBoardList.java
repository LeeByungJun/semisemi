package freeboard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import freeboard.model.service.FreeBoardService;
import freeboard.model.vo.FreeBoard;


@WebServlet("/fblist")
public class FreeBoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//페이지별로 출력되는 게시글 전체 조회 처리용 컨트롤러 
		
		//페이지 기본값 지정 
		int currentPage=1;
		int category=0;
		String keyword = null;
		//전달된 페이지 값 추출 
		
		
		if(request.getParameter("category")!=null) {
			category = Integer.parseInt(request.getParameter("category"));
		}
		System.out.print("categorycategorycategorycategory"+category);

		if(request.getParameter("keyword")!=null){ //뷰어로부터 가져온 page값이 null이 아니면
			keyword = request.getParameter("keyword");
		}
		
		if(request.getParameter("page")!=null){ //뷰어로부터 가져온 page값이 null이 아니면
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		
		//게시판 한 페이지당 출력할 목록갯수 지정 
		int limit = 10; //10개로 지정
		
		FreeBoardService rservice = new FreeBoardService();
		//전체 목록 갯수 조회 
		int listCount = rservice.getListCount();
		//System.out.println("전체목록 갯수 출력 > "+listCount);
		
		//현재 페이지에 출력할 목록 조회 
		ArrayList<FreeBoard> list = null;
		
		if(keyword!=null&&category!=0) {
			list = rservice.selectSearchTitle(currentPage,limit,keyword,category);
		}else {
			list = rservice.selectList(currentPage,limit);
		}
		//System.out.println("현재 목록 : "+list);
		
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

		view = request.getRequestDispatcher("DongGuk/views/freeBoard.jsp");
		
		
		request.setAttribute("list", list); //공지사항의 전체 조회를 하는jsp페이지 호출
		request.setAttribute("listSize", list.size()); //공지사항의 전체 조회를 하는jsp페이지 호출
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("maxPage", maxPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);			
		request.setAttribute("listCount", listCount);
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

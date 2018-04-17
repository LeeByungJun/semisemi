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
import freeboard.model.vo.FreeBoardComment;

/**
 * Servlet implementation class ReviewRentDetail
 */
@WebServlet("/fbdetail")
public class FreeBoardDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//페이지별로 출력되는 게시글 전체 조회 처리용 컨트롤러 

		int id = Integer.parseInt(request.getParameter("fb_num"));



		
		
		
		//페이지 기본값 지정 
		int currentPage=1;
		//전달된 페이지 값 추출 
		if(request.getParameter("page")!=null){ //뷰어로부터 가져온 page값이 null이 아니면
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		
		//게시판 한 페이지당 출력할 목록갯수 지정 
		int limit = 10; //10개로 지정
		
		FreeBoardService fbservice = new FreeBoardService();
		//전체 목록 갯수 조회 
		int listCount = fbservice.getCommentCount(id);
		//System.out.println("전체목록 갯수 출력 > "+listCount);
		
		//현재 페이지에 출력할 목록 조회 
		ArrayList<FreeBoardComment> comment_list = fbservice.selectComment(currentPage,limit,id);
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



		
		/*System.out.println("선택 공지번호 출력");
		System.out.println(noticeNo);*/
		FreeBoardService fservice = new FreeBoardService();
		FreeBoard review = fservice.selectFreeBoard(id);
		//글을 클릭시 조횟수 1증가처리 

		
		response.setContentType("text/html; charset=UTF-8");
		
		RequestDispatcher view = null;
		
		if(review!=null) { /* 게시글의 조회가 된다면 */ 
			//view페이지로 이동할때 response.sendRedirect() 넘기는 데이터가 없이 바로 불러올때 
			//request.getRequestDispatcher() 넘기는 데이터의 값이 있을때 사용
			view = request.getRequestDispatcher("DongGuk/views/freeBoardDetail.jsp");
			request.setAttribute("review", review);
			
			request.setAttribute("comment_list", comment_list); //공지사항의 전체 조회를 하는jsp페이지 호출
			request.setAttribute("listSize", comment_list.size()); //공지사항의 전체 조회를 하는jsp페이지 호출
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);			
			request.setAttribute("listCount", listCount);

			view.forward(request, response);		
		}else if(review==null) {
			view = request.getRequestDispatcher("WookJae/views/notice/noticeError.jsp");
			request.setAttribute("error", id+"번 공지글 상세조회 실패..");
			view.forward(request, response);
			//"errormessage", noticeNo+"번 공지글 상세조회 실패.."
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

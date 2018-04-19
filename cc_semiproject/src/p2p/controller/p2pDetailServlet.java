package p2p.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import p2p.model.service.p2pService;
import p2p.model.vo.p2p;

/**
 * Servlet implementation class p2pDetailServlet
 */
@WebServlet("/p2pdetail")
public class p2pDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public p2pDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int board_no = Integer.parseInt(request.getParameter("no"));

		
		//System.out.println("선택한 게시글의 번호출력 > "+board_no);
		
		p2p p = new p2pService().getp2pDetail(board_no);
		//System.out.println("선택한 게시글의 정보출력");
		//System.out.println(p.toString());

		response.setContentType("text/html; charset=utf-8");
		RequestDispatcher view = null;	
		if(!(p==null)) {
			view = request.getRequestDispatcher("Aram/views/p2pDetail.jsp");
			request.setAttribute("p2p", p);
			view.forward(request, response);
		}
		else {
			System.out.println("조회하신 객체가 없습니다.");
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

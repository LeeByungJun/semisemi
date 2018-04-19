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
 * Servlet implementation class p2pUpdateReadyServlet
 */
@WebServlet("/p2pUpdate")
public class p2pUpdateReadyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public p2pUpdateReadyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//입력된값중에 한글이 있으면 인코딩진행
		request.setCharacterEncoding("utf-8");
		
		int pbno = Integer.parseInt(request.getParameter("pbno"));
		//System.out.println("수정을 시도하는 게시판번호 -> "+pbno);
		
		p2p p = new p2pService().getp2pDetail(pbno);
		
		RequestDispatcher view = null;
		if(p!=null) {
			//System.out.println("서블릿성공");
			view = request.getRequestDispatcher("Aram/views/p2pContentsChange.jsp");
			request.setAttribute("p2pObject", p);			
			view.forward(request, response);
		}else{
			System.out.println("수정을 시도하신 글이 존재하지 않습니다.");
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

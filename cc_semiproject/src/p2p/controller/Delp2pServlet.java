package p2p.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import p2p.model.service.p2pService;

/**
 * Servlet implementation class Delp2pServlet
 */
@WebServlet("/delp2p")
public class Delp2pServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Delp2pServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("utf-8");
		int pb = Integer.parseInt(request.getParameter("pb"));
		System.out.println("pb : "+pb);
	
		int result = new p2pService().delp2pWrite(pb);
		
		response.setContentType("text/html; charset=utf-8"); 
		RequestDispatcher view = null;
		
		if(result>0) {
			response.sendRedirect("/cs/p2plist?page=1");	
		}else {
			System.out.println("삭제하려는 게시글을 재확인 부탁드립니다..");
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

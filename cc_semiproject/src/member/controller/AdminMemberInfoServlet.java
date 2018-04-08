package member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.MemberAdmin;

/**
 * Servlet implementation class AdminMemberInfoServlet
 */
@WebServlet("/adminmi")
public class AdminMemberInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemberInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//관리자 멤버 조회용 컨트롤러
		
		//회원 전체 정보 가져오기
		ArrayList<MemberAdmin> allMember = new MemberService().selectAllMember();
		
		//판매가능 유저 정보 가져오기
		ArrayList<MemberAdmin> cansellMember = new MemberService().selectCSMember();
		
		//신고 많이 받은 유저 가져오기 (정렬해서)
		ArrayList<MemberAdmin> countMember = new MemberService().selectCountMember();
		
		response.setContentType("text/html; charset=utf-8");
		if(allMember != null && cansellMember != null & countMember != null) {
			RequestDispatcher view = request.getRequestDispatcher("byungjun/views/memberManagement.jsp");
			request.setAttribute("all", allMember);
			request.setAttribute("cansell", cansellMember);
			request.setAttribute("count", countMember);
			view.forward(request, response);
			
		}else {
			System.out.println("관리자 회원정보 조회 실패!");
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

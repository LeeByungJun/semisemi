package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import grade.model.vo.Grade;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/mupdate.me")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		Member member = new Member();
		Grade grade = new Grade();
		
		member.setMem_num(Integer.parseInt(request.getParameter("num")));
		member.setPhone(request.getParameter("phone"));
		member.setAddress(request.getParameter("address"));
		member.setPassword(request.getParameter("userpwd"));
		member.setEmail(request.getParameter("email"));
		
		grade.setG_rank(request.getParameter("g_rank"));
		
		System.out.println("num=" + member.getMem_num());
		
		int result = new MemberService().updateMember(member);
		
		System.out.println("result= " + result);
		
		response.setContentType("text/html; charset=UTF-8");
		if (result > 0) {
			response.sendRedirect("/cs/mypage?email="+member.getEmail());
			/*RequestDispatcher view = request.getRequestDispatcher("/cs/YunHee/views/myPage.jsp");
			request.setAttribute("message", "회원 정보 수정 성공");
			view.forward(request, response);*/
		} else {
			/*RequestDispatcher view = request.getRequestDispatcher("views/member/memberError.jsp");
			request.setAttribute("message", "회원 정보 수정 실패");
			view.forward(request, response);*/
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

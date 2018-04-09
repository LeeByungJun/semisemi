package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;

/**
 * Servlet implementation class AdminMemDeleteServlet
 */
@WebServlet("/admindel")
public class AdminMemDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//관리자 회원정보 삭제용 서블릿
		String email = request.getParameter("email");
		
		int result = new MemberService().adminDelMember(email);
		
		response.setContentType("text/html; charset=utf-8");
		if(result > 0) {
			System.out.println("관리자 회원삭제처리 성공!");
			response.sendRedirect("adminmi");
		}else {
			System.out.println("관리자 회원삭제처리 실패!");
		}
		///cs/byungjun/views/writeFormManagement.jsp
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

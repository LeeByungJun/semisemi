package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import grade.model.service.GradeService;
import grade.model.vo.Grade;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MyPageController
 */
@WebServlet(name = "mypage", urlPatterns = { "/mypage" })
public class MyPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//마이페이지용 서블릿
		//넘어오는 값이 한글 값이 있을 경우utf-8로 인코딩처리
		request.setCharacterEncoding("utf-8");
		
		//넘어오는 값을 받아줌 (괄호 안에 email은 넘어오는 키 값임)
		String email = request.getParameter("email");
		//String g_rank = request.getParameter("g_rank");
		
		Member member = new MemberService().mypageSelect(email);
		RequestDispatcher view = null;
		Grade grade = new GradeService().selectGrade(member.getG_Code());
		
		if (member != null) {
			//데이터조회 성공
			view = request.getRequestDispatcher("YunHee/views/myPage.jsp");
			request.setAttribute("member", member);
			request.setAttribute("grade", grade);
			view.forward(request, response);
		}else {
			System.out.println("마이페이지 조회 실패!");
		}
		/*/cs/YunHee/views/myPage.jsp*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

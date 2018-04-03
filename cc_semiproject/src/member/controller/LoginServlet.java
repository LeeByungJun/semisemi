package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import function.EncryptPassword;
import member.model.service.MemberService;
import member.model.vo.Member;

import static function.EncryptPassword.*;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.me")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static int count = 0;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String email = (String)request.getParameter("useremail");
		String pwd = (String)request.getParameter("userpwd");
		System.out.println("pwd : " + pwd);
		
		//System.out.println(email + ", " + pwd);
		
		//System.out.println(email + " " + pwd);
		//service에 연결하고 결과 받아서 보여주고
		Member loginUser = new MemberService().selectLogin(email,pwd);
		
		//System.out.println(loginUser.toString());
		
		response.setContentType("text/html; charset=utf-8");
		
		if(loginUser != null) {
			//성공 session생성
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			count++;
			System.out.println("접속한 유저 수 : " + count);
			/*response.sendRedirect("index.jsp");*/
			PrintWriter out = response.getWriter();
			out.append(loginUser.getEmail());
		/*}else if(loginUser != null && !loginUser.getEmail().equals("pjlee92@naver.com")){
			//성공 session생성 -> 관리자페이지로
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			count++;
			System.out.println("접속한 유저 수 : " + count);
			response.sendRedirect("index.jsp");
			PrintWriter out = response.getWriter();
			out.append("로그인 성공");*/
		}else {
			//실패 페이지로~
			//로그인에 실패하였습니다.. 메시지-> ajax로 처리하자
			//System.out.println("실패");
			PrintWriter out = response.getWriter();
			out.append("로그인에 실패하였습니다");
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

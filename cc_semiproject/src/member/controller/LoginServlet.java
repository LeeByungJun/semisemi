package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import function.EncryptPassword;
import member.model.service.MemberService;
import member.model.vo.Member;
import visit.model.service.VisitService;
import visit.model.vo.Visit;

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
		
		//service에 연결하고 결과 받아서 보여주고
		Member loginUser = new MemberService().selectLogin(email,pwd);
		
		response.setContentType("text/html; charset=utf-8");
		
		if(loginUser != null) {
			//성공 session생성
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			
			//인원 수 증가 쿼리 동작 -> 서비스 호출 -> dao 호출 고고싱
	    	new VisitService().setVisitCount();
	    	
	    	//차트용 데이터 뽑아오기
	    	ArrayList<Visit> totalCount = new VisitService().totalCount();
	    	/*for(Visit v:totalCount) {
	    		System.out.println(v.toString());
	    	}*/
	    	session.setAttribute("totalVisit", totalCount);
	    	
	    	//오늘 방문 인원 수 구하기
	    	int todayCount = new VisitService().todayCount();
	    	//System.out.println("todayCount = " + todayCount);
	    	
	    	session.setAttribute("todayVisit", todayCount);
	    	
			/*count++;
			System.out.println("접속한 유저 수 : " + count);*/
			/*response.sendRedirect("index.jsp");*/
			PrintWriter out = response.getWriter();
			out.append(loginUser.getEmail());
		}else {
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

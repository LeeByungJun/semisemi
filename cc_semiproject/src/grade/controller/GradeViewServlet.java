package grade.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import grade.model.service.GradeService;
import grade.model.vo.Grade;

/**
 * Servlet implementation class GradeViewServlet
 */
@WebServlet("/gview")
public class GradeViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GradeViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//String g_code = request.getParameter("g_code");
		ArrayList<Grade> grade= new GradeService().selectList();
		
		System.out.println("grade : " + grade);
		
		response.setContentType("text/html; charset=UTF-8");
		RequestDispatcher view = null;
		if(grade != null) {
			view = request.getRequestDispatcher("YunHee/views/viewGrade.jsp");
			request.setAttribute("grade", grade);
			view.forward(request, response);
		}else {
			System.out.println("실패");
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

package notice.controller;

import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NoticeFileDownServlet
 */
@WebServlet("/nfdown")
public class NoticeFileDownServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeFileDownServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//게시글 첨부파일 다운로드 처리용 컨트롤러 
		request.setCharacterEncoding("utf-8");
		
		//프로젝트 내에 파일이 저장된 폴더의 경로정보를 얻어옴
		String readFolder = request.getSession().getServletContext().getRealPath("/WookJae/upload_notice");
		System.out.println("파일이 저장된 폴더의 경로를 출력 : "+readFolder);
		
		String originalFileName = request.getParameter("ofile");
		String renameFileName = request.getParameter("rfile");
		
		//클라이언트로 내보낼 출력 스트림 생성 
		ServletOutputStream downOut = response.getOutputStream();
		File downFile = new File(readFolder+"/"+renameFileName);
		
		response.setContentType("text/plain; charset=utf-8");
		response.addHeader("Content-Disposition",
				"attachment; filename=\"" 
				+ new String(
				originalFileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
		
		response.setContentLength((int) downFile.length());
		BufferedInputStream bin = new BufferedInputStream(
				new FileInputStream(downFile));
		int read = -1;
		while ((read = bin.read()) != -1) {
			downOut.write(read);
			downOut.flush();
		}
		downOut.close();
		bin.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}


















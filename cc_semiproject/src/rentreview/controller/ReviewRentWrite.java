package rentreview.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import rentreview.model.vo.ReviewRent;
import rentreview.model.service.ReviewRentService;

/**
 * Servlet implementation class RentReviewWriter
 */

@WebServlet("/rvwrite")
public class ReviewRentWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewRentWrite() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//파일 업로드 기능이 추가된 공지글 등록 처리 컨트롤러
		//1. 한글이 있을 경우 인코딩 처리
		int maxSize = 1024 * 1024 * 10;
		RequestDispatcher view = null;
		
		String root = request.getSession().getServletContext().getRealPath("/");
		System.out.println("root : "+root);
		

		String savePath = root + "DongGuk/images";
		
		

		
		MultipartRequest mrequest = new MultipartRequest(
				request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		

		
		ReviewRent rr= new ReviewRent();
		rr.setRr_subject(mrequest.getParameter("subject"));
		rr.setRr_writer(mrequest.getParameter("writer"));
		rr.setRr_content(mrequest.getParameter("content"));
		
		String originFileName = mrequest.getFilesystemName("upfile");
		
		System.out.println("originFileName1 : "+originFileName);
		
		
		if (originFileName != null) {
			// 업로도된 파일명을 "년월일시분초.확장자" 로 변경함
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
					+ originFileName.substring(originFileName.lastIndexOf(".") + 1);

			// 파일명 바꾸기하려면 File 객체의 renameTo() 사용함
			File originFile = new File(savePath + "\\" + originFileName);
			File renameFile = new File(savePath + "\\" + renameFileName);

			
			System.out.println("savePath : "+originFile);
			
			// 파일이름 바꾸기 실행 >> 실패할 경우 직접 바꾸기함
			// 새 파일만들고 원래 파일내용 읽어서 복사 기록하고
			// 원 파일 삭제함
			if (!originFile.renameTo(renameFile)) {
				int read = -1;
				byte[] buf = new byte[1024];
				// 한번에 읽을 배열 크기 지정
				FileInputStream fin = new FileInputStream(originFile);
				FileOutputStream fout = new FileOutputStream(renameFile);

				while ((read = fin.read(buf, 0, buf.length)) != -1) {
					fout.write(buf, 0, read);
				}

				fin.close();
				fout.close();
				originFile.delete(); // 원본 파일 삭제함
			}
			
			
			System.out.println("originFileName2 : "+originFileName);
			rr.setRr_original_filename(originFileName);
			rr.setRr_rename_filename(renameFileName);
		} 
		
		if(originFileName != null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()))
					+ "." + originFileName.substring(originFileName.lastIndexOf(".") + 1);
			
			java.io.File originFile = new File(savePath + "\\" + originFileName);
			File renameFile = new File(savePath + "\\" + renameFileName);
			
		}
		
		int result = new ReviewRentService().insertReviewRent(rr);
		
		
		
		
		
		response.setContentType("text/html; charset=UTF-8");
		if(result > 0) {
			response.sendRedirect("/cs/rlist");
		}else {
			response.sendRedirect("DongGuk/views/reviewWrite.jsp");
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

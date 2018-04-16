package report.controller;

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

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import report.model.service.ReportService;
import report.model.vo.Report;

/**
 * Servlet implementation class ReportUpdateWrite
 */
@WebServlet("/rupdatewrite")
public class ReportUpdateWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportUpdateWrite() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//게시글 원글 등록 처리용 컨트롤러
		request.setCharacterEncoding("utf-8");
		
		//업로드할 파일의 용량최대치 제한 : 10Mbyte;
		int maxSize = 1024 * 1024 * 10;		
		
		RequestDispatcher view = null;
		//enctype="multipart/form-data"로 전송되었는지 확인 
		if(!ServletFileUpload.isMultipartContent(request)) {
			view = request.getRequestDispatcher("WookJae/views/report/reportError.jsp");
			request.setAttribute("error", "form enctype속성을 사용할 수 없습니다..");
			view.forward(request, response);
		}
	
		//해당 컨테이너의 구동중이 웹 어플리케이션의 루트경로 추출 
		String root = request.getSession().getServletContext().getRealPath("/");
		//업로드 되는 파일이 저장될 폴더명과 경로 연결처리 
		String savePath = root + "upload_report"; 

		////////////////////////////////////////// 출력확인 ////////////////////////////////////////////// 
		System.out.println("루트경로 : "+root);
		System.out.println("파일저장 경로 : "+savePath);
		
		//request를 MultipartRequest객체로 변환시킴 
		MultipartRequest mrequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());

		String reportTitle = mrequest.getParameter("retitle");
		String reportContent = mrequest.getParameter("recontents");
		int reportNum = Integer.parseInt(mrequest.getParameter("rnum"));
		int currentPage = Integer.parseInt(mrequest.getParameter("page"));
		String roriginFileName = mrequest.getParameter("ofile");
		String rrenameFileName = mrequest.getParameter("rfile");
		
		//System.out.println(reportTitle + "/" + reportContent + " / " + reportNum + " / " + currentPage + " / " + roriginFileName + "/ " +rrenameFileName);
		////////////////////////////////////////// 출력확인 ////////////////////////////////////////////// 
				
		Report rp = null;
		String originFileName = mrequest.getFilesystemName("reupfile");
		if(originFileName!=null) {
			//업로드된 파일명을 "년월일시분초.확장자"로 변경함
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
					+ originFileName.substring(originFileName.lastIndexOf(".") + 1);
			// 파일명 바꾸기하려면 File 객체의 renameTo() 사용함
			File originFile = new File(savePath + "\\" + originFileName);
			File renameFile = new File(savePath + "\\" + renameFileName);

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
			
			//저장된 이전파일 삭제처리 
			if(rrenameFileName!=null) 
				(new File(savePath+"\\"+rrenameFileName)).delete();
				rp = new Report(reportNum, reportTitle, reportContent, originFileName, renameFileName);
			
		} else 
				rp = new Report(reportNum, reportTitle, reportContent);
		
		if(new ReportService().updateReport(rp)>0) {
			response.sendRedirect("/cs/rlist?page="+currentPage);
		}else {
			view = request.getRequestDispatcher("WookJae/views/report/reportError.jsp");
			request.setAttribute("error", "게시물 원글 수정실패함..");
			view.forward(request, response);
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

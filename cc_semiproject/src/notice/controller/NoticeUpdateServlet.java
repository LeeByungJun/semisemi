package notice.controller;

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

import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeUpdateServlet
 */
@WebServlet("/nupdate2")
public class NoticeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//게시글 원글 수정 처리용 컨트롤러 
		
		System.out.println("실행확인");
		request.setCharacterEncoding("utf-8");
		
		//업도드할 파일의 용량 제한 
		//int maxSize = 1024*1024*10;
		
		RequestDispatcher view = null;
		/*if (!ServletFileUpload.isMultipartContent(request)) {
			view = request.getRequestDispatcher("WookJae/views/notice/noticeError.jsp");
			request.setAttribute("error", "form enctype 속성 사용 안 됨!");
			view.forward(request, response);
		}		*/
		
		/*System.out.println("게시글 번호 출력 ");
		System.out.println(request.getParameter("nnum"));
		System.out.println("=========================================================");
		System.out.println("페이지 번호 출력 ");
		System.out.println(request.getParameter("page"));
		System.out.println("=========================================================");
		System.out.println("수정된 타이틀 출력 ");
		System.out.println(request.getParameter("ntitle"));
		System.out.println("=========================================================");
		System.out.println("수정된 내용출력 ");
		System.out.println(request.getParameter("ncontents"));*/
		
		int thisPage = Integer.parseInt(request.getParameter("nnum"));
		int currentPage = Integer.parseInt(request.getParameter("page"));
		String noticeTitle = request.getParameter("ntitle");
		String noticeContents = request.getParameter("ncontents");
		
		Notice n = null;
		
		n = new Notice(thisPage,noticeTitle,noticeContents);
		
		if (new NoticeService().updateNotice(n) > 0) {
			response.sendRedirect("/cs/nlist?page="+currentPage);
		} else {
			view = request.getRequestDispatcher("WookJae/views/notice/noticeError.jsp");
			request.setAttribute("error", "게시글 수정실패..");
			view.forward(request, response);
		}
		
		

		/*// 해당 컨테이너의 구동중인 웹 애플리케이션의 루트 경로 알아냄
		String root = request.getSession().getServletContext().getRealPath("/");
		System.out.println("웹 어플리케이션의 루트경로 출력 아래..");
		System.out.println("root : "+root);
		// 업로드되는 파일이 저장될 폴더명과 경로 연결 처리
		String savePath = root+"WookJae/upload_notice";
		System.out.println("업로드 되는 파일이 저장될경로 출력 아래..");
		System.out.println("savePath : "+savePath); */
		
		// request 를 MultipartRequest 객체로 변환함
		/*MultipartRequest mrequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
				new DefaultFileRenamePolicy());*/

		//작동이 안됨
		/*String noticeTitle = mrequest.getParameter("ntitle");
		String noticeContent = mrequest.getParameter("ncontents");
		int noticeNum = Integer.parseInt(mrequest.getParameter("nnum"));
		int currentPage = Integer.parseInt(mrequest.getParameter("page"));
		String noticeOriginFileName = mrequest.getParameter("ofile");
		String noticeRenameFileName = mrequest.getParameter("rfile");
		
		System.out.println("전달받은 게시글이름 : "+noticeTitle);
		System.out.println("전달받은 게시글내용 : "+noticeContent);
		System.out.println("전달받은 게시글번호 : "+noticeNum);
		System.out.println("전달받은 게시글페이지 : "+currentPage);
		System.out.println("전달받은 게시글원본이름 : "+noticeOriginFileName);
		System.out.println("전달받은 게시글수정본이름 : "+noticeRenameFileName);*/
		
		
		
		
		/*Notice n = null;
		String originFileName = mrequest.getFilesystemName("upfile");
		if (originFileName != null) {
			// 업로도된 파일명을 "년월일시분초.확장자" 로 변경함
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

			// 저장된 이전 파일 삭제함
			if(noticeRenameFileName != null) 
				(new File(savePath + "\\" + noticeRenameFileName)).delete();
			n = new Notice(noticeNum, noticeTitle, noticeContent, originFileName, renameFileName);		
		} else
			n = new Notice(noticeNum, noticeTitle, noticeContent);
		
		if (new NoticeService().updateNotice(n) > 0) {
			response.sendRedirect("/cs/nlist?page="+currentPage);
		} else {
			view = request.getRequestDispatcher("WookJae/views/notice/noticeError.jsp");
			request.setAttribute("error", "게시글 수정실패..");
			view.forward(request, response);
		}*/
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

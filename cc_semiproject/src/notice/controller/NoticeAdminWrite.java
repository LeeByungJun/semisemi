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
 * Servlet implementation class NoticeAdminWrite
 */
@WebServlet("/adminwrite")
public class NoticeAdminWrite extends HttpServlet {
	private static final long serialVersionUID = 2L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeAdminWrite() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1.전송온 값에 한글이 있으면 인코딩 처리함
		request.setCharacterEncoding("UTF-8");
		
		/*String filetitle = (String)request.getParameter("title");
		String filecontent = (String)request.getParameter("content");
		String fileupfile =  (String)request.getParameter("upfile");
		System.out.println(filetitle+", "+fileupfile+", "+filecontent);*/
		
		//2.업로드할 파일의 용량을 제한설정함(10Mbyte)
		//int maxSize = 1024*1024*10;
		
		/*String title = (String) request.getAttribute("title");
		String contents = (String) request.getAttribute("content");*/

		//enctype="multipart/form-data"로 전송됬는지 확인
		/*RequestDispatcher view = null;
		if (!ServletFileUpload.isMultipartContent(request)) {	
			view = request.getRequestDispatcher("WookJae/views/notice/noticeError.jsp");
			request.setAttribute("error", "form태그에 enctype속성이 정의되지 않았습니다.");
			view.forward(request, response);
		}*/
		
		//해당 웹 컨테이너(was:톰켓)에서 구동중인 웹 어플리케이션의 경로(context directory)알아냄
		/*String root = request.getSession().getServletContext().getRealPath("/");
		System.out.println("웹 어플리케이션의 루트경로 출력 아래..");
		System.out.println("root : "+root);
		//업로드 되는 파일이 저장될 폴더명과 루트경로 연결
		String savePath = root+"WookJae/upload_notice";
		System.out.println("업로드 되는 파일이 저장될경로 출력 아래..");
		System.out.println("savePath : "+savePath); */
		
		//cos.jar라이브러리를 사용할 경우, MultipartRequest객체 생성
		//객체가 생성됨과 동시에 자동 파일 업로드됨 
		//request객체는 MultipartRequest객체로 변환됩니다.
		/*MultipartRequest mrequest = new MultipartRequest(
				request, savePath, maxSize, "UTF-8",
				new DefaultFileRenamePolicy());		*/
		
		//3.작성한 내용 불러와 객체에 저장하기(DB로 전송하기위한 사전작업)
		Notice notice = new Notice();
		notice.setN_title(request.getParameter("title"));
		notice.setN_contents(request.getParameter("contents"));
		notice.setN_writer(request.getParameter("nwriter"));
				
		/*String originFileName = mrequest.getFilesystemName("upfile");
			
		if(originFileName!=null) {
			// 업로도된 파일명을 "년월일시분초.확장자" 로 변경함
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
					+ originFileName.substring(originFileName.lastIndexOf(".") + 1);

			// 파일명 바꾸기하려면 File 객체의 renameTo() 사용함
			File originFile = new File(savePath + "\\" + originFileName);
			File renameFile = new File(savePath + "\\" + renameFileName);*/

			// 파일이름 바꾸기 실행 >> 실패할 경우 직접 바꾸기함
			// 새 파일만들고 원래 파일내용 읽어서 복사 기록하고
			// 원 파일 삭제함
			/*if (!originFile.renameTo(renameFile)) {
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
			notice.setN_original_filename(originFileName);
			notice.setN_rename_filename(renameFileName);
		} */
		RequestDispatcher view = null;
		
		response.setContentType("text/html; charset=utf-8");
		if(new NoticeService().insertNotice(notice)>0) {
			response.sendRedirect("/cs/nlist?page=1");
		}else {
			view=request.getRequestDispatcher("WookJae/views/notice/noticeError.jsp");
			request.setAttribute("error", "신규 게시글 등록실패..");
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

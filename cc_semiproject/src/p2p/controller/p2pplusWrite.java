package p2p.controller;

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

import p2p.model.service.p2pService;
import p2p.model.vo.p2p;

/**
 * Servlet implementation class p2pplusWrite
 */
@WebServlet("/p2pAdd")
public class p2pplusWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public p2pplusWrite() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//게시글 원글 등록 처리용 컨트롤러		
		request.setCharacterEncoding("utf-8");
		
		//업로드할 파일의 용량최대치 제한 : 10Mbyte;
		int maxSize = 1024 * 1024 * 10;				

		RequestDispatcher view = null;

		//enctype="multipart/form-data"로 전송되었는지 확인 
		if(!ServletFileUpload.isMultipartContent(request)) {
			System.out.println("form enctype으로 정의되지않았습니다. 재확인바람...");
		}
		
		//해당 컨테이너의 구동중이 웹 어플리케이션의 루트경로 추출 
		String root = request.getSession().getServletContext().getRealPath("/");	
		System.out.println("원본경로 : "+root);
		
		//업로드 되는 파일이 저장될 폴더명과 경로 연결처리 
		String savePath = root+"p2p"; 		
		System.out.println("savePath : "+savePath);

		
		//request를 MultipartRequest객체로 변환시킴 
		MultipartRequest mrequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());

		String ptitle = mrequest.getParameter("ptitle");
		String pcontents = mrequest.getParameter("pcontents");
		
		System.out.println("ptitle = " + mrequest.getParameter("ptitle"));
		System.out.println("pcontents = " + mrequest.getParameter("pcontents"));
		System.out.println("writerNo = " + mrequest.getParameter("writerNo"));
		
		int member_num = Integer.parseInt(mrequest.getParameter("writerNo"));
		//System.out.println("작성자의 회원번호 : "+member_num);
	
		p2p p = new p2p();
		p.setMem_num(member_num);
		p.setP_title(ptitle);
		p.setP_context(pcontents);

		String originFileName=(mrequest.getFilesystemName("pfile"));
		System.out.println("originFileName : "+originFileName);
		
/*		int originFileNamelength = (mrequest.getFilesystemName("pfile")).length();
		System.out.println(originFileNamelength);
		
		if(originFileNamelength==5) //자동차10
		 	originFileName = ((mrequest.getFilesystemName("pfile")).substring(0,5))+".jpg"; // 0 1  2  3  4  
																							// 자 동 차 1 0
		if(originFileNamelength==4)
			originFileName = ((mrequest.getFilesystemName("pfile")).substring(0,4))+".jpg";
*/	
		
		//System.out.println("originFileName : "+originFileName);
		
		String imageRoot = "/cs/p2p_pic/"+originFileName;
		System.out.println("imageRoot : "+imageRoot);
		
		p.setP_image(imageRoot);
		
				
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
			// 원 파일 삭제함oo
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
			p.setP_original_filename(originFileName);
			p.setP_rename_filename(renameFileName);		
		} 

		response.setContentType("text/html; charset=utf-8");
		
		p2pService pseriv = new p2pService();
		
		int result = pseriv.insertWrite(p);
		if(result>0) {
			response.sendRedirect("/cs/p2plist?page=1");		
		}else {
			System.out.println("게시글 등록실패 ㅠ,,,,,,,");
		}
	}

}



























package p2p.controller;

import java.io.IOException;

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
 * Servlet implementation class p2pAlterFinalServlet
 */
@WebServlet("/p2pRepeat")
public class p2pAlterFinalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public p2pAlterFinalServlet() {
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
		//업로드 되는 파일이 저장될 폴더명과 경로 연결처리 
		String savePath = root+"p2p"; 		
		//System.out.println("savePath : "+savePath);

		
		//request를 MultipartRequest객체로 변환시킴 
		MultipartRequest mrequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());

		String ptitle = mrequest.getParameter("ptitle");
		String pcontents = mrequest.getParameter("pcontents");
		int boardNo = Integer.parseInt(mrequest.getParameter("boardNo"));

		System.out.println(ptitle+", "+pcontents);
		System.out.println("수정시도하는 게시판번호 : "+boardNo);
	
		
		String originFileName=(mrequest.getFilesystemName("pfile"));
		System.out.println("originFileName : "+originFileName);		
		
		
		String imageRoot = "/cs/p2p_pic/"+originFileName;
		
		
		p2p p2 = new p2p(boardNo, ptitle, pcontents, imageRoot);

		int set = new p2pService().finalUpdate(p2);
		
		if(set>0) {
			response.sendRedirect("/cs/p2plist?page=1");		
		}else {
			System.out.println("수정에 실패하였습니다.......");
		}
		
	}

}



















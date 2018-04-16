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

import member.model.service.MemberService;
import report.model.service.ReportService;
import report.model.vo.Report;

/**
 * Servlet implementation class ReportWriteServlet
 */
@WebServlet("/rwrite")
public class ReportWriteServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportWriteServlet() {
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
      String savePath = root+"upload_report"; 
      
      
      //request를 MultipartRequest객체로 변환시킴 
      MultipartRequest mrequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
      
      Report r = new Report();
      
      r.setR_title(mrequest.getParameter("rtitle"));
      r.setEmail(mrequest.getParameter("rwriter"));
      r.setR_contents(mrequest.getParameter("rcontents"));
      
      String addReporter = mrequest.getParameter("addreporter");
      
      System.out.println("===========================================================");
      System.out.println("신고한 사람의 이메일주소 > "+addReporter);
      System.out.println("===========================================================");
      
      String originFileName = mrequest.getFilesystemName("rupfile");
      ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      //System.out.println("작성페이지로 부터 전달 받은 타이틀/작성자/내용 => "+r.getR_title()+", "+r.getEmail()+", "+r.getR_contents()+", "+originFileName);
            ///////////////////////////////////출력성공 //////////////////////////////////////
      
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
         r.setR_original_filename(originFileName); 
         r.setR_rename_filename(renameFileName);
         //System.out.println("원본파일 이름 : "+r.getR_original_filename());
         //System.out.println("수정본파일 이름 : "+r.getR_rename_filename());
         ///////////////////////////////////출력성공 //////////////////////////////////////
      } 
      
      response.setContentType("text/html; charset=utf-8");
      
      ReportService rservice = new ReportService();

      if((rservice.insertReport(r)>0)) {
         //멤버 테이블에서 넘어온 신고당한 유저의 count 컬럼을 1증가시켜줘야됨
         /*int result = new MemberService().updateMemberCount(addReporter);*/
         int result2 = new MemberService().addMemberReportCount(addReporter);
         //////////////////////////////////////////
         response.sendRedirect("/cs/rlist");
      }else {
         view = request.getRequestDispatcher("/cs/WookJae/views/report/reportError.jsp");
         request.setAttribute("error", "새로운 제보실패..");
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